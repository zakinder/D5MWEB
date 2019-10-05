// UVM_MONITOR : axi4_stream_module_monitor [AXI4_STREAM]
class axi4_stream_module_monitor extends  axi4_module_monitor;
    `uvm_component_utils(axi4_stream_module_monitor)
	int FPW ;
	int HEADERS ;
	int TAILS ;
	int VALIDS ;
	int valids_per_cycle 		= 0;
	int current_packet_length 	= 0;
	bit request = 1;
	int flit_delay [$];
	uvm_analysis_port #(axi4_stream_packet_transaction) item_collected_port;
	uvm_analysis_imp #(axi4_stream_valid_cycle,axi4_stream_module_monitor) axi4_port;
	int n_valids 				= 0;
	int headers_seen 	= 0;
	int tails_seen 	 	= 0;
	typedef bit [127:0] flit_t;
	flit_t flit_queue[$];
	int packets_per_cycle = 0;
	axi4_stream_packet_transaction packet_queue[$];
	//-- covergroup definition
    function new(string name, uvm_component parent);
        super.new(name, parent);
        axi4_port = new("axi4_port",this);
    endfunction: new
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		FPW 	= DATA_BYTES/16;//-- convert to variables!
		HEADERS = FPW;
		TAILS 	= 2*FPW;
		VALIDS 	= 0;
	endfunction : build_phase
	//-- Stuff FLITs into a FIFO, separate control signals
	function void collect_flits(input axi4_stream_valid_cycle vc);
		//-- read tuser flags for valid flags
		flit_t tmp_flit;
		flit_t current_flit;
		packets_per_cycle = 0;
		valids_per_cycle =0;
		for (int i = 0; i<FPW; i++) begin //-- Check bitvector
		//-- Check if valid
			if (vc.tuser == 1) begin
				valids_per_cycle ++;
				//-- Write 2 flit queue
				for (int b=0; b<16; b++)
					tmp_flit[b] = vc.tdata[16*i+b];
				flit_queue.push_back(tmp_flit);
				if (vc.tuser == 1'b1) begin
					headers_seen++; //-- Complete ax_packets to assemble
					packets_per_cycle++;
					flit_delay.push_back(n_valids);
					n_valids = 0;
				end
				//-- Check if tail for complete ax packet
				if (vc.tuser == 1'b1) begin
					tails_seen++; //-- Complete ax_packets to assemble
					assert (n_valids == 0)
					else `uvm_fatal(get_type_name(), $psprintf("Non valid flits in pkt detected!"))
				end
				//-- Check complete ax packets
				assert (tails_seen<= headers_seen) 
				else  `uvm_fatal(get_type_name(), $psprintf("packet is null"))
				assert (headers_seen <= tails_seen+1)
				else  `uvm_fatal(get_type_name(), $psprintf("Packet without Tail detected"))
			end
			else begin
				n_valids ++;
			end
		end
		if(|vc.tuser)
			`uvm_info(get_type_name(),$psprintf("%d header and %d tails available", headers_seen, tails_seen)  ,UVM_HIGH)
	endfunction : collect_flits
	//-- Use FLITs to form packets
	function void collect_packet();
		flit_t current_flit;
		bit bitstream[];
		//-- Assemble 1 ax packet
		flit_queue_underflow : assert (flit_queue.size() > 0);
		//-- First flit is always header
		current_flit = flit_queue.pop_front();
		no_length_mismatches_allowed : assert (current_flit[14:11] == current_flit[10:7]); 	//--check internal axi4_stream_packet_transaction length
		current_packet_length = current_flit[10:7];
		`uvm_info(get_type_name(),$psprintf("packet length %0d ", current_packet_length), UVM_HIGH)
		`uvm_info(get_type_name(),$psprintf("queue size %0d ", flit_queue.size()), UVM_HIGH)
		flit_queue_underflow2 : assert (flit_queue.size() >= current_packet_length - 1);		//--check check axi4_stream_packet_transaction complete received
		//-- pack flits 2 bitstream
		bitstream = new[current_packet_length*16];
		//-- Pack first flit
		for (int i=0; i<16; i=i+1)
			bitstream[i] = current_flit[i];
		//-- Get and pack the remaining flits
		for (int flit=1; flit < current_packet_length; flit ++) begin
			current_flit = flit_queue.pop_front();
			`uvm_info(get_type_name(),$psprintf("pop flit %0d (%0x)", flit, current_flit), UVM_HIGH)
			for (int i=0; i<16; i=i+1) begin
				bitstream[flit*16+i] = current_flit[i];
			end
		end
		packet = axi4_stream_packet_transaction::type_id::create("packet", this);
		void'(packet.unpack(bitstream));
		packet.flit_delay = flit_delay.pop_front();
		ax_pkt_cg.sample(); 
		//-- assembled a packet
		headers_seen--;
		tails_seen--; 
		if (packet == null) begin
		  `uvm_fatal(get_type_name(), $psprintf("packet is null"))
		end
		packet_queue.push_back(packet);
		if(packet.get_command_type() == AX_RESPONSE_TYPE)begin
		`uvm_info("RESPONSE collected",$psprintf("Rsp %0d : %s",rsp_rcvd, packet.command.name()), UVM_LOW)
		rsp_rcvd++;
		end else begin
		`uvm_info("REQUEST collected",$psprintf("Req %0d : %s",req_rcvd, packet.command.name()), UVM_LOW)
		req_rcvd++;
		end
		`uvm_info("AXI4 to AX Monitor",$psprintf("\n%s", packet.sprint()), UVM_HIGH)
	endfunction : collect_packet
	function void write(input axi4_stream_valid_cycle vc);
		axi4_stream_packet_transaction packet;
		collect_flits(vc);
		//`uvm_info(get_type_name(),$psprintf("got %0d tails and %0d flits",tails_seen, flit_queue.size() ), UVM_HIGH)
		//-- Convert flit_queue to ax_packets
		while (tails_seen >0) begin
			collect_packet();		
		end
		//-- If flit queue is not empty -> ax packet striped over 2 axi cycles
		while (packet_queue.size()>0) begin
			packet = packet_queue.pop_front();
			//if (packet.command != AX_ERROR_RESPONSE)
				item_collected_port.write(packet);
		end
	endfunction
	function void check_phase(uvm_phase phase);
		if (flit_queue.size() >0)
			`uvm_fatal(get_type_name(),$psprintf("flit_queue is not empty: %0d", flit_queue.size()))
	endfunction : check_phase
endclass: axi4_stream_module_monitor
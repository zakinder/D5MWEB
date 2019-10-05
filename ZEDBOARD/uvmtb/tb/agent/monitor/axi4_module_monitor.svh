// UVM_MONITOR : AX_MODULE_MON [AXI4_STREAM]
class axi4_module_monitor extends uvm_monitor;
	//-- Basic Module monitor
	axi4_stream_packet_transaction packet;
	covergroup ax_pkt_cg;
		option.per_instance = 1;
		AX_PACKET_LENGTH : coverpoint packet.packet_length{
			illegal_bins zero_flit_pkt = {0};
			bins pkt_length[] = {[1:9]};
		}
		AX_COMMAND: coverpoint packet.command {
			bins requests[] = {
				AX_WRITE_16,
				AX_WRITE_32,
				AX_WRITE_48,
				AX_WRITE_64,
				AX_WRITE_80,
				AX_WRITE_96,
				AX_WRITE_112,
				AX_WRITE_128,
				AX_MODE_WRITE,
				AX_BIT_WRITE,
				AX_DUAL_8B_ADDI,
				AX_SINGLE_16B_ADDI,
				AX_POSTED_WRITE_16,
				AX_POSTED_WRITE_32,
				AX_POSTED_WRITE_48,
				AX_POSTED_WRITE_64,
				AX_POSTED_WRITE_80,
				AX_POSTED_WRITE_96,
				AX_POSTED_WRITE_112,
				AX_POSTED_WRITE_128,
				AX_POSTED_BIT_WRIT,
				AX_POSTED_BIT_WRIT,
				AX_POSTED_DUAL_8B_ADDI,
				AX_POSTED_SINGLE_16B_ADDI,
				AX_MODE_READ,
				AX_READ_16,
				AX_READ_32,
				AX_READ_48,
				AX_READ_64,
				AX_READ_80,
				AX_READ_96,
				AX_READ_112, 
				AX_READ_128};
			bins response[] = {
				AX_READ_RESPONSE,
				AX_WRITE_RESPONSE,
				AX_MODE_READ_RESPONSE,
				AX_MODE_WRITE_RESPONSE,
				AX_ERROR_RESPONSE
			};
			illegal_bins n_used = default;
		}
		FLIT_DELAY: coverpoint packet.flit_delay{
			bins zero_delay = {0};
			bins small_delay = {[1:3]};
			bins big_delay = {[4:20]};
			bins huge_delay = {[21:$]};
		}
		FLIT_DELAY_COMMAND : cross AX_COMMAND, FLIT_DELAY;
	endgroup
	uvm_analysis_port #(axi4_stream_packet_transaction) item_collected_port;
	int req_rcvd = 0;
	int rsp_rcvd = 0;
	`uvm_component_utils(axi4_module_monitor)
	function new ( string name = "axi4_module_monitor", uvm_component parent );
		super.new(name, parent);
		item_collected_port = new("item_collected_port", this);
	endfunction : new
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction : build_phase
endclass: axi4_module_monitor
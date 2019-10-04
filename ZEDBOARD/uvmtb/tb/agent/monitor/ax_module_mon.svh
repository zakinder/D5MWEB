// UVM_MONITOR : axi_lite_MONITOR [AXI4_LITE]
class axi_lite_monitor extends uvm_monitor;
    protected virtual   axi4l_if axi4l_vif;
    protected int       id;
    uvm_analysis_port #(axi_lite_transaction) item_collected_port;
    uvm_analysis_port #(axi_lite_transaction) dut_inputs_port; // analysis port for DUT inputs
    uvm_analysis_port #(axi_lite_transaction) dut_outputs_port; // analysis port for DUT outputs
    protected axi_lite_transaction aL_txn;
    `uvm_component_utils_begin(axi_lite_monitor)
        `uvm_field_int(id, UVM_DEFAULT)
    `uvm_component_utils_end
    function new (string name, uvm_component parent);
        super.new(name, parent);
        aL_txn = new();
        item_collected_port = new("item_collected_port", this);
       // dut_inputs_port = new("dut_inputs_port", this); // construct the analysis port
        //dut_outputs_port = new("dut_outputs_port", this); // construct the analysis port
    endfunction
    function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual axi4l_if)::get(this, "", "axi4l_vif", axi4l_vif))
        `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(), ".axi4l_vif"});
        dut_inputs_port = new(.name("dut_inputs_port"),.parent(this));
        dut_outputs_port = new(.name("dut_outputs_port"),.parent(this));
    endfunction // build_phase
    virtual task run_phase (uvm_phase phase);
        fork
            collect_transactions();
        join
    endtask: run_phase
    virtual protected task collect_transactions();
        bit valid_txn = 0;
        forever begin
            axi_lite_transaction tx_in,tx_out,tx_copy;
            tx_in       = axi_lite_transaction::type_id::create("tx_in"); 
            tx_out      = axi_lite_transaction::type_id::create("tx_out");
            aL_txn      = new();
            if (axi4l_vif.ARESETN == 'b0)
            @(posedge axi4l_vif.ARESETN);
                if (axi4l_vif.AWVALID == 'b1) begin
                    tx_in.WDATA = axi4l_vif.WDATA; 
                    aL_txn.reqWriteRead = WRITE;    
                    aL_txn.addr  = axi4l_vif.AWADDR[7:0];
                    @(posedge axi4l_vif.WVALID);
                    aL_txn.data  = axi4l_vif.WDATA;
                    @(negedge axi4l_vif.WVALID);
                    valid_txn = 1;
                end
            else if (axi4l_vif.ARVALID == 'b1) begin
                tx_out.RDATA = axi4l_vif.RDATA; 
                aL_txn.reqWriteRead = READ;    
                aL_txn.addr  = axi4l_vif.ARADDR[7:0];
                @(posedge axi4l_vif.RVALID);
                aL_txn.data  = axi4l_vif.RDATA;
                @(negedge axi4l_vif.RVALID);
                valid_txn = 1;
            end
            @(posedge axi4l_vif.ACLK);
            //aL_txn.data = axi4l_vif.data;
            //while (axi4l_vif.valid == 'b1) begin
            //@(posedge axi4l_vif.ACLK);
            //aL_txn.cycles++;
            //end
            //aL_txn.cycles--;
             //`uvm_info("axi4l_vif data", aL_txn.sprint(), UVM_LOW);
                if (valid_txn == 'b1 ) begin
                    //`uvm_info("MON", aL_txn.convert2string(), UVM_LOW) 
                    item_collected_port.write(aL_txn);
                    //item_collected_port.write(aL_txn);
                end
            dut_inputs_port.write(tx_in);  
            $cast(tx_copy, tx_out.clone());
            dut_outputs_port.write(tx_copy);             
            valid_txn = 0;
        end
    endtask: collect_transactions
endclass: axi_lite_monitor
// UVM_MONITOR : d5m_camera_MONITOR [d5m_camera]
class d5m_camera_monitor extends uvm_monitor;
    protected virtual   d5m_camera_if d5m_camera_vif;
    protected int       id;
    uvm_analysis_port #(d5m_camera_transaction) item_collected_port;
    uvm_analysis_port #(d5m_camera_transaction) dut_inputs_port; // analysis port for DUT inputs
    uvm_analysis_port #(d5m_camera_transaction) dut_outputs_port; // analysis port for DUT outputs
    protected d5m_camera_transaction aL_txn;
    `uvm_component_utils_begin(d5m_camera_monitor)
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
        if(!uvm_config_db#(virtual d5m_camera_if)::get(this, "", "d5m_camera_vif", d5m_camera_vif))
        `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(), ".d5m_camera_vif"});
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
            d5m_camera_transaction tx_in,tx_out,tx_copy;
            tx_in       = d5m_camera_transaction::type_id::create("tx_in"); 
            tx_out      = d5m_camera_transaction::type_id::create("tx_out");
            aL_txn      = new();
            // if (d5m_camera_vif.reset == 'b0)
            // @(posedge d5m_camera_vif.reset);
                // if (d5m_camera_vif.AWVALID == 'b1) begin
                    // tx_in.WDATA = d5m_camera_vif.WDATA; 
                    // aL_txn.reqWriteRead = WRITE;    
                    // aL_txn.addr  = d5m_camera_vif.AWADDR[7:0];
                    // @(posedge d5m_camera_vif.WVALID);
                    // aL_txn.idata  = d5m_camera_vif.WDATA;
                    // @(negedge d5m_camera_vif.WVALID);
                    // valid_txn = 1;
                // end
            // else if (d5m_camera_vif.ARVALID == 'b1) begin
                // tx_out.RDATA = d5m_camera_vif.RDATA; 
                // aL_txn.reqWriteRead = READ;    
                // aL_txn.addr  = d5m_camera_vif.ARADDR[7:0];
                // @(posedge d5m_camera_vif.RVALID);
                // aL_txn.idata  = d5m_camera_vif.RDATA;
                // @(negedge d5m_camera_vif.RVALID);
                // valid_txn = 1;
            // end
            @(posedge d5m_camera_vif.pixclk);
            //aL_txn.idata = d5m_camera_vif.idata;
            //while (d5m_camera_vif.valid == 'b1) begin
            //@(posedge d5m_camera_vif.pixclk);
            //aL_txn.cycles++;
            //end
            //aL_txn.cycles--;
             //`uvm_info("d5m_camera_vif idata", aL_txn.sprint(), UVM_LOW);
                //if (valid_txn == 'b1 ) begin
                    //`uvm_info("MON", aL_txn.convert2string(), UVM_LOW) 
                    item_collected_port.write(aL_txn);
                    //item_collected_port.write(aL_txn);
                //end
            dut_inputs_port.write(tx_in);  
            $cast(tx_copy, tx_out.clone());
            dut_outputs_port.write(tx_copy);             
            valid_txn = 0;
        end
    endtask: collect_transactions
endclass: d5m_camera_monitor
// UVM_DRIVER : d5m_camera_DRV [d5m_camera]
class d5m_camera_driver extends uvm_driver #(d5m_camera_transaction);
    protected virtual d5m_camera_if d5m_camera_vif;
    protected int     id;
    `uvm_component_utils_begin(d5m_camera_driver)
        `uvm_field_int(id, UVM_DEFAULT)
    `uvm_component_utils_end
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual d5m_camera_if)::get(this, "", "d5m_camera_vif", d5m_camera_vif))
        `uvm_fatal("NOVIF", {"virtual interface must be set for: ",get_full_name(), ".d5m_camera_vif"});
    endfunction
    virtual task run_phase (uvm_phase phase);
        fork
            //reset_signals();
            get_and_drive();
        join
    endtask: run_phase
    //====================================================================================
    //------------------------------------------------------------------------------------
    //--------------------------------- AXI4LITE WRITE: RESET SIGNALS
    //------------------------------------------------------------------------------------
    //====================================================================================
    virtual protected task reset_signals();
        `uvm_info("AXI4LITE WRITE: RESET SIGNALS", "RESET SIGNALS",UVM_LOW)
        // forever begin
            // @(negedge d5m_camera_vif.reset);
            // d5m_camera_vif.idata   <= 12'h0;
            // d5m_camera_vif.ilval   <=  1'b0;
            // d5m_camera_vif.ifval   <=  1'b0;
        // end
    endtask: reset_signals
    //====================================================================================
    //------------------------------------------------------------------------------------
    //--------------------------------- GET_AND_DRIVE
    //------------------------------------------------------------------------------------
    //====================================================================================
    virtual protected task get_and_drive();
        forever begin
            @(posedge d5m_camera_vif.pixclk);
            if (d5m_camera_vif.reset == 1'b0) begin
                @(posedge d5m_camera_vif.reset);
                @(posedge d5m_camera_vif.pixclk);
            end
            seq_item_port.get_next_item(req);
            //`uvm_info("DRV", req.convert2string(), UVM_LOW)
            repeat(req.cycles) begin
                @(posedge d5m_camera_vif.pixclk);
            end
            drive_transfer(req);
            seq_item_port.item_done();
        end
    endtask: get_and_drive
    //====================================================================================
    //------------------------------------------------------------------------------------
    //--------------------------------- DRIVE READ DATA CHANNEL
    //------------------------------------------------------------------------------------
    //====================================================================================
    virtual protected task drive_transfer (d5m_camera_transaction aL_txn);
        drive_data_phase(aL_txn);
        drive_lval_phase(aL_txn);
        drive_fval_phase(aL_txn);
    endtask: drive_transfer
    //====================================================================================
    //------------------------------------------------------------------------------------
    //--------------------------------- DRIVE READ DATA CHANNEL
    //------------------------------------------------------------------------------------
    //====================================================================================
    virtual protected task drive_lval_phase (d5m_camera_transaction aL_txn);
        bit valid;
        valid = aL_txn.ilval;
        drive_lval(valid);
    endtask: drive_lval_phase
    virtual protected task drive_fval_phase (d5m_camera_transaction aL_txn);
        bit valid;
        valid = aL_txn.ifval;
        drive_fval(valid);
    endtask: drive_fval_phase
    virtual protected task drive_data_phase (d5m_camera_transaction aL_txn);
        bit[11:0] rw_data;
        bit err;
        rw_data = aL_txn.idata;
        drive_write_data_channel(rw_data, err);
    endtask: drive_data_phase
    virtual protected task drive_lval(bit ilval);
        int d5m_camera_ctr;
                d5m_camera_vif.ilval  <= ilval;
        //@(posedge d5m_camera_vif.pixclk);

    endtask: drive_lval
    virtual protected task drive_fval(bit ifval);
             d5m_camera_vif.ifval  <= ifval;
       // @(posedge d5m_camera_vif.pixclk);

    endtask: drive_fval
    virtual protected task drive_write_data_channel (bit[11:0] idata, output bit error);
            d5m_camera_vif.idata  <= idata;
       // @(posedge d5m_camera_vif.pixclk);

    endtask: drive_write_data_channel
endclass: d5m_camera_driver
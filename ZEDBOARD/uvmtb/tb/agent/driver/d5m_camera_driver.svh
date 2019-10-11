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
            reset_signals();
            d5m_frame();
        join
    endtask: run_phase
    //====================================================================================
    //------------------------------------------------------------------------------------
    //--------------------------------- AXI4LITE WRITE: RESET SIGNALS
    //------------------------------------------------------------------------------------
    //====================================================================================
    virtual protected task reset_signals();
        //`uvm_info("AXI4LITE WRITE: RESET SIGNALS", "RESET SIGNALS",UVM_LOW)
        forever begin
            @(negedge d5m_camera_vif.ARESETN);
            d5m_camera_vif.AWADDR  <=  8'h0;
            d5m_camera_vif.AWPROT  <=  3'h0;
            d5m_camera_vif.AWVALID <=  1'b0;
            d5m_camera_vif.WDATA   <= 32'h0;
            d5m_camera_vif.WSTRB   <=  4'h0;
            d5m_camera_vif.WVALID  <=  1'b0;
            d5m_camera_vif.BREADY  <=  1'b1;
            d5m_camera_vif.ARADDR  <=  8'h0;
            d5m_camera_vif.ARPROT  <=  3'h0;
            d5m_camera_vif.ARVALID <=  1'b0;
            d5m_camera_vif.RREADY  <=  1'b1;
        end
    endtask: reset_signals
    //====================================================================================
    //------------------------------------------------------------------------------------
    //--------------------------------- GET_AND_DRIVE
    //------------------------------------------------------------------------------------
    //====================================================================================
    virtual protected task d5m_frame();
        forever begin
            @(posedge d5m_camera_vif.pixclk);
            if (d5m_camera_vif.reset == 1'b0) begin
                @(posedge d5m_camera_vif.reset);
                @(posedge d5m_camera_vif.pixclk);
            end
            seq_item_port.get_next_item(req);
            repeat(req.cycles) begin
                @(posedge d5m_camera_vif.pixclk);
            end
            drive_transfer(req);
            seq_item_port.item_done();
        end
    endtask: d5m_frame
    //====================================================================================
    //------------------------------------------------------------------------------------
    //--------------------------------- DRIVE READ DATA CHANNEL
    //------------------------------------------------------------------------------------
    //====================================================================================
    virtual protected task drive_transfer (d5m_camera_transaction aL_txn);
        drive_address_phase(aL_txn);
        drive_data_phase(aL_txn);
    endtask: drive_transfer
    //====================================================================================
    //------------------------------------------------------------------------------------
    //--------------------------------- DRIVE READ DATA CHANNEL
    //------------------------------------------------------------------------------------
    //====================================================================================

    virtual protected task drive_address_phase (d5m_camera_transaction aL_txn);
        case (aL_txn.d5m_txn)
        AXI4_WRITE : drive_write_address_channel(aL_txn);
        AXI4_READ  : drive_read_address_channel(aL_txn);
        D5M_WRITE  : d5m_data_phase(aL_txn);
        endcase
    endtask: drive_address_phase
    virtual protected task drive_data_phase (d5m_camera_transaction aL_txn);
        bit[31:0] rw_data;
        bit err;
        rw_data = aL_txn.data;
        case (aL_txn.d5m_txn)
        AXI4_WRITE : drive_write_data_channel(rw_data, err);
        AXI4_READ  : drive_read_data_channel(rw_data, err);
        endcase    
    endtask: drive_data_phase
    virtual protected task d5m_data_phase (d5m_camera_transaction aL_txn);
        bit[11:0] rw_data;
        bit err;
        bit ifval;
        bit ilval;
        ifval   = aL_txn.ifval;
        ilval   = aL_txn.ilval;
        rw_data = aL_txn.idata;
        d5m_write_idata(rw_data,ilval,ifval, err);
    endtask: d5m_data_phase
    virtual protected task d5m_write_idata (bit[11:0] idata,bit ilval,bit ifval, output bit error);
        d5m_camera_vif.idata  <= idata;
        d5m_camera_vif.ifval  <= ifval;
        d5m_camera_vif.ilval  <= ilval;
    endtask: d5m_write_idata
    //====================================================================================
    //------------------------------------------------------------------------------------
    //--------------------------------- AXI4LITE WRITE ADDRESS
    //------------------------------------------------------------------------------------
    //====================================================================================
    virtual protected task drive_write_address_channel (d5m_camera_transaction aL_txn);
        int axi_lite_ctr;
        d5m_camera_vif.AWADDR  <= {8'h0, aL_txn.addr};
        d5m_camera_vif.AWPROT  <= 3'h0;
        d5m_camera_vif.AWVALID <= 1'b1;
        //wait for write response
        for(axi_lite_ctr = 0; axi_lite_ctr <= 62; axi_lite_ctr ++) begin
            @(posedge d5m_camera_vif.ACLK);
            if (d5m_camera_vif.BVALID) break;
        end
        if (axi_lite_ctr == 62) begin
            `uvm_error("axi_lite_master_driver","AWVALID timeout");
        end    
        @(posedge d5m_camera_vif.ACLK);
        // d5m_camera_vif.AWADDR  <= 8'h0;
        // d5m_camera_vif.AWPROT  <= 3'h0;
        // d5m_camera_vif.AWVALID <= 1'b0;
    endtask: drive_write_address_channel
    //====================================================================================
    //------------------------------------------------------------------------------------
    //--------------------------------- AXI4LITE WRITE DATA
    //------------------------------------------------------------------------------------
    //====================================================================================
    virtual protected task drive_write_data_channel (bit[31:0] data, output bit error);
        int axi_lite_ctr;
        //`uvm_info("AXI4LITE WRITE WDATA", "WRITE DATA",UVM_LOW)
        d5m_camera_vif.WDATA  <= data;
        d5m_camera_vif.WSTRB  <= 4'hf;
        d5m_camera_vif.WVALID <= 1'b1;
        @(posedge d5m_camera_vif.ACLK);
            for(axi_lite_ctr = 0; axi_lite_ctr <= 62; axi_lite_ctr ++) begin
            @(posedge d5m_camera_vif.ACLK);
            //------------------------------
            if (d5m_camera_vif.WREADY) 
                d5m_camera_vif.AWADDR  <= 8'h0;
                d5m_camera_vif.AWPROT  <= 3'h0;
                d5m_camera_vif.AWVALID <= 1'b0; 
            break;
            //------------------------------
            end
            if (axi_lite_ctr == 62) begin
            `uvm_error("axi_lite_master_driver","AWVALID timeout");
            end
        @(posedge d5m_camera_vif.ACLK);
        d5m_camera_vif.WDATA  <= 32'h0;
        d5m_camera_vif.WSTRB  <= 4'h0;
        d5m_camera_vif.WVALID <= 1'b0;
        //wait for write response
        for(axi_lite_ctr = 0; axi_lite_ctr <= 62; axi_lite_ctr ++) begin
            @(posedge d5m_camera_vif.ACLK);
            if (d5m_camera_vif.BVALID) break;
        end
        if (axi_lite_ctr == 62) begin
            `uvm_error("axi_lite_master_driver","BVALID timeout");
        end
        else begin
            if (d5m_camera_vif.BVALID == 1'b1 && d5m_camera_vif.BRESP != 2'h0)
            `uvm_error("axi_lite_master_driver","Received ERROR Write Response");
            d5m_camera_vif.BREADY <= d5m_camera_vif.BVALID;
         @(posedge d5m_camera_vif.ACLK);
        end
    endtask: drive_write_data_channel
    //====================================================================================
    //------------------------------------------------------------------------------------
    //--------------------------------- AXI4LITE WRITE READ ADDRESS
    //------------------------------------------------------------------------------------
    //====================================================================================
    virtual protected task drive_read_address_channel (d5m_camera_transaction aL_txn);
        int axi_lite_ctr;
        d5m_camera_vif.ARADDR  <= {8'h0, aL_txn.addr};
        d5m_camera_vif.ARPROT  <= 3'h0;
        d5m_camera_vif.ARVALID <= 1'b1;
        for(axi_lite_ctr = 0; axi_lite_ctr <= 62; axi_lite_ctr ++) begin
            @(posedge d5m_camera_vif.ACLK);
            if (d5m_camera_vif.ARREADY) break;
        end
        if (axi_lite_ctr == 62) begin
            `uvm_error("axi_lite_master_driver","ARVALID timeout");
        end
        @(posedge d5m_camera_vif.ACLK);
        d5m_camera_vif.ARADDR  <= 8'h0;
        d5m_camera_vif.ARPROT  <= 3'h0;
        d5m_camera_vif.ARVALID <= 1'b0;    
    endtask: drive_read_address_channel
    //====================================================================================
    //------------------------------------------------------------------------------------
    //--------------------------------- AXI4LITE READ DATA
    //------------------------------------------------------------------------------------
    //====================================================================================
    virtual protected task drive_read_data_channel (output bit [31:0] data, output bit error);
        int axi_lite_ctr;
        for(axi_lite_ctr = 0; axi_lite_ctr <= 62; axi_lite_ctr ++) begin
            @(posedge d5m_camera_vif.ACLK);
            if (d5m_camera_vif.RVALID) break;
        end
        data = d5m_camera_vif.RDATA;
        if (axi_lite_ctr == 62) begin
            `uvm_error("axi_lite_master_driver","RVALID timeout");
        end
        else begin
        if (d5m_camera_vif.RVALID == 1'b1 && d5m_camera_vif.RRESP != 2'h0)
            `uvm_error("axi_lite_master_driver","Received ERROR Read Response");
            d5m_camera_vif.RREADY <= d5m_camera_vif.RVALID;
            @(posedge d5m_camera_vif.ACLK);
        end
    endtask: drive_read_data_channel
endclass: d5m_camera_driver
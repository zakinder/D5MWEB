// UVM_DRIVER : axi_lite_DRV [AXI4_LITE]
class axi_lite_driver extends uvm_driver #(axi_lite_transaction);
    protected virtual axi4l_if axi4l_vif;
    protected int     id;
    `uvm_component_utils_begin(axi_lite_driver)
        `uvm_field_int(id, UVM_DEFAULT)
    `uvm_component_utils_end
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual axi4l_if)::get(this, "", "axi4l_vif", axi4l_vif))
        `uvm_fatal("NOVIF", {"virtual interface must be set for: ",get_full_name(), ".axi4l_vif"});
    endfunction
    virtual task run_phase (uvm_phase phase);
        fork
            get_and_drive();
            reset_signals();
        join
    endtask: run_phase
    virtual protected task get_and_drive();
        forever begin
            @(posedge axi4l_vif.ACLK);
            if (axi4l_vif.ARESETN == 1'b0) begin
                @(posedge axi4l_vif.ARESETN);
                @(posedge axi4l_vif.ACLK);
            end
            seq_item_port.get_next_item(req);
            //`uvm_info("DRV", req.convert2string(), UVM_LOW)
            repeat(req.cycles) begin
                @(posedge axi4l_vif.ACLK);
            end
            drive_transfer(req);
            seq_item_port.item_done();
        end
    endtask: get_and_drive
    virtual protected task reset_signals();
        forever begin
            @(negedge axi4l_vif.ARESETN);
            axi4l_vif.AWADDR  <=  8'h0;
            axi4l_vif.AWPROT  <=  3'h0;
            axi4l_vif.AWVALID <=  1'b0;
            axi4l_vif.WDATA   <= 32'h0;
            axi4l_vif.WSTRB   <=  4'h0;
            axi4l_vif.WVALID  <=  1'b0;
            axi4l_vif.BREADY  <=  1'b1;
            axi4l_vif.ARADDR  <=  8'h0;
            axi4l_vif.ARPROT  <=  3'h0;
            axi4l_vif.ARVALID <=  1'b0;
            axi4l_vif.RREADY  <=  1'b1;
        end
    endtask: reset_signals
    virtual protected task drive_transfer (axi_lite_transaction aL_txn);
        drive_address_phase(aL_txn);
        drive_data_phase(aL_txn);
    endtask: drive_transfer
    virtual protected task drive_address_phase (axi_lite_transaction aL_txn);
        //`uvm_info("axi_lite_master_driver", "drive_address_phase",UVM_HIGH)
        case (aL_txn.reqWriteRead)
            READ : drive_read_address_channel(aL_txn);
            WRITE: drive_write_address_channel(aL_txn);
        endcase
    endtask: drive_address_phase
    virtual protected task drive_data_phase (axi_lite_transaction aL_txn);
        bit[31:0] rw_data;
        bit err;
        rw_data = aL_txn.data;
        case (aL_txn.reqWriteRead)
        READ : drive_read_data_channel(rw_data, err);
        WRITE: drive_write_data_channel(rw_data, err);
        endcase    
    endtask: drive_data_phase
    virtual protected task drive_write_address_channel (axi_lite_transaction aL_txn);
        int axi_lite_ctr;
        axi4l_vif.AWADDR  <= {8'h0, aL_txn.addr};
        axi4l_vif.AWPROT  <= 3'h0;
        axi4l_vif.AWVALID <= 1'b1;
        for(axi_lite_ctr = 0; axi_lite_ctr <= 31; axi_lite_ctr ++) begin
            @(posedge axi4l_vif.ACLK);
            if (axi4l_vif.AWREADY) break;
        end
        if (axi_lite_ctr == 31) begin
            `uvm_error("axi_lite_master_driver","AWVALID timeout");
        end    
        @(posedge axi4l_vif.ACLK);
        // axi4l_vif.AWADDR  <= 8'h0;
        // axi4l_vif.AWPROT  <= 3'h0;
        // axi4l_vif.AWVALID <= 1'b0;    
    endtask: drive_write_address_channel
    virtual protected task drive_read_address_channel (axi_lite_transaction aL_txn);
        int axi_lite_ctr;
        axi4l_vif.ARADDR  <= {8'h0, aL_txn.addr};
        axi4l_vif.ARPROT  <= 3'h0;
        axi4l_vif.ARVALID <= 1'b1;
        for(axi_lite_ctr = 0; axi_lite_ctr <= 31; axi_lite_ctr ++) begin
            @(posedge axi4l_vif.ACLK);
            if (axi4l_vif.ARREADY) break;
        end
        if (axi_lite_ctr == 31) begin
            `uvm_error("axi_lite_master_driver","ARVALID timeout");
        end
        @(posedge axi4l_vif.ACLK);
        axi4l_vif.ARADDR  <= 8'h0;
        axi4l_vif.ARPROT  <= 3'h0;
        axi4l_vif.ARVALID <= 1'b0;    
    endtask: drive_read_address_channel
    virtual protected task drive_write_data_channel (bit[31:0] data, output bit error);
        int axi_lite_ctr;
        axi4l_vif.WDATA  <= data;
        axi4l_vif.WSTRB  <= 4'hf;
        axi4l_vif.WVALID <= 1'b1;
        @(posedge axi4l_vif.ACLK);
            for(axi_lite_ctr = 0; axi_lite_ctr <= 31; axi_lite_ctr ++) begin
            @(posedge axi4l_vif.ACLK);
            if (axi4l_vif.WREADY) 
                    axi4l_vif.AWADDR  <= 8'h0;
        axi4l_vif.AWPROT  <= 3'h0;
        axi4l_vif.AWVALID <= 1'b0; 
            break;
        end
        if (axi_lite_ctr == 31) begin
            `uvm_error("axi_lite_master_driver","AWVALID timeout");
        end
        @(posedge axi4l_vif.ACLK);
        axi4l_vif.WDATA  <= 32'h0;
        axi4l_vif.WSTRB  <= 4'h0;
        axi4l_vif.WVALID <= 1'b0;
        //wait for write response
        for(axi_lite_ctr = 0; axi_lite_ctr <= 31; axi_lite_ctr ++) begin
            @(posedge axi4l_vif.ACLK);
            if (axi4l_vif.BVALID) break;
        end
        if (axi_lite_ctr == 31) begin
            `uvm_error("axi_lite_master_driver","BVALID timeout");
        end
        else begin
            if (axi4l_vif.BVALID == 1'b1 && axi4l_vif.BRESP != 2'h0)
            `uvm_error("axi_lite_master_driver","Received ERROR Write Response");
            axi4l_vif.BREADY <= axi4l_vif.BVALID;
         @(posedge axi4l_vif.ACLK);
        end
    endtask: drive_write_data_channel
    // drive read data channel
    virtual protected task drive_read_data_channel (output bit [31:0] data, output bit error);
        int axi_lite_ctr;
        for(axi_lite_ctr = 0; axi_lite_ctr <= 31; axi_lite_ctr ++) begin
            @(posedge axi4l_vif.ACLK);
            if (axi4l_vif.RVALID) break;
        end
        data = axi4l_vif.RDATA;
        if (axi_lite_ctr == 31) begin
            `uvm_error("axi_lite_master_driver","RVALID timeout");
        end
        else begin
        if (axi4l_vif.RVALID == 1'b1 && axi4l_vif.RRESP != 2'h0)
            `uvm_error("axi_lite_master_driver","Received ERROR Read Response");
            axi4l_vif.RREADY <= axi4l_vif.RVALID;
            @(posedge axi4l_vif.ACLK);
        end
    endtask: drive_read_data_channel
endclass: axi_lite_driver
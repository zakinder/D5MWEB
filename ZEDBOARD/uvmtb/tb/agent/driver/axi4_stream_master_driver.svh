// UVM_DRIVER : AXI4_STREAM_MASTER_DRIVER 
class axi4_stream_master_driver  extends uvm_driver #(axi4_stream_valid_cycle);
    `uvm_component_utils(axi4_stream_master_driver)
        axi4_stream_config axi4_stream_cfg;
    virtual interface axi4s_if  axi4s_vif;
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction : build_phase
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        forever begin
            if(axi4s_vif.ARESET_N !== 1) begin
                axi4s_vif.TVALID <= 0;
                //`uvm_info(get_type_name(),$psprintf("reset"), UVM_HIGH)
                @(posedge axi4s_vif.ARESET_N);
            //    `uvm_info(get_type_name(),$psprintf("coming out of reset"), UVM_HIGH)
            end
            fork
                begin //-- Asynchronous reset
                    @(negedge axi4s_vif.ARESET_N);
                end
                begin
                    drive_valid_cycles();
                end
            join_any
            disable fork;
        end
    endtask : run_phase
    task drive_valid_cycles();
        @(posedge axi4s_vif.ACLK);
        forever begin
            axi4_stream_valid_cycle  vc;
            //-- Try next AXI4 item
            seq_item_port.try_next_item(vc);
            if( vc != null) begin
                //`uvm_info(get_type_name(),$psprintf("There is an item to sent"), UVM_MEDIUM)
                //`uvm_info(get_type_name(),$psprintf("send %0x %0x", vc.tuser, vc.tdata), UVM_MEDIUM)
                //-- Wait until delay
                repeat(vc.delay)
                    @(posedge axi4s_vif.ACLK);
                //-- Send AXI4 cycle
                axi4s_vif.TDATA  <= vc.tdata;
                axi4s_vif.TUSER  <= vc.tuser;
                axi4s_vif.TVALID <= 1;
                @(posedge axi4s_vif.ACLK)
                while(axi4s_vif.TREADY == 0)
                    @(posedge axi4s_vif.ACLK);
                axi4s_vif.TUSER  <= 0;
                axi4s_vif.TDATA  <= 0;
                axi4s_vif.TVALID <= 0;
                //`uvm_info(get_type_name(),$psprintf("send done: %0x %0x", vc.tuser, vc.tdata), UVM_MEDIUM)
                seq_item_port.item_done();
            end else //-- Else wait 1 cycle
                @(posedge axi4s_vif.ACLK);
        end
    endtask : drive_valid_cycles
endclass: axi4_stream_master_driver
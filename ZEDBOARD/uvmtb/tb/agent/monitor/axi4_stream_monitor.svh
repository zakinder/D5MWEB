// UVM_MONITOR : AXI4_STREAM_MONITOR [AXI4_STREAM]
class axi4_stream_monitor extends uvm_monitor;
    `uvm_component_utils(axi4_stream_monitor)
    virtual interface axi4s_if axi4s_vif;
    uvm_analysis_port #(axi4_stream_valid_cycle)    item_collected_port;
    function new(string name, uvm_component parent);
        super.new(name, parent);
        item_collected_port = new("item_collected_port", this);
    endfunction: new
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction : build_phase
    task run();
        axi4_stream_valid_cycle  vc;
        forever begin
            if (axi4s_vif.ARESET_N !== 1)
            begin
                @(posedge axi4s_vif.ARESET_N);
                `uvm_info(get_type_name(),$psprintf("coming out of reset"), UVM_LOW)
            end
            //fork
                begin //-- Asynchronous reset
                    @(negedge axi4s_vif.ARESET_N);
                end
                forever begin
                    //-- At the positive edge of ACLK
                    @(posedge axi4s_vif.ACLK);
                    //-- Capture valid bus cycles
                    vc = new();
                    if (axi4s_vif.TVALID == 1 && axi4s_vif.TREADY == 1) begin
                        vc.tuser     = axi4s_vif.TUSER;
                        vc.tdata     = axi4s_vif.TDATA;
                        item_collected_port.write(vc);
                        `uvm_info(get_type_name(),$psprintf("valid cycle tuser %0x tdata %0x", vc.tuser, vc.tdata), UVM_HIGH)
                    end
                    //-- used to detect the ax_pkt_delay between packets
                    if (axi4s_vif.TVALID == 0) begin
                        vc.tuser    = 0;
                        vc.tdata    = {DATA_BYTES{16'b0}};;
                        item_collected_port.write(vc);
                    end
                end
            //join_any
            //disable fork;
        end
    endtask : run
endclass: axi4_stream_monitor

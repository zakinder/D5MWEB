// UVM_AGENT : axi_lite_AGT [AXI4_LITE]
class axi_lite_agent extends uvm_agent;
    `uvm_component_utils(axi_lite_agent)
    uvm_analysis_port#(axi_lite_transaction) item_collected_port;
    axi_lite_sequencer       aL_sqr;
    axi_lite_driver          aL_drv;
    axi_lite_monitor         aL_mon;
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        item_collected_port    = new(.name("item_collected_port"),.parent(this));
        aL_mon                 = axi_lite_monitor::type_id::create("aL_mon", this);
        if (get_is_active() == UVM_ACTIVE) begin
            aL_sqr = axi_lite_sequencer::type_id::create("aL_sqr", this);
            aL_drv = axi_lite_driver::type_id::create("aL_drv", this);
        end
    endfunction
    function void connect_phase(uvm_phase phase);
        if (get_is_active() == UVM_ACTIVE) begin
            aL_drv.seq_item_port.connect(aL_sqr.seq_item_export);
            aL_mon.item_collected_port.connect(item_collected_port);
        end
    endfunction
endclass: axi_lite_agent
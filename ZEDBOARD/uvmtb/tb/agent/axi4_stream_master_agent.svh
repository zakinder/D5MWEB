// UVM_AGENT : AXI4_STREAM_MASTER_AGENT [AXI4_STREAM]
class axi4_stream_master_agent extends uvm_agent;
    `uvm_component_utils(axi4_stream_master_agent)
    axi4_stream_config                  axi4_stream_master_cfg;
    axi4_stream_master_driver           axi4_master_driver;
    axi4_stream_master_sequencer        axi_sequencer;
    axi4_stream_monitor                 axi4_monitor;
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (! uvm_config_db#(axi4_stream_config)::get(.cntxt(this),.inst_name (""),.field_name("axi4_stream_master_cfg"),.value(axi4_stream_master_cfg))) begin
        `uvm_error("axi4_stream_master_agent", "axi4_stream_master_cfg not found")
        end
        if (axi4_stream_master_cfg.master_active == UVM_ACTIVE) begin
            axi_sequencer      = axi4_stream_master_sequencer    ::type_id::create(.name("axi_sequencer"),.parent(this));
            axi4_master_driver = axi4_stream_master_driver       ::type_id::create(.name("axi4_master_driver"),.parent(this));
        end
        axi4_monitor = axi4_stream_monitor::type_id::create(.name("axi4_monitor"),.parent(this));
    endfunction: build_phase
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        axi4_monitor.axi4s_vif    = axi4_stream_master_cfg.axi4s_vif;
        if (axi4_stream_master_cfg.master_active == UVM_ACTIVE) begin
            axi4_master_driver.seq_item_port.connect(axi_sequencer.seq_item_export);
            axi4_master_driver.axi4s_vif = axi4_stream_master_cfg.axi4s_vif;
        end
    endfunction: connect_phase
endclass: axi4_stream_master_agent

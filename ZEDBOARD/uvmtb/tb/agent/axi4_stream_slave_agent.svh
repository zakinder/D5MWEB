// UVM_AGENT : AXI4_STREAM_SLAVE_AGENT [AXI4_STREAM]
class axi4_stream_slave_agent extends uvm_agent;
    `uvm_component_utils(axi4_stream_slave_agent)
    axi4_stream_config                  axi4_stream_slave_cfg;
    axi4_stream_slave_driver            axi4_slave_driver;
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (! uvm_config_db#(axi4_stream_config)::get(.cntxt(this),.inst_name (""),.field_name("axi4_stream_slave_cfg"),.value(axi4_stream_slave_cfg))) begin
        `uvm_error("axi4_stream_slave_agent", "axi4_stream_slave_cfg not found")
        end
        if (axi4_stream_slave_cfg.slave_active == UVM_ACTIVE) begin
            axi4_slave_driver = axi4_stream_slave_driver         ::type_id::create(.name("axi4_slave_driver"),.parent(this));
        end
    endfunction: build_phase
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        if (axi4_stream_slave_cfg.slave_active == UVM_ACTIVE) begin
            axi4_slave_driver.axi4s_vif = axi4_stream_slave_cfg.axi4s_vif;
        end
    endfunction: connect_phase
endclass: axi4_stream_slave_agent
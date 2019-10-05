// UVM_ENV : AXI4_LITE_ENV
class axi4_lite_env extends uvm_env;
    `uvm_component_utils(axi4_lite_env)
    
    protected virtual interface axi4l_if axi4l_vif;
    
    axi_lite_agent               aL_agt;
    axi_lite_fc_subscriber       aL_fc_sub;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual axi4l_if)::get(this, "", "axi4l_vif", axi4l_vif))
            `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".axi4l_vif"});
        aL_agt          = axi_lite_agent::type_id::create("aL_agt", this);
        if (!uvm_config_db#(virtual axi4l_if)::get(this, "", "axi4l_vif", axi4l_vif))
            `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".axi4l_vif"});
        aL_fc_sub       = axi_lite_fc_subscriber::type_id::create("aL_fc_sub", this);
    endfunction: build_phase
    
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        aL_agt.item_collected_port.connect(aL_fc_sub.analysis_export);
    endfunction: connect_phase
    
endclass: axi4_lite_env
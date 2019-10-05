// UVM_ENV : TEMPLATE_ENV
class template_env extends uvm_env;
    `uvm_component_utils(template_env)
    
    template_agent              sa_agent;
    template_scoreboard         sa_sb;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        sa_agent        = template_agent            ::type_id::create(.name("sa_agent"), .parent(this));
        sa_sb           = template_scoreboard       ::type_id::create(.name("sa_sb"), .parent(this));
    endfunction: build_phase
    
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        sa_agent.agent_ap_fdut.connect(sa_sb.tp_fdut_sb_export);
        sa_agent.agent_ap_afterToDut.connect(sa_sb.tp_predict_sb_export);
    endfunction: connect_phase
    
endclass: template_env
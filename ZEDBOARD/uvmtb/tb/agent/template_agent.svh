// UVM_AGENT : TEMPLATE_AGENT [TEMPLATE]
class template_agent extends uvm_agent;
    `uvm_component_utils(template_agent)
    uvm_analysis_port#(tp_transaction) agent_ap_fdut;
    uvm_analysis_port#(tp_transaction) agent_ap_afterToDut;
    template_sequencer                 sa_seqr;
    template_driver                    sa_drvr;
    template_monitor_fdut              sa_mon_fdut;
    template_monitor_predict           sa_mon_afterToDut;
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent_ap_fdut               = new(.name("agent_ap_fdut"), .parent(this));
        agent_ap_afterToDut         = new(.name("agent_ap_afterToDut"), .parent(this));
        sa_seqr                     = template_sequencer            ::type_id::create(.name("sa_seqr"), .parent(this));
        sa_drvr                     = template_driver               ::type_id::create(.name("sa_drvr"), .parent(this));
        sa_mon_fdut                 = template_monitor_fdut::type_id::create(.name("sa_mon_fdut"), .parent(this));
        sa_mon_afterToDut           = template_monitor_predict   ::type_id::create(.name("sa_mon_afterToDut"), .parent(this));
    endfunction: build_phase
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        sa_drvr.seq_item_port.connect(sa_seqr.seq_item_export);
        sa_mon_fdut.mon_ap_fdut.connect(agent_ap_fdut);
        sa_mon_afterToDut.mon_ap_afterToDut.connect(agent_ap_afterToDut);
    endfunction: connect_phase
endclass: template_agent
// UVM_ENV : TEMPLATE_ENV
class rgb_env extends uvm_env;
    `uvm_component_utils(rgb_env)
    protected virtual interface rgb_if rgb_vi;
    rgb_agent#(par_1)           frame_agent;
    rgb_fc_subscriber           frame_fc_sub;
    rgb_scoreboard              frame_sb;
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        frame_agent     = rgb_agent#(par_1)         ::type_id::create(.name("frame_agent"),.parent(this));
        frame_fc_sub    = rgb_fc_subscriber         ::type_id::create(.name("frame_fc_sub"),.parent(this));
        frame_sb        = rgb_scoreboard            ::type_id::create(.name("frame_sb"),.parent(this));
    endfunction: build_phase
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        frame_agent.frame_ap.connect(frame_fc_sub.analysis_export);
        frame_agent.frame_ap.connect(frame_sb.frame_analysis_export);
    endfunction: connect_phase
endclass: rgb_env
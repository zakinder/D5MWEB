// UVM_AGENT : RGB_AGENT [RGB]
class rgb_agent#(parameter set_config cfg = par_1) extends uvm_agent;
    `uvm_component_param_utils(rgb_agent#(cfg))
    uvm_analysis_port#(rgb_transaction#(cfg)) frame_ap;
    rgb_sequencer   #(cfg)               frame_seqr;
    rgb_driver      #(cfg)               frame_drvr;
    rgb_monitor     #(cfg)               frame_mon;
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        frame_ap    = new(.name("frame_ap"),.parent(this));
        frame_seqr  = rgb_sequencer#(cfg)  ::type_id::create(.name("frame_seqr"),.parent(this));
        frame_drvr  = rgb_driver   #(cfg)  ::type_id::create(.name("frame_drvr"),.parent(this));
        frame_mon   = rgb_monitor  #(cfg)  ::type_id::create(.name("frame_mon"),.parent(this));
    endfunction: build_phase
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        frame_drvr.seq_item_port.connect(frame_seqr.seq_item_export);
        frame_mon.frame_ap.connect(frame_ap);
    endfunction: connect_phase
endclass: rgb_agent
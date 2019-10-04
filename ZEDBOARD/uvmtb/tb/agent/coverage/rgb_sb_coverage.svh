typedef class rgb_scoreboard;
// UVM_SUBSCRIBER : RGB_SB_SUBSCRIBER [RGB]
class rgb_sb_subscriber extends uvm_subscriber#(rgb_transaction);
    `uvm_component_utils(rgb_sb_subscriber)
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
    function void write(rgb_transaction t);
        rgb_scoreboard frame_sb;
        $cast(frame_sb, m_parent);
        frame_sb.check_rgb_data(t);
    endfunction: write
endclass: rgb_sb_subscriber
//====================================================================================
//------------------------------------------------------------------------------------
//--------------------------------- UVM_SCORECARDS
//------------------------------------------------------------------------------------
//====================================================================================
// UVM_SCORECARD : RGB_SCOREBOARD [RGB]
class rgb_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(rgb_scoreboard)
    uvm_analysis_export#(rgb_transaction)    frame_analysis_export;
    local rgb_sb_subscriber                  frame_sb_sub;
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        frame_analysis_export = new(.name("frame_analysis_export"),.parent(this));
        frame_sb_sub = rgb_sb_subscriber::type_id::create(.name("frame_sb_sub"),.parent(this));
    endfunction: build_phase
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        frame_analysis_export.connect(frame_sb_sub.analysis_export);
    endfunction: connect_phase
    virtual function void check_rgb_data(rgb_transaction frame_tx);
        uvm_table_printer p = new;
    endfunction: check_rgb_data
endclass: rgb_scoreboard
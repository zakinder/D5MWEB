
// UVM_MONITOR : RGB_MONITOR [RGB]
class rgb_monitor#(parameter set_config cfg = par_1) extends uvm_monitor;
    `uvm_component_param_utils(rgb_monitor#(cfg))
    uvm_analysis_port#(rgb_transaction#(cfg)) frame_ap;
    int unsigned agent_id = 1;
    virtual rgb_if#(cfg) rgb_vi;
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        void'(uvm_resource_db#(virtual rgb_if#(cfg))::read_by_name(.scope("ifs"),.name("rgb_if"),.val(rgb_vi)));
        frame_ap = new(.name("frame_ap"),.parent(this));
    endfunction: build_phase
    task run_phase(uvm_phase phase);
    $display("Detected new frame_tx on interface #%d\n", agent_id);
        forever begin
            rgb_transaction#(cfg) frame_tx;
            @rgb_vi.slave_cb;
            frame_tx               = rgb_transaction#(cfg)::type_id::create(.name("frame_tx"));
            frame_tx.iRed          = rgb_vi.slave_cb.iRed;
            frame_tx.iGreen        = rgb_vi.slave_cb.iGreen;
            frame_tx.iBlue         = rgb_vi.slave_cb.iBlue;
            frame_tx.iPixelEn      = rgb_vi.slave_cb.iPixelEn;
            frame_tx.iValid        = rgb_vi.slave_cb.iValid;
            frame_tx.iEof          = rgb_vi.slave_cb.iEof;
            frame_tx.iX            = rgb_vi.slave_cb.iX;
            frame_tx.iY            = rgb_vi.slave_cb.iY;
            frame_ap.write(frame_tx);
        end
    endtask: run_phase
endclass: rgb_monitor
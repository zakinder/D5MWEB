// UVM_DRIVER : RGB_DRIVER [RGB]
class rgb_driver#(parameter set_config cfg = par_1) extends uvm_driver#(rgb_transaction#(cfg));
    `uvm_component_param_utils(rgb_driver#(cfg))
    virtual rgb_if#(cfg) rgb_vi;
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        void'(uvm_resource_db#(virtual rgb_if#(cfg))::read_by_name(.scope("ifs"),.name("rgb_if"),.val(rgb_vi)));
    endfunction: build_phase
    task run_phase(uvm_phase phase);
        rgb_transaction#(cfg) frame_tx;
        forever begin
            @rgb_vi.master_cb;
            seq_item_port.get_next_item(frame_tx);
            @rgb_vi.master_cb;
            rgb_vi.master_cb.iRed        <= frame_tx.iRed;
            rgb_vi.master_cb.iGreen      <= frame_tx.iGreen;
            rgb_vi.master_cb.iBlue       <= frame_tx.iBlue;
            rgb_vi.master_cb.iX          <= frame_tx.iX;
            rgb_vi.master_cb.iY          <= frame_tx.iY;
            rgb_vi.master_cb.iPixelEn    <= frame_tx.iPixelEn;
            rgb_vi.master_cb.iValid      <= frame_tx.iValid;
            rgb_vi.master_cb.iEof        <= frame_tx.iEof;
            seq_item_port.item_done();
        end
    endtask: run_phase
endclass: rgb_driver
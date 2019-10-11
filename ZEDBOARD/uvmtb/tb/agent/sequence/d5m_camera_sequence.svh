// UVM_SEQUENCE : d5m_camera_SEQUENCER [d5m_camera]
class d5m_camera_sequencer extends uvm_sequencer #(d5m_camera_transaction);
    int id;
    `uvm_component_utils_begin(d5m_camera_sequencer)
        `uvm_field_int(id, UVM_DEFAULT)
    `uvm_component_utils_end
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction
endclass: d5m_camera_sequencer
// UVM_SEQUENCE : d5m_camera_BASE_SEQ [d5m_camera]
virtual class d5m_camera_base_seq extends uvm_sequence #(d5m_camera_transaction);
    function new (string name="d5m_camera_base_seq");
        super.new(name);
    endfunction
endclass: d5m_camera_base_seq
// UVM_SEQUENCE : d5m_camera_DIRECTED_SEQ [d5m_camera]
class d5m_camera_directed_sequence extends d5m_camera_base_seq;
    `uvm_object_utils(d5m_camera_directed_sequence)
    function new(string name="d5m_camera_directed_sequence");
        super.new(name);
    endfunction
    virtual task body();
        d5m_camera_transaction item;
        bit [16:0] idata;
        bit [16:0] y_cord;
        bit [16:0] n_frames;
        //init d5m clear
        for(idata = 0; idata <= 10; idata++) begin
            `uvm_create(item)
            item.idata          = 0;
            item.cycles         = 0;
            item.ilval          = 1'b0;
            item.ifval          = 1'b0;
            if (idata > 9 )begin //>200
                item.ifval          = 1'b1;//init default sof valid line high
            end
            `uvm_send(item);
        end
        for(n_frames = 0; n_frames <= item.number_frames; n_frames++) begin
            for(y_cord = 0; y_cord <= item.lval_lines; y_cord++) begin
                for(idata = 1; idata <= ((item.image_width) + (item.lval_offset)); idata++) begin
                    `uvm_create(item)
                    if (y_cord > 0 && y_cord < item.lval_lines) begin
                        item.cycles         = 0;
                        item.ifval          = 1'b1;
                        item.ilval          = 1'b1;// sol[start of line]
                        item.idata          = idata;
                        if (idata >= (item.image_width)) begin   
                            item.ilval      = 1'b0;// eol[end of line]
                            item.idata      = 0;
                        end
                    end else begin
                        item.cycles         = 0;
                        item.ilval          = 1'b0;
                        item.idata          = 0;
                        if (y_cord == 0) begin
                            if (idata >= ((item.image_width) + (item.lval_offset)) - 10)begin   
                                item.ifval      = 1'b1;// sof[start of frame]
                            end
                        end
                        if (y_cord == item.lval_lines) begin
                            if (idata >= (item.image_width) + 2)begin   
                                item.ifval      = 1'b0;// eof[end of frame]
                            end
                        end
                    end
                    `uvm_send(item);
                end
            end
        end
        for(n_frames = 0; n_frames <= item.number_frames; n_frames++) begin
            for(y_cord = 0; y_cord <= item.lval_lines; y_cord++) begin
                for(idata = 1; idata <= ((item.image_width) + (item.lval_offset)); idata++) begin
                    `uvm_create(item)
                    if (y_cord > 0 && y_cord < item.lval_lines) begin
                        item.cycles         = 0;
                        item.ifval          = 1'b1;
                        item.ilval          = 1'b1;// sol[start of line]
                        item.idata          = $urandom_range(0,4095);
                        if (idata >= (item.image_width)) begin   
                            item.ilval      = 1'b0;// eol[end of line]
                            item.idata      = 0;
                        end
                    end else begin
                        item.cycles         = 0;
                        item.ilval          = 1'b0;
                        item.idata          = 0;
                        if (y_cord == 0) begin
                            if (idata >= ((item.image_width) + (item.lval_offset)) - 10)begin   
                                item.ifval      = 1'b1;// sof[start of frame]
                            end
                        end
                        if (y_cord == item.lval_lines) begin
                            if (idata >= (item.image_width) + 2)begin   
                                item.ifval      = 1'b0;// eof[end of frame]
                            end
                        end
                    end
                    `uvm_send(item);
                end
            end
        end
    endtask: body
endclass: d5m_camera_directed_sequence
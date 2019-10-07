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
        //----------------------------
        `uvm_create(item)
        for(idata = 0; idata < 11; idata++) begin
            item.idata          = 0;
            item.cycles         = 0;
            item.ilval          = 1'b0;
            item.ifval          = 1'b0;
            `uvm_send(item);
        end
        //----------------------------
        //LINE 1
        //----------------------------
        for(idata = 0; idata < 300; idata++) begin
        `uvm_create(item)
            item.idata          = idata;
            item.cycles         = 0;
            item.ilval          = 1'b1;
            item.ifval          = 1'b1;
             if (idata >= 199)begin
              item.ilval         = 1'b0;
              item.idata          = 0;
             end
            `uvm_send(item);
        end
        //----------------------------
        //LINE 2
        //----------------------------
        `uvm_create(item)
            idata               = 0;
        for(idata = 0; idata < 300; idata++) begin
            item.idata          = idata;
            item.cycles         = 0;
            item.ilval          = 1'b1;
            item.ifval          = 1'b1;
             if (idata >= 199)begin
              item.ilval         = 1'b0;
              item.idata          = 0;
             end
            `uvm_send(item);
        end
        //----------------------------
        //LINE 3
        //----------------------------
        `uvm_create(item)
            idata               = 0;
        for(idata = 0; idata < 300; idata++) begin
            item.idata          = idata;
            item.cycles         = 0;
            item.ilval          = 1'b1;
            item.ifval          = 1'b1;
             if (idata >= 199)begin
              item.ilval         = 1'b0;
              item.idata          = 0;
             end
            `uvm_send(item);
        end
        //----------------------------
        //LINE 4
        //----------------------------
        `uvm_create(item)
            idata               = 0;
        for(idata = 0; idata < 300; idata++) begin
            item.idata          = idata;
            item.cycles         = 0;
            item.ilval          = 1'b1;
            item.ifval          = 1'b1;
             if (idata >= 199)begin
              item.ilval         = 1'b0;
              item.idata          = 0;
             end
            `uvm_send(item);
        end
        //----------------------------
        //LAST LINE
        //----------------------------
        `uvm_create(item)
            idata               = 0;
        for(idata = 0; idata <= 410; idata++) begin
            item.idata          = idata;
            item.cycles         = 0;
            item.ilval          = 1'b1;
            item.ifval          = 1'b1;
             if (idata >= 199)begin
              item.ilval         = 1'b0;
              item.idata          = 0;
             end
             if (idata  >= 200) begin
              item.ifval         = 1'b0;
             end
            `uvm_send(item);
        end
        //----------------------------
    endtask: body
endclass: d5m_camera_directed_sequence
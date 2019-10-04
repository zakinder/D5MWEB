// UVM_SEQUENCE : TEMPLATE_SEQUENCER [TEMPLATE]
class template_sequencer extends uvm_sequencer #(tp_transaction);
    `uvm_component_utils(template_sequencer)
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
endclass: template_sequencer
// UVM_SEQUENCE : TEMPLATE_BASE_SEQ [TEMPLATE]
virtual class template_base_sequence extends uvm_sequence #(tp_transaction);
    function new (string name="template_base_sequence");
        super.new(name);
    endfunction
endclass: template_base_sequence
// UVM_SEQUENCE : TEMPLATE_SEQUENCE [TEMPLATE]
class template_sequence extends uvm_sequence#(tp_transaction);
    `uvm_object_utils(template_sequence)
    function new(string name = "");
        super.new(name);
    endfunction: new
    task body();
        tp_transaction tx;
        repeat(10000) begin
        tx = tp_transaction::type_id::create(.name("tx"), .contxt(get_full_name()));
        start_item(tx);
            assert(tx.randomize());
            //`uvm_info("sa_sequence", tx.sprint(), UVM_LOW);
        finish_item(tx);
        end
    endtask: body
endclass: template_sequence
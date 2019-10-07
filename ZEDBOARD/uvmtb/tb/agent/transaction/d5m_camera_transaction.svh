// UVM_SEQUENCE_ITEM : d5m_camera_TXN [d5m_camera]
class d5m_camera_transaction extends uvm_sequence_item;
    rand bit [11:0]     idata;
    rand bit            ilval;
    rand bit            ifval;
    rand int unsigned   cycles;
    constraint c_cycles { 
    cycles == 1; }
    function new (string name = "");
        super.new(name);
    endfunction
    `uvm_object_utils_begin(d5m_camera_transaction)
        `uvm_field_int  (idata,                         UVM_DEFAULT)
        `uvm_field_int  (ilval,                         UVM_DEFAULT)
        `uvm_field_int  (ifval,                         UVM_DEFAULT) 
        `uvm_field_int  (cycles,                        UVM_DEFAULT)
    `uvm_object_utils_end
endclass: d5m_camera_transaction

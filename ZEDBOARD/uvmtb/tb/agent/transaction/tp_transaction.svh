// UVM_SEQUENCE_ITEM : TEMPLATE_TRANSACTION [TEMPLATE]
class tp_transaction extends uvm_sequence_item;

    rand bit[1:0]  ina;
    rand bit[1:0]  inb;
    rand bit[11:0] idata;
    
    constraint c_idata { idata <= 20; }
    bit[2:0]      outValTbs;
    bit[2:0]      outValDut;

    function new(string name = "");
        super.new(name);
    endfunction: new

    function string convert2string();
        return $sformatf("idata='d%0d",idata);
    endfunction

    `uvm_object_utils_begin(tp_transaction)
        `uvm_field_int(ina, UVM_ALL_ON)
        `uvm_field_int(inb, UVM_ALL_ON)
        `uvm_field_int(idata, UVM_ALL_ON)
        `uvm_field_int(outValTbs, UVM_ALL_ON)
        `uvm_field_int(outValDut, UVM_ALL_ON)
    `uvm_object_utils_end
    
endclass: tp_transaction
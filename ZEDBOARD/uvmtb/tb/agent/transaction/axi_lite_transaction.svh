// UVM_SEQUENCE_ITEM : axi_lite_TXN [AXI4_LITE]
class axi_lite_transaction extends uvm_sequence_item;
    rand bit [15:0]     addr;
    rand bit [31:0]     data;
    rand bit [31:0]     WDATA;
    rand bit [31:0]     RDATA;
    rand axi_lite_txn_e  reqWriteRead;
    rand int unsigned   cycles;
    constraint c_cycles { 
    cycles <= 20; }
    function new (string name = "");
        super.new(name);
    endfunction
    function string convert2string();
        return $sformatf("addr='h%h, data='h%0h, cycles='d%0d",addr, data, cycles);
    endfunction
    `uvm_object_utils_begin(axi_lite_transaction)
        `uvm_field_int  (addr,                          UVM_DEFAULT)
        `uvm_field_int  (data,                          UVM_DEFAULT)
        `uvm_field_int  (WDATA,                         UVM_DEFAULT)
        `uvm_field_int  (RDATA,                         UVM_DEFAULT)
        `uvm_field_enum (axi_lite_txn_e, reqWriteRead,   UVM_DEFAULT)    
        `uvm_field_int  (cycles,                        UVM_DEFAULT)
    `uvm_object_utils_end
endclass: axi_lite_transaction
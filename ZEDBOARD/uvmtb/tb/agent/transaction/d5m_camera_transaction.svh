// UVM_SEQUENCE_ITEM : d5m_camera_TXN [d5m_camera]
class d5m_camera_transaction extends uvm_sequence_item;
    rand bit [11:0]     idata;
    rand bit            ilval;
    rand bit            ifval;
    rand int unsigned   cycles;
    int                 image_width    = 200; 
    int                 lval_offset    = 100; 
    int                 lval_lines     = 6; //5 lines [1-5] [0 sof clear] [6 eof clear]
    int                 number_frames  = 10; //7 frames [0-7]
    rand bit [15:0]     addr;
    rand bit [31:0]     data;
    rand bit [31:0]     WDATA;
    rand bit [31:0]     RDATA;
    rand d5m_txn_e      d5m_txn;
    
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
        `uvm_field_int  (lval_offset,                   UVM_DEFAULT)
        `uvm_field_int  (lval_lines,                    UVM_DEFAULT)
        `uvm_field_int  (number_frames,                 UVM_DEFAULT)
        `uvm_field_int  (image_width,                   UVM_DEFAULT)
        `uvm_field_int  (addr,                          UVM_DEFAULT)
        `uvm_field_int  (data,                          UVM_DEFAULT)
        `uvm_field_int  (WDATA,                         UVM_DEFAULT)
        `uvm_field_int  (RDATA,                         UVM_DEFAULT)
        `uvm_field_enum (d5m_txn_e, d5m_txn,            UVM_DEFAULT)    
    `uvm_object_utils_end
endclass: d5m_camera_transaction
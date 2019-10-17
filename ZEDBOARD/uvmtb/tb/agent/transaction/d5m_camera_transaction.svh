class d5m_camera_transaction extends uvm_sequence_item;
    rand bit [11:0]     idata;
    rand bit            ilval;
    rand bit            ifval;
    bit [7:0]           ired;
    bit [7:0]           igreen;
    bit [7:0]           iblue;
    bit                 ivalid;
    bit                 readyToRead;
    bit [11:0]          ixCord;
    bit [11:0]          iyCord;
    int                 image_width    = 200; 
    int                 lval_offset    = 50;
    int                 lval_lines     = 5; //lval_lines - 2
    int                 number_frames  = 1;   //7 frames [0-7]
    rand bit [15:0]     addr;
    rand bit [31:0]     data;
    rand d5m_txn_e      d5m_txn;
    function new (string name = "");
        super.new(name);
    endfunction
    `uvm_object_utils_begin(d5m_camera_transaction)
        `uvm_field_int  (idata,                         UVM_DEFAULT);
        `uvm_field_int  (ired ,                         UVM_DEFAULT);
        `uvm_field_int  (igreen ,                       UVM_DEFAULT);
        `uvm_field_int  (iblue ,                        UVM_DEFAULT);
        `uvm_field_int  (ivalid ,                       UVM_DEFAULT);
        `uvm_field_int  (readyToRead ,                  UVM_DEFAULT);
        `uvm_field_int  (ixCord ,                       UVM_DEFAULT);
        `uvm_field_int  (iyCord ,                       UVM_DEFAULT);
        `uvm_field_int  (ilval,                         UVM_DEFAULT);
        `uvm_field_int  (ifval,                         UVM_DEFAULT);
        `uvm_field_int  (lval_offset,                   UVM_DEFAULT);
        `uvm_field_int  (lval_lines,                    UVM_DEFAULT);
        `uvm_field_int  (number_frames,                 UVM_DEFAULT);
        `uvm_field_int  (image_width,                   UVM_DEFAULT);
        `uvm_field_int  (addr,                          UVM_DEFAULT);
        `uvm_field_int  (data,                          UVM_DEFAULT);
        `uvm_field_enum (d5m_txn_e, d5m_txn,            UVM_DEFAULT); 
    `uvm_object_utils_end
endclass: d5m_camera_transaction
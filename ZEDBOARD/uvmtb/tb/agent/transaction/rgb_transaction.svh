// UVM_SEQUENCE_ITEM : RGB_TRANSACTION [RGB]
class rgb_transaction#(parameter set_config cfg = par_1) extends uvm_sequence_item;
    rand bit[cfg.w_p1.data_width-1:0]       iRed;
    rand bit[cfg.w_p1.data_width-1:0]       iGreen;
    rand bit[cfg.w_p1.data_width-1:0]       iBlue;
    rand bit            iPixelEn;
    rand bit            iValid;
    rand bit            iEof;
    rand bit [cfg.w_p1.addr_width-1:0]      iX;
    rand bit [cfg.w_p1.addr_width-1:0]      iY;
    function new(string name = "");
        super.new(name);
    endfunction: new
    `uvm_object_utils_begin(rgb_transaction#(cfg))
        `uvm_field_int(iRed,         UVM_ALL_ON)
        `uvm_field_int(iGreen,       UVM_ALL_ON)
        `uvm_field_int(iBlue,        UVM_ALL_ON)
        `uvm_field_int(iPixelEn,     UVM_ALL_ON)
        `uvm_field_int(iEof,         UVM_ALL_ON)
        `uvm_field_int(iValid,       UVM_ALL_ON)
        `uvm_field_int(iX,           UVM_ALL_ON)
        `uvm_field_int(iY,           UVM_ALL_ON)
    `uvm_object_utils_end
endclass: rgb_transaction
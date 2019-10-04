// UVM_SEQUENCE_ITEM : AXI4_STREAM_VALID_CYCLE [AXI4_STREAM]
class axi4_stream_valid_cycle  extends uvm_sequence_item;
    rand bit [15:0]    tdata;
    rand bit               tuser;
    rand int unsigned      delay = 0;
    constraint c_packet_delay {
        delay < 20 ;
    }
    function new(string name = "");
        super.new(name);
    endfunction: new
    `uvm_object_utils_begin(axi4_stream_valid_cycle)
        `uvm_field_int(tdata, UVM_ALL_ON | UVM_NOPACK | UVM_HEX)
        `uvm_field_int(tuser, UVM_ALL_ON | UVM_NOPACK | UVM_HEX)
        `uvm_field_int(delay, UVM_DEFAULT | UVM_DEC| UVM_NOPACK)
    `uvm_object_utils_end
endclass: axi4_stream_valid_cycle
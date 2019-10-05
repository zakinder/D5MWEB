// UVM_OBJECT : AXI4_STREAM_CONFIG [AXI4_STREAM]
class axi4_stream_config extends uvm_object;
    uvm_active_passive_enum master_active = UVM_ACTIVE;
    uvm_active_passive_enum slave_active  = UVM_ACTIVE;
    uvm_active_passive_enum open_rsp_mode = UVM_ACTIVE;
    virtual axi4s_if axi4s_vif;
    `uvm_object_utils_begin(axi4_stream_config)
        `uvm_field_enum(uvm_active_passive_enum, master_active, UVM_DEFAULT)
        `uvm_field_enum(uvm_active_passive_enum, slave_active,  UVM_DEFAULT)
        `uvm_field_enum(uvm_active_passive_enum, open_rsp_mode,  UVM_DEFAULT)
    `uvm_object_utils_end
    function new(string name = "");
        super.new(name);
    endfunction: new
    virtual function void do_print (uvm_printer printer);
        super.do_print(printer);
    endfunction : do_print
endclass: axi4_stream_config
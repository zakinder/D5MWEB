// UVM_OBJECT : axi_lite_CONFIGURATION [AXI4_LITE]
class axi_lite_configuration extends uvm_object;
    `uvm_object_utils(axi_lite_configuration)
    function new(string name = "");
        super.new(name);
    endfunction: new
endclass: axi_lite_configuration
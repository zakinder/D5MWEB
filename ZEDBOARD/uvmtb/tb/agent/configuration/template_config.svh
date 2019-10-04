// UVM_OBJECT : TEMPLATE_CONFIGURATION [TEMPLATE]
class template_configuration extends uvm_object;
    `uvm_object_utils(template_configuration)
    function new(string name = "");
        super.new(name);
    endfunction: new
endclass: template_configuration
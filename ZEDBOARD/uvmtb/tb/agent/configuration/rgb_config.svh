// UVM_OBJECT : RGB_CONFIGURATION [RGB]
class rgb_configuration extends uvm_object;
    `uvm_object_utils(rgb_configuration)
    function new(string name = "");
        super.new(name);
    endfunction: new
    rand int count;
    constraint c_count    { count > 0; count < 10; }
endclass: rgb_configuration
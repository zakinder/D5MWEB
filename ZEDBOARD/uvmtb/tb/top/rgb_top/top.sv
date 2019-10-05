`include "../../defin_lib.svh"
`include "../../interfaces/rgb_if.sv"
`include "../../interfaces/rgb_color.sv"
module top;
    import uvm_pkg::*;
    import rgb_pkg::*;
    reg clk;
    //INTERFACE
    rgb_if          rgb_vif(clk);                           // RGB_INTERFACE 
    //MODULE
    rgb_color           rgb_dut(rgb_vif);                    // [RGB]
    initial begin
        clk = 0;
        #5ns ;
        forever #5ns clk = ! clk;
    end
    initial begin
        uvm_resource_db #(virtual rgb_if)   ::set(.scope("ifs"),.name("rgb_if"),.val(rgb_vif));
        run_test();
    end
endmodule: top
`include "../../defin_lib.svh"
`include "../../generic_pack.svh"
`include "../../interfaces/tp_if.sv"
`include "../../interfaces/adder.sv"
module top;
    import uvm_pkg::*;
    import template_pkg::*;
    //INTERFACE
    tp_if           tp_vif();                            // TEMPLATE_NTERFACE 
    //MODULE
    adder           template_dut(tp_vif);                // [TEMPLATE]
    initial begin
    tp_vif.sig_clock = 0;
    #5ns ;
    forever #5ns tp_vif.sig_clock = ! tp_vif.sig_clock;
    end
    initial begin
        uvm_resource_db #(virtual tp_if)    ::set(.scope("ifs"), .name("tp_if"), .val(tp_vif));
        run_test();
    end
endmodule: top
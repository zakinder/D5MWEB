`include "../../defin_lib.svh"
`include "../../generic_pack.svh"
`include "../../interfaces/axi4l_if.sv"
`include "../../interfaces/vfp_config_axi4l_dut.sv"
module top;
    import uvm_pkg::*;
    import axi4_lite_pkg::*;
    reg ACLK;
    reg ARESETN  = 1'b1;
    //INTERFACE
    axi4l_if                 axi4l_vif(ACLK,ARESETN);                // AXI_LITE_INTERFACE  
    //MODULE
    vfpConfigAxi4lDut        vfp_dut(axi4l_vif); // [AXI4_LITE]
    initial begin
        ARESETN  = 1'b1;
    #500;
        ARESETN  = 1'b0;
    #500;
        ARESETN  = 1'b1;
    end
    initial begin
        ACLK = 0;
    #5ns ;
    forever #5ns ACLK = ! ACLK;
    end
    initial begin
        uvm_config_db   #(virtual axi4l_if) ::set(null, "*", "axi4l_vif", axi4l_vif);
        run_test();
    end
endmodule: top
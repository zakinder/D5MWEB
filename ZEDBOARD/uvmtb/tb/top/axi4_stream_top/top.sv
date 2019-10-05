`include "../../defin_lib.svh"
`include "../../generic_pack.svh"
`include "../../interfaces/axi4s_if.sv"
`include "../../interfaces/vfp_config_axi4s_dut.sv"
module top;
    import uvm_pkg::*;
    import axi4_stream_pkg::*;
    reg ACLK;
    reg ARESET_N;
    //INTERFACE
    axi4s_if           axi4s_vif(ACLK,ARESET_N);             // AXI4_STREAM_INTERFACE  
    //MODULE
    vfpConfigAxi4sDut  vfp_dut(axi4s_vif); // [AXI4_LITE]
    initial begin
        ARESET_N = 1'b0;
    #1000;
        ARESET_N = 1'b1;
    end
    initial begin
        ACLK = 0;
    #5ns ;
    forever #5ns ACLK = ! ACLK;
    end
    initial begin
        uvm_config_db   #(virtual axi4s_if) ::set(.cntxt(null),.inst_name("uvm_test_top"),.field_name("axi4s_vif"),.value(axi4s_vif));
        run_test();
    end
endmodule: top
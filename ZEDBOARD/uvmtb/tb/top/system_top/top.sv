`include "../../defin_lib.svh"
`include "../../generic_pack.svh"
`include "../../interfaces/axi4l_if.sv"
`include "../../interfaces/axi4s_if.sv"
`include "../../interfaces/rgb_if.sv"
`include "../../interfaces/tp_if.sv"
`include "../../interfaces/d5m_camera_if.sv"
`include "../../interfaces/adder.sv"
`include "../../interfaces/rgb_color.sv"
`include "../../interfaces/vfp_config_dut.sv"
module top;
    import uvm_pkg::*;
    import system_pkg::*;
    reg ACLK;
    reg ARESETN;
    reg ARESET_N;
    reg clk;
    reg pixclk;
    reg reset  = 1'b0;
    //INTERFACE
    axi4l_if        axi4l_vif(ACLK,ARESETN);                // AXI_LITE_INTERFACE  
    axi4s_if        axi4s_vif(ACLK,ARESET_N);               // AXI4_STREAM_INTERFACE  
    rgb_if          rgb_vif(clk);                           // RGB_INTERFACE 
    tp_if           tp_vif();                               // TEMPLATE_NTERFACE 
    d5m_camera_if                 d5m_camera_vif(pixclk,reset);       
    //MODULE
    adder               template_dut(tp_vif);                // [TEMPLATE]
    vfpConfigDut        vfp_dut(axi4l_vif,axi4s_vif,tp_vif,d5m_camera_vif); // [AXI4_LITE]
    rgb_color           rgb_dut(rgb_vif);                    // [RGB]
    //MODULE
    //vfpConfigd5mCameraDut        vfp_dut(d5m_camera_vif); // [d5m_camera]
    initial begin
    #50;
        reset  = 1'b0;
    #50;
        reset  = 1'b1;
    end

    initial begin
        ARESETN  = 1'b0;
        ARESET_N = 1'b0;
    #1000;
        ARESETN  = 1'b1;
        ARESET_N = 1'b1;
    end
    initial begin
        ACLK = 0;
    #5ns ;
    forever #5ns ACLK = ! ACLK;
    end
    initial begin
        tp_vif.sig_clock = 0;
    #5ns ;
    forever #5ns tp_vif.sig_clock = ! tp_vif.sig_clock;
    end
    initial begin
        clk = 0;
        #5ns ;
        forever #5ns clk = ! clk;
    end
    initial begin
        pixclk = 0;
    #5ns ;
    forever #5ns pixclk = ! pixclk;
    end
    initial begin
        uvm_config_db   #(virtual axi4l_if) ::set(null, "*", "axi4l_vif", axi4l_vif);
        uvm_resource_db #(virtual tp_if)    ::set(.scope("ifs"), .name("tp_if"), .val(tp_vif));
        uvm_resource_db #(virtual rgb_if)   ::set(.scope("ifs"),.name("rgb_if"),.val(rgb_vif));
        uvm_config_db   #(virtual d5m_camera_if) ::set(null, "*", "d5m_camera_vif", d5m_camera_vif);
        uvm_config_db   #(virtual axi4s_if) ::set(.cntxt(null),.inst_name("uvm_test_top"),.field_name("axi4s_vif"),.value(axi4s_vif));
        run_test();
    end
endmodule: top
`include "../../defin_lib.svh"
`include "../../generic_pack.svh"
`include "../../interfaces/d5m_camera_if.sv"
`include "../../interfaces/vfp_config_d5m_camera_dut.sv"
module top;
    import uvm_pkg::*;
    import d5m_camera_pkg::*;
    reg pixclk;
    reg ACLK;
    reg reset  = 1'b0;
    //INTERFACE
    d5m_camera_if                 d5m_camera_vif(ACLK,pixclk,reset);                // AXI_LITE_INTERFACE  
    //MODULE
    vfpConfigd5mCameraDut        vfp_dut(d5m_camera_vif); // [d5m_camera]
    
    // reset
    initial begin
    #50;
    reset  = 1'b0;
    #50;
    reset  = 1'b1;
    end
    
    initial begin
    pixclk = 0;
    #10ns;
    forever #10ns pixclk = ! pixclk;
    end
    
    initial begin
    ACLK = 0;
    #5ns ;
    forever #5ns ACLK = ! ACLK;
    end
    
    initial begin
        uvm_config_db   #(virtual d5m_camera_if) ::set(null, "*", "d5m_camera_vif", d5m_camera_vif);
        run_test();
    end
endmodule: top
// MODULE : ADDER [TEMPLATE]
module rgbAssertionDut(d5m_camera_if.ConfigMaster d5m_camera_vif);
    rgbAssertion rgb_dut (
   .clk         (d5m_camera_vif.pixclk),
   .reset       (d5m_camera_vif.reset),
   .valid       (d5m_camera_vif.valid),
   .iRed        (d5m_camera_vif.red),
   .iGreen      (d5m_camera_vif.green),
   .iBlue       (d5m_camera_vif.blue));
endmodule: rgbAssertionDut
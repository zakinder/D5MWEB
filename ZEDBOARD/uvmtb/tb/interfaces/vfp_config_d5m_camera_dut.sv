// MODULE : VFPCONFIGDUT
module imageReadInterfaceDut(d5m_camera_if.ConfigMaster d5m_camera_vif);
import generic_pack::*;  
    imageReadInterface imageReadInst (
    .clk                       (d5m_camera_vif.pixclk),
    .reset                     (d5m_camera_vif.reset),
    .readyToRead               (d5m_camera_vif.readyToRead),
    .valid                     (d5m_camera_vif.valid),
    .red                       (d5m_camera_vif.red),
    .green                     (d5m_camera_vif.green),
    .blue                      (d5m_camera_vif.blue),
    .xCord                     (d5m_camera_vif.xCord),
    .yCord                     (d5m_camera_vif.yCord),
    .endOfFrame                (d5m_camera_vif.endOfFrame));
endmodule: imageReadInterfaceDut
module vfpConfigd5mCameraDut(d5m_camera_if.ConfigMaster d5m_camera_vif);
import generic_pack::*;  
    VFP_v1_0                  #(
    .revision_number           ( revision_number            ),
    .C_rgb_m_axis_TDATA_WIDTH  ( C_rgb_m_axis_TDATA_WIDTH   ),
    .C_rgb_m_axis_START_COUNT  ( C_rgb_m_axis_START_COUNT   ),
    .C_rgb_s_axis_TDATA_WIDTH  ( C_rgb_s_axis_TDATA_WIDTH   ),
    .C_m_axis_mm2s_TDATA_WIDTH ( C_m_axis_mm2s_TDATA_WIDTH  ),
    .C_m_axis_mm2s_START_COUNT ( C_m_axis_mm2s_START_COUNT  ),
    .C_vfpConfig_DATA_WIDTH    ( C_vfpConfig_DATA_WIDTH     ),
    .C_vfpConfig_ADDR_WIDTH    ( C_vfpConfig_ADDR_WIDTH     ),
    .conf_data_width           ( conf_data_width            ),
    .conf_addr_width           ( conf_addr_width            ),
    .i_data_width              ( i_data_width               ),
    .s_data_width              ( s_data_width               ),
    .b_data_width              ( b_data_width               ),
    .i_precision               ( i_precision                ),
    .i_full_range              ( i_full_range               ),
    .img_width                 ( img_width                  ),
    .dataWidth                 ( dataWidth                  ))
    dutVFP_v1Inst              (
    //d5m input
    .pixclk                    (d5m_camera_vif.pixclk        ),//(d5m_camera_vif.ACLK   ),
    .ifval                     (d5m_camera_vif.ifval         ),//(d5m_camera_vif.ARESETN),
    .ilval                     (d5m_camera_vif.ilval         ),//(d5m_camera_vif.AWADDR ),
    .idata                     (d5m_camera_vif.idata         ),//(d5m_camera_vif.AWPROT ),
    //tx channel
    .rgb_m_axis_aclk           (d5m_camera_vif.ACLK          ),
    .rgb_m_axis_aresetn        (d5m_camera_vif.ARESETN       ),
    .rgb_m_axis_tready         (d5m_camera_vif.rgb_s_axis_tready),//input
    .rgb_m_axis_tvalid         (d5m_camera_vif.rgb_m_axis_tvalid),//output
    .rgb_m_axis_tlast          (d5m_camera_vif.rgb_m_axis_tlast),//output
    .rgb_m_axis_tuser          (d5m_camera_vif.rgb_m_axis_tuser),//output
    .rgb_m_axis_tdata          (d5m_camera_vif.rgb_m_axis_tdata),//output
    //rx channel               
    .rgb_s_axis_aclk           (d5m_camera_vif.ACLK          ),
    .rgb_s_axis_aresetn        (d5m_camera_vif.ARESETN       ),
    .rgb_s_axis_tready         (d5m_camera_vif.rgb_s_axis_tready),//output
    .rgb_s_axis_tvalid         (d5m_camera_vif.rgb_m_axis_tvalid),//input
    .rgb_s_axis_tlast          (d5m_camera_vif.rgb_m_axis_tlast),//input
    .rgb_s_axis_tuser          (d5m_camera_vif.rgb_m_axis_tuser),//input
    .rgb_s_axis_tdata          (d5m_camera_vif.rgb_m_axis_tdata),//input
    //destination channel                                    
    .m_axis_mm2s_aclk          (d5m_camera_vif.ACLK          ),
    .m_axis_mm2s_aresetn       (d5m_camera_vif.ARESETN       ),
    .m_axis_mm2s_tready        (d5m_camera_vif.m_axis_mm2s_tready),//input
    .m_axis_mm2s_tvalid        (d5m_camera_vif.m_axis_mm2s_tvalid),//output
    .m_axis_mm2s_tuser         (d5m_camera_vif.m_axis_mm2s_tuser),//output
    .m_axis_mm2s_tlast         (d5m_camera_vif.m_axis_mm2s_tlast),//output
    .m_axis_mm2s_tdata         (d5m_camera_vif.m_axis_mm2s_tdata),//output
    .m_axis_mm2s_tkeep         (d5m_camera_vif.m_axis_mm2s_tkeep),//output
    .m_axis_mm2s_tstrb         (d5m_camera_vif.m_axis_mm2s_tstrb),//output
    .m_axis_mm2s_tid           (d5m_camera_vif.m_axis_mm2s_tid),//output
    .m_axis_mm2s_tdest         (d5m_camera_vif.m_axis_mm2s_tdest),//output
    //video configuration      
    .vfpconfig_aclk            (d5m_camera_vif.ACLK          ),
    .vfpconfig_aresetn         (d5m_camera_vif.ARESETN       ),
    .vfpconfig_awaddr          (d5m_camera_vif.AWADDR        ),
    .vfpconfig_awprot          (d5m_camera_vif.AWPROT        ),
    .vfpconfig_awvalid         (d5m_camera_vif.AWVALID       ),
    .vfpconfig_awready         (d5m_camera_vif.AWREADY       ),
    .vfpconfig_wdata           (d5m_camera_vif.WDATA         ),
    .vfpconfig_wstrb           (d5m_camera_vif.WSTRB         ),
    .vfpconfig_wvalid          (d5m_camera_vif.WVALID        ),
    .vfpconfig_wready          (d5m_camera_vif.WREADY        ),
    .vfpconfig_bresp           (d5m_camera_vif.BRESP         ),
    .vfpconfig_bvalid          (d5m_camera_vif.BVALID        ),
    .vfpconfig_bready          (d5m_camera_vif.BREADY        ),
    .vfpconfig_araddr          (d5m_camera_vif.ARADDR        ),
    .vfpconfig_arprot          (d5m_camera_vif.ARPROT        ),
    .vfpconfig_arvalid         (d5m_camera_vif.ARVALID       ),
    .vfpconfig_arready         (d5m_camera_vif.ARREADY       ),
    .vfpconfig_rdata           (d5m_camera_vif.RDATA         ),
    .vfpconfig_rresp           (d5m_camera_vif.RRESP         ),
    .vfpconfig_rvalid          (d5m_camera_vif.RVALID        ),
    .vfpconfig_rready          (d5m_camera_vif.RREADY        ));
endmodule: vfpConfigd5mCameraDut
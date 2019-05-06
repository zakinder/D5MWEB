// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
// Date        : Sun May  5 21:53:59 2019
// Host        : BLACKHOLE running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               z:/ZEDBOARD/vivado/zynq_soc/ZEDBOARD.srcs/sources_1/bd/zynq_soc/ip/zynq_soc_VFP_0/zynq_soc_VFP_0_stub.v
// Design      : zynq_soc_VFP_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "VFP_v1_0,Vivado 2017.2" *)
module zynq_soc_VFP_0(pixclk, ifval, ilval, idata, rgb_s_axis_tdata, 
  rgb_s_axis_tlast, rgb_s_axis_tvalid, rgb_s_axis_tuser, rgb_s_axis_tready, 
  rgb_s_axis_aclk, rgb_s_axis_aresetn, vfpconfig_awaddr, vfpconfig_awprot, 
  vfpconfig_awvalid, vfpconfig_awready, vfpconfig_wdata, vfpconfig_wstrb, vfpconfig_wvalid, 
  vfpconfig_wready, vfpconfig_bresp, vfpconfig_bvalid, vfpconfig_bready, vfpconfig_araddr, 
  vfpconfig_arprot, vfpconfig_arvalid, vfpconfig_arready, vfpconfig_rdata, vfpconfig_rresp, 
  vfpconfig_rvalid, vfpconfig_rready, vfpconfig_aclk, vfpconfig_aresetn, rgb_m_axis_tdata, 
  rgb_m_axis_tlast, rgb_m_axis_tuser, rgb_m_axis_tvalid, rgb_m_axis_tready, 
  rgb_m_axis_aclk, rgb_m_axis_aresetn, m_axis_mm2s_tdata, m_axis_mm2s_tkeep, 
  m_axis_mm2s_tstrb, m_axis_mm2s_tid, m_axis_mm2s_tdest, m_axis_mm2s_tlast, 
  m_axis_mm2s_tvalid, m_axis_mm2s_tuser, m_axis_mm2s_tready, m_axis_mm2s_aclk, 
  m_axis_mm2s_aresetn)
/* synthesis syn_black_box black_box_pad_pin="pixclk,ifval,ilval,idata[11:0],rgb_s_axis_tdata[15:0],rgb_s_axis_tlast,rgb_s_axis_tvalid,rgb_s_axis_tuser,rgb_s_axis_tready,rgb_s_axis_aclk,rgb_s_axis_aresetn,vfpconfig_awaddr[7:0],vfpconfig_awprot[2:0],vfpconfig_awvalid,vfpconfig_awready,vfpconfig_wdata[31:0],vfpconfig_wstrb[3:0],vfpconfig_wvalid,vfpconfig_wready,vfpconfig_bresp[1:0],vfpconfig_bvalid,vfpconfig_bready,vfpconfig_araddr[7:0],vfpconfig_arprot[2:0],vfpconfig_arvalid,vfpconfig_arready,vfpconfig_rdata[31:0],vfpconfig_rresp[1:0],vfpconfig_rvalid,vfpconfig_rready,vfpconfig_aclk,vfpconfig_aresetn,rgb_m_axis_tdata[15:0],rgb_m_axis_tlast,rgb_m_axis_tuser,rgb_m_axis_tvalid,rgb_m_axis_tready,rgb_m_axis_aclk,rgb_m_axis_aresetn,m_axis_mm2s_tdata[15:0],m_axis_mm2s_tkeep[2:0],m_axis_mm2s_tstrb[2:0],m_axis_mm2s_tid[0:0],m_axis_mm2s_tdest[0:0],m_axis_mm2s_tlast,m_axis_mm2s_tvalid,m_axis_mm2s_tuser,m_axis_mm2s_tready,m_axis_mm2s_aclk,m_axis_mm2s_aresetn" */;
  input pixclk;
  input ifval;
  input ilval;
  input [11:0]idata;
  input [15:0]rgb_s_axis_tdata;
  input rgb_s_axis_tlast;
  input rgb_s_axis_tvalid;
  input rgb_s_axis_tuser;
  output rgb_s_axis_tready;
  input rgb_s_axis_aclk;
  input rgb_s_axis_aresetn;
  input [7:0]vfpconfig_awaddr;
  input [2:0]vfpconfig_awprot;
  input vfpconfig_awvalid;
  output vfpconfig_awready;
  input [31:0]vfpconfig_wdata;
  input [3:0]vfpconfig_wstrb;
  input vfpconfig_wvalid;
  output vfpconfig_wready;
  output [1:0]vfpconfig_bresp;
  output vfpconfig_bvalid;
  input vfpconfig_bready;
  input [7:0]vfpconfig_araddr;
  input [2:0]vfpconfig_arprot;
  input vfpconfig_arvalid;
  output vfpconfig_arready;
  output [31:0]vfpconfig_rdata;
  output [1:0]vfpconfig_rresp;
  output vfpconfig_rvalid;
  input vfpconfig_rready;
  input vfpconfig_aclk;
  input vfpconfig_aresetn;
  output [15:0]rgb_m_axis_tdata;
  output rgb_m_axis_tlast;
  output rgb_m_axis_tuser;
  output rgb_m_axis_tvalid;
  input rgb_m_axis_tready;
  input rgb_m_axis_aclk;
  input rgb_m_axis_aresetn;
  output [15:0]m_axis_mm2s_tdata;
  output [2:0]m_axis_mm2s_tkeep;
  output [2:0]m_axis_mm2s_tstrb;
  output [0:0]m_axis_mm2s_tid;
  output [0:0]m_axis_mm2s_tdest;
  output m_axis_mm2s_tlast;
  output m_axis_mm2s_tvalid;
  output m_axis_mm2s_tuser;
  input m_axis_mm2s_tready;
  input m_axis_mm2s_aclk;
  input m_axis_mm2s_aresetn;
endmodule

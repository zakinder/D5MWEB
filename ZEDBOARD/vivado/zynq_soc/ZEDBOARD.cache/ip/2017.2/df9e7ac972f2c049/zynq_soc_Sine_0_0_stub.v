// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
// Date        : Mon May  6 23:07:05 2019
// Host        : BLACKHOLE running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ zynq_soc_Sine_0_0_stub.v
// Design      : zynq_soc_Sine_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "Sine_v2_0,Vivado 2017.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(ctrl_saxi_awaddr, ctrl_saxi_awprot, 
  ctrl_saxi_awvalid, ctrl_saxi_awready, ctrl_saxi_wdata, ctrl_saxi_wstrb, ctrl_saxi_wvalid, 
  ctrl_saxi_wready, ctrl_saxi_bresp, ctrl_saxi_bvalid, ctrl_saxi_bready, ctrl_saxi_araddr, 
  ctrl_saxi_arprot, ctrl_saxi_arvalid, ctrl_saxi_arready, ctrl_saxi_rdata, ctrl_saxi_rresp, 
  ctrl_saxi_rvalid, ctrl_saxi_rready, ctrl_saxi_aclk, ctrl_saxi_aresetn)
/* synthesis syn_black_box black_box_pad_pin="ctrl_saxi_awaddr[6:0],ctrl_saxi_awprot[2:0],ctrl_saxi_awvalid,ctrl_saxi_awready,ctrl_saxi_wdata[31:0],ctrl_saxi_wstrb[3:0],ctrl_saxi_wvalid,ctrl_saxi_wready,ctrl_saxi_bresp[1:0],ctrl_saxi_bvalid,ctrl_saxi_bready,ctrl_saxi_araddr[6:0],ctrl_saxi_arprot[2:0],ctrl_saxi_arvalid,ctrl_saxi_arready,ctrl_saxi_rdata[31:0],ctrl_saxi_rresp[1:0],ctrl_saxi_rvalid,ctrl_saxi_rready,ctrl_saxi_aclk,ctrl_saxi_aresetn" */;
  input [6:0]ctrl_saxi_awaddr;
  input [2:0]ctrl_saxi_awprot;
  input ctrl_saxi_awvalid;
  output ctrl_saxi_awready;
  input [31:0]ctrl_saxi_wdata;
  input [3:0]ctrl_saxi_wstrb;
  input ctrl_saxi_wvalid;
  output ctrl_saxi_wready;
  output [1:0]ctrl_saxi_bresp;
  output ctrl_saxi_bvalid;
  input ctrl_saxi_bready;
  input [6:0]ctrl_saxi_araddr;
  input [2:0]ctrl_saxi_arprot;
  input ctrl_saxi_arvalid;
  output ctrl_saxi_arready;
  output [31:0]ctrl_saxi_rdata;
  output [1:0]ctrl_saxi_rresp;
  output ctrl_saxi_rvalid;
  input ctrl_saxi_rready;
  input ctrl_saxi_aclk;
  input ctrl_saxi_aresetn;
endmodule

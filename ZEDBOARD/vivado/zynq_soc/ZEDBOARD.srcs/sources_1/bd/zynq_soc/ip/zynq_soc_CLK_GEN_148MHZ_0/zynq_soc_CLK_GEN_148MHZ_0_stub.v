// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
// Date        : Mon Apr 15 23:02:25 2019
// Host        : MARS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               z:/Documents/GitHub/D5MWEB/ZEDBOARD/vivado/zynq_soc/ZEDBOARD.srcs/sources_1/bd/zynq_soc/ip/zynq_soc_CLK_GEN_148MHZ_0/zynq_soc_CLK_GEN_148MHZ_0_stub.v
// Design      : zynq_soc_CLK_GEN_148MHZ_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module zynq_soc_CLK_GEN_148MHZ_0(clk_out1, clk_out2, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,clk_out2,clk_in1" */;
  output clk_out1;
  output clk_out2;
  input clk_in1;
endmodule

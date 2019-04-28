// (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

// IP VLNV: xilinx.com:user:VFP:1.0
// IP Revision: 30

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
VFP_0 your_instance_name (
  .pixclk(pixclk),                            // input wire pixclk
  .ifval(ifval),                              // input wire ifval
  .ilval(ilval),                              // input wire ilval
  .idata(idata),                              // input wire [11 : 0] idata
  .rgb_s_axis_tdata(rgb_s_axis_tdata),        // input wire [15 : 0] rgb_s_axis_tdata
  .rgb_s_axis_tlast(rgb_s_axis_tlast),        // input wire rgb_s_axis_tlast
  .rgb_s_axis_tvalid(rgb_s_axis_tvalid),      // input wire rgb_s_axis_tvalid
  .rgb_s_axis_tuser(rgb_s_axis_tuser),        // input wire rgb_s_axis_tuser
  .rgb_s_axis_tready(rgb_s_axis_tready),      // output wire rgb_s_axis_tready
  .rgb_s_axis_aclk(rgb_s_axis_aclk),          // input wire rgb_s_axis_aclk
  .rgb_s_axis_aresetn(rgb_s_axis_aresetn),    // input wire rgb_s_axis_aresetn
  .vfpconfig_awaddr(vfpconfig_awaddr),        // input wire [7 : 0] vfpconfig_awaddr
  .vfpconfig_awprot(vfpconfig_awprot),        // input wire [2 : 0] vfpconfig_awprot
  .vfpconfig_awvalid(vfpconfig_awvalid),      // input wire vfpconfig_awvalid
  .vfpconfig_awready(vfpconfig_awready),      // output wire vfpconfig_awready
  .vfpconfig_wdata(vfpconfig_wdata),          // input wire [31 : 0] vfpconfig_wdata
  .vfpconfig_wstrb(vfpconfig_wstrb),          // input wire [3 : 0] vfpconfig_wstrb
  .vfpconfig_wvalid(vfpconfig_wvalid),        // input wire vfpconfig_wvalid
  .vfpconfig_wready(vfpconfig_wready),        // output wire vfpconfig_wready
  .vfpconfig_bresp(vfpconfig_bresp),          // output wire [1 : 0] vfpconfig_bresp
  .vfpconfig_bvalid(vfpconfig_bvalid),        // output wire vfpconfig_bvalid
  .vfpconfig_bready(vfpconfig_bready),        // input wire vfpconfig_bready
  .vfpconfig_araddr(vfpconfig_araddr),        // input wire [7 : 0] vfpconfig_araddr
  .vfpconfig_arprot(vfpconfig_arprot),        // input wire [2 : 0] vfpconfig_arprot
  .vfpconfig_arvalid(vfpconfig_arvalid),      // input wire vfpconfig_arvalid
  .vfpconfig_arready(vfpconfig_arready),      // output wire vfpconfig_arready
  .vfpconfig_rdata(vfpconfig_rdata),          // output wire [31 : 0] vfpconfig_rdata
  .vfpconfig_rresp(vfpconfig_rresp),          // output wire [1 : 0] vfpconfig_rresp
  .vfpconfig_rvalid(vfpconfig_rvalid),        // output wire vfpconfig_rvalid
  .vfpconfig_rready(vfpconfig_rready),        // input wire vfpconfig_rready
  .vfpconfig_aclk(vfpconfig_aclk),            // input wire vfpconfig_aclk
  .vfpconfig_aresetn(vfpconfig_aresetn),      // input wire vfpconfig_aresetn
  .rgb_m_axis_tdata(rgb_m_axis_tdata),        // output wire [15 : 0] rgb_m_axis_tdata
  .rgb_m_axis_tlast(rgb_m_axis_tlast),        // output wire rgb_m_axis_tlast
  .rgb_m_axis_tuser(rgb_m_axis_tuser),        // output wire rgb_m_axis_tuser
  .rgb_m_axis_tvalid(rgb_m_axis_tvalid),      // output wire rgb_m_axis_tvalid
  .rgb_m_axis_tready(rgb_m_axis_tready),      // input wire rgb_m_axis_tready
  .rgb_m_axis_aclk(rgb_m_axis_aclk),          // input wire rgb_m_axis_aclk
  .rgb_m_axis_aresetn(rgb_m_axis_aresetn),    // input wire rgb_m_axis_aresetn
  .m_axis_mm2s_tdata(m_axis_mm2s_tdata),      // output wire [15 : 0] m_axis_mm2s_tdata
  .m_axis_mm2s_tkeep(m_axis_mm2s_tkeep),      // output wire [2 : 0] m_axis_mm2s_tkeep
  .m_axis_mm2s_tstrb(m_axis_mm2s_tstrb),      // output wire [2 : 0] m_axis_mm2s_tstrb
  .m_axis_mm2s_tid(m_axis_mm2s_tid),          // output wire [0 : 0] m_axis_mm2s_tid
  .m_axis_mm2s_tdest(m_axis_mm2s_tdest),      // output wire [0 : 0] m_axis_mm2s_tdest
  .m_axis_mm2s_tlast(m_axis_mm2s_tlast),      // output wire m_axis_mm2s_tlast
  .m_axis_mm2s_tvalid(m_axis_mm2s_tvalid),    // output wire m_axis_mm2s_tvalid
  .m_axis_mm2s_tuser(m_axis_mm2s_tuser),      // output wire m_axis_mm2s_tuser
  .m_axis_mm2s_tready(m_axis_mm2s_tready),    // input wire m_axis_mm2s_tready
  .m_axis_mm2s_aclk(m_axis_mm2s_aclk),        // input wire m_axis_mm2s_aclk
  .m_axis_mm2s_aresetn(m_axis_mm2s_aresetn)  // input wire m_axis_mm2s_aresetn
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file VFP_0.v when simulating
// the core, VFP_0. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.


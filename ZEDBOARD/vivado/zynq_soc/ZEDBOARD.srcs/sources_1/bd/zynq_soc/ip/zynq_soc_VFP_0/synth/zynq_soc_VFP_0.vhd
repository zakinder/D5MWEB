-- (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: zakinder:DisplayIO:VFP:1.0
-- IP Revision: 17

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY xil_defaultlib;
USE xil_defaultlib.VFP_v1_0;

ENTITY zynq_soc_VFP_0 IS
  PORT (
    pixclk : IN STD_LOGIC;
    ifval : IN STD_LOGIC;
    ilval : IN STD_LOGIC;
    idata : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    rgb_s_axis_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgb_s_axis_tlast : IN STD_LOGIC;
    rgb_s_axis_tvalid : IN STD_LOGIC;
    rgb_s_axis_tuser : IN STD_LOGIC;
    rgb_s_axis_tready : OUT STD_LOGIC;
    rgb_s_axis_aclk : IN STD_LOGIC;
    rgb_s_axis_aresetn : IN STD_LOGIC;
    vfpconfig_awaddr : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    vfpconfig_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    vfpconfig_awvalid : IN STD_LOGIC;
    vfpconfig_awready : OUT STD_LOGIC;
    vfpconfig_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    vfpconfig_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    vfpconfig_wvalid : IN STD_LOGIC;
    vfpconfig_wready : OUT STD_LOGIC;
    vfpconfig_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    vfpconfig_bvalid : OUT STD_LOGIC;
    vfpconfig_bready : IN STD_LOGIC;
    vfpconfig_araddr : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    vfpconfig_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    vfpconfig_arvalid : IN STD_LOGIC;
    vfpconfig_arready : OUT STD_LOGIC;
    vfpconfig_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    vfpconfig_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    vfpconfig_rvalid : OUT STD_LOGIC;
    vfpconfig_rready : IN STD_LOGIC;
    vfpconfig_aclk : IN STD_LOGIC;
    vfpconfig_aresetn : IN STD_LOGIC;
    rgb_m_axis_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    rgb_m_axis_tlast : OUT STD_LOGIC;
    rgb_m_axis_tuser : OUT STD_LOGIC;
    rgb_m_axis_tvalid : OUT STD_LOGIC;
    rgb_m_axis_tready : IN STD_LOGIC;
    rgb_m_axis_aclk : IN STD_LOGIC;
    rgb_m_axis_aresetn : IN STD_LOGIC;
    m_axis_mm2s_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_mm2s_tkeep : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axis_mm2s_tstrb : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axis_mm2s_tid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axis_mm2s_tdest : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axis_mm2s_tlast : OUT STD_LOGIC;
    m_axis_mm2s_tvalid : OUT STD_LOGIC;
    m_axis_mm2s_tuser : OUT STD_LOGIC;
    m_axis_mm2s_tready : IN STD_LOGIC;
    m_axis_mm2s_aclk : IN STD_LOGIC;
    m_axis_mm2s_aresetn : IN STD_LOGIC
  );
END zynq_soc_VFP_0;

ARCHITECTURE zynq_soc_VFP_0_arch OF zynq_soc_VFP_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF zynq_soc_VFP_0_arch: ARCHITECTURE IS "yes";
  COMPONENT VFP_v1_0 IS
    GENERIC (
      C_rgb_s_axis_TDATA_WIDTH : INTEGER; -- AXI4Stream sink: Data Width
      C_vfpConfig_DATA_WIDTH : INTEGER; -- Width of S_AXI data bus
      C_vfpConfig_ADDR_WIDTH : INTEGER; -- Width of S_AXI address bus
      C_rgb_m_axis_TDATA_WIDTH : INTEGER; -- Width of S_AXIS address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.
      C_rgb_m_axis_START_COUNT : INTEGER; -- Start count is the numeber of clock cycles the master will wait before initiating/issuing any transaction.
      C_m_axis_mm2s_TDATA_WIDTH : INTEGER; -- Width of S_AXIS address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.
      C_m_axis_mm2s_START_COUNT : INTEGER; -- Start count is the numeber of clock cycles the master will wait before initiating/issuing any transaction.
      revision_number : STD_LOGIC_VECTOR(31 DOWNTO 0);
      i_data_width : INTEGER;
      s_data_width : INTEGER;
      b_data_width : INTEGER;
      i_precision : INTEGER;
      i_full_range : BOOLEAN;
      conf_data_width : INTEGER;
      conf_addr_width : INTEGER;
      img_width : INTEGER;
      dataWidth : INTEGER
    );
    PORT (
      pixclk : IN STD_LOGIC;
      ifval : IN STD_LOGIC;
      ilval : IN STD_LOGIC;
      idata : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      rgb_s_axis_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      rgb_s_axis_tlast : IN STD_LOGIC;
      rgb_s_axis_tvalid : IN STD_LOGIC;
      rgb_s_axis_tuser : IN STD_LOGIC;
      rgb_s_axis_tready : OUT STD_LOGIC;
      rgb_s_axis_aclk : IN STD_LOGIC;
      rgb_s_axis_aresetn : IN STD_LOGIC;
      vfpconfig_awaddr : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      vfpconfig_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      vfpconfig_awvalid : IN STD_LOGIC;
      vfpconfig_awready : OUT STD_LOGIC;
      vfpconfig_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      vfpconfig_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      vfpconfig_wvalid : IN STD_LOGIC;
      vfpconfig_wready : OUT STD_LOGIC;
      vfpconfig_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      vfpconfig_bvalid : OUT STD_LOGIC;
      vfpconfig_bready : IN STD_LOGIC;
      vfpconfig_araddr : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      vfpconfig_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      vfpconfig_arvalid : IN STD_LOGIC;
      vfpconfig_arready : OUT STD_LOGIC;
      vfpconfig_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      vfpconfig_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      vfpconfig_rvalid : OUT STD_LOGIC;
      vfpconfig_rready : IN STD_LOGIC;
      vfpconfig_aclk : IN STD_LOGIC;
      vfpconfig_aresetn : IN STD_LOGIC;
      rgb_m_axis_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      rgb_m_axis_tlast : OUT STD_LOGIC;
      rgb_m_axis_tuser : OUT STD_LOGIC;
      rgb_m_axis_tvalid : OUT STD_LOGIC;
      rgb_m_axis_tready : IN STD_LOGIC;
      rgb_m_axis_aclk : IN STD_LOGIC;
      rgb_m_axis_aresetn : IN STD_LOGIC;
      m_axis_mm2s_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      m_axis_mm2s_tkeep : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axis_mm2s_tstrb : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axis_mm2s_tid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axis_mm2s_tdest : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axis_mm2s_tlast : OUT STD_LOGIC;
      m_axis_mm2s_tvalid : OUT STD_LOGIC;
      m_axis_mm2s_tuser : OUT STD_LOGIC;
      m_axis_mm2s_tready : IN STD_LOGIC;
      m_axis_mm2s_aclk : IN STD_LOGIC;
      m_axis_mm2s_aresetn : IN STD_LOGIC
    );
  END COMPONENT VFP_v1_0;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF zynq_soc_VFP_0_arch: ARCHITECTURE IS "VFP_v1_0,Vivado 2017.2";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF zynq_soc_VFP_0_arch : ARCHITECTURE IS "zynq_soc_VFP_0,VFP_v1_0,{}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF rgb_s_axis_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 rgb_s_axis TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF rgb_s_axis_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 rgb_s_axis TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF rgb_s_axis_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 rgb_s_axis TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF rgb_s_axis_tuser: SIGNAL IS "xilinx.com:interface:axis:1.0 rgb_s_axis TUSER";
  ATTRIBUTE X_INTERFACE_INFO OF rgb_s_axis_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 rgb_s_axis TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF rgb_s_axis_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 rgb_s_axis_aclk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF rgb_s_axis_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 rgb_s_axis_aresetn RST";
  ATTRIBUTE X_INTERFACE_INFO OF vfpconfig_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 vfpConfig AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF vfpconfig_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 vfpConfig AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF vfpconfig_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 vfpConfig AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF vfpconfig_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 vfpConfig AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF vfpconfig_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 vfpConfig WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF vfpconfig_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 vfpConfig WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF vfpconfig_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 vfpConfig WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF vfpconfig_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 vfpConfig WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF vfpconfig_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 vfpConfig BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF vfpconfig_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 vfpConfig BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF vfpconfig_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 vfpConfig BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF vfpconfig_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 vfpConfig ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF vfpconfig_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 vfpConfig ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF vfpconfig_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 vfpConfig ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF vfpconfig_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 vfpConfig ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF vfpconfig_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 vfpConfig RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF vfpconfig_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 vfpConfig RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF vfpconfig_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 vfpConfig RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF vfpconfig_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 vfpConfig RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF vfpconfig_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 vfpconfig_aclk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF vfpconfig_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 vfpconfig_aresetn RST";
  ATTRIBUTE X_INTERFACE_INFO OF rgb_m_axis_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 rgb_m_axis TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF rgb_m_axis_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 rgb_m_axis TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF rgb_m_axis_tuser: SIGNAL IS "xilinx.com:interface:axis:1.0 rgb_m_axis TUSER";
  ATTRIBUTE X_INTERFACE_INFO OF rgb_m_axis_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 rgb_m_axis TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF rgb_m_axis_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 rgb_m_axis TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF rgb_m_axis_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 rgb_m_axis_aclk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF rgb_m_axis_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 rgb_m_axis_aresetn RST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_mm2s_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis_mm2s TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_mm2s_tkeep: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis_mm2s TKEEP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_mm2s_tstrb: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis_mm2s TSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_mm2s_tid: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis_mm2s TID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_mm2s_tdest: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis_mm2s TDEST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_mm2s_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis_mm2s TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_mm2s_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis_mm2s TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_mm2s_tuser: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis_mm2s TUSER";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_mm2s_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis_mm2s TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_mm2s_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 m_axis_mm2s_aclk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_mm2s_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 m_axis_mm2s_aresetn RST";
BEGIN
  U0 : VFP_v1_0
    GENERIC MAP (
      C_rgb_s_axis_TDATA_WIDTH => 16,
      C_vfpConfig_DATA_WIDTH => 32,
      C_vfpConfig_ADDR_WIDTH => 8,
      C_rgb_m_axis_TDATA_WIDTH => 16,
      C_rgb_m_axis_START_COUNT => 32,
      C_m_axis_mm2s_TDATA_WIDTH => 16,
      C_m_axis_mm2s_START_COUNT => 32,
      revision_number => X"05032019",
      i_data_width => 8,
      s_data_width => 16,
      b_data_width => 32,
      i_precision => 12,
      i_full_range => false,
      conf_data_width => 32,
      conf_addr_width => 8,
      img_width => 4096,
      dataWidth => 12
    )
    PORT MAP (
      pixclk => pixclk,
      ifval => ifval,
      ilval => ilval,
      idata => idata,
      rgb_s_axis_tdata => rgb_s_axis_tdata,
      rgb_s_axis_tlast => rgb_s_axis_tlast,
      rgb_s_axis_tvalid => rgb_s_axis_tvalid,
      rgb_s_axis_tuser => rgb_s_axis_tuser,
      rgb_s_axis_tready => rgb_s_axis_tready,
      rgb_s_axis_aclk => rgb_s_axis_aclk,
      rgb_s_axis_aresetn => rgb_s_axis_aresetn,
      vfpconfig_awaddr => vfpconfig_awaddr,
      vfpconfig_awprot => vfpconfig_awprot,
      vfpconfig_awvalid => vfpconfig_awvalid,
      vfpconfig_awready => vfpconfig_awready,
      vfpconfig_wdata => vfpconfig_wdata,
      vfpconfig_wstrb => vfpconfig_wstrb,
      vfpconfig_wvalid => vfpconfig_wvalid,
      vfpconfig_wready => vfpconfig_wready,
      vfpconfig_bresp => vfpconfig_bresp,
      vfpconfig_bvalid => vfpconfig_bvalid,
      vfpconfig_bready => vfpconfig_bready,
      vfpconfig_araddr => vfpconfig_araddr,
      vfpconfig_arprot => vfpconfig_arprot,
      vfpconfig_arvalid => vfpconfig_arvalid,
      vfpconfig_arready => vfpconfig_arready,
      vfpconfig_rdata => vfpconfig_rdata,
      vfpconfig_rresp => vfpconfig_rresp,
      vfpconfig_rvalid => vfpconfig_rvalid,
      vfpconfig_rready => vfpconfig_rready,
      vfpconfig_aclk => vfpconfig_aclk,
      vfpconfig_aresetn => vfpconfig_aresetn,
      rgb_m_axis_tdata => rgb_m_axis_tdata,
      rgb_m_axis_tlast => rgb_m_axis_tlast,
      rgb_m_axis_tuser => rgb_m_axis_tuser,
      rgb_m_axis_tvalid => rgb_m_axis_tvalid,
      rgb_m_axis_tready => rgb_m_axis_tready,
      rgb_m_axis_aclk => rgb_m_axis_aclk,
      rgb_m_axis_aresetn => rgb_m_axis_aresetn,
      m_axis_mm2s_tdata => m_axis_mm2s_tdata,
      m_axis_mm2s_tkeep => m_axis_mm2s_tkeep,
      m_axis_mm2s_tstrb => m_axis_mm2s_tstrb,
      m_axis_mm2s_tid => m_axis_mm2s_tid,
      m_axis_mm2s_tdest => m_axis_mm2s_tdest,
      m_axis_mm2s_tlast => m_axis_mm2s_tlast,
      m_axis_mm2s_tvalid => m_axis_mm2s_tvalid,
      m_axis_mm2s_tuser => m_axis_mm2s_tuser,
      m_axis_mm2s_tready => m_axis_mm2s_tready,
      m_axis_mm2s_aclk => m_axis_mm2s_aclk,
      m_axis_mm2s_aresetn => m_axis_mm2s_aresetn
    );
END zynq_soc_VFP_0_arch;

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

-- IP VLNV: xilinx.com:user:Sine:2.0
-- IP Revision: 2

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY zynq_soc_Sine_0_0 IS
  PORT (
    ctrl_saxi_awaddr : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    ctrl_saxi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    ctrl_saxi_awvalid : IN STD_LOGIC;
    ctrl_saxi_awready : OUT STD_LOGIC;
    ctrl_saxi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    ctrl_saxi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    ctrl_saxi_wvalid : IN STD_LOGIC;
    ctrl_saxi_wready : OUT STD_LOGIC;
    ctrl_saxi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ctrl_saxi_bvalid : OUT STD_LOGIC;
    ctrl_saxi_bready : IN STD_LOGIC;
    ctrl_saxi_araddr : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    ctrl_saxi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    ctrl_saxi_arvalid : IN STD_LOGIC;
    ctrl_saxi_arready : OUT STD_LOGIC;
    ctrl_saxi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    ctrl_saxi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ctrl_saxi_rvalid : OUT STD_LOGIC;
    ctrl_saxi_rready : IN STD_LOGIC;
    ctrl_saxi_aclk : IN STD_LOGIC;
    ctrl_saxi_aresetn : IN STD_LOGIC
  );
END zynq_soc_Sine_0_0;

ARCHITECTURE zynq_soc_Sine_0_0_arch OF zynq_soc_Sine_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF zynq_soc_Sine_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT Sine_v2_0 IS
    GENERIC (
      C_ctrl_saxi_DATA_WIDTH : INTEGER; -- Width of S_AXI data bus
      C_ctrl_saxi_ADDR_WIDTH : INTEGER; -- Width of S_AXI address bus
      revision_number : STD_LOGIC_VECTOR(31 DOWNTO 0);
      cntampl_value_g : INTEGER;
      depth_g : INTEGER;
      width_g : INTEGER
    );
    PORT (
      ctrl_saxi_awaddr : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      ctrl_saxi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      ctrl_saxi_awvalid : IN STD_LOGIC;
      ctrl_saxi_awready : OUT STD_LOGIC;
      ctrl_saxi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      ctrl_saxi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      ctrl_saxi_wvalid : IN STD_LOGIC;
      ctrl_saxi_wready : OUT STD_LOGIC;
      ctrl_saxi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      ctrl_saxi_bvalid : OUT STD_LOGIC;
      ctrl_saxi_bready : IN STD_LOGIC;
      ctrl_saxi_araddr : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      ctrl_saxi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      ctrl_saxi_arvalid : IN STD_LOGIC;
      ctrl_saxi_arready : OUT STD_LOGIC;
      ctrl_saxi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      ctrl_saxi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      ctrl_saxi_rvalid : OUT STD_LOGIC;
      ctrl_saxi_rready : IN STD_LOGIC;
      ctrl_saxi_aclk : IN STD_LOGIC;
      ctrl_saxi_aresetn : IN STD_LOGIC
    );
  END COMPONENT Sine_v2_0;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF ctrl_saxi_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 ctrl_saxi AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF ctrl_saxi_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 ctrl_saxi AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF ctrl_saxi_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 ctrl_saxi AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF ctrl_saxi_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 ctrl_saxi AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF ctrl_saxi_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 ctrl_saxi WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF ctrl_saxi_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 ctrl_saxi WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF ctrl_saxi_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 ctrl_saxi WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF ctrl_saxi_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 ctrl_saxi WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF ctrl_saxi_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 ctrl_saxi BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF ctrl_saxi_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 ctrl_saxi BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF ctrl_saxi_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 ctrl_saxi BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF ctrl_saxi_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 ctrl_saxi ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF ctrl_saxi_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 ctrl_saxi ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF ctrl_saxi_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 ctrl_saxi ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF ctrl_saxi_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 ctrl_saxi ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF ctrl_saxi_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 ctrl_saxi RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF ctrl_saxi_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 ctrl_saxi RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF ctrl_saxi_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 ctrl_saxi RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF ctrl_saxi_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 ctrl_saxi RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF ctrl_saxi_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 ctrl_saxi_CLK CLK";
  ATTRIBUTE X_INTERFACE_INFO OF ctrl_saxi_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 ctrl_saxi_RST RST";
BEGIN
  U0 : Sine_v2_0
    GENERIC MAP (
      C_ctrl_saxi_DATA_WIDTH => 32,
      C_ctrl_saxi_ADDR_WIDTH => 7,
      revision_number => X"04272017",
      cntampl_value_g => 255,
      depth_g => 8,
      width_g => 12
    )
    PORT MAP (
      ctrl_saxi_awaddr => ctrl_saxi_awaddr,
      ctrl_saxi_awprot => ctrl_saxi_awprot,
      ctrl_saxi_awvalid => ctrl_saxi_awvalid,
      ctrl_saxi_awready => ctrl_saxi_awready,
      ctrl_saxi_wdata => ctrl_saxi_wdata,
      ctrl_saxi_wstrb => ctrl_saxi_wstrb,
      ctrl_saxi_wvalid => ctrl_saxi_wvalid,
      ctrl_saxi_wready => ctrl_saxi_wready,
      ctrl_saxi_bresp => ctrl_saxi_bresp,
      ctrl_saxi_bvalid => ctrl_saxi_bvalid,
      ctrl_saxi_bready => ctrl_saxi_bready,
      ctrl_saxi_araddr => ctrl_saxi_araddr,
      ctrl_saxi_arprot => ctrl_saxi_arprot,
      ctrl_saxi_arvalid => ctrl_saxi_arvalid,
      ctrl_saxi_arready => ctrl_saxi_arready,
      ctrl_saxi_rdata => ctrl_saxi_rdata,
      ctrl_saxi_rresp => ctrl_saxi_rresp,
      ctrl_saxi_rvalid => ctrl_saxi_rvalid,
      ctrl_saxi_rready => ctrl_saxi_rready,
      ctrl_saxi_aclk => ctrl_saxi_aclk,
      ctrl_saxi_aresetn => ctrl_saxi_aresetn
    );
END zynq_soc_Sine_0_0_arch;

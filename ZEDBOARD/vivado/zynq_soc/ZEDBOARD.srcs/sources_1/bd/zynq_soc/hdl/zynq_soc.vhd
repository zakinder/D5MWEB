--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
--Date        : Thu May  9 00:28:40 2019
--Host        : BLACKHOLE running 64-bit major release  (build 9200)
--Command     : generate_target zynq_soc.bd
--Design      : zynq_soc
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity D5M_OUTPUT_imp_KZVKLU is
  port (
    CLK_75MHZ : in STD_LOGIC;
    D5M_IIC_scl_i : in STD_LOGIC;
    D5M_IIC_scl_o : out STD_LOGIC;
    D5M_IIC_scl_t : out STD_LOGIC;
    D5M_IIC_sda_i : in STD_LOGIC;
    D5M_IIC_sda_o : out STD_LOGIC;
    D5M_IIC_sda_t : out STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC;
    reseto : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_aresetn : in STD_LOGIC;
    trigger : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
end D5M_OUTPUT_imp_KZVKLU;

architecture STRUCTURE of D5M_OUTPUT_imp_KZVKLU is
  component zynq_soc_D5M_IIC_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    iic2intc_irpt : out STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    sda_i : in STD_LOGIC;
    sda_o : out STD_LOGIC;
    sda_t : out STD_LOGIC;
    scl_i : in STD_LOGIC;
    scl_o : out STD_LOGIC;
    scl_t : out STD_LOGIC;
    gpo : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component zynq_soc_D5M_IIC_0;
  component zynq_soc_VCC_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component zynq_soc_VCC_0;
  signal Conn1_ARADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal Conn1_ARREADY : STD_LOGIC;
  signal Conn1_ARVALID : STD_LOGIC;
  signal Conn1_AWADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal Conn1_AWREADY : STD_LOGIC;
  signal Conn1_AWVALID : STD_LOGIC;
  signal Conn1_BREADY : STD_LOGIC;
  signal Conn1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn1_BVALID : STD_LOGIC;
  signal Conn1_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn1_RREADY : STD_LOGIC;
  signal Conn1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn1_RVALID : STD_LOGIC;
  signal Conn1_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn1_WREADY : STD_LOGIC;
  signal Conn1_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn1_WVALID : STD_LOGIC;
  signal Conn2_SCL_I : STD_LOGIC;
  signal Conn2_SCL_O : STD_LOGIC;
  signal Conn2_SCL_T : STD_LOGIC;
  signal Conn2_SDA_I : STD_LOGIC;
  signal Conn2_SDA_O : STD_LOGIC;
  signal Conn2_SDA_T : STD_LOGIC;
  signal VCC_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s_axi_aclk_1 : STD_LOGIC;
  signal s_axi_aresetn_1 : STD_LOGIC;
  signal NLW_D5M_IIC_iic2intc_irpt_UNCONNECTED : STD_LOGIC;
  signal NLW_D5M_IIC_gpo_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  Conn1_ARADDR(8 downto 0) <= S_AXI_araddr(8 downto 0);
  Conn1_ARVALID <= S_AXI_arvalid;
  Conn1_AWADDR(8 downto 0) <= S_AXI_awaddr(8 downto 0);
  Conn1_AWVALID <= S_AXI_awvalid;
  Conn1_BREADY <= S_AXI_bready;
  Conn1_RREADY <= S_AXI_rready;
  Conn1_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  Conn1_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  Conn1_WVALID <= S_AXI_wvalid;
  Conn2_SCL_I <= D5M_IIC_scl_i;
  Conn2_SDA_I <= D5M_IIC_sda_i;
  D5M_IIC_scl_o <= Conn2_SCL_O;
  D5M_IIC_scl_t <= Conn2_SCL_T;
  D5M_IIC_sda_o <= Conn2_SDA_O;
  D5M_IIC_sda_t <= Conn2_SDA_T;
  S_AXI_arready <= Conn1_ARREADY;
  S_AXI_awready <= Conn1_AWREADY;
  S_AXI_bresp(1 downto 0) <= Conn1_BRESP(1 downto 0);
  S_AXI_bvalid <= Conn1_BVALID;
  S_AXI_rdata(31 downto 0) <= Conn1_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= Conn1_RRESP(1 downto 0);
  S_AXI_rvalid <= Conn1_RVALID;
  S_AXI_wready <= Conn1_WREADY;
  reseto(0) <= VCC_dout(0);
  s_axi_aclk_1 <= CLK_75MHZ;
  s_axi_aresetn_1 <= s_axi_aresetn;
  trigger(0) <= VCC_dout(0);
D5M_IIC: component zynq_soc_D5M_IIC_0
     port map (
      gpo(0) => NLW_D5M_IIC_gpo_UNCONNECTED(0),
      iic2intc_irpt => NLW_D5M_IIC_iic2intc_irpt_UNCONNECTED,
      s_axi_aclk => s_axi_aclk_1,
      s_axi_araddr(8 downto 0) => Conn1_ARADDR(8 downto 0),
      s_axi_aresetn => s_axi_aresetn_1,
      s_axi_arready => Conn1_ARREADY,
      s_axi_arvalid => Conn1_ARVALID,
      s_axi_awaddr(8 downto 0) => Conn1_AWADDR(8 downto 0),
      s_axi_awready => Conn1_AWREADY,
      s_axi_awvalid => Conn1_AWVALID,
      s_axi_bready => Conn1_BREADY,
      s_axi_bresp(1 downto 0) => Conn1_BRESP(1 downto 0),
      s_axi_bvalid => Conn1_BVALID,
      s_axi_rdata(31 downto 0) => Conn1_RDATA(31 downto 0),
      s_axi_rready => Conn1_RREADY,
      s_axi_rresp(1 downto 0) => Conn1_RRESP(1 downto 0),
      s_axi_rvalid => Conn1_RVALID,
      s_axi_wdata(31 downto 0) => Conn1_WDATA(31 downto 0),
      s_axi_wready => Conn1_WREADY,
      s_axi_wstrb(3 downto 0) => Conn1_WSTRB(3 downto 0),
      s_axi_wvalid => Conn1_WVALID,
      scl_i => Conn2_SCL_I,
      scl_o => Conn2_SCL_O,
      scl_t => Conn2_SCL_T,
      sda_i => Conn2_SDA_I,
      sda_o => Conn2_SDA_O,
      sda_t => Conn2_SDA_T
    );
VCC: component zynq_soc_VCC_0
     port map (
      dout(0) => VCC_dout(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity D5M_imp_H6UO12 is
  port (
    CLK_150MHZ : in STD_LOGIC;
    aresetn150Mhz : in STD_LOGIC;
    config_axis_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    config_axis_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    config_axis_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    config_axis_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    config_axis_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    config_axis_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    config_axis_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    config_axis_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    config_axis_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    config_axis_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    config_axis_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    config_axis_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    config_axis_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    config_axis_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    config_axis_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    config_axis_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    config_axis_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    config_axis_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    config_axis_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    idata : in STD_LOGIC_VECTOR ( 11 downto 0 );
    ifval : in STD_LOGIC;
    ilval : in STD_LOGIC;
    pixclk : in STD_LOGIC;
    video_out_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    video_out_tkeep : out STD_LOGIC_VECTOR ( 2 downto 0 );
    video_out_tlast : out STD_LOGIC;
    video_out_tready : in STD_LOGIC;
    video_out_tuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    video_out_tvalid : out STD_LOGIC
  );
end D5M_imp_H6UO12;

architecture STRUCTURE of D5M_imp_H6UO12 is
  component zynq_soc_VFP_0 is
  port (
    pixclk : in STD_LOGIC;
    ifval : in STD_LOGIC;
    ilval : in STD_LOGIC;
    idata : in STD_LOGIC_VECTOR ( 11 downto 0 );
    rgb_s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    rgb_s_axis_tlast : in STD_LOGIC;
    rgb_s_axis_tvalid : in STD_LOGIC;
    rgb_s_axis_tuser : in STD_LOGIC;
    rgb_s_axis_tready : out STD_LOGIC;
    rgb_s_axis_aclk : in STD_LOGIC;
    rgb_s_axis_aresetn : in STD_LOGIC;
    vfpconfig_awaddr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    vfpconfig_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    vfpconfig_awvalid : in STD_LOGIC;
    vfpconfig_awready : out STD_LOGIC;
    vfpconfig_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    vfpconfig_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    vfpconfig_wvalid : in STD_LOGIC;
    vfpconfig_wready : out STD_LOGIC;
    vfpconfig_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    vfpconfig_bvalid : out STD_LOGIC;
    vfpconfig_bready : in STD_LOGIC;
    vfpconfig_araddr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    vfpconfig_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    vfpconfig_arvalid : in STD_LOGIC;
    vfpconfig_arready : out STD_LOGIC;
    vfpconfig_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    vfpconfig_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    vfpconfig_rvalid : out STD_LOGIC;
    vfpconfig_rready : in STD_LOGIC;
    vfpconfig_aclk : in STD_LOGIC;
    vfpconfig_aresetn : in STD_LOGIC;
    rgb_m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    rgb_m_axis_tlast : out STD_LOGIC;
    rgb_m_axis_tuser : out STD_LOGIC;
    rgb_m_axis_tvalid : out STD_LOGIC;
    rgb_m_axis_tready : in STD_LOGIC;
    rgb_m_axis_aclk : in STD_LOGIC;
    rgb_m_axis_aresetn : in STD_LOGIC;
    m_axis_mm2s_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_mm2s_tkeep : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axis_mm2s_tstrb : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axis_mm2s_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_mm2s_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_mm2s_tlast : out STD_LOGIC;
    m_axis_mm2s_tvalid : out STD_LOGIC;
    m_axis_mm2s_tuser : out STD_LOGIC;
    m_axis_mm2s_tready : in STD_LOGIC;
    m_axis_mm2s_aclk : in STD_LOGIC;
    m_axis_mm2s_aresetn : in STD_LOGIC
  );
  end component zynq_soc_VFP_0;
  signal VFP_0_m_axis_mm2s_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal VFP_0_m_axis_mm2s_TKEEP : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal VFP_0_m_axis_mm2s_TLAST : STD_LOGIC;
  signal VFP_0_m_axis_mm2s_TREADY : STD_LOGIC;
  signal VFP_0_m_axis_mm2s_TUSER : STD_LOGIC;
  signal VFP_0_m_axis_mm2s_TVALID : STD_LOGIC;
  signal VFP_0_rgb_m_axis_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal VFP_0_rgb_m_axis_TLAST : STD_LOGIC;
  signal VFP_0_rgb_m_axis_TREADY : STD_LOGIC;
  signal VFP_0_rgb_m_axis_TUSER : STD_LOGIC;
  signal VFP_0_rgb_m_axis_TVALID : STD_LOGIC;
  signal config_axis_1_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal config_axis_1_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal config_axis_1_ARREADY : STD_LOGIC;
  signal config_axis_1_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal config_axis_1_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal config_axis_1_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal config_axis_1_AWREADY : STD_LOGIC;
  signal config_axis_1_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal config_axis_1_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal config_axis_1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal config_axis_1_BVALID : STD_LOGIC;
  signal config_axis_1_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal config_axis_1_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal config_axis_1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal config_axis_1_RVALID : STD_LOGIC;
  signal config_axis_1_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal config_axis_1_WREADY : STD_LOGIC;
  signal config_axis_1_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal config_axis_1_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal idata_1 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal ifval_1 : STD_LOGIC;
  signal ilval_1 : STD_LOGIC;
  signal pixclk_1 : STD_LOGIC;
  signal processing_system7_0_FCLK_CLK0 : STD_LOGIC;
  signal rst_PS7_150M_peripheral_aresetn : STD_LOGIC;
  signal NLW_VFP_m_axis_mm2s_tdest_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_VFP_m_axis_mm2s_tid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_VFP_m_axis_mm2s_tstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
begin
  VFP_0_m_axis_mm2s_TREADY <= video_out_tready;
  config_axis_1_ARADDR(31 downto 0) <= config_axis_araddr(31 downto 0);
  config_axis_1_ARPROT(2 downto 0) <= config_axis_arprot(2 downto 0);
  config_axis_1_ARVALID(0) <= config_axis_arvalid(0);
  config_axis_1_AWADDR(31 downto 0) <= config_axis_awaddr(31 downto 0);
  config_axis_1_AWPROT(2 downto 0) <= config_axis_awprot(2 downto 0);
  config_axis_1_AWVALID(0) <= config_axis_awvalid(0);
  config_axis_1_BREADY(0) <= config_axis_bready(0);
  config_axis_1_RREADY(0) <= config_axis_rready(0);
  config_axis_1_WDATA(31 downto 0) <= config_axis_wdata(31 downto 0);
  config_axis_1_WSTRB(3 downto 0) <= config_axis_wstrb(3 downto 0);
  config_axis_1_WVALID(0) <= config_axis_wvalid(0);
  config_axis_arready(0) <= config_axis_1_ARREADY;
  config_axis_awready(0) <= config_axis_1_AWREADY;
  config_axis_bresp(1 downto 0) <= config_axis_1_BRESP(1 downto 0);
  config_axis_bvalid(0) <= config_axis_1_BVALID;
  config_axis_rdata(31 downto 0) <= config_axis_1_RDATA(31 downto 0);
  config_axis_rresp(1 downto 0) <= config_axis_1_RRESP(1 downto 0);
  config_axis_rvalid(0) <= config_axis_1_RVALID;
  config_axis_wready(0) <= config_axis_1_WREADY;
  idata_1(11 downto 0) <= idata(11 downto 0);
  ifval_1 <= ifval;
  ilval_1 <= ilval;
  pixclk_1 <= pixclk;
  processing_system7_0_FCLK_CLK0 <= CLK_150MHZ;
  rst_PS7_150M_peripheral_aresetn <= aresetn150Mhz;
  video_out_tdata(15 downto 0) <= VFP_0_m_axis_mm2s_TDATA(15 downto 0);
  video_out_tkeep(2 downto 0) <= VFP_0_m_axis_mm2s_TKEEP(2 downto 0);
  video_out_tlast <= VFP_0_m_axis_mm2s_TLAST;
  video_out_tuser(0) <= VFP_0_m_axis_mm2s_TUSER;
  video_out_tvalid <= VFP_0_m_axis_mm2s_TVALID;
VFP: component zynq_soc_VFP_0
     port map (
      idata(11 downto 0) => idata_1(11 downto 0),
      ifval => ifval_1,
      ilval => ilval_1,
      m_axis_mm2s_aclk => processing_system7_0_FCLK_CLK0,
      m_axis_mm2s_aresetn => rst_PS7_150M_peripheral_aresetn,
      m_axis_mm2s_tdata(15 downto 0) => VFP_0_m_axis_mm2s_TDATA(15 downto 0),
      m_axis_mm2s_tdest(0) => NLW_VFP_m_axis_mm2s_tdest_UNCONNECTED(0),
      m_axis_mm2s_tid(0) => NLW_VFP_m_axis_mm2s_tid_UNCONNECTED(0),
      m_axis_mm2s_tkeep(2 downto 0) => VFP_0_m_axis_mm2s_TKEEP(2 downto 0),
      m_axis_mm2s_tlast => VFP_0_m_axis_mm2s_TLAST,
      m_axis_mm2s_tready => VFP_0_m_axis_mm2s_TREADY,
      m_axis_mm2s_tstrb(2 downto 0) => NLW_VFP_m_axis_mm2s_tstrb_UNCONNECTED(2 downto 0),
      m_axis_mm2s_tuser => VFP_0_m_axis_mm2s_TUSER,
      m_axis_mm2s_tvalid => VFP_0_m_axis_mm2s_TVALID,
      pixclk => pixclk_1,
      rgb_m_axis_aclk => processing_system7_0_FCLK_CLK0,
      rgb_m_axis_aresetn => rst_PS7_150M_peripheral_aresetn,
      rgb_m_axis_tdata(15 downto 0) => VFP_0_rgb_m_axis_TDATA(15 downto 0),
      rgb_m_axis_tlast => VFP_0_rgb_m_axis_TLAST,
      rgb_m_axis_tready => VFP_0_rgb_m_axis_TREADY,
      rgb_m_axis_tuser => VFP_0_rgb_m_axis_TUSER,
      rgb_m_axis_tvalid => VFP_0_rgb_m_axis_TVALID,
      rgb_s_axis_aclk => processing_system7_0_FCLK_CLK0,
      rgb_s_axis_aresetn => rst_PS7_150M_peripheral_aresetn,
      rgb_s_axis_tdata(15 downto 0) => VFP_0_rgb_m_axis_TDATA(15 downto 0),
      rgb_s_axis_tlast => VFP_0_rgb_m_axis_TLAST,
      rgb_s_axis_tready => VFP_0_rgb_m_axis_TREADY,
      rgb_s_axis_tuser => VFP_0_rgb_m_axis_TUSER,
      rgb_s_axis_tvalid => VFP_0_rgb_m_axis_TVALID,
      vfpconfig_aclk => processing_system7_0_FCLK_CLK0,
      vfpconfig_araddr(7 downto 0) => config_axis_1_ARADDR(7 downto 0),
      vfpconfig_aresetn => rst_PS7_150M_peripheral_aresetn,
      vfpconfig_arprot(2 downto 0) => config_axis_1_ARPROT(2 downto 0),
      vfpconfig_arready => config_axis_1_ARREADY,
      vfpconfig_arvalid => config_axis_1_ARVALID(0),
      vfpconfig_awaddr(7 downto 0) => config_axis_1_AWADDR(7 downto 0),
      vfpconfig_awprot(2 downto 0) => config_axis_1_AWPROT(2 downto 0),
      vfpconfig_awready => config_axis_1_AWREADY,
      vfpconfig_awvalid => config_axis_1_AWVALID(0),
      vfpconfig_bready => config_axis_1_BREADY(0),
      vfpconfig_bresp(1 downto 0) => config_axis_1_BRESP(1 downto 0),
      vfpconfig_bvalid => config_axis_1_BVALID,
      vfpconfig_rdata(31 downto 0) => config_axis_1_RDATA(31 downto 0),
      vfpconfig_rready => config_axis_1_RREADY(0),
      vfpconfig_rresp(1 downto 0) => config_axis_1_RRESP(1 downto 0),
      vfpconfig_rvalid => config_axis_1_RVALID,
      vfpconfig_wdata(31 downto 0) => config_axis_1_WDATA(31 downto 0),
      vfpconfig_wready => config_axis_1_WREADY,
      vfpconfig_wstrb(3 downto 0) => config_axis_1_WSTRB(3 downto 0),
      vfpconfig_wvalid => config_axis_1_WVALID(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity HDMI_OUTPUT_imp_13QHMTJ is
  port (
    CLK_148MHZ : in STD_LOGIC;
    CLK_75MHZ : in STD_LOGIC;
    HDMI_IIC_scl_i : in STD_LOGIC;
    HDMI_IIC_scl_o : out STD_LOGIC;
    HDMI_IIC_scl_t : out STD_LOGIC;
    HDMI_IIC_sda_i : in STD_LOGIC;
    HDMI_IIC_sda_o : out STD_LOGIC;
    HDMI_IIC_sda_t : out STD_LOGIC;
    IO_HDMIO_clk : out STD_LOGIC;
    IO_HDMIO_data : out STD_LOGIC_VECTOR ( 15 downto 0 );
    IO_HDMIO_de : out STD_LOGIC;
    IO_HDMIO_hsync : out STD_LOGIC;
    IO_HDMIO_spdif : out STD_LOGIC;
    IO_HDMIO_vsync : out STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC;
    VID_IO_IN_active_video : in STD_LOGIC;
    VID_IO_IN_data : in STD_LOGIC_VECTOR ( 15 downto 0 );
    VID_IO_IN_hsync : in STD_LOGIC;
    VID_IO_IN_vsync : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC
  );
end HDMI_OUTPUT_imp_13QHMTJ;

architecture STRUCTURE of HDMI_OUTPUT_imp_13QHMTJ is
  component zynq_soc_GND_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component zynq_soc_GND_0;
  component zynq_soc_HDMI_0 is
  port (
    clk : in STD_LOGIC;
    audio_spdif : in STD_LOGIC;
    video_vsync : in STD_LOGIC;
    video_hsync : in STD_LOGIC;
    video_de : in STD_LOGIC;
    video_data : in STD_LOGIC_VECTOR ( 15 downto 0 );
    io_hdmio_spdif : out STD_LOGIC;
    io_hdmio_video : out STD_LOGIC_VECTOR ( 15 downto 0 );
    io_hdmio_vsync : out STD_LOGIC;
    io_hdmio_hsync : out STD_LOGIC;
    io_hdmio_de : out STD_LOGIC;
    io_hdmio_clk : out STD_LOGIC
  );
  end component zynq_soc_HDMI_0;
  component zynq_soc_HDMI_IIC_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    iic2intc_irpt : out STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    sda_i : in STD_LOGIC;
    sda_o : out STD_LOGIC;
    sda_t : out STD_LOGIC;
    scl_i : in STD_LOGIC;
    scl_o : out STD_LOGIC;
    scl_t : out STD_LOGIC;
    gpo : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component zynq_soc_HDMI_IIC_0;
  signal Conn1_CLK : STD_LOGIC;
  signal Conn1_DATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Conn1_DE : STD_LOGIC;
  signal Conn1_HSYNC : STD_LOGIC;
  signal Conn1_SPDIF : STD_LOGIC;
  signal Conn1_VSYNC : STD_LOGIC;
  signal Conn2_SCL_I : STD_LOGIC;
  signal Conn2_SCL_O : STD_LOGIC;
  signal Conn2_SCL_T : STD_LOGIC;
  signal Conn2_SDA_I : STD_LOGIC;
  signal Conn2_SDA_O : STD_LOGIC;
  signal Conn2_SDA_T : STD_LOGIC;
  signal GND_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S_AXI_1_ARADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal S_AXI_1_ARREADY : STD_LOGIC;
  signal S_AXI_1_ARVALID : STD_LOGIC;
  signal S_AXI_1_AWADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal S_AXI_1_AWREADY : STD_LOGIC;
  signal S_AXI_1_AWVALID : STD_LOGIC;
  signal S_AXI_1_BREADY : STD_LOGIC;
  signal S_AXI_1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal S_AXI_1_BVALID : STD_LOGIC;
  signal S_AXI_1_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal S_AXI_1_RREADY : STD_LOGIC;
  signal S_AXI_1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal S_AXI_1_RVALID : STD_LOGIC;
  signal S_AXI_1_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal S_AXI_1_WREADY : STD_LOGIC;
  signal S_AXI_1_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal S_AXI_1_WVALID : STD_LOGIC;
  signal VIDEO_PIPELINE_vid_io_out_ACTIVE_VIDEO : STD_LOGIC;
  signal VIDEO_PIPELINE_vid_io_out_DATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal VIDEO_PIPELINE_vid_io_out_HSYNC : STD_LOGIC;
  signal VIDEO_PIPELINE_vid_io_out_VSYNC : STD_LOGIC;
  signal clk_wiz_0_clk_out1 : STD_LOGIC;
  signal s_axi_aclk_1 : STD_LOGIC;
  signal s_axi_aresetn_1 : STD_LOGIC;
  signal NLW_HDMI_IIC_iic2intc_irpt_UNCONNECTED : STD_LOGIC;
  signal NLW_HDMI_IIC_gpo_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  Conn2_SCL_I <= HDMI_IIC_scl_i;
  Conn2_SDA_I <= HDMI_IIC_sda_i;
  HDMI_IIC_scl_o <= Conn2_SCL_O;
  HDMI_IIC_scl_t <= Conn2_SCL_T;
  HDMI_IIC_sda_o <= Conn2_SDA_O;
  HDMI_IIC_sda_t <= Conn2_SDA_T;
  IO_HDMIO_clk <= Conn1_CLK;
  IO_HDMIO_data(15 downto 0) <= Conn1_DATA(15 downto 0);
  IO_HDMIO_de <= Conn1_DE;
  IO_HDMIO_hsync <= Conn1_HSYNC;
  IO_HDMIO_spdif <= Conn1_SPDIF;
  IO_HDMIO_vsync <= Conn1_VSYNC;
  S_AXI_1_ARADDR(8 downto 0) <= S_AXI_araddr(8 downto 0);
  S_AXI_1_ARVALID <= S_AXI_arvalid;
  S_AXI_1_AWADDR(8 downto 0) <= S_AXI_awaddr(8 downto 0);
  S_AXI_1_AWVALID <= S_AXI_awvalid;
  S_AXI_1_BREADY <= S_AXI_bready;
  S_AXI_1_RREADY <= S_AXI_rready;
  S_AXI_1_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  S_AXI_1_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  S_AXI_1_WVALID <= S_AXI_wvalid;
  S_AXI_arready <= S_AXI_1_ARREADY;
  S_AXI_awready <= S_AXI_1_AWREADY;
  S_AXI_bresp(1 downto 0) <= S_AXI_1_BRESP(1 downto 0);
  S_AXI_bvalid <= S_AXI_1_BVALID;
  S_AXI_rdata(31 downto 0) <= S_AXI_1_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= S_AXI_1_RRESP(1 downto 0);
  S_AXI_rvalid <= S_AXI_1_RVALID;
  S_AXI_wready <= S_AXI_1_WREADY;
  VIDEO_PIPELINE_vid_io_out_ACTIVE_VIDEO <= VID_IO_IN_active_video;
  VIDEO_PIPELINE_vid_io_out_DATA(15 downto 0) <= VID_IO_IN_data(15 downto 0);
  VIDEO_PIPELINE_vid_io_out_HSYNC <= VID_IO_IN_hsync;
  VIDEO_PIPELINE_vid_io_out_VSYNC <= VID_IO_IN_vsync;
  clk_wiz_0_clk_out1 <= CLK_148MHZ;
  s_axi_aclk_1 <= CLK_75MHZ;
  s_axi_aresetn_1 <= s_axi_aresetn;
GND: component zynq_soc_GND_0
     port map (
      dout(0) => GND_dout(0)
    );
HDMI: component zynq_soc_HDMI_0
     port map (
      audio_spdif => GND_dout(0),
      clk => clk_wiz_0_clk_out1,
      io_hdmio_clk => Conn1_CLK,
      io_hdmio_de => Conn1_DE,
      io_hdmio_hsync => Conn1_HSYNC,
      io_hdmio_spdif => Conn1_SPDIF,
      io_hdmio_video(15 downto 0) => Conn1_DATA(15 downto 0),
      io_hdmio_vsync => Conn1_VSYNC,
      video_data(15 downto 0) => VIDEO_PIPELINE_vid_io_out_DATA(15 downto 0),
      video_de => VIDEO_PIPELINE_vid_io_out_ACTIVE_VIDEO,
      video_hsync => VIDEO_PIPELINE_vid_io_out_HSYNC,
      video_vsync => VIDEO_PIPELINE_vid_io_out_VSYNC
    );
HDMI_IIC: component zynq_soc_HDMI_IIC_0
     port map (
      gpo(0) => NLW_HDMI_IIC_gpo_UNCONNECTED(0),
      iic2intc_irpt => NLW_HDMI_IIC_iic2intc_irpt_UNCONNECTED,
      s_axi_aclk => s_axi_aclk_1,
      s_axi_araddr(8 downto 0) => S_AXI_1_ARADDR(8 downto 0),
      s_axi_aresetn => s_axi_aresetn_1,
      s_axi_arready => S_AXI_1_ARREADY,
      s_axi_arvalid => S_AXI_1_ARVALID,
      s_axi_awaddr(8 downto 0) => S_AXI_1_AWADDR(8 downto 0),
      s_axi_awready => S_AXI_1_AWREADY,
      s_axi_awvalid => S_AXI_1_AWVALID,
      s_axi_bready => S_AXI_1_BREADY,
      s_axi_bresp(1 downto 0) => S_AXI_1_BRESP(1 downto 0),
      s_axi_bvalid => S_AXI_1_BVALID,
      s_axi_rdata(31 downto 0) => S_AXI_1_RDATA(31 downto 0),
      s_axi_rready => S_AXI_1_RREADY,
      s_axi_rresp(1 downto 0) => S_AXI_1_RRESP(1 downto 0),
      s_axi_rvalid => S_AXI_1_RVALID,
      s_axi_wdata(31 downto 0) => S_AXI_1_WDATA(31 downto 0),
      s_axi_wready => S_AXI_1_WREADY,
      s_axi_wstrb(3 downto 0) => S_AXI_1_WSTRB(3 downto 0),
      s_axi_wvalid => S_AXI_1_WVALID,
      scl_i => Conn2_SCL_I,
      scl_o => Conn2_SCL_O,
      scl_t => Conn2_SCL_T,
      sda_i => Conn2_SDA_I,
      sda_o => Conn2_SDA_O,
      sda_t => Conn2_SDA_T
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SYSTEM_RESETS_imp_5I36KH is
  port (
    CLK_150MHZ : in STD_LOGIC;
    CLK_75MHZ : in STD_LOGIC;
    aresetn150Mhz : out STD_LOGIC_VECTOR ( 0 to 0 );
    aresetn75Mhz : out STD_LOGIC_VECTOR ( 0 to 0 );
    iaresetn150Mhz : out STD_LOGIC_VECTOR ( 0 to 0 );
    master_aresetn : in STD_LOGIC
  );
end SYSTEM_RESETS_imp_5I36KH;

architecture STRUCTURE of SYSTEM_RESETS_imp_5I36KH is
  component zynq_soc_rst_PS7_150M_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component zynq_soc_rst_PS7_150M_0;
  component zynq_soc_rst_PS7_75M_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component zynq_soc_rst_PS7_75M_0;
  signal PS7_FCLK_CLK2 : STD_LOGIC;
  signal PS_VIDEO_FCLK_RESET0_N : STD_LOGIC;
  signal processing_system7_0_FCLK_CLK0 : STD_LOGIC;
  signal rst_PS7_150M_interconnect_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal rst_PS7_150M_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal rst_PS7_75M_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_PS7_150M_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_rst_PS7_150M_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_PS7_150M_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_PS7_75M_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_rst_PS7_75M_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_PS7_75M_interconnect_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_PS7_75M_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  PS7_FCLK_CLK2 <= CLK_75MHZ;
  PS_VIDEO_FCLK_RESET0_N <= master_aresetn;
  aresetn150Mhz(0) <= rst_PS7_150M_peripheral_aresetn(0);
  aresetn75Mhz(0) <= rst_PS7_75M_peripheral_aresetn(0);
  iaresetn150Mhz(0) <= rst_PS7_150M_interconnect_aresetn(0);
  processing_system7_0_FCLK_CLK0 <= CLK_150MHZ;
rst_PS7_150M: component zynq_soc_rst_PS7_150M_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_rst_PS7_150M_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => PS_VIDEO_FCLK_RESET0_N,
      interconnect_aresetn(0) => rst_PS7_150M_interconnect_aresetn(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_rst_PS7_150M_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => rst_PS7_150M_peripheral_aresetn(0),
      peripheral_reset(0) => NLW_rst_PS7_150M_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => processing_system7_0_FCLK_CLK0
    );
rst_PS7_75M: component zynq_soc_rst_PS7_75M_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_rst_PS7_75M_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => PS_VIDEO_FCLK_RESET0_N,
      interconnect_aresetn(0) => NLW_rst_PS7_75M_interconnect_aresetn_UNCONNECTED(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_rst_PS7_75M_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => rst_PS7_75M_peripheral_aresetn(0),
      peripheral_reset(0) => NLW_rst_PS7_75M_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => PS7_FCLK_CLK2
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity VIDEO_PIPELINE_imp_1COWDW3 is
  port (
    CLK_148MHZ : in STD_LOGIC;
    CLK_150MHZ : in STD_LOGIC;
    ctrl_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ctrl_arready : out STD_LOGIC;
    ctrl_arvalid : in STD_LOGIC;
    ctrl_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ctrl_awready : out STD_LOGIC;
    ctrl_awvalid : in STD_LOGIC;
    ctrl_bready : in STD_LOGIC;
    ctrl_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ctrl_bvalid : out STD_LOGIC;
    ctrl_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ctrl_rready : in STD_LOGIC;
    ctrl_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ctrl_rvalid : out STD_LOGIC;
    ctrl_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ctrl_wready : out STD_LOGIC;
    ctrl_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    ctrl_wvalid : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    vid_io_out_active_video : out STD_LOGIC;
    vid_io_out_data : out STD_LOGIC_VECTOR ( 15 downto 0 );
    vid_io_out_hsync : out STD_LOGIC;
    vid_io_out_vsync : out STD_LOGIC;
    video_in_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    video_in_tlast : in STD_LOGIC;
    video_in_tready : out STD_LOGIC;
    video_in_tuser : in STD_LOGIC;
    video_in_tvalid : in STD_LOGIC
  );
end VIDEO_PIPELINE_imp_1COWDW3;

architecture STRUCTURE of VIDEO_PIPELINE_imp_1COWDW3 is
  component zynq_soc_GND_1 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component zynq_soc_GND_1;
  component zynq_soc_TIMMING_CONTROLELR_0 is
  port (
    clk : in STD_LOGIC;
    clken : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    s_axi_aclken : in STD_LOGIC;
    gen_clken : in STD_LOGIC;
    hsync_out : out STD_LOGIC;
    hblank_out : out STD_LOGIC;
    vsync_out : out STD_LOGIC;
    vblank_out : out STD_LOGIC;
    active_video_out : out STD_LOGIC;
    resetn : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    irq : out STD_LOGIC;
    fsync_in : in STD_LOGIC;
    fsync_out : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component zynq_soc_TIMMING_CONTROLELR_0;
  component zynq_soc_VCC_1 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component zynq_soc_VCC_1;
  component zynq_soc_VIDEO_OUT_0 is
  port (
    aclk : in STD_LOGIC;
    aclken : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_video_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_video_tvalid : in STD_LOGIC;
    s_axis_video_tready : out STD_LOGIC;
    s_axis_video_tuser : in STD_LOGIC;
    s_axis_video_tlast : in STD_LOGIC;
    fid : in STD_LOGIC;
    vid_io_out_clk : in STD_LOGIC;
    vid_io_out_ce : in STD_LOGIC;
    vid_io_out_reset : in STD_LOGIC;
    vid_active_video : out STD_LOGIC;
    vid_vsync : out STD_LOGIC;
    vid_hsync : out STD_LOGIC;
    vid_vblank : out STD_LOGIC;
    vid_hblank : out STD_LOGIC;
    vid_field_id : out STD_LOGIC;
    vid_data : out STD_LOGIC_VECTOR ( 15 downto 0 );
    vtg_vsync : in STD_LOGIC;
    vtg_hsync : in STD_LOGIC;
    vtg_vblank : in STD_LOGIC;
    vtg_hblank : in STD_LOGIC;
    vtg_active_video : in STD_LOGIC;
    vtg_field_id : in STD_LOGIC;
    vtg_ce : out STD_LOGIC;
    locked : out STD_LOGIC;
    overflow : out STD_LOGIC;
    underflow : out STD_LOGIC;
    status : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component zynq_soc_VIDEO_OUT_0;
  signal Conn3_ACTIVE_VIDEO : STD_LOGIC;
  signal Conn3_DATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Conn3_HSYNC : STD_LOGIC;
  signal Conn3_VSYNC : STD_LOGIC;
  signal GND_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal TIMMING_CONTROLELR_vtiming_out_ACTIVE_VIDEO : STD_LOGIC;
  signal TIMMING_CONTROLELR_vtiming_out_HBLANK : STD_LOGIC;
  signal TIMMING_CONTROLELR_vtiming_out_HSYNC : STD_LOGIC;
  signal TIMMING_CONTROLELR_vtiming_out_VBLANK : STD_LOGIC;
  signal TIMMING_CONTROLELR_vtiming_out_VSYNC : STD_LOGIC;
  signal VCC_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal VIDEO_OUT_vtg_ce : STD_LOGIC;
  signal aclk_1 : STD_LOGIC;
  signal ctrl_1_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ctrl_1_ARREADY : STD_LOGIC;
  signal ctrl_1_ARVALID : STD_LOGIC;
  signal ctrl_1_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ctrl_1_AWREADY : STD_LOGIC;
  signal ctrl_1_AWVALID : STD_LOGIC;
  signal ctrl_1_BREADY : STD_LOGIC;
  signal ctrl_1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ctrl_1_BVALID : STD_LOGIC;
  signal ctrl_1_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ctrl_1_RREADY : STD_LOGIC;
  signal ctrl_1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ctrl_1_RVALID : STD_LOGIC;
  signal ctrl_1_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ctrl_1_WREADY : STD_LOGIC;
  signal ctrl_1_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ctrl_1_WVALID : STD_LOGIC;
  signal s_axi_aresetn_1 : STD_LOGIC;
  signal vid_io_out_clk_1 : STD_LOGIC;
  signal video_in_1_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal video_in_1_TLAST : STD_LOGIC;
  signal video_in_1_TREADY : STD_LOGIC;
  signal video_in_1_TUSER : STD_LOGIC;
  signal video_in_1_TVALID : STD_LOGIC;
  signal NLW_TIMMING_CONTROLELR_irq_UNCONNECTED : STD_LOGIC;
  signal NLW_TIMMING_CONTROLELR_fsync_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_VIDEO_OUT_locked_UNCONNECTED : STD_LOGIC;
  signal NLW_VIDEO_OUT_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_VIDEO_OUT_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_VIDEO_OUT_vid_field_id_UNCONNECTED : STD_LOGIC;
  signal NLW_VIDEO_OUT_vid_hblank_UNCONNECTED : STD_LOGIC;
  signal NLW_VIDEO_OUT_vid_vblank_UNCONNECTED : STD_LOGIC;
  signal NLW_VIDEO_OUT_status_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
begin
  aclk_1 <= CLK_150MHZ;
  ctrl_1_ARADDR(31 downto 0) <= ctrl_araddr(31 downto 0);
  ctrl_1_ARVALID <= ctrl_arvalid;
  ctrl_1_AWADDR(31 downto 0) <= ctrl_awaddr(31 downto 0);
  ctrl_1_AWVALID <= ctrl_awvalid;
  ctrl_1_BREADY <= ctrl_bready;
  ctrl_1_RREADY <= ctrl_rready;
  ctrl_1_WDATA(31 downto 0) <= ctrl_wdata(31 downto 0);
  ctrl_1_WSTRB(3 downto 0) <= ctrl_wstrb(3 downto 0);
  ctrl_1_WVALID <= ctrl_wvalid;
  ctrl_arready <= ctrl_1_ARREADY;
  ctrl_awready <= ctrl_1_AWREADY;
  ctrl_bresp(1 downto 0) <= ctrl_1_BRESP(1 downto 0);
  ctrl_bvalid <= ctrl_1_BVALID;
  ctrl_rdata(31 downto 0) <= ctrl_1_RDATA(31 downto 0);
  ctrl_rresp(1 downto 0) <= ctrl_1_RRESP(1 downto 0);
  ctrl_rvalid <= ctrl_1_RVALID;
  ctrl_wready <= ctrl_1_WREADY;
  s_axi_aresetn_1 <= s_axi_aresetn;
  vid_io_out_active_video <= Conn3_ACTIVE_VIDEO;
  vid_io_out_clk_1 <= CLK_148MHZ;
  vid_io_out_data(15 downto 0) <= Conn3_DATA(15 downto 0);
  vid_io_out_hsync <= Conn3_HSYNC;
  vid_io_out_vsync <= Conn3_VSYNC;
  video_in_1_TDATA(15 downto 0) <= video_in_tdata(15 downto 0);
  video_in_1_TLAST <= video_in_tlast;
  video_in_1_TUSER <= video_in_tuser;
  video_in_1_TVALID <= video_in_tvalid;
  video_in_tready <= video_in_1_TREADY;
GND: component zynq_soc_GND_1
     port map (
      dout(0) => GND_dout(0)
    );
TIMMING_CONTROLELR: component zynq_soc_TIMMING_CONTROLELR_0
     port map (
      active_video_out => TIMMING_CONTROLELR_vtiming_out_ACTIVE_VIDEO,
      clk => vid_io_out_clk_1,
      clken => VCC_dout(0),
      fsync_in => '0',
      fsync_out(0) => NLW_TIMMING_CONTROLELR_fsync_out_UNCONNECTED(0),
      gen_clken => VIDEO_OUT_vtg_ce,
      hblank_out => TIMMING_CONTROLELR_vtiming_out_HBLANK,
      hsync_out => TIMMING_CONTROLELR_vtiming_out_HSYNC,
      irq => NLW_TIMMING_CONTROLELR_irq_UNCONNECTED,
      resetn => VCC_dout(0),
      s_axi_aclk => aclk_1,
      s_axi_aclken => VCC_dout(0),
      s_axi_araddr(8 downto 0) => ctrl_1_ARADDR(8 downto 0),
      s_axi_aresetn => s_axi_aresetn_1,
      s_axi_arready => ctrl_1_ARREADY,
      s_axi_arvalid => ctrl_1_ARVALID,
      s_axi_awaddr(8 downto 0) => ctrl_1_AWADDR(8 downto 0),
      s_axi_awready => ctrl_1_AWREADY,
      s_axi_awvalid => ctrl_1_AWVALID,
      s_axi_bready => ctrl_1_BREADY,
      s_axi_bresp(1 downto 0) => ctrl_1_BRESP(1 downto 0),
      s_axi_bvalid => ctrl_1_BVALID,
      s_axi_rdata(31 downto 0) => ctrl_1_RDATA(31 downto 0),
      s_axi_rready => ctrl_1_RREADY,
      s_axi_rresp(1 downto 0) => ctrl_1_RRESP(1 downto 0),
      s_axi_rvalid => ctrl_1_RVALID,
      s_axi_wdata(31 downto 0) => ctrl_1_WDATA(31 downto 0),
      s_axi_wready => ctrl_1_WREADY,
      s_axi_wstrb(3 downto 0) => ctrl_1_WSTRB(3 downto 0),
      s_axi_wvalid => ctrl_1_WVALID,
      vblank_out => TIMMING_CONTROLELR_vtiming_out_VBLANK,
      vsync_out => TIMMING_CONTROLELR_vtiming_out_VSYNC
    );
VCC: component zynq_soc_VCC_1
     port map (
      dout(0) => VCC_dout(0)
    );
VIDEO_OUT: component zynq_soc_VIDEO_OUT_0
     port map (
      aclk => aclk_1,
      aclken => VCC_dout(0),
      aresetn => VCC_dout(0),
      fid => '0',
      locked => NLW_VIDEO_OUT_locked_UNCONNECTED,
      overflow => NLW_VIDEO_OUT_overflow_UNCONNECTED,
      s_axis_video_tdata(15 downto 0) => video_in_1_TDATA(15 downto 0),
      s_axis_video_tlast => video_in_1_TLAST,
      s_axis_video_tready => video_in_1_TREADY,
      s_axis_video_tuser => video_in_1_TUSER,
      s_axis_video_tvalid => video_in_1_TVALID,
      status(31 downto 0) => NLW_VIDEO_OUT_status_UNCONNECTED(31 downto 0),
      underflow => NLW_VIDEO_OUT_underflow_UNCONNECTED,
      vid_active_video => Conn3_ACTIVE_VIDEO,
      vid_data(15 downto 0) => Conn3_DATA(15 downto 0),
      vid_field_id => NLW_VIDEO_OUT_vid_field_id_UNCONNECTED,
      vid_hblank => NLW_VIDEO_OUT_vid_hblank_UNCONNECTED,
      vid_hsync => Conn3_HSYNC,
      vid_io_out_ce => VCC_dout(0),
      vid_io_out_clk => vid_io_out_clk_1,
      vid_io_out_reset => GND_dout(0),
      vid_vblank => NLW_VIDEO_OUT_vid_vblank_UNCONNECTED,
      vid_vsync => Conn3_VSYNC,
      vtg_active_video => TIMMING_CONTROLELR_vtiming_out_ACTIVE_VIDEO,
      vtg_ce => VIDEO_OUT_vtg_ce,
      vtg_field_id => '0',
      vtg_hblank => TIMMING_CONTROLELR_vtiming_out_HBLANK,
      vtg_hsync => TIMMING_CONTROLELR_vtiming_out_HSYNC,
      vtg_vblank => TIMMING_CONTROLELR_vtiming_out_VBLANK,
      vtg_vsync => TIMMING_CONTROLELR_vtiming_out_VSYNC
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity V_DMA_imp_QVYQ8K is
  port (
    M_AXIS_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXIS_tlast : out STD_LOGIC;
    M_AXIS_tready : in STD_LOGIC;
    M_AXIS_tuser : out STD_LOGIC;
    M_AXIS_tvalid : out STD_LOGIC;
    M_AXI_MM2S_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_MM2S_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_MM2S_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_MM2S_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_MM2S_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_MM2S_arready : in STD_LOGIC;
    M_AXI_MM2S_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_MM2S_arvalid : out STD_LOGIC;
    M_AXI_MM2S_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXI_MM2S_rlast : in STD_LOGIC;
    M_AXI_MM2S_rready : out STD_LOGIC;
    M_AXI_MM2S_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_MM2S_rvalid : in STD_LOGIC;
    M_AXI_S2MM_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_S2MM_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_S2MM_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_S2MM_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_S2MM_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_S2MM_awready : in STD_LOGIC;
    M_AXI_S2MM_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_S2MM_awvalid : out STD_LOGIC;
    M_AXI_S2MM_bready : out STD_LOGIC;
    M_AXI_S2MM_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_S2MM_bvalid : in STD_LOGIC;
    M_AXI_S2MM_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXI_S2MM_wlast : out STD_LOGIC;
    M_AXI_S2MM_wready : in STD_LOGIC;
    M_AXI_S2MM_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_S2MM_wvalid : out STD_LOGIC;
    S_AXIS_S2MM_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXIS_S2MM_tkeep : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXIS_S2MM_tlast : in STD_LOGIC;
    S_AXIS_S2MM_tready : out STD_LOGIC;
    S_AXIS_S2MM_tuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXIS_S2MM_tvalid : in STD_LOGIC;
    S_AXI_LITE_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_LITE_arready : out STD_LOGIC;
    S_AXI_LITE_arvalid : in STD_LOGIC;
    S_AXI_LITE_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_LITE_awready : out STD_LOGIC;
    S_AXI_LITE_awvalid : in STD_LOGIC;
    S_AXI_LITE_bready : in STD_LOGIC;
    S_AXI_LITE_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_LITE_bvalid : out STD_LOGIC;
    S_AXI_LITE_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_LITE_rready : in STD_LOGIC;
    S_AXI_LITE_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_LITE_rvalid : out STD_LOGIC;
    S_AXI_LITE_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_LITE_wready : out STD_LOGIC;
    S_AXI_LITE_wvalid : in STD_LOGIC;
    aresetn150Mhz : in STD_LOGIC;
    s_axis_s2mm_aclk : in STD_LOGIC
  );
end V_DMA_imp_QVYQ8K;

architecture STRUCTURE of V_DMA_imp_QVYQ8K is
  component zynq_soc_VDMA1_0 is
  port (
    s_axi_lite_aclk : in STD_LOGIC;
    m_axi_mm2s_aclk : in STD_LOGIC;
    m_axis_mm2s_aclk : in STD_LOGIC;
    m_axi_s2mm_aclk : in STD_LOGIC;
    s_axis_s2mm_aclk : in STD_LOGIC;
    axi_resetn : in STD_LOGIC;
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_awready : out STD_LOGIC;
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_wready : out STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_bvalid : out STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_arvalid : in STD_LOGIC;
    s_axi_lite_arready : out STD_LOGIC;
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_lite_rvalid : out STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    mm2s_frame_ptr_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    s2mm_frame_ptr_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axi_mm2s_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mm2s_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_mm2s_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mm2s_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm2s_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mm2s_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_mm2s_arvalid : out STD_LOGIC;
    m_axi_mm2s_arready : in STD_LOGIC;
    m_axi_mm2s_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_mm2s_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm2s_rlast : in STD_LOGIC;
    m_axi_mm2s_rvalid : in STD_LOGIC;
    m_axi_mm2s_rready : out STD_LOGIC;
    m_axis_mm2s_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_mm2s_tkeep : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_mm2s_tuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_mm2s_tvalid : out STD_LOGIC;
    m_axis_mm2s_tready : in STD_LOGIC;
    m_axis_mm2s_tlast : out STD_LOGIC;
    m_axi_s2mm_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_s2mm_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_s2mm_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_awvalid : out STD_LOGIC;
    m_axi_s2mm_awready : in STD_LOGIC;
    m_axi_s2mm_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_s2mm_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_s2mm_wlast : out STD_LOGIC;
    m_axi_s2mm_wvalid : out STD_LOGIC;
    m_axi_s2mm_wready : in STD_LOGIC;
    m_axi_s2mm_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_bvalid : in STD_LOGIC;
    m_axi_s2mm_bready : out STD_LOGIC;
    s_axis_s2mm_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_s2mm_tkeep : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_s2mm_tuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_s2mm_tvalid : in STD_LOGIC;
    s_axis_s2mm_tready : out STD_LOGIC;
    s_axis_s2mm_tlast : in STD_LOGIC;
    mm2s_introut : out STD_LOGIC;
    s2mm_introut : out STD_LOGIC
  );
  end component zynq_soc_VDMA1_0;
  signal PS7_axi_periph_M03_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M03_AXI_ARREADY : STD_LOGIC;
  signal PS7_axi_periph_M03_AXI_ARVALID : STD_LOGIC;
  signal PS7_axi_periph_M03_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M03_AXI_AWREADY : STD_LOGIC;
  signal PS7_axi_periph_M03_AXI_AWVALID : STD_LOGIC;
  signal PS7_axi_periph_M03_AXI_BREADY : STD_LOGIC;
  signal PS7_axi_periph_M03_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_M03_AXI_BVALID : STD_LOGIC;
  signal PS7_axi_periph_M03_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M03_AXI_RREADY : STD_LOGIC;
  signal PS7_axi_periph_M03_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_M03_AXI_RVALID : STD_LOGIC;
  signal PS7_axi_periph_M03_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M03_AXI_WREADY : STD_LOGIC;
  signal PS7_axi_periph_M03_AXI_WVALID : STD_LOGIC;
  signal VDMA1_M_AXIS_MM2S_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal VDMA1_M_AXIS_MM2S_TLAST : STD_LOGIC;
  signal VDMA1_M_AXIS_MM2S_TREADY : STD_LOGIC;
  signal VDMA1_M_AXIS_MM2S_TUSER : STD_LOGIC_VECTOR ( 0 to 0 );
  signal VDMA1_M_AXIS_MM2S_TVALID : STD_LOGIC;
  signal VDMA1_M_AXI_MM2S_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal VDMA1_M_AXI_MM2S_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal VDMA1_M_AXI_MM2S_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal VDMA1_M_AXI_MM2S_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal VDMA1_M_AXI_MM2S_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal VDMA1_M_AXI_MM2S_ARREADY : STD_LOGIC;
  signal VDMA1_M_AXI_MM2S_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal VDMA1_M_AXI_MM2S_ARVALID : STD_LOGIC;
  signal VDMA1_M_AXI_MM2S_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal VDMA1_M_AXI_MM2S_RLAST : STD_LOGIC;
  signal VDMA1_M_AXI_MM2S_RREADY : STD_LOGIC;
  signal VDMA1_M_AXI_MM2S_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal VDMA1_M_AXI_MM2S_RVALID : STD_LOGIC;
  signal VDMA1_M_AXI_S2MM_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal VDMA1_M_AXI_S2MM_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal VDMA1_M_AXI_S2MM_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal VDMA1_M_AXI_S2MM_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal VDMA1_M_AXI_S2MM_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal VDMA1_M_AXI_S2MM_AWREADY : STD_LOGIC;
  signal VDMA1_M_AXI_S2MM_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal VDMA1_M_AXI_S2MM_AWVALID : STD_LOGIC;
  signal VDMA1_M_AXI_S2MM_BREADY : STD_LOGIC;
  signal VDMA1_M_AXI_S2MM_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal VDMA1_M_AXI_S2MM_BVALID : STD_LOGIC;
  signal VDMA1_M_AXI_S2MM_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal VDMA1_M_AXI_S2MM_WLAST : STD_LOGIC;
  signal VDMA1_M_AXI_S2MM_WREADY : STD_LOGIC;
  signal VDMA1_M_AXI_S2MM_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal VDMA1_M_AXI_S2MM_WVALID : STD_LOGIC;
  signal processing_system7_0_FCLK_CLK0 : STD_LOGIC;
  signal rst_PS7_75M_peripheral_aresetn : STD_LOGIC;
  signal v_ccm_0_video_out_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal v_ccm_0_video_out_TKEEP : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal v_ccm_0_video_out_TLAST : STD_LOGIC;
  signal v_ccm_0_video_out_TREADY : STD_LOGIC;
  signal v_ccm_0_video_out_TUSER : STD_LOGIC_VECTOR ( 0 to 0 );
  signal v_ccm_0_video_out_TVALID : STD_LOGIC;
  signal NLW_VDMA1_mm2s_introut_UNCONNECTED : STD_LOGIC;
  signal NLW_VDMA1_s2mm_introut_UNCONNECTED : STD_LOGIC;
  signal NLW_VDMA1_m_axis_mm2s_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_VDMA1_mm2s_frame_ptr_out_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_VDMA1_s2mm_frame_ptr_out_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
begin
  M_AXIS_tdata(15 downto 0) <= VDMA1_M_AXIS_MM2S_TDATA(15 downto 0);
  M_AXIS_tlast <= VDMA1_M_AXIS_MM2S_TLAST;
  M_AXIS_tuser <= VDMA1_M_AXIS_MM2S_TUSER(0);
  M_AXIS_tvalid <= VDMA1_M_AXIS_MM2S_TVALID;
  M_AXI_MM2S_araddr(31 downto 0) <= VDMA1_M_AXI_MM2S_ARADDR(31 downto 0);
  M_AXI_MM2S_arburst(1 downto 0) <= VDMA1_M_AXI_MM2S_ARBURST(1 downto 0);
  M_AXI_MM2S_arcache(3 downto 0) <= VDMA1_M_AXI_MM2S_ARCACHE(3 downto 0);
  M_AXI_MM2S_arlen(7 downto 0) <= VDMA1_M_AXI_MM2S_ARLEN(7 downto 0);
  M_AXI_MM2S_arprot(2 downto 0) <= VDMA1_M_AXI_MM2S_ARPROT(2 downto 0);
  M_AXI_MM2S_arsize(2 downto 0) <= VDMA1_M_AXI_MM2S_ARSIZE(2 downto 0);
  M_AXI_MM2S_arvalid <= VDMA1_M_AXI_MM2S_ARVALID;
  M_AXI_MM2S_rready <= VDMA1_M_AXI_MM2S_RREADY;
  M_AXI_S2MM_awaddr(31 downto 0) <= VDMA1_M_AXI_S2MM_AWADDR(31 downto 0);
  M_AXI_S2MM_awburst(1 downto 0) <= VDMA1_M_AXI_S2MM_AWBURST(1 downto 0);
  M_AXI_S2MM_awcache(3 downto 0) <= VDMA1_M_AXI_S2MM_AWCACHE(3 downto 0);
  M_AXI_S2MM_awlen(7 downto 0) <= VDMA1_M_AXI_S2MM_AWLEN(7 downto 0);
  M_AXI_S2MM_awprot(2 downto 0) <= VDMA1_M_AXI_S2MM_AWPROT(2 downto 0);
  M_AXI_S2MM_awsize(2 downto 0) <= VDMA1_M_AXI_S2MM_AWSIZE(2 downto 0);
  M_AXI_S2MM_awvalid <= VDMA1_M_AXI_S2MM_AWVALID;
  M_AXI_S2MM_bready <= VDMA1_M_AXI_S2MM_BREADY;
  M_AXI_S2MM_wdata(63 downto 0) <= VDMA1_M_AXI_S2MM_WDATA(63 downto 0);
  M_AXI_S2MM_wlast <= VDMA1_M_AXI_S2MM_WLAST;
  M_AXI_S2MM_wstrb(7 downto 0) <= VDMA1_M_AXI_S2MM_WSTRB(7 downto 0);
  M_AXI_S2MM_wvalid <= VDMA1_M_AXI_S2MM_WVALID;
  PS7_axi_periph_M03_AXI_ARADDR(31 downto 0) <= S_AXI_LITE_araddr(31 downto 0);
  PS7_axi_periph_M03_AXI_ARVALID <= S_AXI_LITE_arvalid;
  PS7_axi_periph_M03_AXI_AWADDR(31 downto 0) <= S_AXI_LITE_awaddr(31 downto 0);
  PS7_axi_periph_M03_AXI_AWVALID <= S_AXI_LITE_awvalid;
  PS7_axi_periph_M03_AXI_BREADY <= S_AXI_LITE_bready;
  PS7_axi_periph_M03_AXI_RREADY <= S_AXI_LITE_rready;
  PS7_axi_periph_M03_AXI_WDATA(31 downto 0) <= S_AXI_LITE_wdata(31 downto 0);
  PS7_axi_periph_M03_AXI_WVALID <= S_AXI_LITE_wvalid;
  S_AXIS_S2MM_tready <= v_ccm_0_video_out_TREADY;
  S_AXI_LITE_arready <= PS7_axi_periph_M03_AXI_ARREADY;
  S_AXI_LITE_awready <= PS7_axi_periph_M03_AXI_AWREADY;
  S_AXI_LITE_bresp(1 downto 0) <= PS7_axi_periph_M03_AXI_BRESP(1 downto 0);
  S_AXI_LITE_bvalid <= PS7_axi_periph_M03_AXI_BVALID;
  S_AXI_LITE_rdata(31 downto 0) <= PS7_axi_periph_M03_AXI_RDATA(31 downto 0);
  S_AXI_LITE_rresp(1 downto 0) <= PS7_axi_periph_M03_AXI_RRESP(1 downto 0);
  S_AXI_LITE_rvalid <= PS7_axi_periph_M03_AXI_RVALID;
  S_AXI_LITE_wready <= PS7_axi_periph_M03_AXI_WREADY;
  VDMA1_M_AXIS_MM2S_TREADY <= M_AXIS_tready;
  VDMA1_M_AXI_MM2S_ARREADY <= M_AXI_MM2S_arready;
  VDMA1_M_AXI_MM2S_RDATA(63 downto 0) <= M_AXI_MM2S_rdata(63 downto 0);
  VDMA1_M_AXI_MM2S_RLAST <= M_AXI_MM2S_rlast;
  VDMA1_M_AXI_MM2S_RRESP(1 downto 0) <= M_AXI_MM2S_rresp(1 downto 0);
  VDMA1_M_AXI_MM2S_RVALID <= M_AXI_MM2S_rvalid;
  VDMA1_M_AXI_S2MM_AWREADY <= M_AXI_S2MM_awready;
  VDMA1_M_AXI_S2MM_BRESP(1 downto 0) <= M_AXI_S2MM_bresp(1 downto 0);
  VDMA1_M_AXI_S2MM_BVALID <= M_AXI_S2MM_bvalid;
  VDMA1_M_AXI_S2MM_WREADY <= M_AXI_S2MM_wready;
  processing_system7_0_FCLK_CLK0 <= s_axis_s2mm_aclk;
  rst_PS7_75M_peripheral_aresetn <= aresetn150Mhz;
  v_ccm_0_video_out_TDATA(15 downto 0) <= S_AXIS_S2MM_tdata(15 downto 0);
  v_ccm_0_video_out_TKEEP(2 downto 0) <= S_AXIS_S2MM_tkeep(2 downto 0);
  v_ccm_0_video_out_TLAST <= S_AXIS_S2MM_tlast;
  v_ccm_0_video_out_TUSER(0) <= S_AXIS_S2MM_tuser(0);
  v_ccm_0_video_out_TVALID <= S_AXIS_S2MM_tvalid;
VDMA1: component zynq_soc_VDMA1_0
     port map (
      axi_resetn => rst_PS7_75M_peripheral_aresetn,
      m_axi_mm2s_aclk => processing_system7_0_FCLK_CLK0,
      m_axi_mm2s_araddr(31 downto 0) => VDMA1_M_AXI_MM2S_ARADDR(31 downto 0),
      m_axi_mm2s_arburst(1 downto 0) => VDMA1_M_AXI_MM2S_ARBURST(1 downto 0),
      m_axi_mm2s_arcache(3 downto 0) => VDMA1_M_AXI_MM2S_ARCACHE(3 downto 0),
      m_axi_mm2s_arlen(7 downto 0) => VDMA1_M_AXI_MM2S_ARLEN(7 downto 0),
      m_axi_mm2s_arprot(2 downto 0) => VDMA1_M_AXI_MM2S_ARPROT(2 downto 0),
      m_axi_mm2s_arready => VDMA1_M_AXI_MM2S_ARREADY,
      m_axi_mm2s_arsize(2 downto 0) => VDMA1_M_AXI_MM2S_ARSIZE(2 downto 0),
      m_axi_mm2s_arvalid => VDMA1_M_AXI_MM2S_ARVALID,
      m_axi_mm2s_rdata(63 downto 0) => VDMA1_M_AXI_MM2S_RDATA(63 downto 0),
      m_axi_mm2s_rlast => VDMA1_M_AXI_MM2S_RLAST,
      m_axi_mm2s_rready => VDMA1_M_AXI_MM2S_RREADY,
      m_axi_mm2s_rresp(1 downto 0) => VDMA1_M_AXI_MM2S_RRESP(1 downto 0),
      m_axi_mm2s_rvalid => VDMA1_M_AXI_MM2S_RVALID,
      m_axi_s2mm_aclk => processing_system7_0_FCLK_CLK0,
      m_axi_s2mm_awaddr(31 downto 0) => VDMA1_M_AXI_S2MM_AWADDR(31 downto 0),
      m_axi_s2mm_awburst(1 downto 0) => VDMA1_M_AXI_S2MM_AWBURST(1 downto 0),
      m_axi_s2mm_awcache(3 downto 0) => VDMA1_M_AXI_S2MM_AWCACHE(3 downto 0),
      m_axi_s2mm_awlen(7 downto 0) => VDMA1_M_AXI_S2MM_AWLEN(7 downto 0),
      m_axi_s2mm_awprot(2 downto 0) => VDMA1_M_AXI_S2MM_AWPROT(2 downto 0),
      m_axi_s2mm_awready => VDMA1_M_AXI_S2MM_AWREADY,
      m_axi_s2mm_awsize(2 downto 0) => VDMA1_M_AXI_S2MM_AWSIZE(2 downto 0),
      m_axi_s2mm_awvalid => VDMA1_M_AXI_S2MM_AWVALID,
      m_axi_s2mm_bready => VDMA1_M_AXI_S2MM_BREADY,
      m_axi_s2mm_bresp(1 downto 0) => VDMA1_M_AXI_S2MM_BRESP(1 downto 0),
      m_axi_s2mm_bvalid => VDMA1_M_AXI_S2MM_BVALID,
      m_axi_s2mm_wdata(63 downto 0) => VDMA1_M_AXI_S2MM_WDATA(63 downto 0),
      m_axi_s2mm_wlast => VDMA1_M_AXI_S2MM_WLAST,
      m_axi_s2mm_wready => VDMA1_M_AXI_S2MM_WREADY,
      m_axi_s2mm_wstrb(7 downto 0) => VDMA1_M_AXI_S2MM_WSTRB(7 downto 0),
      m_axi_s2mm_wvalid => VDMA1_M_AXI_S2MM_WVALID,
      m_axis_mm2s_aclk => processing_system7_0_FCLK_CLK0,
      m_axis_mm2s_tdata(15 downto 0) => VDMA1_M_AXIS_MM2S_TDATA(15 downto 0),
      m_axis_mm2s_tkeep(1 downto 0) => NLW_VDMA1_m_axis_mm2s_tkeep_UNCONNECTED(1 downto 0),
      m_axis_mm2s_tlast => VDMA1_M_AXIS_MM2S_TLAST,
      m_axis_mm2s_tready => VDMA1_M_AXIS_MM2S_TREADY,
      m_axis_mm2s_tuser(0) => VDMA1_M_AXIS_MM2S_TUSER(0),
      m_axis_mm2s_tvalid => VDMA1_M_AXIS_MM2S_TVALID,
      mm2s_frame_ptr_out(5 downto 0) => NLW_VDMA1_mm2s_frame_ptr_out_UNCONNECTED(5 downto 0),
      mm2s_introut => NLW_VDMA1_mm2s_introut_UNCONNECTED,
      s2mm_frame_ptr_out(5 downto 0) => NLW_VDMA1_s2mm_frame_ptr_out_UNCONNECTED(5 downto 0),
      s2mm_introut => NLW_VDMA1_s2mm_introut_UNCONNECTED,
      s_axi_lite_aclk => processing_system7_0_FCLK_CLK0,
      s_axi_lite_araddr(8 downto 0) => PS7_axi_periph_M03_AXI_ARADDR(8 downto 0),
      s_axi_lite_arready => PS7_axi_periph_M03_AXI_ARREADY,
      s_axi_lite_arvalid => PS7_axi_periph_M03_AXI_ARVALID,
      s_axi_lite_awaddr(8 downto 0) => PS7_axi_periph_M03_AXI_AWADDR(8 downto 0),
      s_axi_lite_awready => PS7_axi_periph_M03_AXI_AWREADY,
      s_axi_lite_awvalid => PS7_axi_periph_M03_AXI_AWVALID,
      s_axi_lite_bready => PS7_axi_periph_M03_AXI_BREADY,
      s_axi_lite_bresp(1 downto 0) => PS7_axi_periph_M03_AXI_BRESP(1 downto 0),
      s_axi_lite_bvalid => PS7_axi_periph_M03_AXI_BVALID,
      s_axi_lite_rdata(31 downto 0) => PS7_axi_periph_M03_AXI_RDATA(31 downto 0),
      s_axi_lite_rready => PS7_axi_periph_M03_AXI_RREADY,
      s_axi_lite_rresp(1 downto 0) => PS7_axi_periph_M03_AXI_RRESP(1 downto 0),
      s_axi_lite_rvalid => PS7_axi_periph_M03_AXI_RVALID,
      s_axi_lite_wdata(31 downto 0) => PS7_axi_periph_M03_AXI_WDATA(31 downto 0),
      s_axi_lite_wready => PS7_axi_periph_M03_AXI_WREADY,
      s_axi_lite_wvalid => PS7_axi_periph_M03_AXI_WVALID,
      s_axis_s2mm_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_s2mm_tdata(15 downto 0) => v_ccm_0_video_out_TDATA(15 downto 0),
      s_axis_s2mm_tkeep(1 downto 0) => v_ccm_0_video_out_TKEEP(1 downto 0),
      s_axis_s2mm_tlast => v_ccm_0_video_out_TLAST,
      s_axis_s2mm_tready => v_ccm_0_video_out_TREADY,
      s_axis_s2mm_tuser(0) => v_ccm_0_video_out_TUSER(0),
      s_axis_s2mm_tvalid => v_ccm_0_video_out_TVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m00_couplers_imp_1D0AVJ7 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXI_rid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    M_AXI_rlast : in STD_LOGIC;
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXI_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wlast : out STD_LOGIC;
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m00_couplers_imp_1D0AVJ7;

architecture STRUCTURE of m00_couplers_imp_1D0AVJ7 is
  component zynq_soc_auto_pc_1 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component zynq_soc_auto_pc_1;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_pc_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_m00_couplers_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_pc_to_m00_couplers_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_m00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_m00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_m00_couplers_ARREADY : STD_LOGIC;
  signal auto_pc_to_m00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_m00_couplers_ARVALID : STD_LOGIC;
  signal auto_pc_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_m00_couplers_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_pc_to_m00_couplers_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_m00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_m00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_m00_couplers_AWREADY : STD_LOGIC;
  signal auto_pc_to_m00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_m00_couplers_AWVALID : STD_LOGIC;
  signal auto_pc_to_m00_couplers_BID : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal auto_pc_to_m00_couplers_BREADY : STD_LOGIC;
  signal auto_pc_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m00_couplers_BVALID : STD_LOGIC;
  signal auto_pc_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal auto_pc_to_m00_couplers_RID : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal auto_pc_to_m00_couplers_RLAST : STD_LOGIC;
  signal auto_pc_to_m00_couplers_RREADY : STD_LOGIC;
  signal auto_pc_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m00_couplers_RVALID : STD_LOGIC;
  signal auto_pc_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal auto_pc_to_m00_couplers_WID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_pc_to_m00_couplers_WLAST : STD_LOGIC;
  signal auto_pc_to_m00_couplers_WREADY : STD_LOGIC;
  signal auto_pc_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_pc_to_m00_couplers_WVALID : STD_LOGIC;
  signal m00_couplers_to_auto_pc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_pc_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_pc_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_auto_pc_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_auto_pc_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_auto_pc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_pc_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_ARREADY : STD_LOGIC;
  signal m00_couplers_to_auto_pc_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_pc_ARVALID : STD_LOGIC;
  signal m00_couplers_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_pc_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_pc_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_auto_pc_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_auto_pc_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_auto_pc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_pc_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_AWREADY : STD_LOGIC;
  signal m00_couplers_to_auto_pc_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_pc_AWVALID : STD_LOGIC;
  signal m00_couplers_to_auto_pc_BID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_auto_pc_BREADY : STD_LOGIC;
  signal m00_couplers_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_pc_BVALID : STD_LOGIC;
  signal m00_couplers_to_auto_pc_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal m00_couplers_to_auto_pc_RID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_auto_pc_RLAST : STD_LOGIC;
  signal m00_couplers_to_auto_pc_RREADY : STD_LOGIC;
  signal m00_couplers_to_auto_pc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_pc_RVALID : STD_LOGIC;
  signal m00_couplers_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal m00_couplers_to_auto_pc_WLAST : STD_LOGIC;
  signal m00_couplers_to_auto_pc_WREADY : STD_LOGIC;
  signal m00_couplers_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_auto_pc_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= auto_pc_to_m00_couplers_ARADDR(31 downto 0);
  M_AXI_arburst(1 downto 0) <= auto_pc_to_m00_couplers_ARBURST(1 downto 0);
  M_AXI_arcache(3 downto 0) <= auto_pc_to_m00_couplers_ARCACHE(3 downto 0);
  M_AXI_arid(0) <= auto_pc_to_m00_couplers_ARID(0);
  M_AXI_arlen(3 downto 0) <= auto_pc_to_m00_couplers_ARLEN(3 downto 0);
  M_AXI_arlock(1 downto 0) <= auto_pc_to_m00_couplers_ARLOCK(1 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_pc_to_m00_couplers_ARPROT(2 downto 0);
  M_AXI_arqos(3 downto 0) <= auto_pc_to_m00_couplers_ARQOS(3 downto 0);
  M_AXI_arsize(2 downto 0) <= auto_pc_to_m00_couplers_ARSIZE(2 downto 0);
  M_AXI_arvalid <= auto_pc_to_m00_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_pc_to_m00_couplers_AWADDR(31 downto 0);
  M_AXI_awburst(1 downto 0) <= auto_pc_to_m00_couplers_AWBURST(1 downto 0);
  M_AXI_awcache(3 downto 0) <= auto_pc_to_m00_couplers_AWCACHE(3 downto 0);
  M_AXI_awid(0) <= auto_pc_to_m00_couplers_AWID(0);
  M_AXI_awlen(3 downto 0) <= auto_pc_to_m00_couplers_AWLEN(3 downto 0);
  M_AXI_awlock(1 downto 0) <= auto_pc_to_m00_couplers_AWLOCK(1 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_pc_to_m00_couplers_AWPROT(2 downto 0);
  M_AXI_awqos(3 downto 0) <= auto_pc_to_m00_couplers_AWQOS(3 downto 0);
  M_AXI_awsize(2 downto 0) <= auto_pc_to_m00_couplers_AWSIZE(2 downto 0);
  M_AXI_awvalid <= auto_pc_to_m00_couplers_AWVALID;
  M_AXI_bready <= auto_pc_to_m00_couplers_BREADY;
  M_AXI_rready <= auto_pc_to_m00_couplers_RREADY;
  M_AXI_wdata(63 downto 0) <= auto_pc_to_m00_couplers_WDATA(63 downto 0);
  M_AXI_wid(0) <= auto_pc_to_m00_couplers_WID(0);
  M_AXI_wlast <= auto_pc_to_m00_couplers_WLAST;
  M_AXI_wstrb(7 downto 0) <= auto_pc_to_m00_couplers_WSTRB(7 downto 0);
  M_AXI_wvalid <= auto_pc_to_m00_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m00_couplers_to_auto_pc_ARREADY;
  S_AXI_awready <= m00_couplers_to_auto_pc_AWREADY;
  S_AXI_bid(0) <= m00_couplers_to_auto_pc_BID(0);
  S_AXI_bresp(1 downto 0) <= m00_couplers_to_auto_pc_BRESP(1 downto 0);
  S_AXI_bvalid <= m00_couplers_to_auto_pc_BVALID;
  S_AXI_rdata(63 downto 0) <= m00_couplers_to_auto_pc_RDATA(63 downto 0);
  S_AXI_rid(0) <= m00_couplers_to_auto_pc_RID(0);
  S_AXI_rlast <= m00_couplers_to_auto_pc_RLAST;
  S_AXI_rresp(1 downto 0) <= m00_couplers_to_auto_pc_RRESP(1 downto 0);
  S_AXI_rvalid <= m00_couplers_to_auto_pc_RVALID;
  S_AXI_wready <= m00_couplers_to_auto_pc_WREADY;
  auto_pc_to_m00_couplers_ARREADY <= M_AXI_arready;
  auto_pc_to_m00_couplers_AWREADY <= M_AXI_awready;
  auto_pc_to_m00_couplers_BID(5 downto 0) <= M_AXI_bid(5 downto 0);
  auto_pc_to_m00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_pc_to_m00_couplers_BVALID <= M_AXI_bvalid;
  auto_pc_to_m00_couplers_RDATA(63 downto 0) <= M_AXI_rdata(63 downto 0);
  auto_pc_to_m00_couplers_RID(5 downto 0) <= M_AXI_rid(5 downto 0);
  auto_pc_to_m00_couplers_RLAST <= M_AXI_rlast;
  auto_pc_to_m00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_pc_to_m00_couplers_RVALID <= M_AXI_rvalid;
  auto_pc_to_m00_couplers_WREADY <= M_AXI_wready;
  m00_couplers_to_auto_pc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m00_couplers_to_auto_pc_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  m00_couplers_to_auto_pc_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  m00_couplers_to_auto_pc_ARID(0) <= S_AXI_arid(0);
  m00_couplers_to_auto_pc_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  m00_couplers_to_auto_pc_ARLOCK(0) <= S_AXI_arlock(0);
  m00_couplers_to_auto_pc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m00_couplers_to_auto_pc_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  m00_couplers_to_auto_pc_ARREGION(3 downto 0) <= S_AXI_arregion(3 downto 0);
  m00_couplers_to_auto_pc_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  m00_couplers_to_auto_pc_ARVALID <= S_AXI_arvalid;
  m00_couplers_to_auto_pc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m00_couplers_to_auto_pc_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  m00_couplers_to_auto_pc_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  m00_couplers_to_auto_pc_AWID(0) <= S_AXI_awid(0);
  m00_couplers_to_auto_pc_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  m00_couplers_to_auto_pc_AWLOCK(0) <= S_AXI_awlock(0);
  m00_couplers_to_auto_pc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m00_couplers_to_auto_pc_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  m00_couplers_to_auto_pc_AWREGION(3 downto 0) <= S_AXI_awregion(3 downto 0);
  m00_couplers_to_auto_pc_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  m00_couplers_to_auto_pc_AWVALID <= S_AXI_awvalid;
  m00_couplers_to_auto_pc_BREADY <= S_AXI_bready;
  m00_couplers_to_auto_pc_RREADY <= S_AXI_rready;
  m00_couplers_to_auto_pc_WDATA(63 downto 0) <= S_AXI_wdata(63 downto 0);
  m00_couplers_to_auto_pc_WLAST <= S_AXI_wlast;
  m00_couplers_to_auto_pc_WSTRB(7 downto 0) <= S_AXI_wstrb(7 downto 0);
  m00_couplers_to_auto_pc_WVALID <= S_AXI_wvalid;
auto_pc: component zynq_soc_auto_pc_1
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1,
      m_axi_araddr(31 downto 0) => auto_pc_to_m00_couplers_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => auto_pc_to_m00_couplers_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => auto_pc_to_m00_couplers_ARCACHE(3 downto 0),
      m_axi_arid(0) => auto_pc_to_m00_couplers_ARID(0),
      m_axi_arlen(3 downto 0) => auto_pc_to_m00_couplers_ARLEN(3 downto 0),
      m_axi_arlock(1 downto 0) => auto_pc_to_m00_couplers_ARLOCK(1 downto 0),
      m_axi_arprot(2 downto 0) => auto_pc_to_m00_couplers_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => auto_pc_to_m00_couplers_ARQOS(3 downto 0),
      m_axi_arready => auto_pc_to_m00_couplers_ARREADY,
      m_axi_arsize(2 downto 0) => auto_pc_to_m00_couplers_ARSIZE(2 downto 0),
      m_axi_arvalid => auto_pc_to_m00_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_pc_to_m00_couplers_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => auto_pc_to_m00_couplers_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => auto_pc_to_m00_couplers_AWCACHE(3 downto 0),
      m_axi_awid(0) => auto_pc_to_m00_couplers_AWID(0),
      m_axi_awlen(3 downto 0) => auto_pc_to_m00_couplers_AWLEN(3 downto 0),
      m_axi_awlock(1 downto 0) => auto_pc_to_m00_couplers_AWLOCK(1 downto 0),
      m_axi_awprot(2 downto 0) => auto_pc_to_m00_couplers_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => auto_pc_to_m00_couplers_AWQOS(3 downto 0),
      m_axi_awready => auto_pc_to_m00_couplers_AWREADY,
      m_axi_awsize(2 downto 0) => auto_pc_to_m00_couplers_AWSIZE(2 downto 0),
      m_axi_awvalid => auto_pc_to_m00_couplers_AWVALID,
      m_axi_bid(0) => auto_pc_to_m00_couplers_BID(0),
      m_axi_bready => auto_pc_to_m00_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_m00_couplers_BVALID,
      m_axi_rdata(63 downto 0) => auto_pc_to_m00_couplers_RDATA(63 downto 0),
      m_axi_rid(0) => auto_pc_to_m00_couplers_RID(0),
      m_axi_rlast => auto_pc_to_m00_couplers_RLAST,
      m_axi_rready => auto_pc_to_m00_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_pc_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_pc_to_m00_couplers_RVALID,
      m_axi_wdata(63 downto 0) => auto_pc_to_m00_couplers_WDATA(63 downto 0),
      m_axi_wid(0) => auto_pc_to_m00_couplers_WID(0),
      m_axi_wlast => auto_pc_to_m00_couplers_WLAST,
      m_axi_wready => auto_pc_to_m00_couplers_WREADY,
      m_axi_wstrb(7 downto 0) => auto_pc_to_m00_couplers_WSTRB(7 downto 0),
      m_axi_wvalid => auto_pc_to_m00_couplers_WVALID,
      s_axi_araddr(31 downto 0) => m00_couplers_to_auto_pc_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => m00_couplers_to_auto_pc_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => m00_couplers_to_auto_pc_ARCACHE(3 downto 0),
      s_axi_arid(0) => m00_couplers_to_auto_pc_ARID(0),
      s_axi_arlen(7 downto 0) => m00_couplers_to_auto_pc_ARLEN(7 downto 0),
      s_axi_arlock(0) => m00_couplers_to_auto_pc_ARLOCK(0),
      s_axi_arprot(2 downto 0) => m00_couplers_to_auto_pc_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => m00_couplers_to_auto_pc_ARQOS(3 downto 0),
      s_axi_arready => m00_couplers_to_auto_pc_ARREADY,
      s_axi_arregion(3 downto 0) => m00_couplers_to_auto_pc_ARREGION(3 downto 0),
      s_axi_arsize(2 downto 0) => m00_couplers_to_auto_pc_ARSIZE(2 downto 0),
      s_axi_arvalid => m00_couplers_to_auto_pc_ARVALID,
      s_axi_awaddr(31 downto 0) => m00_couplers_to_auto_pc_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => m00_couplers_to_auto_pc_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => m00_couplers_to_auto_pc_AWCACHE(3 downto 0),
      s_axi_awid(0) => m00_couplers_to_auto_pc_AWID(0),
      s_axi_awlen(7 downto 0) => m00_couplers_to_auto_pc_AWLEN(7 downto 0),
      s_axi_awlock(0) => m00_couplers_to_auto_pc_AWLOCK(0),
      s_axi_awprot(2 downto 0) => m00_couplers_to_auto_pc_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => m00_couplers_to_auto_pc_AWQOS(3 downto 0),
      s_axi_awready => m00_couplers_to_auto_pc_AWREADY,
      s_axi_awregion(3 downto 0) => m00_couplers_to_auto_pc_AWREGION(3 downto 0),
      s_axi_awsize(2 downto 0) => m00_couplers_to_auto_pc_AWSIZE(2 downto 0),
      s_axi_awvalid => m00_couplers_to_auto_pc_AWVALID,
      s_axi_bid(0) => m00_couplers_to_auto_pc_BID(0),
      s_axi_bready => m00_couplers_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => m00_couplers_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => m00_couplers_to_auto_pc_BVALID,
      s_axi_rdata(63 downto 0) => m00_couplers_to_auto_pc_RDATA(63 downto 0),
      s_axi_rid(0) => m00_couplers_to_auto_pc_RID(0),
      s_axi_rlast => m00_couplers_to_auto_pc_RLAST,
      s_axi_rready => m00_couplers_to_auto_pc_RREADY,
      s_axi_rresp(1 downto 0) => m00_couplers_to_auto_pc_RRESP(1 downto 0),
      s_axi_rvalid => m00_couplers_to_auto_pc_RVALID,
      s_axi_wdata(63 downto 0) => m00_couplers_to_auto_pc_WDATA(63 downto 0),
      s_axi_wlast => m00_couplers_to_auto_pc_WLAST,
      s_axi_wready => m00_couplers_to_auto_pc_WREADY,
      s_axi_wstrb(7 downto 0) => m00_couplers_to_auto_pc_WSTRB(7 downto 0),
      s_axi_wvalid => m00_couplers_to_auto_pc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m00_couplers_imp_3A6666 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wvalid : in STD_LOGIC
  );
end m00_couplers_imp_3A6666;

architecture STRUCTURE of m00_couplers_imp_3A6666 is
  signal m00_couplers_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_ARREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_ARVALID : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_AWREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_AWVALID : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_BREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_m00_couplers_BVALID : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_RREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_m00_couplers_RVALID : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_WREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m00_couplers_to_m00_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid <= m00_couplers_to_m00_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m00_couplers_to_m00_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid <= m00_couplers_to_m00_couplers_AWVALID;
  M_AXI_bready <= m00_couplers_to_m00_couplers_BREADY;
  M_AXI_rready <= m00_couplers_to_m00_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m00_couplers_to_m00_couplers_WDATA(31 downto 0);
  M_AXI_wvalid <= m00_couplers_to_m00_couplers_WVALID;
  S_AXI_arready <= m00_couplers_to_m00_couplers_ARREADY;
  S_AXI_awready <= m00_couplers_to_m00_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m00_couplers_to_m00_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m00_couplers_to_m00_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m00_couplers_to_m00_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m00_couplers_to_m00_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m00_couplers_to_m00_couplers_RVALID;
  S_AXI_wready <= m00_couplers_to_m00_couplers_WREADY;
  m00_couplers_to_m00_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m00_couplers_to_m00_couplers_ARREADY <= M_AXI_arready;
  m00_couplers_to_m00_couplers_ARVALID <= S_AXI_arvalid;
  m00_couplers_to_m00_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m00_couplers_to_m00_couplers_AWREADY <= M_AXI_awready;
  m00_couplers_to_m00_couplers_AWVALID <= S_AXI_awvalid;
  m00_couplers_to_m00_couplers_BREADY <= S_AXI_bready;
  m00_couplers_to_m00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m00_couplers_to_m00_couplers_BVALID <= M_AXI_bvalid;
  m00_couplers_to_m00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m00_couplers_to_m00_couplers_RREADY <= S_AXI_rready;
  m00_couplers_to_m00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m00_couplers_to_m00_couplers_RVALID <= M_AXI_rvalid;
  m00_couplers_to_m00_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m00_couplers_to_m00_couplers_WREADY <= M_AXI_wready;
  m00_couplers_to_m00_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m01_couplers_imp_1RENW4F is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m01_couplers_imp_1RENW4F;

architecture STRUCTURE of m01_couplers_imp_1RENW4F is
  signal m01_couplers_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_m01_couplers_ARREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_ARVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_m01_couplers_AWREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_AWVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_BREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_m01_couplers_BVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_RREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_m01_couplers_RVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_WREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_m01_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m01_couplers_to_m01_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= m01_couplers_to_m01_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= m01_couplers_to_m01_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m01_couplers_to_m01_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= m01_couplers_to_m01_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= m01_couplers_to_m01_couplers_AWVALID;
  M_AXI_bready <= m01_couplers_to_m01_couplers_BREADY;
  M_AXI_rready <= m01_couplers_to_m01_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m01_couplers_to_m01_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m01_couplers_to_m01_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m01_couplers_to_m01_couplers_WVALID;
  S_AXI_arready <= m01_couplers_to_m01_couplers_ARREADY;
  S_AXI_awready <= m01_couplers_to_m01_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m01_couplers_to_m01_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m01_couplers_to_m01_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m01_couplers_to_m01_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m01_couplers_to_m01_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m01_couplers_to_m01_couplers_RVALID;
  S_AXI_wready <= m01_couplers_to_m01_couplers_WREADY;
  m01_couplers_to_m01_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m01_couplers_to_m01_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m01_couplers_to_m01_couplers_ARREADY <= M_AXI_arready;
  m01_couplers_to_m01_couplers_ARVALID <= S_AXI_arvalid;
  m01_couplers_to_m01_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m01_couplers_to_m01_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m01_couplers_to_m01_couplers_AWREADY <= M_AXI_awready;
  m01_couplers_to_m01_couplers_AWVALID <= S_AXI_awvalid;
  m01_couplers_to_m01_couplers_BREADY <= S_AXI_bready;
  m01_couplers_to_m01_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m01_couplers_to_m01_couplers_BVALID <= M_AXI_bvalid;
  m01_couplers_to_m01_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m01_couplers_to_m01_couplers_RREADY <= S_AXI_rready;
  m01_couplers_to_m01_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m01_couplers_to_m01_couplers_RVALID <= M_AXI_rvalid;
  m01_couplers_to_m01_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m01_couplers_to_m01_couplers_WREADY <= M_AXI_wready;
  m01_couplers_to_m01_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m01_couplers_to_m01_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m02_couplers_imp_3VVN0D is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m02_couplers_imp_3VVN0D;

architecture STRUCTURE of m02_couplers_imp_3VVN0D is
  component zynq_soc_auto_cc_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_aclk : in STD_LOGIC;
    m_axi_aresetn : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component zynq_soc_auto_cc_0;
  signal M_ACLK_1 : STD_LOGIC;
  signal M_ARESETN_1 : STD_LOGIC;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_cc_to_m02_couplers_ARADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal auto_cc_to_m02_couplers_ARREADY : STD_LOGIC;
  signal auto_cc_to_m02_couplers_ARVALID : STD_LOGIC;
  signal auto_cc_to_m02_couplers_AWADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal auto_cc_to_m02_couplers_AWREADY : STD_LOGIC;
  signal auto_cc_to_m02_couplers_AWVALID : STD_LOGIC;
  signal auto_cc_to_m02_couplers_BREADY : STD_LOGIC;
  signal auto_cc_to_m02_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m02_couplers_BVALID : STD_LOGIC;
  signal auto_cc_to_m02_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m02_couplers_RREADY : STD_LOGIC;
  signal auto_cc_to_m02_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m02_couplers_RVALID : STD_LOGIC;
  signal auto_cc_to_m02_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m02_couplers_WREADY : STD_LOGIC;
  signal auto_cc_to_m02_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_cc_to_m02_couplers_WVALID : STD_LOGIC;
  signal m02_couplers_to_auto_cc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_auto_cc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_auto_cc_ARREADY : STD_LOGIC;
  signal m02_couplers_to_auto_cc_ARVALID : STD_LOGIC;
  signal m02_couplers_to_auto_cc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_auto_cc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_auto_cc_AWREADY : STD_LOGIC;
  signal m02_couplers_to_auto_cc_AWVALID : STD_LOGIC;
  signal m02_couplers_to_auto_cc_BREADY : STD_LOGIC;
  signal m02_couplers_to_auto_cc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_auto_cc_BVALID : STD_LOGIC;
  signal m02_couplers_to_auto_cc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_auto_cc_RREADY : STD_LOGIC;
  signal m02_couplers_to_auto_cc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_auto_cc_RVALID : STD_LOGIC;
  signal m02_couplers_to_auto_cc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_auto_cc_WREADY : STD_LOGIC;
  signal m02_couplers_to_auto_cc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_auto_cc_WVALID : STD_LOGIC;
  signal NLW_auto_cc_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_auto_cc_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
begin
  M_ACLK_1 <= M_ACLK;
  M_ARESETN_1 <= M_ARESETN;
  M_AXI_araddr(8 downto 0) <= auto_cc_to_m02_couplers_ARADDR(8 downto 0);
  M_AXI_arvalid <= auto_cc_to_m02_couplers_ARVALID;
  M_AXI_awaddr(8 downto 0) <= auto_cc_to_m02_couplers_AWADDR(8 downto 0);
  M_AXI_awvalid <= auto_cc_to_m02_couplers_AWVALID;
  M_AXI_bready <= auto_cc_to_m02_couplers_BREADY;
  M_AXI_rready <= auto_cc_to_m02_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_cc_to_m02_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_cc_to_m02_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_cc_to_m02_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m02_couplers_to_auto_cc_ARREADY;
  S_AXI_awready <= m02_couplers_to_auto_cc_AWREADY;
  S_AXI_bresp(1 downto 0) <= m02_couplers_to_auto_cc_BRESP(1 downto 0);
  S_AXI_bvalid <= m02_couplers_to_auto_cc_BVALID;
  S_AXI_rdata(31 downto 0) <= m02_couplers_to_auto_cc_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m02_couplers_to_auto_cc_RRESP(1 downto 0);
  S_AXI_rvalid <= m02_couplers_to_auto_cc_RVALID;
  S_AXI_wready <= m02_couplers_to_auto_cc_WREADY;
  auto_cc_to_m02_couplers_ARREADY <= M_AXI_arready;
  auto_cc_to_m02_couplers_AWREADY <= M_AXI_awready;
  auto_cc_to_m02_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_cc_to_m02_couplers_BVALID <= M_AXI_bvalid;
  auto_cc_to_m02_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_cc_to_m02_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_cc_to_m02_couplers_RVALID <= M_AXI_rvalid;
  auto_cc_to_m02_couplers_WREADY <= M_AXI_wready;
  m02_couplers_to_auto_cc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m02_couplers_to_auto_cc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m02_couplers_to_auto_cc_ARVALID <= S_AXI_arvalid;
  m02_couplers_to_auto_cc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m02_couplers_to_auto_cc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m02_couplers_to_auto_cc_AWVALID <= S_AXI_awvalid;
  m02_couplers_to_auto_cc_BREADY <= S_AXI_bready;
  m02_couplers_to_auto_cc_RREADY <= S_AXI_rready;
  m02_couplers_to_auto_cc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m02_couplers_to_auto_cc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m02_couplers_to_auto_cc_WVALID <= S_AXI_wvalid;
auto_cc: component zynq_soc_auto_cc_0
     port map (
      m_axi_aclk => M_ACLK_1,
      m_axi_araddr(8 downto 0) => auto_cc_to_m02_couplers_ARADDR(8 downto 0),
      m_axi_aresetn => M_ARESETN_1,
      m_axi_arprot(2 downto 0) => NLW_auto_cc_m_axi_arprot_UNCONNECTED(2 downto 0),
      m_axi_arready => auto_cc_to_m02_couplers_ARREADY,
      m_axi_arvalid => auto_cc_to_m02_couplers_ARVALID,
      m_axi_awaddr(8 downto 0) => auto_cc_to_m02_couplers_AWADDR(8 downto 0),
      m_axi_awprot(2 downto 0) => NLW_auto_cc_m_axi_awprot_UNCONNECTED(2 downto 0),
      m_axi_awready => auto_cc_to_m02_couplers_AWREADY,
      m_axi_awvalid => auto_cc_to_m02_couplers_AWVALID,
      m_axi_bready => auto_cc_to_m02_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_cc_to_m02_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_cc_to_m02_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_cc_to_m02_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_cc_to_m02_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_cc_to_m02_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_cc_to_m02_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_cc_to_m02_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_cc_to_m02_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_cc_to_m02_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_cc_to_m02_couplers_WVALID,
      s_axi_aclk => S_ACLK_1,
      s_axi_araddr(8 downto 0) => m02_couplers_to_auto_cc_ARADDR(8 downto 0),
      s_axi_aresetn => S_ARESETN_1,
      s_axi_arprot(2 downto 0) => m02_couplers_to_auto_cc_ARPROT(2 downto 0),
      s_axi_arready => m02_couplers_to_auto_cc_ARREADY,
      s_axi_arvalid => m02_couplers_to_auto_cc_ARVALID,
      s_axi_awaddr(8 downto 0) => m02_couplers_to_auto_cc_AWADDR(8 downto 0),
      s_axi_awprot(2 downto 0) => m02_couplers_to_auto_cc_AWPROT(2 downto 0),
      s_axi_awready => m02_couplers_to_auto_cc_AWREADY,
      s_axi_awvalid => m02_couplers_to_auto_cc_AWVALID,
      s_axi_bready => m02_couplers_to_auto_cc_BREADY,
      s_axi_bresp(1 downto 0) => m02_couplers_to_auto_cc_BRESP(1 downto 0),
      s_axi_bvalid => m02_couplers_to_auto_cc_BVALID,
      s_axi_rdata(31 downto 0) => m02_couplers_to_auto_cc_RDATA(31 downto 0),
      s_axi_rready => m02_couplers_to_auto_cc_RREADY,
      s_axi_rresp(1 downto 0) => m02_couplers_to_auto_cc_RRESP(1 downto 0),
      s_axi_rvalid => m02_couplers_to_auto_cc_RVALID,
      s_axi_wdata(31 downto 0) => m02_couplers_to_auto_cc_WDATA(31 downto 0),
      s_axi_wready => m02_couplers_to_auto_cc_WREADY,
      s_axi_wstrb(3 downto 0) => m02_couplers_to_auto_cc_WSTRB(3 downto 0),
      s_axi_wvalid => m02_couplers_to_auto_cc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m03_couplers_imp_1QIO7VG is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m03_couplers_imp_1QIO7VG;

architecture STRUCTURE of m03_couplers_imp_1QIO7VG is
  component zynq_soc_auto_cc_1 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_aclk : in STD_LOGIC;
    m_axi_aresetn : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component zynq_soc_auto_cc_1;
  signal M_ACLK_1 : STD_LOGIC;
  signal M_ARESETN_1 : STD_LOGIC;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_cc_to_m03_couplers_ARADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal auto_cc_to_m03_couplers_ARREADY : STD_LOGIC;
  signal auto_cc_to_m03_couplers_ARVALID : STD_LOGIC;
  signal auto_cc_to_m03_couplers_AWADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal auto_cc_to_m03_couplers_AWREADY : STD_LOGIC;
  signal auto_cc_to_m03_couplers_AWVALID : STD_LOGIC;
  signal auto_cc_to_m03_couplers_BREADY : STD_LOGIC;
  signal auto_cc_to_m03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m03_couplers_BVALID : STD_LOGIC;
  signal auto_cc_to_m03_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m03_couplers_RREADY : STD_LOGIC;
  signal auto_cc_to_m03_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_cc_to_m03_couplers_RVALID : STD_LOGIC;
  signal auto_cc_to_m03_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_cc_to_m03_couplers_WREADY : STD_LOGIC;
  signal auto_cc_to_m03_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_cc_to_m03_couplers_WVALID : STD_LOGIC;
  signal m03_couplers_to_auto_cc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_auto_cc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m03_couplers_to_auto_cc_ARREADY : STD_LOGIC;
  signal m03_couplers_to_auto_cc_ARVALID : STD_LOGIC;
  signal m03_couplers_to_auto_cc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_auto_cc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m03_couplers_to_auto_cc_AWREADY : STD_LOGIC;
  signal m03_couplers_to_auto_cc_AWVALID : STD_LOGIC;
  signal m03_couplers_to_auto_cc_BREADY : STD_LOGIC;
  signal m03_couplers_to_auto_cc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_auto_cc_BVALID : STD_LOGIC;
  signal m03_couplers_to_auto_cc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_auto_cc_RREADY : STD_LOGIC;
  signal m03_couplers_to_auto_cc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_auto_cc_RVALID : STD_LOGIC;
  signal m03_couplers_to_auto_cc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_auto_cc_WREADY : STD_LOGIC;
  signal m03_couplers_to_auto_cc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_auto_cc_WVALID : STD_LOGIC;
  signal NLW_auto_cc_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_auto_cc_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
begin
  M_ACLK_1 <= M_ACLK;
  M_ARESETN_1 <= M_ARESETN;
  M_AXI_araddr(8 downto 0) <= auto_cc_to_m03_couplers_ARADDR(8 downto 0);
  M_AXI_arvalid <= auto_cc_to_m03_couplers_ARVALID;
  M_AXI_awaddr(8 downto 0) <= auto_cc_to_m03_couplers_AWADDR(8 downto 0);
  M_AXI_awvalid <= auto_cc_to_m03_couplers_AWVALID;
  M_AXI_bready <= auto_cc_to_m03_couplers_BREADY;
  M_AXI_rready <= auto_cc_to_m03_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_cc_to_m03_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_cc_to_m03_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_cc_to_m03_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= m03_couplers_to_auto_cc_ARREADY;
  S_AXI_awready <= m03_couplers_to_auto_cc_AWREADY;
  S_AXI_bresp(1 downto 0) <= m03_couplers_to_auto_cc_BRESP(1 downto 0);
  S_AXI_bvalid <= m03_couplers_to_auto_cc_BVALID;
  S_AXI_rdata(31 downto 0) <= m03_couplers_to_auto_cc_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m03_couplers_to_auto_cc_RRESP(1 downto 0);
  S_AXI_rvalid <= m03_couplers_to_auto_cc_RVALID;
  S_AXI_wready <= m03_couplers_to_auto_cc_WREADY;
  auto_cc_to_m03_couplers_ARREADY <= M_AXI_arready;
  auto_cc_to_m03_couplers_AWREADY <= M_AXI_awready;
  auto_cc_to_m03_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_cc_to_m03_couplers_BVALID <= M_AXI_bvalid;
  auto_cc_to_m03_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_cc_to_m03_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_cc_to_m03_couplers_RVALID <= M_AXI_rvalid;
  auto_cc_to_m03_couplers_WREADY <= M_AXI_wready;
  m03_couplers_to_auto_cc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m03_couplers_to_auto_cc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m03_couplers_to_auto_cc_ARVALID <= S_AXI_arvalid;
  m03_couplers_to_auto_cc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m03_couplers_to_auto_cc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m03_couplers_to_auto_cc_AWVALID <= S_AXI_awvalid;
  m03_couplers_to_auto_cc_BREADY <= S_AXI_bready;
  m03_couplers_to_auto_cc_RREADY <= S_AXI_rready;
  m03_couplers_to_auto_cc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m03_couplers_to_auto_cc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m03_couplers_to_auto_cc_WVALID <= S_AXI_wvalid;
auto_cc: component zynq_soc_auto_cc_1
     port map (
      m_axi_aclk => M_ACLK_1,
      m_axi_araddr(8 downto 0) => auto_cc_to_m03_couplers_ARADDR(8 downto 0),
      m_axi_aresetn => M_ARESETN_1,
      m_axi_arprot(2 downto 0) => NLW_auto_cc_m_axi_arprot_UNCONNECTED(2 downto 0),
      m_axi_arready => auto_cc_to_m03_couplers_ARREADY,
      m_axi_arvalid => auto_cc_to_m03_couplers_ARVALID,
      m_axi_awaddr(8 downto 0) => auto_cc_to_m03_couplers_AWADDR(8 downto 0),
      m_axi_awprot(2 downto 0) => NLW_auto_cc_m_axi_awprot_UNCONNECTED(2 downto 0),
      m_axi_awready => auto_cc_to_m03_couplers_AWREADY,
      m_axi_awvalid => auto_cc_to_m03_couplers_AWVALID,
      m_axi_bready => auto_cc_to_m03_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_cc_to_m03_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_cc_to_m03_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_cc_to_m03_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_cc_to_m03_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_cc_to_m03_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_cc_to_m03_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_cc_to_m03_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_cc_to_m03_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_cc_to_m03_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_cc_to_m03_couplers_WVALID,
      s_axi_aclk => S_ACLK_1,
      s_axi_araddr(8 downto 0) => m03_couplers_to_auto_cc_ARADDR(8 downto 0),
      s_axi_aresetn => S_ARESETN_1,
      s_axi_arprot(2 downto 0) => m03_couplers_to_auto_cc_ARPROT(2 downto 0),
      s_axi_arready => m03_couplers_to_auto_cc_ARREADY,
      s_axi_arvalid => m03_couplers_to_auto_cc_ARVALID,
      s_axi_awaddr(8 downto 0) => m03_couplers_to_auto_cc_AWADDR(8 downto 0),
      s_axi_awprot(2 downto 0) => m03_couplers_to_auto_cc_AWPROT(2 downto 0),
      s_axi_awready => m03_couplers_to_auto_cc_AWREADY,
      s_axi_awvalid => m03_couplers_to_auto_cc_AWVALID,
      s_axi_bready => m03_couplers_to_auto_cc_BREADY,
      s_axi_bresp(1 downto 0) => m03_couplers_to_auto_cc_BRESP(1 downto 0),
      s_axi_bvalid => m03_couplers_to_auto_cc_BVALID,
      s_axi_rdata(31 downto 0) => m03_couplers_to_auto_cc_RDATA(31 downto 0),
      s_axi_rready => m03_couplers_to_auto_cc_RREADY,
      s_axi_rresp(1 downto 0) => m03_couplers_to_auto_cc_RRESP(1 downto 0),
      s_axi_rvalid => m03_couplers_to_auto_cc_RVALID,
      s_axi_wdata(31 downto 0) => m03_couplers_to_auto_cc_WDATA(31 downto 0),
      s_axi_wready => m03_couplers_to_auto_cc_WREADY,
      s_axi_wstrb(3 downto 0) => m03_couplers_to_auto_cc_WSTRB(3 downto 0),
      s_axi_wvalid => m03_couplers_to_auto_cc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m04_couplers_imp_4ULRS is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m04_couplers_imp_4ULRS;

architecture STRUCTURE of m04_couplers_imp_4ULRS is
  signal m04_couplers_to_m04_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_m04_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m04_couplers_to_m04_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_m04_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m04_couplers_to_m04_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_m04_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_m04_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_m04_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_m04_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_m04_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_m04_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(31 downto 0) <= m04_couplers_to_m04_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= m04_couplers_to_m04_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid(0) <= m04_couplers_to_m04_couplers_ARVALID(0);
  M_AXI_awaddr(31 downto 0) <= m04_couplers_to_m04_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= m04_couplers_to_m04_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid(0) <= m04_couplers_to_m04_couplers_AWVALID(0);
  M_AXI_bready(0) <= m04_couplers_to_m04_couplers_BREADY(0);
  M_AXI_rready(0) <= m04_couplers_to_m04_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m04_couplers_to_m04_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m04_couplers_to_m04_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= m04_couplers_to_m04_couplers_WVALID(0);
  S_AXI_arready(0) <= m04_couplers_to_m04_couplers_ARREADY(0);
  S_AXI_awready(0) <= m04_couplers_to_m04_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= m04_couplers_to_m04_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m04_couplers_to_m04_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m04_couplers_to_m04_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m04_couplers_to_m04_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m04_couplers_to_m04_couplers_RVALID(0);
  S_AXI_wready(0) <= m04_couplers_to_m04_couplers_WREADY(0);
  m04_couplers_to_m04_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m04_couplers_to_m04_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m04_couplers_to_m04_couplers_ARREADY(0) <= M_AXI_arready(0);
  m04_couplers_to_m04_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m04_couplers_to_m04_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m04_couplers_to_m04_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m04_couplers_to_m04_couplers_AWREADY(0) <= M_AXI_awready(0);
  m04_couplers_to_m04_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m04_couplers_to_m04_couplers_BREADY(0) <= S_AXI_bready(0);
  m04_couplers_to_m04_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m04_couplers_to_m04_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m04_couplers_to_m04_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m04_couplers_to_m04_couplers_RREADY(0) <= S_AXI_rready(0);
  m04_couplers_to_m04_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m04_couplers_to_m04_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m04_couplers_to_m04_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m04_couplers_to_m04_couplers_WREADY(0) <= M_AXI_wready(0);
  m04_couplers_to_m04_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m04_couplers_to_m04_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m05_couplers_imp_1UD4Y8P is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m05_couplers_imp_1UD4Y8P;

architecture STRUCTURE of m05_couplers_imp_1UD4Y8P is
  signal m05_couplers_to_m05_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_ARREADY : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_ARVALID : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_AWREADY : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_AWVALID : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_BREADY : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_m05_couplers_BVALID : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_RREADY : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_m05_couplers_RVALID : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_WREADY : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_m05_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m05_couplers_to_m05_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid <= m05_couplers_to_m05_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m05_couplers_to_m05_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid <= m05_couplers_to_m05_couplers_AWVALID;
  M_AXI_bready <= m05_couplers_to_m05_couplers_BREADY;
  M_AXI_rready <= m05_couplers_to_m05_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m05_couplers_to_m05_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m05_couplers_to_m05_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m05_couplers_to_m05_couplers_WVALID;
  S_AXI_arready <= m05_couplers_to_m05_couplers_ARREADY;
  S_AXI_awready <= m05_couplers_to_m05_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m05_couplers_to_m05_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m05_couplers_to_m05_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m05_couplers_to_m05_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m05_couplers_to_m05_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m05_couplers_to_m05_couplers_RVALID;
  S_AXI_wready <= m05_couplers_to_m05_couplers_WREADY;
  m05_couplers_to_m05_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m05_couplers_to_m05_couplers_ARREADY <= M_AXI_arready;
  m05_couplers_to_m05_couplers_ARVALID <= S_AXI_arvalid;
  m05_couplers_to_m05_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m05_couplers_to_m05_couplers_AWREADY <= M_AXI_awready;
  m05_couplers_to_m05_couplers_AWVALID <= S_AXI_awvalid;
  m05_couplers_to_m05_couplers_BREADY <= S_AXI_bready;
  m05_couplers_to_m05_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m05_couplers_to_m05_couplers_BVALID <= M_AXI_bvalid;
  m05_couplers_to_m05_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m05_couplers_to_m05_couplers_RREADY <= S_AXI_rready;
  m05_couplers_to_m05_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m05_couplers_to_m05_couplers_RVALID <= M_AXI_rvalid;
  m05_couplers_to_m05_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m05_couplers_to_m05_couplers_WREADY <= M_AXI_wready;
  m05_couplers_to_m05_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m05_couplers_to_m05_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m06_couplers_imp_1KI5VF is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m06_couplers_imp_1KI5VF;

architecture STRUCTURE of m06_couplers_imp_1KI5VF is
  signal m06_couplers_to_m06_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_m06_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_m06_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_m06_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m06_couplers_to_m06_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(31 downto 0) <= m06_couplers_to_m06_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid(0) <= m06_couplers_to_m06_couplers_ARVALID(0);
  M_AXI_awaddr(31 downto 0) <= m06_couplers_to_m06_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid(0) <= m06_couplers_to_m06_couplers_AWVALID(0);
  M_AXI_bready(0) <= m06_couplers_to_m06_couplers_BREADY(0);
  M_AXI_rready(0) <= m06_couplers_to_m06_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m06_couplers_to_m06_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m06_couplers_to_m06_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= m06_couplers_to_m06_couplers_WVALID(0);
  S_AXI_arready(0) <= m06_couplers_to_m06_couplers_ARREADY(0);
  S_AXI_awready(0) <= m06_couplers_to_m06_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= m06_couplers_to_m06_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m06_couplers_to_m06_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m06_couplers_to_m06_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m06_couplers_to_m06_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m06_couplers_to_m06_couplers_RVALID(0);
  S_AXI_wready(0) <= m06_couplers_to_m06_couplers_WREADY(0);
  m06_couplers_to_m06_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m06_couplers_to_m06_couplers_ARREADY(0) <= M_AXI_arready(0);
  m06_couplers_to_m06_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m06_couplers_to_m06_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m06_couplers_to_m06_couplers_AWREADY(0) <= M_AXI_awready(0);
  m06_couplers_to_m06_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m06_couplers_to_m06_couplers_BREADY(0) <= S_AXI_bready(0);
  m06_couplers_to_m06_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m06_couplers_to_m06_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m06_couplers_to_m06_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m06_couplers_to_m06_couplers_RREADY(0) <= S_AXI_rready(0);
  m06_couplers_to_m06_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m06_couplers_to_m06_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m06_couplers_to_m06_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m06_couplers_to_m06_couplers_WREADY(0) <= M_AXI_wready(0);
  m06_couplers_to_m06_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m06_couplers_to_m06_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m07_couplers_imp_1T74Y56 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m07_couplers_imp_1T74Y56;

architecture STRUCTURE of m07_couplers_imp_1T74Y56 is
  signal m07_couplers_to_m07_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_m07_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_m07_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_m07_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_m07_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_m07_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_m07_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_m07_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m07_couplers_to_m07_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(31 downto 0) <= m07_couplers_to_m07_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid(0) <= m07_couplers_to_m07_couplers_ARVALID(0);
  M_AXI_awaddr(31 downto 0) <= m07_couplers_to_m07_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid(0) <= m07_couplers_to_m07_couplers_AWVALID(0);
  M_AXI_bready(0) <= m07_couplers_to_m07_couplers_BREADY(0);
  M_AXI_rready(0) <= m07_couplers_to_m07_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m07_couplers_to_m07_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m07_couplers_to_m07_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= m07_couplers_to_m07_couplers_WVALID(0);
  S_AXI_arready(0) <= m07_couplers_to_m07_couplers_ARREADY(0);
  S_AXI_awready(0) <= m07_couplers_to_m07_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= m07_couplers_to_m07_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m07_couplers_to_m07_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m07_couplers_to_m07_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m07_couplers_to_m07_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m07_couplers_to_m07_couplers_RVALID(0);
  S_AXI_wready(0) <= m07_couplers_to_m07_couplers_WREADY(0);
  m07_couplers_to_m07_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m07_couplers_to_m07_couplers_ARREADY(0) <= M_AXI_arready(0);
  m07_couplers_to_m07_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m07_couplers_to_m07_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m07_couplers_to_m07_couplers_AWREADY(0) <= M_AXI_awready(0);
  m07_couplers_to_m07_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m07_couplers_to_m07_couplers_BREADY(0) <= S_AXI_bready(0);
  m07_couplers_to_m07_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m07_couplers_to_m07_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m07_couplers_to_m07_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m07_couplers_to_m07_couplers_RREADY(0) <= S_AXI_rready(0);
  m07_couplers_to_m07_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m07_couplers_to_m07_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m07_couplers_to_m07_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m07_couplers_to_m07_couplers_WREADY(0) <= M_AXI_wready(0);
  m07_couplers_to_m07_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m07_couplers_to_m07_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s00_couplers_imp_1VEF3SS is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end s00_couplers_imp_1VEF3SS;

architecture STRUCTURE of s00_couplers_imp_1VEF3SS is
  component zynq_soc_auto_pc_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component zynq_soc_auto_pc_0;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_pc_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s00_couplers_ARREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_ARVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s00_couplers_AWREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_AWVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_BREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s00_couplers_BVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_RREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s00_couplers_RVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_WREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_s00_couplers_WVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_ARREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_ARVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_AWREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_AWVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_BREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_BVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_RLAST : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_RVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_WID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_WLAST : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= auto_pc_to_s00_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_pc_to_s00_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= auto_pc_to_s00_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_pc_to_s00_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_pc_to_s00_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= auto_pc_to_s00_couplers_AWVALID;
  M_AXI_bready <= auto_pc_to_s00_couplers_BREADY;
  M_AXI_rready <= auto_pc_to_s00_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_pc_to_s00_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_pc_to_s00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_pc_to_s00_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= s00_couplers_to_auto_pc_ARREADY;
  S_AXI_awready <= s00_couplers_to_auto_pc_AWREADY;
  S_AXI_bid(11 downto 0) <= s00_couplers_to_auto_pc_BID(11 downto 0);
  S_AXI_bresp(1 downto 0) <= s00_couplers_to_auto_pc_BRESP(1 downto 0);
  S_AXI_bvalid <= s00_couplers_to_auto_pc_BVALID;
  S_AXI_rdata(31 downto 0) <= s00_couplers_to_auto_pc_RDATA(31 downto 0);
  S_AXI_rid(11 downto 0) <= s00_couplers_to_auto_pc_RID(11 downto 0);
  S_AXI_rlast <= s00_couplers_to_auto_pc_RLAST;
  S_AXI_rresp(1 downto 0) <= s00_couplers_to_auto_pc_RRESP(1 downto 0);
  S_AXI_rvalid <= s00_couplers_to_auto_pc_RVALID;
  S_AXI_wready <= s00_couplers_to_auto_pc_WREADY;
  auto_pc_to_s00_couplers_ARREADY <= M_AXI_arready;
  auto_pc_to_s00_couplers_AWREADY <= M_AXI_awready;
  auto_pc_to_s00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_pc_to_s00_couplers_BVALID <= M_AXI_bvalid;
  auto_pc_to_s00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_pc_to_s00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_pc_to_s00_couplers_RVALID <= M_AXI_rvalid;
  auto_pc_to_s00_couplers_WREADY <= M_AXI_wready;
  s00_couplers_to_auto_pc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  s00_couplers_to_auto_pc_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  s00_couplers_to_auto_pc_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  s00_couplers_to_auto_pc_ARID(11 downto 0) <= S_AXI_arid(11 downto 0);
  s00_couplers_to_auto_pc_ARLEN(3 downto 0) <= S_AXI_arlen(3 downto 0);
  s00_couplers_to_auto_pc_ARLOCK(1 downto 0) <= S_AXI_arlock(1 downto 0);
  s00_couplers_to_auto_pc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  s00_couplers_to_auto_pc_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  s00_couplers_to_auto_pc_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  s00_couplers_to_auto_pc_ARVALID <= S_AXI_arvalid;
  s00_couplers_to_auto_pc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  s00_couplers_to_auto_pc_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  s00_couplers_to_auto_pc_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  s00_couplers_to_auto_pc_AWID(11 downto 0) <= S_AXI_awid(11 downto 0);
  s00_couplers_to_auto_pc_AWLEN(3 downto 0) <= S_AXI_awlen(3 downto 0);
  s00_couplers_to_auto_pc_AWLOCK(1 downto 0) <= S_AXI_awlock(1 downto 0);
  s00_couplers_to_auto_pc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  s00_couplers_to_auto_pc_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  s00_couplers_to_auto_pc_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  s00_couplers_to_auto_pc_AWVALID <= S_AXI_awvalid;
  s00_couplers_to_auto_pc_BREADY <= S_AXI_bready;
  s00_couplers_to_auto_pc_RREADY <= S_AXI_rready;
  s00_couplers_to_auto_pc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  s00_couplers_to_auto_pc_WID(11 downto 0) <= S_AXI_wid(11 downto 0);
  s00_couplers_to_auto_pc_WLAST <= S_AXI_wlast;
  s00_couplers_to_auto_pc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  s00_couplers_to_auto_pc_WVALID <= S_AXI_wvalid;
auto_pc: component zynq_soc_auto_pc_0
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1,
      m_axi_araddr(31 downto 0) => auto_pc_to_s00_couplers_ARADDR(31 downto 0),
      m_axi_arprot(2 downto 0) => auto_pc_to_s00_couplers_ARPROT(2 downto 0),
      m_axi_arready => auto_pc_to_s00_couplers_ARREADY,
      m_axi_arvalid => auto_pc_to_s00_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_pc_to_s00_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => auto_pc_to_s00_couplers_AWPROT(2 downto 0),
      m_axi_awready => auto_pc_to_s00_couplers_AWREADY,
      m_axi_awvalid => auto_pc_to_s00_couplers_AWVALID,
      m_axi_bready => auto_pc_to_s00_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_s00_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_s00_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_pc_to_s00_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_pc_to_s00_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_pc_to_s00_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_pc_to_s00_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_pc_to_s00_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_pc_to_s00_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_pc_to_s00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_pc_to_s00_couplers_WVALID,
      s_axi_araddr(31 downto 0) => s00_couplers_to_auto_pc_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => s00_couplers_to_auto_pc_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => s00_couplers_to_auto_pc_ARCACHE(3 downto 0),
      s_axi_arid(11 downto 0) => s00_couplers_to_auto_pc_ARID(11 downto 0),
      s_axi_arlen(3 downto 0) => s00_couplers_to_auto_pc_ARLEN(3 downto 0),
      s_axi_arlock(1 downto 0) => s00_couplers_to_auto_pc_ARLOCK(1 downto 0),
      s_axi_arprot(2 downto 0) => s00_couplers_to_auto_pc_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => s00_couplers_to_auto_pc_ARQOS(3 downto 0),
      s_axi_arready => s00_couplers_to_auto_pc_ARREADY,
      s_axi_arsize(2 downto 0) => s00_couplers_to_auto_pc_ARSIZE(2 downto 0),
      s_axi_arvalid => s00_couplers_to_auto_pc_ARVALID,
      s_axi_awaddr(31 downto 0) => s00_couplers_to_auto_pc_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => s00_couplers_to_auto_pc_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => s00_couplers_to_auto_pc_AWCACHE(3 downto 0),
      s_axi_awid(11 downto 0) => s00_couplers_to_auto_pc_AWID(11 downto 0),
      s_axi_awlen(3 downto 0) => s00_couplers_to_auto_pc_AWLEN(3 downto 0),
      s_axi_awlock(1 downto 0) => s00_couplers_to_auto_pc_AWLOCK(1 downto 0),
      s_axi_awprot(2 downto 0) => s00_couplers_to_auto_pc_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => s00_couplers_to_auto_pc_AWQOS(3 downto 0),
      s_axi_awready => s00_couplers_to_auto_pc_AWREADY,
      s_axi_awsize(2 downto 0) => s00_couplers_to_auto_pc_AWSIZE(2 downto 0),
      s_axi_awvalid => s00_couplers_to_auto_pc_AWVALID,
      s_axi_bid(11 downto 0) => s00_couplers_to_auto_pc_BID(11 downto 0),
      s_axi_bready => s00_couplers_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => s00_couplers_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => s00_couplers_to_auto_pc_BVALID,
      s_axi_rdata(31 downto 0) => s00_couplers_to_auto_pc_RDATA(31 downto 0),
      s_axi_rid(11 downto 0) => s00_couplers_to_auto_pc_RID(11 downto 0),
      s_axi_rlast => s00_couplers_to_auto_pc_RLAST,
      s_axi_rready => s00_couplers_to_auto_pc_RREADY,
      s_axi_rresp(1 downto 0) => s00_couplers_to_auto_pc_RRESP(1 downto 0),
      s_axi_rvalid => s00_couplers_to_auto_pc_RVALID,
      s_axi_wdata(31 downto 0) => s00_couplers_to_auto_pc_WDATA(31 downto 0),
      s_axi_wid(11 downto 0) => s00_couplers_to_auto_pc_WID(11 downto 0),
      s_axi_wlast => s00_couplers_to_auto_pc_WLAST,
      s_axi_wready => s00_couplers_to_auto_pc_WREADY,
      s_axi_wstrb(3 downto 0) => s00_couplers_to_auto_pc_WSTRB(3 downto 0),
      s_axi_wvalid => s00_couplers_to_auto_pc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s00_couplers_imp_KFERMP is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXI_rlast : in STD_LOGIC;
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC
  );
end s00_couplers_imp_KFERMP;

architecture STRUCTURE of s00_couplers_imp_KFERMP is
  signal s00_couplers_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_s00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_s00_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_s00_couplers_ARREADY : STD_LOGIC;
  signal s00_couplers_to_s00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_s00_couplers_ARVALID : STD_LOGIC;
  signal s00_couplers_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s00_couplers_to_s00_couplers_RLAST : STD_LOGIC;
  signal s00_couplers_to_s00_couplers_RREADY : STD_LOGIC;
  signal s00_couplers_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_s00_couplers_RVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= s00_couplers_to_s00_couplers_ARADDR(31 downto 0);
  M_AXI_arburst(1 downto 0) <= s00_couplers_to_s00_couplers_ARBURST(1 downto 0);
  M_AXI_arcache(3 downto 0) <= s00_couplers_to_s00_couplers_ARCACHE(3 downto 0);
  M_AXI_arlen(7 downto 0) <= s00_couplers_to_s00_couplers_ARLEN(7 downto 0);
  M_AXI_arprot(2 downto 0) <= s00_couplers_to_s00_couplers_ARPROT(2 downto 0);
  M_AXI_arsize(2 downto 0) <= s00_couplers_to_s00_couplers_ARSIZE(2 downto 0);
  M_AXI_arvalid <= s00_couplers_to_s00_couplers_ARVALID;
  M_AXI_rready <= s00_couplers_to_s00_couplers_RREADY;
  S_AXI_arready <= s00_couplers_to_s00_couplers_ARREADY;
  S_AXI_rdata(63 downto 0) <= s00_couplers_to_s00_couplers_RDATA(63 downto 0);
  S_AXI_rlast <= s00_couplers_to_s00_couplers_RLAST;
  S_AXI_rresp(1 downto 0) <= s00_couplers_to_s00_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= s00_couplers_to_s00_couplers_RVALID;
  s00_couplers_to_s00_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  s00_couplers_to_s00_couplers_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  s00_couplers_to_s00_couplers_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  s00_couplers_to_s00_couplers_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  s00_couplers_to_s00_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  s00_couplers_to_s00_couplers_ARREADY <= M_AXI_arready;
  s00_couplers_to_s00_couplers_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  s00_couplers_to_s00_couplers_ARVALID <= S_AXI_arvalid;
  s00_couplers_to_s00_couplers_RDATA(63 downto 0) <= M_AXI_rdata(63 downto 0);
  s00_couplers_to_s00_couplers_RLAST <= M_AXI_rlast;
  s00_couplers_to_s00_couplers_RREADY <= S_AXI_rready;
  s00_couplers_to_s00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  s00_couplers_to_s00_couplers_RVALID <= M_AXI_rvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s01_couplers_imp_1AA56YO is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXI_wlast : out STD_LOGIC;
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end s01_couplers_imp_1AA56YO;

architecture STRUCTURE of s01_couplers_imp_1AA56YO is
  signal s01_couplers_to_s01_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_s01_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s01_couplers_to_s01_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s01_couplers_to_s01_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s01_couplers_to_s01_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s01_couplers_to_s01_couplers_AWREADY : STD_LOGIC;
  signal s01_couplers_to_s01_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s01_couplers_to_s01_couplers_AWVALID : STD_LOGIC;
  signal s01_couplers_to_s01_couplers_BREADY : STD_LOGIC;
  signal s01_couplers_to_s01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s01_couplers_to_s01_couplers_BVALID : STD_LOGIC;
  signal s01_couplers_to_s01_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s01_couplers_to_s01_couplers_WLAST : STD_LOGIC;
  signal s01_couplers_to_s01_couplers_WREADY : STD_LOGIC;
  signal s01_couplers_to_s01_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s01_couplers_to_s01_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_awaddr(31 downto 0) <= s01_couplers_to_s01_couplers_AWADDR(31 downto 0);
  M_AXI_awburst(1 downto 0) <= s01_couplers_to_s01_couplers_AWBURST(1 downto 0);
  M_AXI_awcache(3 downto 0) <= s01_couplers_to_s01_couplers_AWCACHE(3 downto 0);
  M_AXI_awlen(7 downto 0) <= s01_couplers_to_s01_couplers_AWLEN(7 downto 0);
  M_AXI_awprot(2 downto 0) <= s01_couplers_to_s01_couplers_AWPROT(2 downto 0);
  M_AXI_awsize(2 downto 0) <= s01_couplers_to_s01_couplers_AWSIZE(2 downto 0);
  M_AXI_awvalid <= s01_couplers_to_s01_couplers_AWVALID;
  M_AXI_bready <= s01_couplers_to_s01_couplers_BREADY;
  M_AXI_wdata(63 downto 0) <= s01_couplers_to_s01_couplers_WDATA(63 downto 0);
  M_AXI_wlast <= s01_couplers_to_s01_couplers_WLAST;
  M_AXI_wstrb(7 downto 0) <= s01_couplers_to_s01_couplers_WSTRB(7 downto 0);
  M_AXI_wvalid <= s01_couplers_to_s01_couplers_WVALID;
  S_AXI_awready <= s01_couplers_to_s01_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= s01_couplers_to_s01_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= s01_couplers_to_s01_couplers_BVALID;
  S_AXI_wready <= s01_couplers_to_s01_couplers_WREADY;
  s01_couplers_to_s01_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  s01_couplers_to_s01_couplers_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  s01_couplers_to_s01_couplers_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  s01_couplers_to_s01_couplers_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  s01_couplers_to_s01_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  s01_couplers_to_s01_couplers_AWREADY <= M_AXI_awready;
  s01_couplers_to_s01_couplers_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  s01_couplers_to_s01_couplers_AWVALID <= S_AXI_awvalid;
  s01_couplers_to_s01_couplers_BREADY <= S_AXI_bready;
  s01_couplers_to_s01_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  s01_couplers_to_s01_couplers_BVALID <= M_AXI_bvalid;
  s01_couplers_to_s01_couplers_WDATA(63 downto 0) <= S_AXI_wdata(63 downto 0);
  s01_couplers_to_s01_couplers_WLAST <= S_AXI_wlast;
  s01_couplers_to_s01_couplers_WREADY <= M_AXI_wready;
  s01_couplers_to_s01_couplers_WSTRB(7 downto 0) <= S_AXI_wstrb(7 downto 0);
  s01_couplers_to_s01_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zynq_soc_PS7_axi_periph_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    M00_ACLK : in STD_LOGIC;
    M00_ARESETN : in STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rready : out STD_LOGIC;
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_wvalid : out STD_LOGIC;
    M01_ACLK : in STD_LOGIC;
    M01_ARESETN : in STD_LOGIC;
    M01_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_arready : in STD_LOGIC;
    M01_AXI_arvalid : out STD_LOGIC;
    M01_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_awready : in STD_LOGIC;
    M01_AXI_awvalid : out STD_LOGIC;
    M01_AXI_bready : out STD_LOGIC;
    M01_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_bvalid : in STD_LOGIC;
    M01_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_rready : out STD_LOGIC;
    M01_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_rvalid : in STD_LOGIC;
    M01_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_wready : in STD_LOGIC;
    M01_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_wvalid : out STD_LOGIC;
    M02_ACLK : in STD_LOGIC;
    M02_ARESETN : in STD_LOGIC;
    M02_AXI_araddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M02_AXI_arready : in STD_LOGIC;
    M02_AXI_arvalid : out STD_LOGIC;
    M02_AXI_awaddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M02_AXI_awready : in STD_LOGIC;
    M02_AXI_awvalid : out STD_LOGIC;
    M02_AXI_bready : out STD_LOGIC;
    M02_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_bvalid : in STD_LOGIC;
    M02_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_rready : out STD_LOGIC;
    M02_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_rvalid : in STD_LOGIC;
    M02_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_wready : in STD_LOGIC;
    M02_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M02_AXI_wvalid : out STD_LOGIC;
    M03_ACLK : in STD_LOGIC;
    M03_ARESETN : in STD_LOGIC;
    M03_AXI_araddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M03_AXI_arready : in STD_LOGIC;
    M03_AXI_arvalid : out STD_LOGIC;
    M03_AXI_awaddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M03_AXI_awready : in STD_LOGIC;
    M03_AXI_awvalid : out STD_LOGIC;
    M03_AXI_bready : out STD_LOGIC;
    M03_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_bvalid : in STD_LOGIC;
    M03_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_rready : out STD_LOGIC;
    M03_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_rvalid : in STD_LOGIC;
    M03_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_wready : in STD_LOGIC;
    M03_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M03_AXI_wvalid : out STD_LOGIC;
    M04_ACLK : in STD_LOGIC;
    M04_ARESETN : in STD_LOGIC;
    M04_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M04_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M04_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M04_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M05_ACLK : in STD_LOGIC;
    M05_ARESETN : in STD_LOGIC;
    M05_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_arready : in STD_LOGIC;
    M05_AXI_arvalid : out STD_LOGIC;
    M05_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_awready : in STD_LOGIC;
    M05_AXI_awvalid : out STD_LOGIC;
    M05_AXI_bready : out STD_LOGIC;
    M05_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_bvalid : in STD_LOGIC;
    M05_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_rready : out STD_LOGIC;
    M05_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_rvalid : in STD_LOGIC;
    M05_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_wready : in STD_LOGIC;
    M05_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_wvalid : out STD_LOGIC;
    M06_ACLK : in STD_LOGIC;
    M06_ARESETN : in STD_LOGIC;
    M06_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M06_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_ACLK : in STD_LOGIC;
    M07_ARESETN : in STD_LOGIC;
    M07_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M07_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M07_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M07_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_ACLK : in STD_LOGIC;
    S00_ARESETN : in STD_LOGIC;
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awready : out STD_LOGIC;
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;
    S00_AXI_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rvalid : out STD_LOGIC;
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_wlast : in STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wvalid : in STD_LOGIC
  );
end zynq_soc_PS7_axi_periph_0;

architecture STRUCTURE of zynq_soc_PS7_axi_periph_0 is
  component zynq_soc_xbar_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_awvalid : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awready : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wvalid : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wready : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_bvalid : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_bready : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_arvalid : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arready : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_rvalid : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_rready : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component zynq_soc_xbar_0;
  signal M00_ACLK_1 : STD_LOGIC;
  signal M00_ARESETN_1 : STD_LOGIC;
  signal M01_ACLK_1 : STD_LOGIC;
  signal M01_ARESETN_1 : STD_LOGIC;
  signal M02_ACLK_1 : STD_LOGIC;
  signal M02_ARESETN_1 : STD_LOGIC;
  signal M03_ACLK_1 : STD_LOGIC;
  signal M03_ARESETN_1 : STD_LOGIC;
  signal M04_ACLK_1 : STD_LOGIC;
  signal M04_ARESETN_1 : STD_LOGIC;
  signal M05_ACLK_1 : STD_LOGIC;
  signal M05_ARESETN_1 : STD_LOGIC;
  signal M06_ACLK_1 : STD_LOGIC;
  signal M06_ARESETN_1 : STD_LOGIC;
  signal M07_ACLK_1 : STD_LOGIC;
  signal M07_ARESETN_1 : STD_LOGIC;
  signal PS7_axi_periph_ACLK_net : STD_LOGIC;
  signal PS7_axi_periph_ARESETN_net : STD_LOGIC;
  signal PS7_axi_periph_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_ARREADY : STD_LOGIC;
  signal PS7_axi_periph_to_s00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_ARVALID : STD_LOGIC;
  signal PS7_axi_periph_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_AWREADY : STD_LOGIC;
  signal PS7_axi_periph_to_s00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_AWVALID : STD_LOGIC;
  signal PS7_axi_periph_to_s00_couplers_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_BREADY : STD_LOGIC;
  signal PS7_axi_periph_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_BVALID : STD_LOGIC;
  signal PS7_axi_periph_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_RLAST : STD_LOGIC;
  signal PS7_axi_periph_to_s00_couplers_RREADY : STD_LOGIC;
  signal PS7_axi_periph_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_RVALID : STD_LOGIC;
  signal PS7_axi_periph_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_WID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_WLAST : STD_LOGIC;
  signal PS7_axi_periph_to_s00_couplers_WREADY : STD_LOGIC;
  signal PS7_axi_periph_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS7_axi_periph_to_s00_couplers_WVALID : STD_LOGIC;
  signal S00_ACLK_1 : STD_LOGIC;
  signal S00_ARESETN_1 : STD_LOGIC;
  signal m00_couplers_to_PS7_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_PS7_axi_periph_ARREADY : STD_LOGIC;
  signal m00_couplers_to_PS7_axi_periph_ARVALID : STD_LOGIC;
  signal m00_couplers_to_PS7_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_PS7_axi_periph_AWREADY : STD_LOGIC;
  signal m00_couplers_to_PS7_axi_periph_AWVALID : STD_LOGIC;
  signal m00_couplers_to_PS7_axi_periph_BREADY : STD_LOGIC;
  signal m00_couplers_to_PS7_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_PS7_axi_periph_BVALID : STD_LOGIC;
  signal m00_couplers_to_PS7_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_PS7_axi_periph_RREADY : STD_LOGIC;
  signal m00_couplers_to_PS7_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_PS7_axi_periph_RVALID : STD_LOGIC;
  signal m00_couplers_to_PS7_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_PS7_axi_periph_WREADY : STD_LOGIC;
  signal m00_couplers_to_PS7_axi_periph_WVALID : STD_LOGIC;
  signal m01_couplers_to_PS7_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_PS7_axi_periph_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_PS7_axi_periph_ARREADY : STD_LOGIC;
  signal m01_couplers_to_PS7_axi_periph_ARVALID : STD_LOGIC;
  signal m01_couplers_to_PS7_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_PS7_axi_periph_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_PS7_axi_periph_AWREADY : STD_LOGIC;
  signal m01_couplers_to_PS7_axi_periph_AWVALID : STD_LOGIC;
  signal m01_couplers_to_PS7_axi_periph_BREADY : STD_LOGIC;
  signal m01_couplers_to_PS7_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_PS7_axi_periph_BVALID : STD_LOGIC;
  signal m01_couplers_to_PS7_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_PS7_axi_periph_RREADY : STD_LOGIC;
  signal m01_couplers_to_PS7_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_PS7_axi_periph_RVALID : STD_LOGIC;
  signal m01_couplers_to_PS7_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_PS7_axi_periph_WREADY : STD_LOGIC;
  signal m01_couplers_to_PS7_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_PS7_axi_periph_WVALID : STD_LOGIC;
  signal m02_couplers_to_PS7_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal m02_couplers_to_PS7_axi_periph_ARREADY : STD_LOGIC;
  signal m02_couplers_to_PS7_axi_periph_ARVALID : STD_LOGIC;
  signal m02_couplers_to_PS7_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal m02_couplers_to_PS7_axi_periph_AWREADY : STD_LOGIC;
  signal m02_couplers_to_PS7_axi_periph_AWVALID : STD_LOGIC;
  signal m02_couplers_to_PS7_axi_periph_BREADY : STD_LOGIC;
  signal m02_couplers_to_PS7_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_PS7_axi_periph_BVALID : STD_LOGIC;
  signal m02_couplers_to_PS7_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_PS7_axi_periph_RREADY : STD_LOGIC;
  signal m02_couplers_to_PS7_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_PS7_axi_periph_RVALID : STD_LOGIC;
  signal m02_couplers_to_PS7_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_PS7_axi_periph_WREADY : STD_LOGIC;
  signal m02_couplers_to_PS7_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_PS7_axi_periph_WVALID : STD_LOGIC;
  signal m03_couplers_to_PS7_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal m03_couplers_to_PS7_axi_periph_ARREADY : STD_LOGIC;
  signal m03_couplers_to_PS7_axi_periph_ARVALID : STD_LOGIC;
  signal m03_couplers_to_PS7_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal m03_couplers_to_PS7_axi_periph_AWREADY : STD_LOGIC;
  signal m03_couplers_to_PS7_axi_periph_AWVALID : STD_LOGIC;
  signal m03_couplers_to_PS7_axi_periph_BREADY : STD_LOGIC;
  signal m03_couplers_to_PS7_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_PS7_axi_periph_BVALID : STD_LOGIC;
  signal m03_couplers_to_PS7_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_PS7_axi_periph_RREADY : STD_LOGIC;
  signal m03_couplers_to_PS7_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_PS7_axi_periph_RVALID : STD_LOGIC;
  signal m03_couplers_to_PS7_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_PS7_axi_periph_WREADY : STD_LOGIC;
  signal m03_couplers_to_PS7_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_PS7_axi_periph_WVALID : STD_LOGIC;
  signal m04_couplers_to_PS7_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_PS7_axi_periph_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m04_couplers_to_PS7_axi_periph_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_PS7_axi_periph_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_PS7_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_PS7_axi_periph_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m04_couplers_to_PS7_axi_periph_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_PS7_axi_periph_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_PS7_axi_periph_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_PS7_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_PS7_axi_periph_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_PS7_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_PS7_axi_periph_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_PS7_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_PS7_axi_periph_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_PS7_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_PS7_axi_periph_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_PS7_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_PS7_axi_periph_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m05_couplers_to_PS7_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_PS7_axi_periph_ARREADY : STD_LOGIC;
  signal m05_couplers_to_PS7_axi_periph_ARVALID : STD_LOGIC;
  signal m05_couplers_to_PS7_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_PS7_axi_periph_AWREADY : STD_LOGIC;
  signal m05_couplers_to_PS7_axi_periph_AWVALID : STD_LOGIC;
  signal m05_couplers_to_PS7_axi_periph_BREADY : STD_LOGIC;
  signal m05_couplers_to_PS7_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_PS7_axi_periph_BVALID : STD_LOGIC;
  signal m05_couplers_to_PS7_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_PS7_axi_periph_RREADY : STD_LOGIC;
  signal m05_couplers_to_PS7_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_PS7_axi_periph_RVALID : STD_LOGIC;
  signal m05_couplers_to_PS7_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_PS7_axi_periph_WREADY : STD_LOGIC;
  signal m05_couplers_to_PS7_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_PS7_axi_periph_WVALID : STD_LOGIC;
  signal m06_couplers_to_PS7_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_PS7_axi_periph_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_PS7_axi_periph_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_PS7_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_PS7_axi_periph_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_PS7_axi_periph_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_PS7_axi_periph_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_PS7_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_PS7_axi_periph_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_PS7_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_PS7_axi_periph_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_PS7_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_PS7_axi_periph_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_PS7_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_PS7_axi_periph_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m06_couplers_to_PS7_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m06_couplers_to_PS7_axi_periph_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_PS7_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_PS7_axi_periph_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_PS7_axi_periph_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_PS7_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_PS7_axi_periph_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_PS7_axi_periph_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_PS7_axi_periph_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_PS7_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_PS7_axi_periph_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_PS7_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_PS7_axi_periph_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_PS7_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_PS7_axi_periph_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_PS7_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_PS7_axi_periph_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m07_couplers_to_PS7_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m07_couplers_to_PS7_axi_periph_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_BREADY : STD_LOGIC;
  signal s00_couplers_to_xbar_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_RREADY : STD_LOGIC;
  signal s00_couplers_to_xbar_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_WVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_ARPROT : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_ARVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_AWPROT : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_AWVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m01_couplers_RREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_WVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m02_couplers_ARADDR : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_ARPROT : STD_LOGIC_VECTOR ( 8 downto 6 );
  signal xbar_to_m02_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m02_couplers_ARVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_AWADDR : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_AWPROT : STD_LOGIC_VECTOR ( 8 downto 6 );
  signal xbar_to_m02_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m02_couplers_AWVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_BREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m02_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m02_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m02_couplers_RREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m02_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m02_couplers_WDATA : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m02_couplers_WSTRB : STD_LOGIC_VECTOR ( 11 downto 8 );
  signal xbar_to_m02_couplers_WVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m03_couplers_ARADDR : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_ARPROT : STD_LOGIC_VECTOR ( 11 downto 9 );
  signal xbar_to_m03_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m03_couplers_ARVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_AWADDR : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_AWPROT : STD_LOGIC_VECTOR ( 11 downto 9 );
  signal xbar_to_m03_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m03_couplers_AWVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_BREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m03_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m03_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m03_couplers_RREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m03_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m03_couplers_WDATA : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m03_couplers_WSTRB : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal xbar_to_m03_couplers_WVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m04_couplers_ARADDR : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_ARPROT : STD_LOGIC_VECTOR ( 14 downto 12 );
  signal xbar_to_m04_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m04_couplers_ARVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_AWADDR : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_AWPROT : STD_LOGIC_VECTOR ( 14 downto 12 );
  signal xbar_to_m04_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m04_couplers_AWVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_BREADY : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m04_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m04_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m04_couplers_RREADY : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m04_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m04_couplers_WDATA : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m04_couplers_WSTRB : STD_LOGIC_VECTOR ( 19 downto 16 );
  signal xbar_to_m04_couplers_WVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m05_couplers_ARADDR : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m05_couplers_ARVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_AWADDR : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m05_couplers_AWVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_BREADY : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m05_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m05_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m05_couplers_RREADY : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m05_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m05_couplers_WDATA : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m05_couplers_WSTRB : STD_LOGIC_VECTOR ( 23 downto 20 );
  signal xbar_to_m05_couplers_WVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m06_couplers_ARADDR : STD_LOGIC_VECTOR ( 223 downto 192 );
  signal xbar_to_m06_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m06_couplers_ARVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_AWADDR : STD_LOGIC_VECTOR ( 223 downto 192 );
  signal xbar_to_m06_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m06_couplers_AWVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_BREADY : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m06_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m06_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m06_couplers_RREADY : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m06_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m06_couplers_WDATA : STD_LOGIC_VECTOR ( 223 downto 192 );
  signal xbar_to_m06_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m06_couplers_WSTRB : STD_LOGIC_VECTOR ( 27 downto 24 );
  signal xbar_to_m06_couplers_WVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m07_couplers_ARADDR : STD_LOGIC_VECTOR ( 255 downto 224 );
  signal xbar_to_m07_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m07_couplers_ARVALID : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_AWADDR : STD_LOGIC_VECTOR ( 255 downto 224 );
  signal xbar_to_m07_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m07_couplers_AWVALID : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_BREADY : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m07_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m07_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m07_couplers_RREADY : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m07_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m07_couplers_WDATA : STD_LOGIC_VECTOR ( 255 downto 224 );
  signal xbar_to_m07_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m07_couplers_WSTRB : STD_LOGIC_VECTOR ( 31 downto 28 );
  signal xbar_to_m07_couplers_WVALID : STD_LOGIC_VECTOR ( 7 to 7 );
  signal NLW_xbar_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal NLW_xbar_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal NLW_xbar_m_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  M00_ACLK_1 <= M00_ACLK;
  M00_ARESETN_1 <= M00_ARESETN;
  M00_AXI_araddr(31 downto 0) <= m00_couplers_to_PS7_axi_periph_ARADDR(31 downto 0);
  M00_AXI_arvalid <= m00_couplers_to_PS7_axi_periph_ARVALID;
  M00_AXI_awaddr(31 downto 0) <= m00_couplers_to_PS7_axi_periph_AWADDR(31 downto 0);
  M00_AXI_awvalid <= m00_couplers_to_PS7_axi_periph_AWVALID;
  M00_AXI_bready <= m00_couplers_to_PS7_axi_periph_BREADY;
  M00_AXI_rready <= m00_couplers_to_PS7_axi_periph_RREADY;
  M00_AXI_wdata(31 downto 0) <= m00_couplers_to_PS7_axi_periph_WDATA(31 downto 0);
  M00_AXI_wvalid <= m00_couplers_to_PS7_axi_periph_WVALID;
  M01_ACLK_1 <= M01_ACLK;
  M01_ARESETN_1 <= M01_ARESETN;
  M01_AXI_araddr(31 downto 0) <= m01_couplers_to_PS7_axi_periph_ARADDR(31 downto 0);
  M01_AXI_arprot(2 downto 0) <= m01_couplers_to_PS7_axi_periph_ARPROT(2 downto 0);
  M01_AXI_arvalid <= m01_couplers_to_PS7_axi_periph_ARVALID;
  M01_AXI_awaddr(31 downto 0) <= m01_couplers_to_PS7_axi_periph_AWADDR(31 downto 0);
  M01_AXI_awprot(2 downto 0) <= m01_couplers_to_PS7_axi_periph_AWPROT(2 downto 0);
  M01_AXI_awvalid <= m01_couplers_to_PS7_axi_periph_AWVALID;
  M01_AXI_bready <= m01_couplers_to_PS7_axi_periph_BREADY;
  M01_AXI_rready <= m01_couplers_to_PS7_axi_periph_RREADY;
  M01_AXI_wdata(31 downto 0) <= m01_couplers_to_PS7_axi_periph_WDATA(31 downto 0);
  M01_AXI_wstrb(3 downto 0) <= m01_couplers_to_PS7_axi_periph_WSTRB(3 downto 0);
  M01_AXI_wvalid <= m01_couplers_to_PS7_axi_periph_WVALID;
  M02_ACLK_1 <= M02_ACLK;
  M02_ARESETN_1 <= M02_ARESETN;
  M02_AXI_araddr(8 downto 0) <= m02_couplers_to_PS7_axi_periph_ARADDR(8 downto 0);
  M02_AXI_arvalid <= m02_couplers_to_PS7_axi_periph_ARVALID;
  M02_AXI_awaddr(8 downto 0) <= m02_couplers_to_PS7_axi_periph_AWADDR(8 downto 0);
  M02_AXI_awvalid <= m02_couplers_to_PS7_axi_periph_AWVALID;
  M02_AXI_bready <= m02_couplers_to_PS7_axi_periph_BREADY;
  M02_AXI_rready <= m02_couplers_to_PS7_axi_periph_RREADY;
  M02_AXI_wdata(31 downto 0) <= m02_couplers_to_PS7_axi_periph_WDATA(31 downto 0);
  M02_AXI_wstrb(3 downto 0) <= m02_couplers_to_PS7_axi_periph_WSTRB(3 downto 0);
  M02_AXI_wvalid <= m02_couplers_to_PS7_axi_periph_WVALID;
  M03_ACLK_1 <= M03_ACLK;
  M03_ARESETN_1 <= M03_ARESETN;
  M03_AXI_araddr(8 downto 0) <= m03_couplers_to_PS7_axi_periph_ARADDR(8 downto 0);
  M03_AXI_arvalid <= m03_couplers_to_PS7_axi_periph_ARVALID;
  M03_AXI_awaddr(8 downto 0) <= m03_couplers_to_PS7_axi_periph_AWADDR(8 downto 0);
  M03_AXI_awvalid <= m03_couplers_to_PS7_axi_periph_AWVALID;
  M03_AXI_bready <= m03_couplers_to_PS7_axi_periph_BREADY;
  M03_AXI_rready <= m03_couplers_to_PS7_axi_periph_RREADY;
  M03_AXI_wdata(31 downto 0) <= m03_couplers_to_PS7_axi_periph_WDATA(31 downto 0);
  M03_AXI_wstrb(3 downto 0) <= m03_couplers_to_PS7_axi_periph_WSTRB(3 downto 0);
  M03_AXI_wvalid <= m03_couplers_to_PS7_axi_periph_WVALID;
  M04_ACLK_1 <= M04_ACLK;
  M04_ARESETN_1 <= M04_ARESETN;
  M04_AXI_araddr(31 downto 0) <= m04_couplers_to_PS7_axi_periph_ARADDR(31 downto 0);
  M04_AXI_arprot(2 downto 0) <= m04_couplers_to_PS7_axi_periph_ARPROT(2 downto 0);
  M04_AXI_arvalid(0) <= m04_couplers_to_PS7_axi_periph_ARVALID(0);
  M04_AXI_awaddr(31 downto 0) <= m04_couplers_to_PS7_axi_periph_AWADDR(31 downto 0);
  M04_AXI_awprot(2 downto 0) <= m04_couplers_to_PS7_axi_periph_AWPROT(2 downto 0);
  M04_AXI_awvalid(0) <= m04_couplers_to_PS7_axi_periph_AWVALID(0);
  M04_AXI_bready(0) <= m04_couplers_to_PS7_axi_periph_BREADY(0);
  M04_AXI_rready(0) <= m04_couplers_to_PS7_axi_periph_RREADY(0);
  M04_AXI_wdata(31 downto 0) <= m04_couplers_to_PS7_axi_periph_WDATA(31 downto 0);
  M04_AXI_wstrb(3 downto 0) <= m04_couplers_to_PS7_axi_periph_WSTRB(3 downto 0);
  M04_AXI_wvalid(0) <= m04_couplers_to_PS7_axi_periph_WVALID(0);
  M05_ACLK_1 <= M05_ACLK;
  M05_ARESETN_1 <= M05_ARESETN;
  M05_AXI_araddr(31 downto 0) <= m05_couplers_to_PS7_axi_periph_ARADDR(31 downto 0);
  M05_AXI_arvalid <= m05_couplers_to_PS7_axi_periph_ARVALID;
  M05_AXI_awaddr(31 downto 0) <= m05_couplers_to_PS7_axi_periph_AWADDR(31 downto 0);
  M05_AXI_awvalid <= m05_couplers_to_PS7_axi_periph_AWVALID;
  M05_AXI_bready <= m05_couplers_to_PS7_axi_periph_BREADY;
  M05_AXI_rready <= m05_couplers_to_PS7_axi_periph_RREADY;
  M05_AXI_wdata(31 downto 0) <= m05_couplers_to_PS7_axi_periph_WDATA(31 downto 0);
  M05_AXI_wstrb(3 downto 0) <= m05_couplers_to_PS7_axi_periph_WSTRB(3 downto 0);
  M05_AXI_wvalid <= m05_couplers_to_PS7_axi_periph_WVALID;
  M06_ACLK_1 <= M06_ACLK;
  M06_ARESETN_1 <= M06_ARESETN;
  M06_AXI_araddr(31 downto 0) <= m06_couplers_to_PS7_axi_periph_ARADDR(31 downto 0);
  M06_AXI_arvalid(0) <= m06_couplers_to_PS7_axi_periph_ARVALID(0);
  M06_AXI_awaddr(31 downto 0) <= m06_couplers_to_PS7_axi_periph_AWADDR(31 downto 0);
  M06_AXI_awvalid(0) <= m06_couplers_to_PS7_axi_periph_AWVALID(0);
  M06_AXI_bready(0) <= m06_couplers_to_PS7_axi_periph_BREADY(0);
  M06_AXI_rready(0) <= m06_couplers_to_PS7_axi_periph_RREADY(0);
  M06_AXI_wdata(31 downto 0) <= m06_couplers_to_PS7_axi_periph_WDATA(31 downto 0);
  M06_AXI_wstrb(3 downto 0) <= m06_couplers_to_PS7_axi_periph_WSTRB(3 downto 0);
  M06_AXI_wvalid(0) <= m06_couplers_to_PS7_axi_periph_WVALID(0);
  M07_ACLK_1 <= M07_ACLK;
  M07_ARESETN_1 <= M07_ARESETN;
  M07_AXI_araddr(31 downto 0) <= m07_couplers_to_PS7_axi_periph_ARADDR(31 downto 0);
  M07_AXI_arvalid(0) <= m07_couplers_to_PS7_axi_periph_ARVALID(0);
  M07_AXI_awaddr(31 downto 0) <= m07_couplers_to_PS7_axi_periph_AWADDR(31 downto 0);
  M07_AXI_awvalid(0) <= m07_couplers_to_PS7_axi_periph_AWVALID(0);
  M07_AXI_bready(0) <= m07_couplers_to_PS7_axi_periph_BREADY(0);
  M07_AXI_rready(0) <= m07_couplers_to_PS7_axi_periph_RREADY(0);
  M07_AXI_wdata(31 downto 0) <= m07_couplers_to_PS7_axi_periph_WDATA(31 downto 0);
  M07_AXI_wstrb(3 downto 0) <= m07_couplers_to_PS7_axi_periph_WSTRB(3 downto 0);
  M07_AXI_wvalid(0) <= m07_couplers_to_PS7_axi_periph_WVALID(0);
  PS7_axi_periph_ACLK_net <= ACLK;
  PS7_axi_periph_ARESETN_net <= ARESETN;
  PS7_axi_periph_to_s00_couplers_ARADDR(31 downto 0) <= S00_AXI_araddr(31 downto 0);
  PS7_axi_periph_to_s00_couplers_ARBURST(1 downto 0) <= S00_AXI_arburst(1 downto 0);
  PS7_axi_periph_to_s00_couplers_ARCACHE(3 downto 0) <= S00_AXI_arcache(3 downto 0);
  PS7_axi_periph_to_s00_couplers_ARID(11 downto 0) <= S00_AXI_arid(11 downto 0);
  PS7_axi_periph_to_s00_couplers_ARLEN(3 downto 0) <= S00_AXI_arlen(3 downto 0);
  PS7_axi_periph_to_s00_couplers_ARLOCK(1 downto 0) <= S00_AXI_arlock(1 downto 0);
  PS7_axi_periph_to_s00_couplers_ARPROT(2 downto 0) <= S00_AXI_arprot(2 downto 0);
  PS7_axi_periph_to_s00_couplers_ARQOS(3 downto 0) <= S00_AXI_arqos(3 downto 0);
  PS7_axi_periph_to_s00_couplers_ARSIZE(2 downto 0) <= S00_AXI_arsize(2 downto 0);
  PS7_axi_periph_to_s00_couplers_ARVALID <= S00_AXI_arvalid;
  PS7_axi_periph_to_s00_couplers_AWADDR(31 downto 0) <= S00_AXI_awaddr(31 downto 0);
  PS7_axi_periph_to_s00_couplers_AWBURST(1 downto 0) <= S00_AXI_awburst(1 downto 0);
  PS7_axi_periph_to_s00_couplers_AWCACHE(3 downto 0) <= S00_AXI_awcache(3 downto 0);
  PS7_axi_periph_to_s00_couplers_AWID(11 downto 0) <= S00_AXI_awid(11 downto 0);
  PS7_axi_periph_to_s00_couplers_AWLEN(3 downto 0) <= S00_AXI_awlen(3 downto 0);
  PS7_axi_periph_to_s00_couplers_AWLOCK(1 downto 0) <= S00_AXI_awlock(1 downto 0);
  PS7_axi_periph_to_s00_couplers_AWPROT(2 downto 0) <= S00_AXI_awprot(2 downto 0);
  PS7_axi_periph_to_s00_couplers_AWQOS(3 downto 0) <= S00_AXI_awqos(3 downto 0);
  PS7_axi_periph_to_s00_couplers_AWSIZE(2 downto 0) <= S00_AXI_awsize(2 downto 0);
  PS7_axi_periph_to_s00_couplers_AWVALID <= S00_AXI_awvalid;
  PS7_axi_periph_to_s00_couplers_BREADY <= S00_AXI_bready;
  PS7_axi_periph_to_s00_couplers_RREADY <= S00_AXI_rready;
  PS7_axi_periph_to_s00_couplers_WDATA(31 downto 0) <= S00_AXI_wdata(31 downto 0);
  PS7_axi_periph_to_s00_couplers_WID(11 downto 0) <= S00_AXI_wid(11 downto 0);
  PS7_axi_periph_to_s00_couplers_WLAST <= S00_AXI_wlast;
  PS7_axi_periph_to_s00_couplers_WSTRB(3 downto 0) <= S00_AXI_wstrb(3 downto 0);
  PS7_axi_periph_to_s00_couplers_WVALID <= S00_AXI_wvalid;
  S00_ACLK_1 <= S00_ACLK;
  S00_ARESETN_1 <= S00_ARESETN;
  S00_AXI_arready <= PS7_axi_periph_to_s00_couplers_ARREADY;
  S00_AXI_awready <= PS7_axi_periph_to_s00_couplers_AWREADY;
  S00_AXI_bid(11 downto 0) <= PS7_axi_periph_to_s00_couplers_BID(11 downto 0);
  S00_AXI_bresp(1 downto 0) <= PS7_axi_periph_to_s00_couplers_BRESP(1 downto 0);
  S00_AXI_bvalid <= PS7_axi_periph_to_s00_couplers_BVALID;
  S00_AXI_rdata(31 downto 0) <= PS7_axi_periph_to_s00_couplers_RDATA(31 downto 0);
  S00_AXI_rid(11 downto 0) <= PS7_axi_periph_to_s00_couplers_RID(11 downto 0);
  S00_AXI_rlast <= PS7_axi_periph_to_s00_couplers_RLAST;
  S00_AXI_rresp(1 downto 0) <= PS7_axi_periph_to_s00_couplers_RRESP(1 downto 0);
  S00_AXI_rvalid <= PS7_axi_periph_to_s00_couplers_RVALID;
  S00_AXI_wready <= PS7_axi_periph_to_s00_couplers_WREADY;
  m00_couplers_to_PS7_axi_periph_ARREADY <= M00_AXI_arready;
  m00_couplers_to_PS7_axi_periph_AWREADY <= M00_AXI_awready;
  m00_couplers_to_PS7_axi_periph_BRESP(1 downto 0) <= M00_AXI_bresp(1 downto 0);
  m00_couplers_to_PS7_axi_periph_BVALID <= M00_AXI_bvalid;
  m00_couplers_to_PS7_axi_periph_RDATA(31 downto 0) <= M00_AXI_rdata(31 downto 0);
  m00_couplers_to_PS7_axi_periph_RRESP(1 downto 0) <= M00_AXI_rresp(1 downto 0);
  m00_couplers_to_PS7_axi_periph_RVALID <= M00_AXI_rvalid;
  m00_couplers_to_PS7_axi_periph_WREADY <= M00_AXI_wready;
  m01_couplers_to_PS7_axi_periph_ARREADY <= M01_AXI_arready;
  m01_couplers_to_PS7_axi_periph_AWREADY <= M01_AXI_awready;
  m01_couplers_to_PS7_axi_periph_BRESP(1 downto 0) <= M01_AXI_bresp(1 downto 0);
  m01_couplers_to_PS7_axi_periph_BVALID <= M01_AXI_bvalid;
  m01_couplers_to_PS7_axi_periph_RDATA(31 downto 0) <= M01_AXI_rdata(31 downto 0);
  m01_couplers_to_PS7_axi_periph_RRESP(1 downto 0) <= M01_AXI_rresp(1 downto 0);
  m01_couplers_to_PS7_axi_periph_RVALID <= M01_AXI_rvalid;
  m01_couplers_to_PS7_axi_periph_WREADY <= M01_AXI_wready;
  m02_couplers_to_PS7_axi_periph_ARREADY <= M02_AXI_arready;
  m02_couplers_to_PS7_axi_periph_AWREADY <= M02_AXI_awready;
  m02_couplers_to_PS7_axi_periph_BRESP(1 downto 0) <= M02_AXI_bresp(1 downto 0);
  m02_couplers_to_PS7_axi_periph_BVALID <= M02_AXI_bvalid;
  m02_couplers_to_PS7_axi_periph_RDATA(31 downto 0) <= M02_AXI_rdata(31 downto 0);
  m02_couplers_to_PS7_axi_periph_RRESP(1 downto 0) <= M02_AXI_rresp(1 downto 0);
  m02_couplers_to_PS7_axi_periph_RVALID <= M02_AXI_rvalid;
  m02_couplers_to_PS7_axi_periph_WREADY <= M02_AXI_wready;
  m03_couplers_to_PS7_axi_periph_ARREADY <= M03_AXI_arready;
  m03_couplers_to_PS7_axi_periph_AWREADY <= M03_AXI_awready;
  m03_couplers_to_PS7_axi_periph_BRESP(1 downto 0) <= M03_AXI_bresp(1 downto 0);
  m03_couplers_to_PS7_axi_periph_BVALID <= M03_AXI_bvalid;
  m03_couplers_to_PS7_axi_periph_RDATA(31 downto 0) <= M03_AXI_rdata(31 downto 0);
  m03_couplers_to_PS7_axi_periph_RRESP(1 downto 0) <= M03_AXI_rresp(1 downto 0);
  m03_couplers_to_PS7_axi_periph_RVALID <= M03_AXI_rvalid;
  m03_couplers_to_PS7_axi_periph_WREADY <= M03_AXI_wready;
  m04_couplers_to_PS7_axi_periph_ARREADY(0) <= M04_AXI_arready(0);
  m04_couplers_to_PS7_axi_periph_AWREADY(0) <= M04_AXI_awready(0);
  m04_couplers_to_PS7_axi_periph_BRESP(1 downto 0) <= M04_AXI_bresp(1 downto 0);
  m04_couplers_to_PS7_axi_periph_BVALID(0) <= M04_AXI_bvalid(0);
  m04_couplers_to_PS7_axi_periph_RDATA(31 downto 0) <= M04_AXI_rdata(31 downto 0);
  m04_couplers_to_PS7_axi_periph_RRESP(1 downto 0) <= M04_AXI_rresp(1 downto 0);
  m04_couplers_to_PS7_axi_periph_RVALID(0) <= M04_AXI_rvalid(0);
  m04_couplers_to_PS7_axi_periph_WREADY(0) <= M04_AXI_wready(0);
  m05_couplers_to_PS7_axi_periph_ARREADY <= M05_AXI_arready;
  m05_couplers_to_PS7_axi_periph_AWREADY <= M05_AXI_awready;
  m05_couplers_to_PS7_axi_periph_BRESP(1 downto 0) <= M05_AXI_bresp(1 downto 0);
  m05_couplers_to_PS7_axi_periph_BVALID <= M05_AXI_bvalid;
  m05_couplers_to_PS7_axi_periph_RDATA(31 downto 0) <= M05_AXI_rdata(31 downto 0);
  m05_couplers_to_PS7_axi_periph_RRESP(1 downto 0) <= M05_AXI_rresp(1 downto 0);
  m05_couplers_to_PS7_axi_periph_RVALID <= M05_AXI_rvalid;
  m05_couplers_to_PS7_axi_periph_WREADY <= M05_AXI_wready;
  m06_couplers_to_PS7_axi_periph_ARREADY(0) <= M06_AXI_arready(0);
  m06_couplers_to_PS7_axi_periph_AWREADY(0) <= M06_AXI_awready(0);
  m06_couplers_to_PS7_axi_periph_BRESP(1 downto 0) <= M06_AXI_bresp(1 downto 0);
  m06_couplers_to_PS7_axi_periph_BVALID(0) <= M06_AXI_bvalid(0);
  m06_couplers_to_PS7_axi_periph_RDATA(31 downto 0) <= M06_AXI_rdata(31 downto 0);
  m06_couplers_to_PS7_axi_periph_RRESP(1 downto 0) <= M06_AXI_rresp(1 downto 0);
  m06_couplers_to_PS7_axi_periph_RVALID(0) <= M06_AXI_rvalid(0);
  m06_couplers_to_PS7_axi_periph_WREADY(0) <= M06_AXI_wready(0);
  m07_couplers_to_PS7_axi_periph_ARREADY(0) <= M07_AXI_arready(0);
  m07_couplers_to_PS7_axi_periph_AWREADY(0) <= M07_AXI_awready(0);
  m07_couplers_to_PS7_axi_periph_BRESP(1 downto 0) <= M07_AXI_bresp(1 downto 0);
  m07_couplers_to_PS7_axi_periph_BVALID(0) <= M07_AXI_bvalid(0);
  m07_couplers_to_PS7_axi_periph_RDATA(31 downto 0) <= M07_AXI_rdata(31 downto 0);
  m07_couplers_to_PS7_axi_periph_RRESP(1 downto 0) <= M07_AXI_rresp(1 downto 0);
  m07_couplers_to_PS7_axi_periph_RVALID(0) <= M07_AXI_rvalid(0);
  m07_couplers_to_PS7_axi_periph_WREADY(0) <= M07_AXI_wready(0);
m00_couplers: entity work.m00_couplers_imp_3A6666
     port map (
      M_ACLK => M00_ACLK_1,
      M_ARESETN => M00_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m00_couplers_to_PS7_axi_periph_ARADDR(31 downto 0),
      M_AXI_arready => m00_couplers_to_PS7_axi_periph_ARREADY,
      M_AXI_arvalid => m00_couplers_to_PS7_axi_periph_ARVALID,
      M_AXI_awaddr(31 downto 0) => m00_couplers_to_PS7_axi_periph_AWADDR(31 downto 0),
      M_AXI_awready => m00_couplers_to_PS7_axi_periph_AWREADY,
      M_AXI_awvalid => m00_couplers_to_PS7_axi_periph_AWVALID,
      M_AXI_bready => m00_couplers_to_PS7_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m00_couplers_to_PS7_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m00_couplers_to_PS7_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m00_couplers_to_PS7_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m00_couplers_to_PS7_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m00_couplers_to_PS7_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m00_couplers_to_PS7_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m00_couplers_to_PS7_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m00_couplers_to_PS7_axi_periph_WREADY,
      M_AXI_wvalid => m00_couplers_to_PS7_axi_periph_WVALID,
      S_ACLK => PS7_axi_periph_ACLK_net,
      S_ARESETN => PS7_axi_periph_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      S_AXI_arready => xbar_to_m00_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m00_couplers_ARVALID(0),
      S_AXI_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      S_AXI_awready => xbar_to_m00_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m00_couplers_AWVALID(0),
      S_AXI_bready => xbar_to_m00_couplers_BREADY(0),
      S_AXI_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m00_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m00_couplers_RREADY(0),
      S_AXI_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m00_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      S_AXI_wready => xbar_to_m00_couplers_WREADY,
      S_AXI_wvalid => xbar_to_m00_couplers_WVALID(0)
    );
m01_couplers: entity work.m01_couplers_imp_1RENW4F
     port map (
      M_ACLK => M01_ACLK_1,
      M_ARESETN => M01_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m01_couplers_to_PS7_axi_periph_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m01_couplers_to_PS7_axi_periph_ARPROT(2 downto 0),
      M_AXI_arready => m01_couplers_to_PS7_axi_periph_ARREADY,
      M_AXI_arvalid => m01_couplers_to_PS7_axi_periph_ARVALID,
      M_AXI_awaddr(31 downto 0) => m01_couplers_to_PS7_axi_periph_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m01_couplers_to_PS7_axi_periph_AWPROT(2 downto 0),
      M_AXI_awready => m01_couplers_to_PS7_axi_periph_AWREADY,
      M_AXI_awvalid => m01_couplers_to_PS7_axi_periph_AWVALID,
      M_AXI_bready => m01_couplers_to_PS7_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m01_couplers_to_PS7_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m01_couplers_to_PS7_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m01_couplers_to_PS7_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m01_couplers_to_PS7_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m01_couplers_to_PS7_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m01_couplers_to_PS7_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m01_couplers_to_PS7_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m01_couplers_to_PS7_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m01_couplers_to_PS7_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m01_couplers_to_PS7_axi_periph_WVALID,
      S_ACLK => PS7_axi_periph_ACLK_net,
      S_ARESETN => PS7_axi_periph_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m01_couplers_ARADDR(63 downto 32),
      S_AXI_arprot(2 downto 0) => xbar_to_m01_couplers_ARPROT(5 downto 3),
      S_AXI_arready => xbar_to_m01_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m01_couplers_ARVALID(1),
      S_AXI_awaddr(31 downto 0) => xbar_to_m01_couplers_AWADDR(63 downto 32),
      S_AXI_awprot(2 downto 0) => xbar_to_m01_couplers_AWPROT(5 downto 3),
      S_AXI_awready => xbar_to_m01_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m01_couplers_AWVALID(1),
      S_AXI_bready => xbar_to_m01_couplers_BREADY(1),
      S_AXI_bresp(1 downto 0) => xbar_to_m01_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m01_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m01_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m01_couplers_RREADY(1),
      S_AXI_rresp(1 downto 0) => xbar_to_m01_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m01_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m01_couplers_WDATA(63 downto 32),
      S_AXI_wready => xbar_to_m01_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m01_couplers_WSTRB(7 downto 4),
      S_AXI_wvalid => xbar_to_m01_couplers_WVALID(1)
    );
m02_couplers: entity work.m02_couplers_imp_3VVN0D
     port map (
      M_ACLK => M02_ACLK_1,
      M_ARESETN => M02_ARESETN_1,
      M_AXI_araddr(8 downto 0) => m02_couplers_to_PS7_axi_periph_ARADDR(8 downto 0),
      M_AXI_arready => m02_couplers_to_PS7_axi_periph_ARREADY,
      M_AXI_arvalid => m02_couplers_to_PS7_axi_periph_ARVALID,
      M_AXI_awaddr(8 downto 0) => m02_couplers_to_PS7_axi_periph_AWADDR(8 downto 0),
      M_AXI_awready => m02_couplers_to_PS7_axi_periph_AWREADY,
      M_AXI_awvalid => m02_couplers_to_PS7_axi_periph_AWVALID,
      M_AXI_bready => m02_couplers_to_PS7_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m02_couplers_to_PS7_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m02_couplers_to_PS7_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m02_couplers_to_PS7_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m02_couplers_to_PS7_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m02_couplers_to_PS7_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m02_couplers_to_PS7_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m02_couplers_to_PS7_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m02_couplers_to_PS7_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m02_couplers_to_PS7_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m02_couplers_to_PS7_axi_periph_WVALID,
      S_ACLK => PS7_axi_periph_ACLK_net,
      S_ARESETN => PS7_axi_periph_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m02_couplers_ARADDR(95 downto 64),
      S_AXI_arprot(2 downto 0) => xbar_to_m02_couplers_ARPROT(8 downto 6),
      S_AXI_arready => xbar_to_m02_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m02_couplers_ARVALID(2),
      S_AXI_awaddr(31 downto 0) => xbar_to_m02_couplers_AWADDR(95 downto 64),
      S_AXI_awprot(2 downto 0) => xbar_to_m02_couplers_AWPROT(8 downto 6),
      S_AXI_awready => xbar_to_m02_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m02_couplers_AWVALID(2),
      S_AXI_bready => xbar_to_m02_couplers_BREADY(2),
      S_AXI_bresp(1 downto 0) => xbar_to_m02_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m02_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m02_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m02_couplers_RREADY(2),
      S_AXI_rresp(1 downto 0) => xbar_to_m02_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m02_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m02_couplers_WDATA(95 downto 64),
      S_AXI_wready => xbar_to_m02_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m02_couplers_WSTRB(11 downto 8),
      S_AXI_wvalid => xbar_to_m02_couplers_WVALID(2)
    );
m03_couplers: entity work.m03_couplers_imp_1QIO7VG
     port map (
      M_ACLK => M03_ACLK_1,
      M_ARESETN => M03_ARESETN_1,
      M_AXI_araddr(8 downto 0) => m03_couplers_to_PS7_axi_periph_ARADDR(8 downto 0),
      M_AXI_arready => m03_couplers_to_PS7_axi_periph_ARREADY,
      M_AXI_arvalid => m03_couplers_to_PS7_axi_periph_ARVALID,
      M_AXI_awaddr(8 downto 0) => m03_couplers_to_PS7_axi_periph_AWADDR(8 downto 0),
      M_AXI_awready => m03_couplers_to_PS7_axi_periph_AWREADY,
      M_AXI_awvalid => m03_couplers_to_PS7_axi_periph_AWVALID,
      M_AXI_bready => m03_couplers_to_PS7_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m03_couplers_to_PS7_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m03_couplers_to_PS7_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m03_couplers_to_PS7_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m03_couplers_to_PS7_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m03_couplers_to_PS7_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m03_couplers_to_PS7_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m03_couplers_to_PS7_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m03_couplers_to_PS7_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m03_couplers_to_PS7_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m03_couplers_to_PS7_axi_periph_WVALID,
      S_ACLK => PS7_axi_periph_ACLK_net,
      S_ARESETN => PS7_axi_periph_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m03_couplers_ARADDR(127 downto 96),
      S_AXI_arprot(2 downto 0) => xbar_to_m03_couplers_ARPROT(11 downto 9),
      S_AXI_arready => xbar_to_m03_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m03_couplers_ARVALID(3),
      S_AXI_awaddr(31 downto 0) => xbar_to_m03_couplers_AWADDR(127 downto 96),
      S_AXI_awprot(2 downto 0) => xbar_to_m03_couplers_AWPROT(11 downto 9),
      S_AXI_awready => xbar_to_m03_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m03_couplers_AWVALID(3),
      S_AXI_bready => xbar_to_m03_couplers_BREADY(3),
      S_AXI_bresp(1 downto 0) => xbar_to_m03_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m03_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m03_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m03_couplers_RREADY(3),
      S_AXI_rresp(1 downto 0) => xbar_to_m03_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m03_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m03_couplers_WDATA(127 downto 96),
      S_AXI_wready => xbar_to_m03_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m03_couplers_WSTRB(15 downto 12),
      S_AXI_wvalid => xbar_to_m03_couplers_WVALID(3)
    );
m04_couplers: entity work.m04_couplers_imp_4ULRS
     port map (
      M_ACLK => M04_ACLK_1,
      M_ARESETN => M04_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m04_couplers_to_PS7_axi_periph_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m04_couplers_to_PS7_axi_periph_ARPROT(2 downto 0),
      M_AXI_arready(0) => m04_couplers_to_PS7_axi_periph_ARREADY(0),
      M_AXI_arvalid(0) => m04_couplers_to_PS7_axi_periph_ARVALID(0),
      M_AXI_awaddr(31 downto 0) => m04_couplers_to_PS7_axi_periph_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m04_couplers_to_PS7_axi_periph_AWPROT(2 downto 0),
      M_AXI_awready(0) => m04_couplers_to_PS7_axi_periph_AWREADY(0),
      M_AXI_awvalid(0) => m04_couplers_to_PS7_axi_periph_AWVALID(0),
      M_AXI_bready(0) => m04_couplers_to_PS7_axi_periph_BREADY(0),
      M_AXI_bresp(1 downto 0) => m04_couplers_to_PS7_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m04_couplers_to_PS7_axi_periph_BVALID(0),
      M_AXI_rdata(31 downto 0) => m04_couplers_to_PS7_axi_periph_RDATA(31 downto 0),
      M_AXI_rready(0) => m04_couplers_to_PS7_axi_periph_RREADY(0),
      M_AXI_rresp(1 downto 0) => m04_couplers_to_PS7_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m04_couplers_to_PS7_axi_periph_RVALID(0),
      M_AXI_wdata(31 downto 0) => m04_couplers_to_PS7_axi_periph_WDATA(31 downto 0),
      M_AXI_wready(0) => m04_couplers_to_PS7_axi_periph_WREADY(0),
      M_AXI_wstrb(3 downto 0) => m04_couplers_to_PS7_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => m04_couplers_to_PS7_axi_periph_WVALID(0),
      S_ACLK => PS7_axi_periph_ACLK_net,
      S_ARESETN => PS7_axi_periph_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m04_couplers_ARADDR(159 downto 128),
      S_AXI_arprot(2 downto 0) => xbar_to_m04_couplers_ARPROT(14 downto 12),
      S_AXI_arready(0) => xbar_to_m04_couplers_ARREADY(0),
      S_AXI_arvalid(0) => xbar_to_m04_couplers_ARVALID(4),
      S_AXI_awaddr(31 downto 0) => xbar_to_m04_couplers_AWADDR(159 downto 128),
      S_AXI_awprot(2 downto 0) => xbar_to_m04_couplers_AWPROT(14 downto 12),
      S_AXI_awready(0) => xbar_to_m04_couplers_AWREADY(0),
      S_AXI_awvalid(0) => xbar_to_m04_couplers_AWVALID(4),
      S_AXI_bready(0) => xbar_to_m04_couplers_BREADY(4),
      S_AXI_bresp(1 downto 0) => xbar_to_m04_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m04_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m04_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => xbar_to_m04_couplers_RREADY(4),
      S_AXI_rresp(1 downto 0) => xbar_to_m04_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m04_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m04_couplers_WDATA(159 downto 128),
      S_AXI_wready(0) => xbar_to_m04_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => xbar_to_m04_couplers_WSTRB(19 downto 16),
      S_AXI_wvalid(0) => xbar_to_m04_couplers_WVALID(4)
    );
m05_couplers: entity work.m05_couplers_imp_1UD4Y8P
     port map (
      M_ACLK => M05_ACLK_1,
      M_ARESETN => M05_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m05_couplers_to_PS7_axi_periph_ARADDR(31 downto 0),
      M_AXI_arready => m05_couplers_to_PS7_axi_periph_ARREADY,
      M_AXI_arvalid => m05_couplers_to_PS7_axi_periph_ARVALID,
      M_AXI_awaddr(31 downto 0) => m05_couplers_to_PS7_axi_periph_AWADDR(31 downto 0),
      M_AXI_awready => m05_couplers_to_PS7_axi_periph_AWREADY,
      M_AXI_awvalid => m05_couplers_to_PS7_axi_periph_AWVALID,
      M_AXI_bready => m05_couplers_to_PS7_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m05_couplers_to_PS7_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m05_couplers_to_PS7_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m05_couplers_to_PS7_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m05_couplers_to_PS7_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m05_couplers_to_PS7_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m05_couplers_to_PS7_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m05_couplers_to_PS7_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m05_couplers_to_PS7_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m05_couplers_to_PS7_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m05_couplers_to_PS7_axi_periph_WVALID,
      S_ACLK => PS7_axi_periph_ACLK_net,
      S_ARESETN => PS7_axi_periph_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m05_couplers_ARADDR(191 downto 160),
      S_AXI_arready => xbar_to_m05_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m05_couplers_ARVALID(5),
      S_AXI_awaddr(31 downto 0) => xbar_to_m05_couplers_AWADDR(191 downto 160),
      S_AXI_awready => xbar_to_m05_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m05_couplers_AWVALID(5),
      S_AXI_bready => xbar_to_m05_couplers_BREADY(5),
      S_AXI_bresp(1 downto 0) => xbar_to_m05_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m05_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m05_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m05_couplers_RREADY(5),
      S_AXI_rresp(1 downto 0) => xbar_to_m05_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m05_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m05_couplers_WDATA(191 downto 160),
      S_AXI_wready => xbar_to_m05_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m05_couplers_WSTRB(23 downto 20),
      S_AXI_wvalid => xbar_to_m05_couplers_WVALID(5)
    );
m06_couplers: entity work.m06_couplers_imp_1KI5VF
     port map (
      M_ACLK => M06_ACLK_1,
      M_ARESETN => M06_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m06_couplers_to_PS7_axi_periph_ARADDR(31 downto 0),
      M_AXI_arready(0) => m06_couplers_to_PS7_axi_periph_ARREADY(0),
      M_AXI_arvalid(0) => m06_couplers_to_PS7_axi_periph_ARVALID(0),
      M_AXI_awaddr(31 downto 0) => m06_couplers_to_PS7_axi_periph_AWADDR(31 downto 0),
      M_AXI_awready(0) => m06_couplers_to_PS7_axi_periph_AWREADY(0),
      M_AXI_awvalid(0) => m06_couplers_to_PS7_axi_periph_AWVALID(0),
      M_AXI_bready(0) => m06_couplers_to_PS7_axi_periph_BREADY(0),
      M_AXI_bresp(1 downto 0) => m06_couplers_to_PS7_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m06_couplers_to_PS7_axi_periph_BVALID(0),
      M_AXI_rdata(31 downto 0) => m06_couplers_to_PS7_axi_periph_RDATA(31 downto 0),
      M_AXI_rready(0) => m06_couplers_to_PS7_axi_periph_RREADY(0),
      M_AXI_rresp(1 downto 0) => m06_couplers_to_PS7_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m06_couplers_to_PS7_axi_periph_RVALID(0),
      M_AXI_wdata(31 downto 0) => m06_couplers_to_PS7_axi_periph_WDATA(31 downto 0),
      M_AXI_wready(0) => m06_couplers_to_PS7_axi_periph_WREADY(0),
      M_AXI_wstrb(3 downto 0) => m06_couplers_to_PS7_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => m06_couplers_to_PS7_axi_periph_WVALID(0),
      S_ACLK => PS7_axi_periph_ACLK_net,
      S_ARESETN => PS7_axi_periph_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m06_couplers_ARADDR(223 downto 192),
      S_AXI_arready(0) => xbar_to_m06_couplers_ARREADY(0),
      S_AXI_arvalid(0) => xbar_to_m06_couplers_ARVALID(6),
      S_AXI_awaddr(31 downto 0) => xbar_to_m06_couplers_AWADDR(223 downto 192),
      S_AXI_awready(0) => xbar_to_m06_couplers_AWREADY(0),
      S_AXI_awvalid(0) => xbar_to_m06_couplers_AWVALID(6),
      S_AXI_bready(0) => xbar_to_m06_couplers_BREADY(6),
      S_AXI_bresp(1 downto 0) => xbar_to_m06_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m06_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m06_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => xbar_to_m06_couplers_RREADY(6),
      S_AXI_rresp(1 downto 0) => xbar_to_m06_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m06_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m06_couplers_WDATA(223 downto 192),
      S_AXI_wready(0) => xbar_to_m06_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => xbar_to_m06_couplers_WSTRB(27 downto 24),
      S_AXI_wvalid(0) => xbar_to_m06_couplers_WVALID(6)
    );
m07_couplers: entity work.m07_couplers_imp_1T74Y56
     port map (
      M_ACLK => M07_ACLK_1,
      M_ARESETN => M07_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m07_couplers_to_PS7_axi_periph_ARADDR(31 downto 0),
      M_AXI_arready(0) => m07_couplers_to_PS7_axi_periph_ARREADY(0),
      M_AXI_arvalid(0) => m07_couplers_to_PS7_axi_periph_ARVALID(0),
      M_AXI_awaddr(31 downto 0) => m07_couplers_to_PS7_axi_periph_AWADDR(31 downto 0),
      M_AXI_awready(0) => m07_couplers_to_PS7_axi_periph_AWREADY(0),
      M_AXI_awvalid(0) => m07_couplers_to_PS7_axi_periph_AWVALID(0),
      M_AXI_bready(0) => m07_couplers_to_PS7_axi_periph_BREADY(0),
      M_AXI_bresp(1 downto 0) => m07_couplers_to_PS7_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m07_couplers_to_PS7_axi_periph_BVALID(0),
      M_AXI_rdata(31 downto 0) => m07_couplers_to_PS7_axi_periph_RDATA(31 downto 0),
      M_AXI_rready(0) => m07_couplers_to_PS7_axi_periph_RREADY(0),
      M_AXI_rresp(1 downto 0) => m07_couplers_to_PS7_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m07_couplers_to_PS7_axi_periph_RVALID(0),
      M_AXI_wdata(31 downto 0) => m07_couplers_to_PS7_axi_periph_WDATA(31 downto 0),
      M_AXI_wready(0) => m07_couplers_to_PS7_axi_periph_WREADY(0),
      M_AXI_wstrb(3 downto 0) => m07_couplers_to_PS7_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => m07_couplers_to_PS7_axi_periph_WVALID(0),
      S_ACLK => PS7_axi_periph_ACLK_net,
      S_ARESETN => PS7_axi_periph_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m07_couplers_ARADDR(255 downto 224),
      S_AXI_arready(0) => xbar_to_m07_couplers_ARREADY(0),
      S_AXI_arvalid(0) => xbar_to_m07_couplers_ARVALID(7),
      S_AXI_awaddr(31 downto 0) => xbar_to_m07_couplers_AWADDR(255 downto 224),
      S_AXI_awready(0) => xbar_to_m07_couplers_AWREADY(0),
      S_AXI_awvalid(0) => xbar_to_m07_couplers_AWVALID(7),
      S_AXI_bready(0) => xbar_to_m07_couplers_BREADY(7),
      S_AXI_bresp(1 downto 0) => xbar_to_m07_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m07_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m07_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => xbar_to_m07_couplers_RREADY(7),
      S_AXI_rresp(1 downto 0) => xbar_to_m07_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m07_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m07_couplers_WDATA(255 downto 224),
      S_AXI_wready(0) => xbar_to_m07_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => xbar_to_m07_couplers_WSTRB(31 downto 28),
      S_AXI_wvalid(0) => xbar_to_m07_couplers_WVALID(7)
    );
s00_couplers: entity work.s00_couplers_imp_1VEF3SS
     port map (
      M_ACLK => PS7_axi_periph_ACLK_net,
      M_ARESETN => PS7_axi_periph_ARESETN_net,
      M_AXI_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      M_AXI_arready => s00_couplers_to_xbar_ARREADY(0),
      M_AXI_arvalid => s00_couplers_to_xbar_ARVALID,
      M_AXI_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      M_AXI_awready => s00_couplers_to_xbar_AWREADY(0),
      M_AXI_awvalid => s00_couplers_to_xbar_AWVALID,
      M_AXI_bready => s00_couplers_to_xbar_BREADY,
      M_AXI_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      M_AXI_bvalid => s00_couplers_to_xbar_BVALID(0),
      M_AXI_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      M_AXI_rready => s00_couplers_to_xbar_RREADY,
      M_AXI_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      M_AXI_rvalid => s00_couplers_to_xbar_RVALID(0),
      M_AXI_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      M_AXI_wready => s00_couplers_to_xbar_WREADY(0),
      M_AXI_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      M_AXI_wvalid => s00_couplers_to_xbar_WVALID,
      S_ACLK => S00_ACLK_1,
      S_ARESETN => S00_ARESETN_1,
      S_AXI_araddr(31 downto 0) => PS7_axi_periph_to_s00_couplers_ARADDR(31 downto 0),
      S_AXI_arburst(1 downto 0) => PS7_axi_periph_to_s00_couplers_ARBURST(1 downto 0),
      S_AXI_arcache(3 downto 0) => PS7_axi_periph_to_s00_couplers_ARCACHE(3 downto 0),
      S_AXI_arid(11 downto 0) => PS7_axi_periph_to_s00_couplers_ARID(11 downto 0),
      S_AXI_arlen(3 downto 0) => PS7_axi_periph_to_s00_couplers_ARLEN(3 downto 0),
      S_AXI_arlock(1 downto 0) => PS7_axi_periph_to_s00_couplers_ARLOCK(1 downto 0),
      S_AXI_arprot(2 downto 0) => PS7_axi_periph_to_s00_couplers_ARPROT(2 downto 0),
      S_AXI_arqos(3 downto 0) => PS7_axi_periph_to_s00_couplers_ARQOS(3 downto 0),
      S_AXI_arready => PS7_axi_periph_to_s00_couplers_ARREADY,
      S_AXI_arsize(2 downto 0) => PS7_axi_periph_to_s00_couplers_ARSIZE(2 downto 0),
      S_AXI_arvalid => PS7_axi_periph_to_s00_couplers_ARVALID,
      S_AXI_awaddr(31 downto 0) => PS7_axi_periph_to_s00_couplers_AWADDR(31 downto 0),
      S_AXI_awburst(1 downto 0) => PS7_axi_periph_to_s00_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => PS7_axi_periph_to_s00_couplers_AWCACHE(3 downto 0),
      S_AXI_awid(11 downto 0) => PS7_axi_periph_to_s00_couplers_AWID(11 downto 0),
      S_AXI_awlen(3 downto 0) => PS7_axi_periph_to_s00_couplers_AWLEN(3 downto 0),
      S_AXI_awlock(1 downto 0) => PS7_axi_periph_to_s00_couplers_AWLOCK(1 downto 0),
      S_AXI_awprot(2 downto 0) => PS7_axi_periph_to_s00_couplers_AWPROT(2 downto 0),
      S_AXI_awqos(3 downto 0) => PS7_axi_periph_to_s00_couplers_AWQOS(3 downto 0),
      S_AXI_awready => PS7_axi_periph_to_s00_couplers_AWREADY,
      S_AXI_awsize(2 downto 0) => PS7_axi_periph_to_s00_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid => PS7_axi_periph_to_s00_couplers_AWVALID,
      S_AXI_bid(11 downto 0) => PS7_axi_periph_to_s00_couplers_BID(11 downto 0),
      S_AXI_bready => PS7_axi_periph_to_s00_couplers_BREADY,
      S_AXI_bresp(1 downto 0) => PS7_axi_periph_to_s00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => PS7_axi_periph_to_s00_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => PS7_axi_periph_to_s00_couplers_RDATA(31 downto 0),
      S_AXI_rid(11 downto 0) => PS7_axi_periph_to_s00_couplers_RID(11 downto 0),
      S_AXI_rlast => PS7_axi_periph_to_s00_couplers_RLAST,
      S_AXI_rready => PS7_axi_periph_to_s00_couplers_RREADY,
      S_AXI_rresp(1 downto 0) => PS7_axi_periph_to_s00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => PS7_axi_periph_to_s00_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => PS7_axi_periph_to_s00_couplers_WDATA(31 downto 0),
      S_AXI_wid(11 downto 0) => PS7_axi_periph_to_s00_couplers_WID(11 downto 0),
      S_AXI_wlast => PS7_axi_periph_to_s00_couplers_WLAST,
      S_AXI_wready => PS7_axi_periph_to_s00_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => PS7_axi_periph_to_s00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => PS7_axi_periph_to_s00_couplers_WVALID
    );
xbar: component zynq_soc_xbar_0
     port map (
      aclk => PS7_axi_periph_ACLK_net,
      aresetn => PS7_axi_periph_ARESETN_net,
      m_axi_araddr(255 downto 224) => xbar_to_m07_couplers_ARADDR(255 downto 224),
      m_axi_araddr(223 downto 192) => xbar_to_m06_couplers_ARADDR(223 downto 192),
      m_axi_araddr(191 downto 160) => xbar_to_m05_couplers_ARADDR(191 downto 160),
      m_axi_araddr(159 downto 128) => xbar_to_m04_couplers_ARADDR(159 downto 128),
      m_axi_araddr(127 downto 96) => xbar_to_m03_couplers_ARADDR(127 downto 96),
      m_axi_araddr(95 downto 64) => xbar_to_m02_couplers_ARADDR(95 downto 64),
      m_axi_araddr(63 downto 32) => xbar_to_m01_couplers_ARADDR(63 downto 32),
      m_axi_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      m_axi_arprot(23 downto 15) => NLW_xbar_m_axi_arprot_UNCONNECTED(23 downto 15),
      m_axi_arprot(14 downto 12) => xbar_to_m04_couplers_ARPROT(14 downto 12),
      m_axi_arprot(11 downto 9) => xbar_to_m03_couplers_ARPROT(11 downto 9),
      m_axi_arprot(8 downto 6) => xbar_to_m02_couplers_ARPROT(8 downto 6),
      m_axi_arprot(5 downto 3) => xbar_to_m01_couplers_ARPROT(5 downto 3),
      m_axi_arprot(2 downto 0) => NLW_xbar_m_axi_arprot_UNCONNECTED(2 downto 0),
      m_axi_arready(7) => xbar_to_m07_couplers_ARREADY(0),
      m_axi_arready(6) => xbar_to_m06_couplers_ARREADY(0),
      m_axi_arready(5) => xbar_to_m05_couplers_ARREADY,
      m_axi_arready(4) => xbar_to_m04_couplers_ARREADY(0),
      m_axi_arready(3) => xbar_to_m03_couplers_ARREADY,
      m_axi_arready(2) => xbar_to_m02_couplers_ARREADY,
      m_axi_arready(1) => xbar_to_m01_couplers_ARREADY,
      m_axi_arready(0) => xbar_to_m00_couplers_ARREADY,
      m_axi_arvalid(7) => xbar_to_m07_couplers_ARVALID(7),
      m_axi_arvalid(6) => xbar_to_m06_couplers_ARVALID(6),
      m_axi_arvalid(5) => xbar_to_m05_couplers_ARVALID(5),
      m_axi_arvalid(4) => xbar_to_m04_couplers_ARVALID(4),
      m_axi_arvalid(3) => xbar_to_m03_couplers_ARVALID(3),
      m_axi_arvalid(2) => xbar_to_m02_couplers_ARVALID(2),
      m_axi_arvalid(1) => xbar_to_m01_couplers_ARVALID(1),
      m_axi_arvalid(0) => xbar_to_m00_couplers_ARVALID(0),
      m_axi_awaddr(255 downto 224) => xbar_to_m07_couplers_AWADDR(255 downto 224),
      m_axi_awaddr(223 downto 192) => xbar_to_m06_couplers_AWADDR(223 downto 192),
      m_axi_awaddr(191 downto 160) => xbar_to_m05_couplers_AWADDR(191 downto 160),
      m_axi_awaddr(159 downto 128) => xbar_to_m04_couplers_AWADDR(159 downto 128),
      m_axi_awaddr(127 downto 96) => xbar_to_m03_couplers_AWADDR(127 downto 96),
      m_axi_awaddr(95 downto 64) => xbar_to_m02_couplers_AWADDR(95 downto 64),
      m_axi_awaddr(63 downto 32) => xbar_to_m01_couplers_AWADDR(63 downto 32),
      m_axi_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      m_axi_awprot(23 downto 15) => NLW_xbar_m_axi_awprot_UNCONNECTED(23 downto 15),
      m_axi_awprot(14 downto 12) => xbar_to_m04_couplers_AWPROT(14 downto 12),
      m_axi_awprot(11 downto 9) => xbar_to_m03_couplers_AWPROT(11 downto 9),
      m_axi_awprot(8 downto 6) => xbar_to_m02_couplers_AWPROT(8 downto 6),
      m_axi_awprot(5 downto 3) => xbar_to_m01_couplers_AWPROT(5 downto 3),
      m_axi_awprot(2 downto 0) => NLW_xbar_m_axi_awprot_UNCONNECTED(2 downto 0),
      m_axi_awready(7) => xbar_to_m07_couplers_AWREADY(0),
      m_axi_awready(6) => xbar_to_m06_couplers_AWREADY(0),
      m_axi_awready(5) => xbar_to_m05_couplers_AWREADY,
      m_axi_awready(4) => xbar_to_m04_couplers_AWREADY(0),
      m_axi_awready(3) => xbar_to_m03_couplers_AWREADY,
      m_axi_awready(2) => xbar_to_m02_couplers_AWREADY,
      m_axi_awready(1) => xbar_to_m01_couplers_AWREADY,
      m_axi_awready(0) => xbar_to_m00_couplers_AWREADY,
      m_axi_awvalid(7) => xbar_to_m07_couplers_AWVALID(7),
      m_axi_awvalid(6) => xbar_to_m06_couplers_AWVALID(6),
      m_axi_awvalid(5) => xbar_to_m05_couplers_AWVALID(5),
      m_axi_awvalid(4) => xbar_to_m04_couplers_AWVALID(4),
      m_axi_awvalid(3) => xbar_to_m03_couplers_AWVALID(3),
      m_axi_awvalid(2) => xbar_to_m02_couplers_AWVALID(2),
      m_axi_awvalid(1) => xbar_to_m01_couplers_AWVALID(1),
      m_axi_awvalid(0) => xbar_to_m00_couplers_AWVALID(0),
      m_axi_bready(7) => xbar_to_m07_couplers_BREADY(7),
      m_axi_bready(6) => xbar_to_m06_couplers_BREADY(6),
      m_axi_bready(5) => xbar_to_m05_couplers_BREADY(5),
      m_axi_bready(4) => xbar_to_m04_couplers_BREADY(4),
      m_axi_bready(3) => xbar_to_m03_couplers_BREADY(3),
      m_axi_bready(2) => xbar_to_m02_couplers_BREADY(2),
      m_axi_bready(1) => xbar_to_m01_couplers_BREADY(1),
      m_axi_bready(0) => xbar_to_m00_couplers_BREADY(0),
      m_axi_bresp(15 downto 14) => xbar_to_m07_couplers_BRESP(1 downto 0),
      m_axi_bresp(13 downto 12) => xbar_to_m06_couplers_BRESP(1 downto 0),
      m_axi_bresp(11 downto 10) => xbar_to_m05_couplers_BRESP(1 downto 0),
      m_axi_bresp(9 downto 8) => xbar_to_m04_couplers_BRESP(1 downto 0),
      m_axi_bresp(7 downto 6) => xbar_to_m03_couplers_BRESP(1 downto 0),
      m_axi_bresp(5 downto 4) => xbar_to_m02_couplers_BRESP(1 downto 0),
      m_axi_bresp(3 downto 2) => xbar_to_m01_couplers_BRESP(1 downto 0),
      m_axi_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid(7) => xbar_to_m07_couplers_BVALID(0),
      m_axi_bvalid(6) => xbar_to_m06_couplers_BVALID(0),
      m_axi_bvalid(5) => xbar_to_m05_couplers_BVALID,
      m_axi_bvalid(4) => xbar_to_m04_couplers_BVALID(0),
      m_axi_bvalid(3) => xbar_to_m03_couplers_BVALID,
      m_axi_bvalid(2) => xbar_to_m02_couplers_BVALID,
      m_axi_bvalid(1) => xbar_to_m01_couplers_BVALID,
      m_axi_bvalid(0) => xbar_to_m00_couplers_BVALID,
      m_axi_rdata(255 downto 224) => xbar_to_m07_couplers_RDATA(31 downto 0),
      m_axi_rdata(223 downto 192) => xbar_to_m06_couplers_RDATA(31 downto 0),
      m_axi_rdata(191 downto 160) => xbar_to_m05_couplers_RDATA(31 downto 0),
      m_axi_rdata(159 downto 128) => xbar_to_m04_couplers_RDATA(31 downto 0),
      m_axi_rdata(127 downto 96) => xbar_to_m03_couplers_RDATA(31 downto 0),
      m_axi_rdata(95 downto 64) => xbar_to_m02_couplers_RDATA(31 downto 0),
      m_axi_rdata(63 downto 32) => xbar_to_m01_couplers_RDATA(31 downto 0),
      m_axi_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      m_axi_rready(7) => xbar_to_m07_couplers_RREADY(7),
      m_axi_rready(6) => xbar_to_m06_couplers_RREADY(6),
      m_axi_rready(5) => xbar_to_m05_couplers_RREADY(5),
      m_axi_rready(4) => xbar_to_m04_couplers_RREADY(4),
      m_axi_rready(3) => xbar_to_m03_couplers_RREADY(3),
      m_axi_rready(2) => xbar_to_m02_couplers_RREADY(2),
      m_axi_rready(1) => xbar_to_m01_couplers_RREADY(1),
      m_axi_rready(0) => xbar_to_m00_couplers_RREADY(0),
      m_axi_rresp(15 downto 14) => xbar_to_m07_couplers_RRESP(1 downto 0),
      m_axi_rresp(13 downto 12) => xbar_to_m06_couplers_RRESP(1 downto 0),
      m_axi_rresp(11 downto 10) => xbar_to_m05_couplers_RRESP(1 downto 0),
      m_axi_rresp(9 downto 8) => xbar_to_m04_couplers_RRESP(1 downto 0),
      m_axi_rresp(7 downto 6) => xbar_to_m03_couplers_RRESP(1 downto 0),
      m_axi_rresp(5 downto 4) => xbar_to_m02_couplers_RRESP(1 downto 0),
      m_axi_rresp(3 downto 2) => xbar_to_m01_couplers_RRESP(1 downto 0),
      m_axi_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid(7) => xbar_to_m07_couplers_RVALID(0),
      m_axi_rvalid(6) => xbar_to_m06_couplers_RVALID(0),
      m_axi_rvalid(5) => xbar_to_m05_couplers_RVALID,
      m_axi_rvalid(4) => xbar_to_m04_couplers_RVALID(0),
      m_axi_rvalid(3) => xbar_to_m03_couplers_RVALID,
      m_axi_rvalid(2) => xbar_to_m02_couplers_RVALID,
      m_axi_rvalid(1) => xbar_to_m01_couplers_RVALID,
      m_axi_rvalid(0) => xbar_to_m00_couplers_RVALID,
      m_axi_wdata(255 downto 224) => xbar_to_m07_couplers_WDATA(255 downto 224),
      m_axi_wdata(223 downto 192) => xbar_to_m06_couplers_WDATA(223 downto 192),
      m_axi_wdata(191 downto 160) => xbar_to_m05_couplers_WDATA(191 downto 160),
      m_axi_wdata(159 downto 128) => xbar_to_m04_couplers_WDATA(159 downto 128),
      m_axi_wdata(127 downto 96) => xbar_to_m03_couplers_WDATA(127 downto 96),
      m_axi_wdata(95 downto 64) => xbar_to_m02_couplers_WDATA(95 downto 64),
      m_axi_wdata(63 downto 32) => xbar_to_m01_couplers_WDATA(63 downto 32),
      m_axi_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      m_axi_wready(7) => xbar_to_m07_couplers_WREADY(0),
      m_axi_wready(6) => xbar_to_m06_couplers_WREADY(0),
      m_axi_wready(5) => xbar_to_m05_couplers_WREADY,
      m_axi_wready(4) => xbar_to_m04_couplers_WREADY(0),
      m_axi_wready(3) => xbar_to_m03_couplers_WREADY,
      m_axi_wready(2) => xbar_to_m02_couplers_WREADY,
      m_axi_wready(1) => xbar_to_m01_couplers_WREADY,
      m_axi_wready(0) => xbar_to_m00_couplers_WREADY,
      m_axi_wstrb(31 downto 28) => xbar_to_m07_couplers_WSTRB(31 downto 28),
      m_axi_wstrb(27 downto 24) => xbar_to_m06_couplers_WSTRB(27 downto 24),
      m_axi_wstrb(23 downto 20) => xbar_to_m05_couplers_WSTRB(23 downto 20),
      m_axi_wstrb(19 downto 16) => xbar_to_m04_couplers_WSTRB(19 downto 16),
      m_axi_wstrb(15 downto 12) => xbar_to_m03_couplers_WSTRB(15 downto 12),
      m_axi_wstrb(11 downto 8) => xbar_to_m02_couplers_WSTRB(11 downto 8),
      m_axi_wstrb(7 downto 4) => xbar_to_m01_couplers_WSTRB(7 downto 4),
      m_axi_wstrb(3 downto 0) => NLW_xbar_m_axi_wstrb_UNCONNECTED(3 downto 0),
      m_axi_wvalid(7) => xbar_to_m07_couplers_WVALID(7),
      m_axi_wvalid(6) => xbar_to_m06_couplers_WVALID(6),
      m_axi_wvalid(5) => xbar_to_m05_couplers_WVALID(5),
      m_axi_wvalid(4) => xbar_to_m04_couplers_WVALID(4),
      m_axi_wvalid(3) => xbar_to_m03_couplers_WVALID(3),
      m_axi_wvalid(2) => xbar_to_m02_couplers_WVALID(2),
      m_axi_wvalid(1) => xbar_to_m01_couplers_WVALID(1),
      m_axi_wvalid(0) => xbar_to_m00_couplers_WVALID(0),
      s_axi_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      s_axi_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      s_axi_arready(0) => s00_couplers_to_xbar_ARREADY(0),
      s_axi_arvalid(0) => s00_couplers_to_xbar_ARVALID,
      s_axi_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      s_axi_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      s_axi_awready(0) => s00_couplers_to_xbar_AWREADY(0),
      s_axi_awvalid(0) => s00_couplers_to_xbar_AWVALID,
      s_axi_bready(0) => s00_couplers_to_xbar_BREADY,
      s_axi_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      s_axi_bvalid(0) => s00_couplers_to_xbar_BVALID(0),
      s_axi_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      s_axi_rready(0) => s00_couplers_to_xbar_RREADY,
      s_axi_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      s_axi_rvalid(0) => s00_couplers_to_xbar_RVALID(0),
      s_axi_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      s_axi_wready(0) => s00_couplers_to_xbar_WREADY(0),
      s_axi_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      s_axi_wvalid(0) => s00_couplers_to_xbar_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zynq_soc_axi_mem_intercon_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    M00_ACLK : in STD_LOGIC;
    M00_ARESETN : in STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_arlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_bid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    M00_AXI_rid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    M00_AXI_rlast : in STD_LOGIC;
    M00_AXI_rready : out STD_LOGIC;
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M00_AXI_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_wlast : out STD_LOGIC;
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC;
    S00_ACLK : in STD_LOGIC;
    S00_ARESETN : in STD_LOGIC;
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rvalid : out STD_LOGIC;
    S01_ACLK : in STD_LOGIC;
    S01_ARESETN : in STD_LOGIC;
    S01_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S01_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S01_AXI_awready : out STD_LOGIC;
    S01_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S01_AXI_awvalid : in STD_LOGIC;
    S01_AXI_bready : in STD_LOGIC;
    S01_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_bvalid : out STD_LOGIC;
    S01_AXI_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S01_AXI_wlast : in STD_LOGIC;
    S01_AXI_wready : out STD_LOGIC;
    S01_AXI_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S01_AXI_wvalid : in STD_LOGIC
  );
end zynq_soc_axi_mem_intercon_0;

architecture STRUCTURE of zynq_soc_axi_mem_intercon_0 is
  component zynq_soc_xbar_1 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awvalid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awready : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_wlast : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_wvalid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_wready : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_bvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arvalid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arready : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_rlast : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rready : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component zynq_soc_xbar_1;
  signal M00_ACLK_1 : STD_LOGIC;
  signal M00_ARESETN_1 : STD_LOGIC;
  signal S00_ACLK_1 : STD_LOGIC;
  signal S00_ARESETN_1 : STD_LOGIC;
  signal S01_ACLK_1 : STD_LOGIC;
  signal S01_ARESETN_1 : STD_LOGIC;
  signal axi_mem_intercon_ACLK_net : STD_LOGIC;
  signal axi_mem_intercon_ARESETN_net : STD_LOGIC;
  signal axi_mem_intercon_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_ARREADY : STD_LOGIC;
  signal axi_mem_intercon_to_s00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_ARVALID : STD_LOGIC;
  signal axi_mem_intercon_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_RLAST : STD_LOGIC;
  signal axi_mem_intercon_to_s00_couplers_RREADY : STD_LOGIC;
  signal axi_mem_intercon_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_to_s00_couplers_RVALID : STD_LOGIC;
  signal axi_mem_intercon_to_s01_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mem_intercon_to_s01_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_to_s01_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mem_intercon_to_s01_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_mem_intercon_to_s01_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_to_s01_couplers_AWREADY : STD_LOGIC;
  signal axi_mem_intercon_to_s01_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_to_s01_couplers_AWVALID : STD_LOGIC;
  signal axi_mem_intercon_to_s01_couplers_BREADY : STD_LOGIC;
  signal axi_mem_intercon_to_s01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_to_s01_couplers_BVALID : STD_LOGIC;
  signal axi_mem_intercon_to_s01_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_mem_intercon_to_s01_couplers_WLAST : STD_LOGIC;
  signal axi_mem_intercon_to_s01_couplers_WREADY : STD_LOGIC;
  signal axi_mem_intercon_to_s01_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_mem_intercon_to_s01_couplers_WVALID : STD_LOGIC;
  signal m00_couplers_to_axi_mem_intercon_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_mem_intercon_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_ARREADY : STD_LOGIC;
  signal m00_couplers_to_axi_mem_intercon_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_ARVALID : STD_LOGIC;
  signal m00_couplers_to_axi_mem_intercon_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_mem_intercon_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_AWREADY : STD_LOGIC;
  signal m00_couplers_to_axi_mem_intercon_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_AWVALID : STD_LOGIC;
  signal m00_couplers_to_axi_mem_intercon_BID : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_BREADY : STD_LOGIC;
  signal m00_couplers_to_axi_mem_intercon_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_BVALID : STD_LOGIC;
  signal m00_couplers_to_axi_mem_intercon_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_RID : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_RLAST : STD_LOGIC;
  signal m00_couplers_to_axi_mem_intercon_RREADY : STD_LOGIC;
  signal m00_couplers_to_axi_mem_intercon_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_RVALID : STD_LOGIC;
  signal m00_couplers_to_axi_mem_intercon_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_WID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_mem_intercon_WLAST : STD_LOGIC;
  signal m00_couplers_to_axi_mem_intercon_WREADY : STD_LOGIC;
  signal m00_couplers_to_axi_mem_intercon_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_axi_mem_intercon_WVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_xbar_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_ARVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s00_couplers_to_xbar_RLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RREADY : STD_LOGIC;
  signal s00_couplers_to_xbar_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s01_couplers_to_xbar_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_xbar_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s01_couplers_to_xbar_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s01_couplers_to_xbar_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s01_couplers_to_xbar_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s01_couplers_to_xbar_AWREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal s01_couplers_to_xbar_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s01_couplers_to_xbar_AWVALID : STD_LOGIC;
  signal s01_couplers_to_xbar_BREADY : STD_LOGIC;
  signal s01_couplers_to_xbar_BRESP : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal s01_couplers_to_xbar_BVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal s01_couplers_to_xbar_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s01_couplers_to_xbar_WLAST : STD_LOGIC;
  signal s01_couplers_to_xbar_WREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal s01_couplers_to_xbar_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s01_couplers_to_xbar_WVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xbar_to_m00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xbar_to_m00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal xbar_to_m00_couplers_RID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RLAST : STD_LOGIC;
  signal xbar_to_m00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal xbar_to_m00_couplers_WLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xbar_to_m00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_xbar_s_axi_arready_UNCONNECTED : STD_LOGIC_VECTOR ( 1 to 1 );
  signal NLW_xbar_s_axi_awready_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_xbar_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_xbar_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_xbar_s_axi_bvalid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_xbar_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 127 downto 64 );
  signal NLW_xbar_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_xbar_s_axi_rlast_UNCONNECTED : STD_LOGIC_VECTOR ( 1 to 1 );
  signal NLW_xbar_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_xbar_s_axi_rvalid_UNCONNECTED : STD_LOGIC_VECTOR ( 1 to 1 );
  signal NLW_xbar_s_axi_wready_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M00_ACLK_1 <= M00_ACLK;
  M00_ARESETN_1 <= M00_ARESETN;
  M00_AXI_araddr(31 downto 0) <= m00_couplers_to_axi_mem_intercon_ARADDR(31 downto 0);
  M00_AXI_arburst(1 downto 0) <= m00_couplers_to_axi_mem_intercon_ARBURST(1 downto 0);
  M00_AXI_arcache(3 downto 0) <= m00_couplers_to_axi_mem_intercon_ARCACHE(3 downto 0);
  M00_AXI_arid(0) <= m00_couplers_to_axi_mem_intercon_ARID(0);
  M00_AXI_arlen(3 downto 0) <= m00_couplers_to_axi_mem_intercon_ARLEN(3 downto 0);
  M00_AXI_arlock(1 downto 0) <= m00_couplers_to_axi_mem_intercon_ARLOCK(1 downto 0);
  M00_AXI_arprot(2 downto 0) <= m00_couplers_to_axi_mem_intercon_ARPROT(2 downto 0);
  M00_AXI_arqos(3 downto 0) <= m00_couplers_to_axi_mem_intercon_ARQOS(3 downto 0);
  M00_AXI_arsize(2 downto 0) <= m00_couplers_to_axi_mem_intercon_ARSIZE(2 downto 0);
  M00_AXI_arvalid <= m00_couplers_to_axi_mem_intercon_ARVALID;
  M00_AXI_awaddr(31 downto 0) <= m00_couplers_to_axi_mem_intercon_AWADDR(31 downto 0);
  M00_AXI_awburst(1 downto 0) <= m00_couplers_to_axi_mem_intercon_AWBURST(1 downto 0);
  M00_AXI_awcache(3 downto 0) <= m00_couplers_to_axi_mem_intercon_AWCACHE(3 downto 0);
  M00_AXI_awid(0) <= m00_couplers_to_axi_mem_intercon_AWID(0);
  M00_AXI_awlen(3 downto 0) <= m00_couplers_to_axi_mem_intercon_AWLEN(3 downto 0);
  M00_AXI_awlock(1 downto 0) <= m00_couplers_to_axi_mem_intercon_AWLOCK(1 downto 0);
  M00_AXI_awprot(2 downto 0) <= m00_couplers_to_axi_mem_intercon_AWPROT(2 downto 0);
  M00_AXI_awqos(3 downto 0) <= m00_couplers_to_axi_mem_intercon_AWQOS(3 downto 0);
  M00_AXI_awsize(2 downto 0) <= m00_couplers_to_axi_mem_intercon_AWSIZE(2 downto 0);
  M00_AXI_awvalid <= m00_couplers_to_axi_mem_intercon_AWVALID;
  M00_AXI_bready <= m00_couplers_to_axi_mem_intercon_BREADY;
  M00_AXI_rready <= m00_couplers_to_axi_mem_intercon_RREADY;
  M00_AXI_wdata(63 downto 0) <= m00_couplers_to_axi_mem_intercon_WDATA(63 downto 0);
  M00_AXI_wid(0) <= m00_couplers_to_axi_mem_intercon_WID(0);
  M00_AXI_wlast <= m00_couplers_to_axi_mem_intercon_WLAST;
  M00_AXI_wstrb(7 downto 0) <= m00_couplers_to_axi_mem_intercon_WSTRB(7 downto 0);
  M00_AXI_wvalid <= m00_couplers_to_axi_mem_intercon_WVALID;
  S00_ACLK_1 <= S00_ACLK;
  S00_ARESETN_1 <= S00_ARESETN;
  S00_AXI_arready <= axi_mem_intercon_to_s00_couplers_ARREADY;
  S00_AXI_rdata(63 downto 0) <= axi_mem_intercon_to_s00_couplers_RDATA(63 downto 0);
  S00_AXI_rlast <= axi_mem_intercon_to_s00_couplers_RLAST;
  S00_AXI_rresp(1 downto 0) <= axi_mem_intercon_to_s00_couplers_RRESP(1 downto 0);
  S00_AXI_rvalid <= axi_mem_intercon_to_s00_couplers_RVALID;
  S01_ACLK_1 <= S01_ACLK;
  S01_ARESETN_1 <= S01_ARESETN;
  S01_AXI_awready <= axi_mem_intercon_to_s01_couplers_AWREADY;
  S01_AXI_bresp(1 downto 0) <= axi_mem_intercon_to_s01_couplers_BRESP(1 downto 0);
  S01_AXI_bvalid <= axi_mem_intercon_to_s01_couplers_BVALID;
  S01_AXI_wready <= axi_mem_intercon_to_s01_couplers_WREADY;
  axi_mem_intercon_ACLK_net <= ACLK;
  axi_mem_intercon_ARESETN_net <= ARESETN;
  axi_mem_intercon_to_s00_couplers_ARADDR(31 downto 0) <= S00_AXI_araddr(31 downto 0);
  axi_mem_intercon_to_s00_couplers_ARBURST(1 downto 0) <= S00_AXI_arburst(1 downto 0);
  axi_mem_intercon_to_s00_couplers_ARCACHE(3 downto 0) <= S00_AXI_arcache(3 downto 0);
  axi_mem_intercon_to_s00_couplers_ARLEN(7 downto 0) <= S00_AXI_arlen(7 downto 0);
  axi_mem_intercon_to_s00_couplers_ARPROT(2 downto 0) <= S00_AXI_arprot(2 downto 0);
  axi_mem_intercon_to_s00_couplers_ARSIZE(2 downto 0) <= S00_AXI_arsize(2 downto 0);
  axi_mem_intercon_to_s00_couplers_ARVALID <= S00_AXI_arvalid;
  axi_mem_intercon_to_s00_couplers_RREADY <= S00_AXI_rready;
  axi_mem_intercon_to_s01_couplers_AWADDR(31 downto 0) <= S01_AXI_awaddr(31 downto 0);
  axi_mem_intercon_to_s01_couplers_AWBURST(1 downto 0) <= S01_AXI_awburst(1 downto 0);
  axi_mem_intercon_to_s01_couplers_AWCACHE(3 downto 0) <= S01_AXI_awcache(3 downto 0);
  axi_mem_intercon_to_s01_couplers_AWLEN(7 downto 0) <= S01_AXI_awlen(7 downto 0);
  axi_mem_intercon_to_s01_couplers_AWPROT(2 downto 0) <= S01_AXI_awprot(2 downto 0);
  axi_mem_intercon_to_s01_couplers_AWSIZE(2 downto 0) <= S01_AXI_awsize(2 downto 0);
  axi_mem_intercon_to_s01_couplers_AWVALID <= S01_AXI_awvalid;
  axi_mem_intercon_to_s01_couplers_BREADY <= S01_AXI_bready;
  axi_mem_intercon_to_s01_couplers_WDATA(63 downto 0) <= S01_AXI_wdata(63 downto 0);
  axi_mem_intercon_to_s01_couplers_WLAST <= S01_AXI_wlast;
  axi_mem_intercon_to_s01_couplers_WSTRB(7 downto 0) <= S01_AXI_wstrb(7 downto 0);
  axi_mem_intercon_to_s01_couplers_WVALID <= S01_AXI_wvalid;
  m00_couplers_to_axi_mem_intercon_ARREADY <= M00_AXI_arready;
  m00_couplers_to_axi_mem_intercon_AWREADY <= M00_AXI_awready;
  m00_couplers_to_axi_mem_intercon_BID(5 downto 0) <= M00_AXI_bid(5 downto 0);
  m00_couplers_to_axi_mem_intercon_BRESP(1 downto 0) <= M00_AXI_bresp(1 downto 0);
  m00_couplers_to_axi_mem_intercon_BVALID <= M00_AXI_bvalid;
  m00_couplers_to_axi_mem_intercon_RDATA(63 downto 0) <= M00_AXI_rdata(63 downto 0);
  m00_couplers_to_axi_mem_intercon_RID(5 downto 0) <= M00_AXI_rid(5 downto 0);
  m00_couplers_to_axi_mem_intercon_RLAST <= M00_AXI_rlast;
  m00_couplers_to_axi_mem_intercon_RRESP(1 downto 0) <= M00_AXI_rresp(1 downto 0);
  m00_couplers_to_axi_mem_intercon_RVALID <= M00_AXI_rvalid;
  m00_couplers_to_axi_mem_intercon_WREADY <= M00_AXI_wready;
m00_couplers: entity work.m00_couplers_imp_1D0AVJ7
     port map (
      M_ACLK => M00_ACLK_1,
      M_ARESETN => M00_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m00_couplers_to_axi_mem_intercon_ARADDR(31 downto 0),
      M_AXI_arburst(1 downto 0) => m00_couplers_to_axi_mem_intercon_ARBURST(1 downto 0),
      M_AXI_arcache(3 downto 0) => m00_couplers_to_axi_mem_intercon_ARCACHE(3 downto 0),
      M_AXI_arid(0) => m00_couplers_to_axi_mem_intercon_ARID(0),
      M_AXI_arlen(3 downto 0) => m00_couplers_to_axi_mem_intercon_ARLEN(3 downto 0),
      M_AXI_arlock(1 downto 0) => m00_couplers_to_axi_mem_intercon_ARLOCK(1 downto 0),
      M_AXI_arprot(2 downto 0) => m00_couplers_to_axi_mem_intercon_ARPROT(2 downto 0),
      M_AXI_arqos(3 downto 0) => m00_couplers_to_axi_mem_intercon_ARQOS(3 downto 0),
      M_AXI_arready => m00_couplers_to_axi_mem_intercon_ARREADY,
      M_AXI_arsize(2 downto 0) => m00_couplers_to_axi_mem_intercon_ARSIZE(2 downto 0),
      M_AXI_arvalid => m00_couplers_to_axi_mem_intercon_ARVALID,
      M_AXI_awaddr(31 downto 0) => m00_couplers_to_axi_mem_intercon_AWADDR(31 downto 0),
      M_AXI_awburst(1 downto 0) => m00_couplers_to_axi_mem_intercon_AWBURST(1 downto 0),
      M_AXI_awcache(3 downto 0) => m00_couplers_to_axi_mem_intercon_AWCACHE(3 downto 0),
      M_AXI_awid(0) => m00_couplers_to_axi_mem_intercon_AWID(0),
      M_AXI_awlen(3 downto 0) => m00_couplers_to_axi_mem_intercon_AWLEN(3 downto 0),
      M_AXI_awlock(1 downto 0) => m00_couplers_to_axi_mem_intercon_AWLOCK(1 downto 0),
      M_AXI_awprot(2 downto 0) => m00_couplers_to_axi_mem_intercon_AWPROT(2 downto 0),
      M_AXI_awqos(3 downto 0) => m00_couplers_to_axi_mem_intercon_AWQOS(3 downto 0),
      M_AXI_awready => m00_couplers_to_axi_mem_intercon_AWREADY,
      M_AXI_awsize(2 downto 0) => m00_couplers_to_axi_mem_intercon_AWSIZE(2 downto 0),
      M_AXI_awvalid => m00_couplers_to_axi_mem_intercon_AWVALID,
      M_AXI_bid(5 downto 0) => m00_couplers_to_axi_mem_intercon_BID(5 downto 0),
      M_AXI_bready => m00_couplers_to_axi_mem_intercon_BREADY,
      M_AXI_bresp(1 downto 0) => m00_couplers_to_axi_mem_intercon_BRESP(1 downto 0),
      M_AXI_bvalid => m00_couplers_to_axi_mem_intercon_BVALID,
      M_AXI_rdata(63 downto 0) => m00_couplers_to_axi_mem_intercon_RDATA(63 downto 0),
      M_AXI_rid(5 downto 0) => m00_couplers_to_axi_mem_intercon_RID(5 downto 0),
      M_AXI_rlast => m00_couplers_to_axi_mem_intercon_RLAST,
      M_AXI_rready => m00_couplers_to_axi_mem_intercon_RREADY,
      M_AXI_rresp(1 downto 0) => m00_couplers_to_axi_mem_intercon_RRESP(1 downto 0),
      M_AXI_rvalid => m00_couplers_to_axi_mem_intercon_RVALID,
      M_AXI_wdata(63 downto 0) => m00_couplers_to_axi_mem_intercon_WDATA(63 downto 0),
      M_AXI_wid(0) => m00_couplers_to_axi_mem_intercon_WID(0),
      M_AXI_wlast => m00_couplers_to_axi_mem_intercon_WLAST,
      M_AXI_wready => m00_couplers_to_axi_mem_intercon_WREADY,
      M_AXI_wstrb(7 downto 0) => m00_couplers_to_axi_mem_intercon_WSTRB(7 downto 0),
      M_AXI_wvalid => m00_couplers_to_axi_mem_intercon_WVALID,
      S_ACLK => axi_mem_intercon_ACLK_net,
      S_ARESETN => axi_mem_intercon_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      S_AXI_arburst(1 downto 0) => xbar_to_m00_couplers_ARBURST(1 downto 0),
      S_AXI_arcache(3 downto 0) => xbar_to_m00_couplers_ARCACHE(3 downto 0),
      S_AXI_arid(0) => xbar_to_m00_couplers_ARID(0),
      S_AXI_arlen(7 downto 0) => xbar_to_m00_couplers_ARLEN(7 downto 0),
      S_AXI_arlock(0) => xbar_to_m00_couplers_ARLOCK(0),
      S_AXI_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      S_AXI_arqos(3 downto 0) => xbar_to_m00_couplers_ARQOS(3 downto 0),
      S_AXI_arready => xbar_to_m00_couplers_ARREADY,
      S_AXI_arregion(3 downto 0) => xbar_to_m00_couplers_ARREGION(3 downto 0),
      S_AXI_arsize(2 downto 0) => xbar_to_m00_couplers_ARSIZE(2 downto 0),
      S_AXI_arvalid => xbar_to_m00_couplers_ARVALID(0),
      S_AXI_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      S_AXI_awburst(1 downto 0) => xbar_to_m00_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => xbar_to_m00_couplers_AWCACHE(3 downto 0),
      S_AXI_awid(0) => xbar_to_m00_couplers_AWID(0),
      S_AXI_awlen(7 downto 0) => xbar_to_m00_couplers_AWLEN(7 downto 0),
      S_AXI_awlock(0) => xbar_to_m00_couplers_AWLOCK(0),
      S_AXI_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      S_AXI_awqos(3 downto 0) => xbar_to_m00_couplers_AWQOS(3 downto 0),
      S_AXI_awready => xbar_to_m00_couplers_AWREADY,
      S_AXI_awregion(3 downto 0) => xbar_to_m00_couplers_AWREGION(3 downto 0),
      S_AXI_awsize(2 downto 0) => xbar_to_m00_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid => xbar_to_m00_couplers_AWVALID(0),
      S_AXI_bid(0) => xbar_to_m00_couplers_BID(0),
      S_AXI_bready => xbar_to_m00_couplers_BREADY(0),
      S_AXI_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m00_couplers_BVALID,
      S_AXI_rdata(63 downto 0) => xbar_to_m00_couplers_RDATA(63 downto 0),
      S_AXI_rid(0) => xbar_to_m00_couplers_RID(0),
      S_AXI_rlast => xbar_to_m00_couplers_RLAST,
      S_AXI_rready => xbar_to_m00_couplers_RREADY(0),
      S_AXI_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m00_couplers_RVALID,
      S_AXI_wdata(63 downto 0) => xbar_to_m00_couplers_WDATA(63 downto 0),
      S_AXI_wlast => xbar_to_m00_couplers_WLAST(0),
      S_AXI_wready => xbar_to_m00_couplers_WREADY,
      S_AXI_wstrb(7 downto 0) => xbar_to_m00_couplers_WSTRB(7 downto 0),
      S_AXI_wvalid => xbar_to_m00_couplers_WVALID(0)
    );
s00_couplers: entity work.s00_couplers_imp_KFERMP
     port map (
      M_ACLK => axi_mem_intercon_ACLK_net,
      M_ARESETN => axi_mem_intercon_ARESETN_net,
      M_AXI_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      M_AXI_arburst(1 downto 0) => s00_couplers_to_xbar_ARBURST(1 downto 0),
      M_AXI_arcache(3 downto 0) => s00_couplers_to_xbar_ARCACHE(3 downto 0),
      M_AXI_arlen(7 downto 0) => s00_couplers_to_xbar_ARLEN(7 downto 0),
      M_AXI_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      M_AXI_arready => s00_couplers_to_xbar_ARREADY(0),
      M_AXI_arsize(2 downto 0) => s00_couplers_to_xbar_ARSIZE(2 downto 0),
      M_AXI_arvalid => s00_couplers_to_xbar_ARVALID,
      M_AXI_rdata(63 downto 0) => s00_couplers_to_xbar_RDATA(63 downto 0),
      M_AXI_rlast => s00_couplers_to_xbar_RLAST(0),
      M_AXI_rready => s00_couplers_to_xbar_RREADY,
      M_AXI_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      M_AXI_rvalid => s00_couplers_to_xbar_RVALID(0),
      S_ACLK => S00_ACLK_1,
      S_ARESETN => S00_ARESETN_1,
      S_AXI_araddr(31 downto 0) => axi_mem_intercon_to_s00_couplers_ARADDR(31 downto 0),
      S_AXI_arburst(1 downto 0) => axi_mem_intercon_to_s00_couplers_ARBURST(1 downto 0),
      S_AXI_arcache(3 downto 0) => axi_mem_intercon_to_s00_couplers_ARCACHE(3 downto 0),
      S_AXI_arlen(7 downto 0) => axi_mem_intercon_to_s00_couplers_ARLEN(7 downto 0),
      S_AXI_arprot(2 downto 0) => axi_mem_intercon_to_s00_couplers_ARPROT(2 downto 0),
      S_AXI_arready => axi_mem_intercon_to_s00_couplers_ARREADY,
      S_AXI_arsize(2 downto 0) => axi_mem_intercon_to_s00_couplers_ARSIZE(2 downto 0),
      S_AXI_arvalid => axi_mem_intercon_to_s00_couplers_ARVALID,
      S_AXI_rdata(63 downto 0) => axi_mem_intercon_to_s00_couplers_RDATA(63 downto 0),
      S_AXI_rlast => axi_mem_intercon_to_s00_couplers_RLAST,
      S_AXI_rready => axi_mem_intercon_to_s00_couplers_RREADY,
      S_AXI_rresp(1 downto 0) => axi_mem_intercon_to_s00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => axi_mem_intercon_to_s00_couplers_RVALID
    );
s01_couplers: entity work.s01_couplers_imp_1AA56YO
     port map (
      M_ACLK => axi_mem_intercon_ACLK_net,
      M_ARESETN => axi_mem_intercon_ARESETN_net,
      M_AXI_awaddr(31 downto 0) => s01_couplers_to_xbar_AWADDR(31 downto 0),
      M_AXI_awburst(1 downto 0) => s01_couplers_to_xbar_AWBURST(1 downto 0),
      M_AXI_awcache(3 downto 0) => s01_couplers_to_xbar_AWCACHE(3 downto 0),
      M_AXI_awlen(7 downto 0) => s01_couplers_to_xbar_AWLEN(7 downto 0),
      M_AXI_awprot(2 downto 0) => s01_couplers_to_xbar_AWPROT(2 downto 0),
      M_AXI_awready => s01_couplers_to_xbar_AWREADY(1),
      M_AXI_awsize(2 downto 0) => s01_couplers_to_xbar_AWSIZE(2 downto 0),
      M_AXI_awvalid => s01_couplers_to_xbar_AWVALID,
      M_AXI_bready => s01_couplers_to_xbar_BREADY,
      M_AXI_bresp(1 downto 0) => s01_couplers_to_xbar_BRESP(3 downto 2),
      M_AXI_bvalid => s01_couplers_to_xbar_BVALID(1),
      M_AXI_wdata(63 downto 0) => s01_couplers_to_xbar_WDATA(63 downto 0),
      M_AXI_wlast => s01_couplers_to_xbar_WLAST,
      M_AXI_wready => s01_couplers_to_xbar_WREADY(1),
      M_AXI_wstrb(7 downto 0) => s01_couplers_to_xbar_WSTRB(7 downto 0),
      M_AXI_wvalid => s01_couplers_to_xbar_WVALID,
      S_ACLK => S01_ACLK_1,
      S_ARESETN => S01_ARESETN_1,
      S_AXI_awaddr(31 downto 0) => axi_mem_intercon_to_s01_couplers_AWADDR(31 downto 0),
      S_AXI_awburst(1 downto 0) => axi_mem_intercon_to_s01_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => axi_mem_intercon_to_s01_couplers_AWCACHE(3 downto 0),
      S_AXI_awlen(7 downto 0) => axi_mem_intercon_to_s01_couplers_AWLEN(7 downto 0),
      S_AXI_awprot(2 downto 0) => axi_mem_intercon_to_s01_couplers_AWPROT(2 downto 0),
      S_AXI_awready => axi_mem_intercon_to_s01_couplers_AWREADY,
      S_AXI_awsize(2 downto 0) => axi_mem_intercon_to_s01_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid => axi_mem_intercon_to_s01_couplers_AWVALID,
      S_AXI_bready => axi_mem_intercon_to_s01_couplers_BREADY,
      S_AXI_bresp(1 downto 0) => axi_mem_intercon_to_s01_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => axi_mem_intercon_to_s01_couplers_BVALID,
      S_AXI_wdata(63 downto 0) => axi_mem_intercon_to_s01_couplers_WDATA(63 downto 0),
      S_AXI_wlast => axi_mem_intercon_to_s01_couplers_WLAST,
      S_AXI_wready => axi_mem_intercon_to_s01_couplers_WREADY,
      S_AXI_wstrb(7 downto 0) => axi_mem_intercon_to_s01_couplers_WSTRB(7 downto 0),
      S_AXI_wvalid => axi_mem_intercon_to_s01_couplers_WVALID
    );
xbar: component zynq_soc_xbar_1
     port map (
      aclk => axi_mem_intercon_ACLK_net,
      aresetn => axi_mem_intercon_ARESETN_net,
      m_axi_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => xbar_to_m00_couplers_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => xbar_to_m00_couplers_ARCACHE(3 downto 0),
      m_axi_arid(0) => xbar_to_m00_couplers_ARID(0),
      m_axi_arlen(7 downto 0) => xbar_to_m00_couplers_ARLEN(7 downto 0),
      m_axi_arlock(0) => xbar_to_m00_couplers_ARLOCK(0),
      m_axi_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => xbar_to_m00_couplers_ARQOS(3 downto 0),
      m_axi_arready(0) => xbar_to_m00_couplers_ARREADY,
      m_axi_arregion(3 downto 0) => xbar_to_m00_couplers_ARREGION(3 downto 0),
      m_axi_arsize(2 downto 0) => xbar_to_m00_couplers_ARSIZE(2 downto 0),
      m_axi_arvalid(0) => xbar_to_m00_couplers_ARVALID(0),
      m_axi_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => xbar_to_m00_couplers_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => xbar_to_m00_couplers_AWCACHE(3 downto 0),
      m_axi_awid(0) => xbar_to_m00_couplers_AWID(0),
      m_axi_awlen(7 downto 0) => xbar_to_m00_couplers_AWLEN(7 downto 0),
      m_axi_awlock(0) => xbar_to_m00_couplers_AWLOCK(0),
      m_axi_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => xbar_to_m00_couplers_AWQOS(3 downto 0),
      m_axi_awready(0) => xbar_to_m00_couplers_AWREADY,
      m_axi_awregion(3 downto 0) => xbar_to_m00_couplers_AWREGION(3 downto 0),
      m_axi_awsize(2 downto 0) => xbar_to_m00_couplers_AWSIZE(2 downto 0),
      m_axi_awvalid(0) => xbar_to_m00_couplers_AWVALID(0),
      m_axi_bid(0) => xbar_to_m00_couplers_BID(0),
      m_axi_bready(0) => xbar_to_m00_couplers_BREADY(0),
      m_axi_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid(0) => xbar_to_m00_couplers_BVALID,
      m_axi_rdata(63 downto 0) => xbar_to_m00_couplers_RDATA(63 downto 0),
      m_axi_rid(0) => xbar_to_m00_couplers_RID(0),
      m_axi_rlast(0) => xbar_to_m00_couplers_RLAST,
      m_axi_rready(0) => xbar_to_m00_couplers_RREADY(0),
      m_axi_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid(0) => xbar_to_m00_couplers_RVALID,
      m_axi_wdata(63 downto 0) => xbar_to_m00_couplers_WDATA(63 downto 0),
      m_axi_wlast(0) => xbar_to_m00_couplers_WLAST(0),
      m_axi_wready(0) => xbar_to_m00_couplers_WREADY,
      m_axi_wstrb(7 downto 0) => xbar_to_m00_couplers_WSTRB(7 downto 0),
      m_axi_wvalid(0) => xbar_to_m00_couplers_WVALID(0),
      s_axi_araddr(63 downto 32) => B"00000000000000000000000000000000",
      s_axi_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      s_axi_arburst(3 downto 2) => B"00",
      s_axi_arburst(1 downto 0) => s00_couplers_to_xbar_ARBURST(1 downto 0),
      s_axi_arcache(7 downto 4) => B"0000",
      s_axi_arcache(3 downto 0) => s00_couplers_to_xbar_ARCACHE(3 downto 0),
      s_axi_arid(1 downto 0) => B"00",
      s_axi_arlen(15 downto 8) => B"00000000",
      s_axi_arlen(7 downto 0) => s00_couplers_to_xbar_ARLEN(7 downto 0),
      s_axi_arlock(1 downto 0) => B"00",
      s_axi_arprot(5 downto 3) => B"000",
      s_axi_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      s_axi_arqos(7 downto 0) => B"00000000",
      s_axi_arready(1) => NLW_xbar_s_axi_arready_UNCONNECTED(1),
      s_axi_arready(0) => s00_couplers_to_xbar_ARREADY(0),
      s_axi_arsize(5 downto 3) => B"000",
      s_axi_arsize(2 downto 0) => s00_couplers_to_xbar_ARSIZE(2 downto 0),
      s_axi_arvalid(1) => '0',
      s_axi_arvalid(0) => s00_couplers_to_xbar_ARVALID,
      s_axi_awaddr(63 downto 32) => s01_couplers_to_xbar_AWADDR(31 downto 0),
      s_axi_awaddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_awburst(3 downto 2) => s01_couplers_to_xbar_AWBURST(1 downto 0),
      s_axi_awburst(1 downto 0) => B"00",
      s_axi_awcache(7 downto 4) => s01_couplers_to_xbar_AWCACHE(3 downto 0),
      s_axi_awcache(3 downto 0) => B"0000",
      s_axi_awid(1 downto 0) => B"00",
      s_axi_awlen(15 downto 8) => s01_couplers_to_xbar_AWLEN(7 downto 0),
      s_axi_awlen(7 downto 0) => B"00000000",
      s_axi_awlock(1 downto 0) => B"00",
      s_axi_awprot(5 downto 3) => s01_couplers_to_xbar_AWPROT(2 downto 0),
      s_axi_awprot(2 downto 0) => B"000",
      s_axi_awqos(7 downto 0) => B"00000000",
      s_axi_awready(1) => s01_couplers_to_xbar_AWREADY(1),
      s_axi_awready(0) => NLW_xbar_s_axi_awready_UNCONNECTED(0),
      s_axi_awsize(5 downto 3) => s01_couplers_to_xbar_AWSIZE(2 downto 0),
      s_axi_awsize(2 downto 0) => B"000",
      s_axi_awvalid(1) => s01_couplers_to_xbar_AWVALID,
      s_axi_awvalid(0) => '0',
      s_axi_bid(1 downto 0) => NLW_xbar_s_axi_bid_UNCONNECTED(1 downto 0),
      s_axi_bready(1) => s01_couplers_to_xbar_BREADY,
      s_axi_bready(0) => '0',
      s_axi_bresp(3 downto 2) => s01_couplers_to_xbar_BRESP(3 downto 2),
      s_axi_bresp(1 downto 0) => NLW_xbar_s_axi_bresp_UNCONNECTED(1 downto 0),
      s_axi_bvalid(1) => s01_couplers_to_xbar_BVALID(1),
      s_axi_bvalid(0) => NLW_xbar_s_axi_bvalid_UNCONNECTED(0),
      s_axi_rdata(127 downto 64) => NLW_xbar_s_axi_rdata_UNCONNECTED(127 downto 64),
      s_axi_rdata(63 downto 0) => s00_couplers_to_xbar_RDATA(63 downto 0),
      s_axi_rid(1 downto 0) => NLW_xbar_s_axi_rid_UNCONNECTED(1 downto 0),
      s_axi_rlast(1) => NLW_xbar_s_axi_rlast_UNCONNECTED(1),
      s_axi_rlast(0) => s00_couplers_to_xbar_RLAST(0),
      s_axi_rready(1) => '0',
      s_axi_rready(0) => s00_couplers_to_xbar_RREADY,
      s_axi_rresp(3 downto 2) => NLW_xbar_s_axi_rresp_UNCONNECTED(3 downto 2),
      s_axi_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      s_axi_rvalid(1) => NLW_xbar_s_axi_rvalid_UNCONNECTED(1),
      s_axi_rvalid(0) => s00_couplers_to_xbar_RVALID(0),
      s_axi_wdata(127 downto 64) => s01_couplers_to_xbar_WDATA(63 downto 0),
      s_axi_wdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      s_axi_wlast(1) => s01_couplers_to_xbar_WLAST,
      s_axi_wlast(0) => '1',
      s_axi_wready(1) => s01_couplers_to_xbar_WREADY(1),
      s_axi_wready(0) => NLW_xbar_s_axi_wready_UNCONNECTED(0),
      s_axi_wstrb(15 downto 8) => s01_couplers_to_xbar_WSTRB(7 downto 0),
      s_axi_wstrb(7 downto 0) => B"11111111",
      s_axi_wvalid(1) => s01_couplers_to_xbar_WVALID,
      s_axi_wvalid(0) => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity TO_PS_imp_1M0D9Z7 is
  port (
    CLK_100MHZ : out STD_LOGIC;
    CLK_150MHZ : out STD_LOGIC;
    CLK_75MHZ : out STD_LOGIC;
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rready : out STD_LOGIC;
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_wvalid : out STD_LOGIC;
    M02_AXI_araddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M02_AXI_arready : in STD_LOGIC;
    M02_AXI_arvalid : out STD_LOGIC;
    M02_AXI_awaddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M02_AXI_awready : in STD_LOGIC;
    M02_AXI_awvalid : out STD_LOGIC;
    M02_AXI_bready : out STD_LOGIC;
    M02_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_bvalid : in STD_LOGIC;
    M02_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_rready : out STD_LOGIC;
    M02_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_rvalid : in STD_LOGIC;
    M02_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_wready : in STD_LOGIC;
    M02_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M02_AXI_wvalid : out STD_LOGIC;
    M03_AXI_araddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M03_AXI_arready : in STD_LOGIC;
    M03_AXI_arvalid : out STD_LOGIC;
    M03_AXI_awaddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M03_AXI_awready : in STD_LOGIC;
    M03_AXI_awvalid : out STD_LOGIC;
    M03_AXI_bready : out STD_LOGIC;
    M03_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_bvalid : in STD_LOGIC;
    M03_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_rready : out STD_LOGIC;
    M03_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_rvalid : in STD_LOGIC;
    M03_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_wready : in STD_LOGIC;
    M03_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M03_AXI_wvalid : out STD_LOGIC;
    M04_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M04_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M04_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M04_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_arready : in STD_LOGIC;
    M05_AXI_arvalid : out STD_LOGIC;
    M05_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_awready : in STD_LOGIC;
    M05_AXI_awvalid : out STD_LOGIC;
    M05_AXI_bready : out STD_LOGIC;
    M05_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_bvalid : in STD_LOGIC;
    M05_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_rready : out STD_LOGIC;
    M05_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_rvalid : in STD_LOGIC;
    M05_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_wready : in STD_LOGIC;
    M05_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_wvalid : out STD_LOGIC;
    M06_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M06_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M07_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M07_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M07_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rvalid : out STD_LOGIC;
    S01_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S01_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S01_AXI_awready : out STD_LOGIC;
    S01_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S01_AXI_awvalid : in STD_LOGIC;
    S01_AXI_bready : in STD_LOGIC;
    S01_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_bvalid : out STD_LOGIC;
    S01_AXI_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S01_AXI_wlast : in STD_LOGIC;
    S01_AXI_wready : out STD_LOGIC;
    S01_AXI_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S01_AXI_wvalid : in STD_LOGIC;
    aresetn150Mhz : in STD_LOGIC;
    aresetn75Mhz : in STD_LOGIC;
    iaresetn150Mhz : in STD_LOGIC;
    master_aresetn : out STD_LOGIC
  );
end TO_PS_imp_1M0D9Z7;

architecture STRUCTURE of TO_PS_imp_1M0D9Z7 is
  component zynq_soc_PS7_0 is
  port (
    M_AXI_GP0_ARVALID : out STD_LOGIC;
    M_AXI_GP0_AWVALID : out STD_LOGIC;
    M_AXI_GP0_BREADY : out STD_LOGIC;
    M_AXI_GP0_RREADY : out STD_LOGIC;
    M_AXI_GP0_WLAST : out STD_LOGIC;
    M_AXI_GP0_WVALID : out STD_LOGIC;
    M_AXI_GP0_ARID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_AWID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_WID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ACLK : in STD_LOGIC;
    M_AXI_GP0_ARREADY : in STD_LOGIC;
    M_AXI_GP0_AWREADY : in STD_LOGIC;
    M_AXI_GP0_BVALID : in STD_LOGIC;
    M_AXI_GP0_RLAST : in STD_LOGIC;
    M_AXI_GP0_RVALID : in STD_LOGIC;
    M_AXI_GP0_WREADY : in STD_LOGIC;
    M_AXI_GP0_BID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_RID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_ARREADY : out STD_LOGIC;
    S_AXI_HP0_AWREADY : out STD_LOGIC;
    S_AXI_HP0_BVALID : out STD_LOGIC;
    S_AXI_HP0_RLAST : out STD_LOGIC;
    S_AXI_HP0_RVALID : out STD_LOGIC;
    S_AXI_HP0_WREADY : out STD_LOGIC;
    S_AXI_HP0_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_BID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_RID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_RDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_HP0_RCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP0_WCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP0_RACOUNT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_WACOUNT : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_ACLK : in STD_LOGIC;
    S_AXI_HP0_ARVALID : in STD_LOGIC;
    S_AXI_HP0_AWVALID : in STD_LOGIC;
    S_AXI_HP0_BREADY : in STD_LOGIC;
    S_AXI_HP0_RDISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP0_RREADY : in STD_LOGIC;
    S_AXI_HP0_WLAST : in STD_LOGIC;
    S_AXI_HP0_WRISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP0_WVALID : in STD_LOGIC;
    S_AXI_HP0_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_ARLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_AWLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_ARID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_AWID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_WID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_WDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_HP0_WSTRB : in STD_LOGIC_VECTOR ( 7 downto 0 );
    FCLK_CLK0 : out STD_LOGIC;
    FCLK_CLK1 : out STD_LOGIC;
    FCLK_CLK2 : out STD_LOGIC;
    FCLK_RESET0_N : out STD_LOGIC;
    MIO : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    DDR_CAS_n : inout STD_LOGIC;
    DDR_CKE : inout STD_LOGIC;
    DDR_Clk_n : inout STD_LOGIC;
    DDR_Clk : inout STD_LOGIC;
    DDR_CS_n : inout STD_LOGIC;
    DDR_DRSTB : inout STD_LOGIC;
    DDR_ODT : inout STD_LOGIC;
    DDR_RAS_n : inout STD_LOGIC;
    DDR_WEB : inout STD_LOGIC;
    DDR_BankAddr : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_Addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_VRN : inout STD_LOGIC;
    DDR_VRP : inout STD_LOGIC;
    DDR_DM : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQ : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_DQS_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQS : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    PS_SRSTB : inout STD_LOGIC;
    PS_CLK : inout STD_LOGIC;
    PS_PORB : inout STD_LOGIC
  );
  end component zynq_soc_PS7_0;
  component zynq_soc_Sine_0_0 is
  port (
    ctrl_saxi_awaddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ctrl_saxi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    ctrl_saxi_awvalid : in STD_LOGIC;
    ctrl_saxi_awready : out STD_LOGIC;
    ctrl_saxi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ctrl_saxi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    ctrl_saxi_wvalid : in STD_LOGIC;
    ctrl_saxi_wready : out STD_LOGIC;
    ctrl_saxi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ctrl_saxi_bvalid : out STD_LOGIC;
    ctrl_saxi_bready : in STD_LOGIC;
    ctrl_saxi_araddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ctrl_saxi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    ctrl_saxi_arvalid : in STD_LOGIC;
    ctrl_saxi_arready : out STD_LOGIC;
    ctrl_saxi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ctrl_saxi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ctrl_saxi_rvalid : out STD_LOGIC;
    ctrl_saxi_rready : in STD_LOGIC;
    ctrl_saxi_aclk : in STD_LOGIC;
    ctrl_saxi_aresetn : in STD_LOGIC
  );
  end component zynq_soc_Sine_0_0;
  signal Conn1_ARADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal Conn1_ARREADY : STD_LOGIC;
  signal Conn1_ARVALID : STD_LOGIC;
  signal Conn1_AWADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal Conn1_AWREADY : STD_LOGIC;
  signal Conn1_AWVALID : STD_LOGIC;
  signal Conn1_BREADY : STD_LOGIC;
  signal Conn1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn1_BVALID : STD_LOGIC;
  signal Conn1_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn1_RREADY : STD_LOGIC;
  signal Conn1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn1_RVALID : STD_LOGIC;
  signal Conn1_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn1_WREADY : STD_LOGIC;
  signal Conn1_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn1_WVALID : STD_LOGIC;
  signal Conn2_ARADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal Conn2_ARREADY : STD_LOGIC;
  signal Conn2_ARVALID : STD_LOGIC;
  signal Conn2_AWADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal Conn2_AWREADY : STD_LOGIC;
  signal Conn2_AWVALID : STD_LOGIC;
  signal Conn2_BREADY : STD_LOGIC;
  signal Conn2_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn2_BVALID : STD_LOGIC;
  signal Conn2_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn2_RREADY : STD_LOGIC;
  signal Conn2_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn2_RVALID : STD_LOGIC;
  signal Conn2_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn2_WREADY : STD_LOGIC;
  signal Conn2_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn2_WVALID : STD_LOGIC;
  signal Conn3_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn3_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal Conn3_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn3_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn3_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn3_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal Conn3_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn3_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn3_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn3_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn3_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn3_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn3_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn3_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn3_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn3_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn3_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn3_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn3_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn4_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn4_ARREADY : STD_LOGIC;
  signal Conn4_ARVALID : STD_LOGIC;
  signal Conn4_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn4_AWREADY : STD_LOGIC;
  signal Conn4_AWVALID : STD_LOGIC;
  signal Conn4_BREADY : STD_LOGIC;
  signal Conn4_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn4_BVALID : STD_LOGIC;
  signal Conn4_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn4_RREADY : STD_LOGIC;
  signal Conn4_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn4_RVALID : STD_LOGIC;
  signal Conn4_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn4_WREADY : STD_LOGIC;
  signal Conn4_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn4_WVALID : STD_LOGIC;
  signal Conn5_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn5_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn5_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn5_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn5_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn5_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn5_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn5_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn5_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn5_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn5_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn5_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn5_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn5_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn5_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn5_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn5_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn6_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn6_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn6_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn6_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn6_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn6_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn6_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn6_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn6_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn6_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn6_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn6_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn6_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn6_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn6_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn6_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn6_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M02_ARESETN_1 : STD_LOGIC;
  signal PS7_FCLK_CLK2 : STD_LOGIC;
  signal PS7_M_AXI_GP0_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_M_AXI_GP0_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_M_AXI_GP0_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS7_M_AXI_GP0_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal PS7_M_AXI_GP0_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS7_M_AXI_GP0_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_M_AXI_GP0_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal PS7_M_AXI_GP0_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS7_M_AXI_GP0_ARREADY : STD_LOGIC;
  signal PS7_M_AXI_GP0_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal PS7_M_AXI_GP0_ARVALID : STD_LOGIC;
  signal PS7_M_AXI_GP0_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_M_AXI_GP0_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_M_AXI_GP0_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS7_M_AXI_GP0_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal PS7_M_AXI_GP0_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS7_M_AXI_GP0_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_M_AXI_GP0_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal PS7_M_AXI_GP0_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS7_M_AXI_GP0_AWREADY : STD_LOGIC;
  signal PS7_M_AXI_GP0_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal PS7_M_AXI_GP0_AWVALID : STD_LOGIC;
  signal PS7_M_AXI_GP0_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal PS7_M_AXI_GP0_BREADY : STD_LOGIC;
  signal PS7_M_AXI_GP0_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_M_AXI_GP0_BVALID : STD_LOGIC;
  signal PS7_M_AXI_GP0_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_M_AXI_GP0_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal PS7_M_AXI_GP0_RLAST : STD_LOGIC;
  signal PS7_M_AXI_GP0_RREADY : STD_LOGIC;
  signal PS7_M_AXI_GP0_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_M_AXI_GP0_RVALID : STD_LOGIC;
  signal PS7_M_AXI_GP0_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_M_AXI_GP0_WID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal PS7_M_AXI_GP0_WLAST : STD_LOGIC;
  signal PS7_M_AXI_GP0_WREADY : STD_LOGIC;
  signal PS7_M_AXI_GP0_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS7_M_AXI_GP0_WVALID : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M00_AXI_ARREADY : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_ARVALID : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M00_AXI_AWREADY : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_AWVALID : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_BREADY : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_M00_AXI_BVALID : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M00_AXI_RREADY : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_M00_AXI_RVALID : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M00_AXI_WREADY : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_WVALID : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M01_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal PS7_axi_periph_M01_AXI_ARREADY : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_ARVALID : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M01_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal PS7_axi_periph_M01_AXI_AWREADY : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_AWVALID : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_BREADY : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_M01_AXI_BVALID : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M01_AXI_RREADY : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_M01_AXI_RVALID : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M01_AXI_WREADY : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS7_axi_periph_M01_AXI_WVALID : STD_LOGIC;
  signal PS_VIDEO_DDR_ADDR : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal PS_VIDEO_DDR_BA : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal PS_VIDEO_DDR_CAS_N : STD_LOGIC;
  signal PS_VIDEO_DDR_CKE : STD_LOGIC;
  signal PS_VIDEO_DDR_CK_N : STD_LOGIC;
  signal PS_VIDEO_DDR_CK_P : STD_LOGIC;
  signal PS_VIDEO_DDR_CS_N : STD_LOGIC;
  signal PS_VIDEO_DDR_DM : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS_VIDEO_DDR_DQ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS_VIDEO_DDR_DQS_N : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS_VIDEO_DDR_DQS_P : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS_VIDEO_DDR_ODT : STD_LOGIC;
  signal PS_VIDEO_DDR_RAS_N : STD_LOGIC;
  signal PS_VIDEO_DDR_RESET_N : STD_LOGIC;
  signal PS_VIDEO_DDR_WE_N : STD_LOGIC;
  signal PS_VIDEO_FCLK_CLK1 : STD_LOGIC;
  signal PS_VIDEO_FCLK_RESET0_N : STD_LOGIC;
  signal PS_VIDEO_FIXED_IO_DDR_VRN : STD_LOGIC;
  signal PS_VIDEO_FIXED_IO_DDR_VRP : STD_LOGIC;
  signal PS_VIDEO_FIXED_IO_MIO : STD_LOGIC_VECTOR ( 53 downto 0 );
  signal PS_VIDEO_FIXED_IO_PS_CLK : STD_LOGIC;
  signal PS_VIDEO_FIXED_IO_PS_PORB : STD_LOGIC;
  signal PS_VIDEO_FIXED_IO_PS_SRSTB : STD_LOGIC;
  signal SYSTEM_RESETS_interconnect_aresetn : STD_LOGIC;
  signal VDMA1_M_AXI_MM2S_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal VDMA1_M_AXI_MM2S_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal VDMA1_M_AXI_MM2S_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal VDMA1_M_AXI_MM2S_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal VDMA1_M_AXI_MM2S_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal VDMA1_M_AXI_MM2S_ARREADY : STD_LOGIC;
  signal VDMA1_M_AXI_MM2S_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal VDMA1_M_AXI_MM2S_ARVALID : STD_LOGIC;
  signal VDMA1_M_AXI_MM2S_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal VDMA1_M_AXI_MM2S_RLAST : STD_LOGIC;
  signal VDMA1_M_AXI_MM2S_RREADY : STD_LOGIC;
  signal VDMA1_M_AXI_MM2S_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal VDMA1_M_AXI_MM2S_RVALID : STD_LOGIC;
  signal VDMA1_M_AXI_S2MM_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal VDMA1_M_AXI_S2MM_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal VDMA1_M_AXI_S2MM_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal VDMA1_M_AXI_S2MM_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal VDMA1_M_AXI_S2MM_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal VDMA1_M_AXI_S2MM_AWREADY : STD_LOGIC;
  signal VDMA1_M_AXI_S2MM_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal VDMA1_M_AXI_S2MM_AWVALID : STD_LOGIC;
  signal VDMA1_M_AXI_S2MM_BREADY : STD_LOGIC;
  signal VDMA1_M_AXI_S2MM_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal VDMA1_M_AXI_S2MM_BVALID : STD_LOGIC;
  signal VDMA1_M_AXI_S2MM_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal VDMA1_M_AXI_S2MM_WLAST : STD_LOGIC;
  signal VDMA1_M_AXI_S2MM_WREADY : STD_LOGIC;
  signal VDMA1_M_AXI_S2MM_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal VDMA1_M_AXI_S2MM_WVALID : STD_LOGIC;
  signal axi_mem_intercon_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mem_intercon_M00_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_M00_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mem_intercon_M00_AXI_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_mem_intercon_M00_AXI_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mem_intercon_M00_AXI_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_M00_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_M00_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mem_intercon_M00_AXI_ARREADY : STD_LOGIC;
  signal axi_mem_intercon_M00_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_M00_AXI_ARVALID : STD_LOGIC;
  signal axi_mem_intercon_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_mem_intercon_M00_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_M00_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mem_intercon_M00_AXI_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_mem_intercon_M00_AXI_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mem_intercon_M00_AXI_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_M00_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_M00_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_mem_intercon_M00_AXI_AWREADY : STD_LOGIC;
  signal axi_mem_intercon_M00_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_mem_intercon_M00_AXI_AWVALID : STD_LOGIC;
  signal axi_mem_intercon_M00_AXI_BID : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal axi_mem_intercon_M00_AXI_BREADY : STD_LOGIC;
  signal axi_mem_intercon_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_M00_AXI_BVALID : STD_LOGIC;
  signal axi_mem_intercon_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_mem_intercon_M00_AXI_RID : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal axi_mem_intercon_M00_AXI_RLAST : STD_LOGIC;
  signal axi_mem_intercon_M00_AXI_RREADY : STD_LOGIC;
  signal axi_mem_intercon_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_mem_intercon_M00_AXI_RVALID : STD_LOGIC;
  signal axi_mem_intercon_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_mem_intercon_M00_AXI_WID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_mem_intercon_M00_AXI_WLAST : STD_LOGIC;
  signal axi_mem_intercon_M00_AXI_WREADY : STD_LOGIC;
  signal axi_mem_intercon_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_mem_intercon_M00_AXI_WVALID : STD_LOGIC;
  signal processing_system7_0_FCLK_CLK0 : STD_LOGIC;
  signal rst_PS7_150M_peripheral_aresetn : STD_LOGIC;
  signal NLW_PS7_S_AXI_HP0_RACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_PS7_S_AXI_HP0_RCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_PS7_S_AXI_HP0_WACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_PS7_S_AXI_HP0_WCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
begin
  CLK_100MHZ <= PS_VIDEO_FCLK_CLK1;
  CLK_150MHZ <= processing_system7_0_FCLK_CLK0;
  CLK_75MHZ <= PS7_FCLK_CLK2;
  Conn1_ARREADY <= M02_AXI_arready;
  Conn1_AWREADY <= M02_AXI_awready;
  Conn1_BRESP(1 downto 0) <= M02_AXI_bresp(1 downto 0);
  Conn1_BVALID <= M02_AXI_bvalid;
  Conn1_RDATA(31 downto 0) <= M02_AXI_rdata(31 downto 0);
  Conn1_RRESP(1 downto 0) <= M02_AXI_rresp(1 downto 0);
  Conn1_RVALID <= M02_AXI_rvalid;
  Conn1_WREADY <= M02_AXI_wready;
  Conn2_ARREADY <= M03_AXI_arready;
  Conn2_AWREADY <= M03_AXI_awready;
  Conn2_BRESP(1 downto 0) <= M03_AXI_bresp(1 downto 0);
  Conn2_BVALID <= M03_AXI_bvalid;
  Conn2_RDATA(31 downto 0) <= M03_AXI_rdata(31 downto 0);
  Conn2_RRESP(1 downto 0) <= M03_AXI_rresp(1 downto 0);
  Conn2_RVALID <= M03_AXI_rvalid;
  Conn2_WREADY <= M03_AXI_wready;
  Conn3_ARREADY(0) <= M04_AXI_arready(0);
  Conn3_AWREADY(0) <= M04_AXI_awready(0);
  Conn3_BRESP(1 downto 0) <= M04_AXI_bresp(1 downto 0);
  Conn3_BVALID(0) <= M04_AXI_bvalid(0);
  Conn3_RDATA(31 downto 0) <= M04_AXI_rdata(31 downto 0);
  Conn3_RRESP(1 downto 0) <= M04_AXI_rresp(1 downto 0);
  Conn3_RVALID(0) <= M04_AXI_rvalid(0);
  Conn3_WREADY(0) <= M04_AXI_wready(0);
  Conn4_ARREADY <= M05_AXI_arready;
  Conn4_AWREADY <= M05_AXI_awready;
  Conn4_BRESP(1 downto 0) <= M05_AXI_bresp(1 downto 0);
  Conn4_BVALID <= M05_AXI_bvalid;
  Conn4_RDATA(31 downto 0) <= M05_AXI_rdata(31 downto 0);
  Conn4_RRESP(1 downto 0) <= M05_AXI_rresp(1 downto 0);
  Conn4_RVALID <= M05_AXI_rvalid;
  Conn4_WREADY <= M05_AXI_wready;
  Conn5_ARREADY(0) <= M06_AXI_arready(0);
  Conn5_AWREADY(0) <= M06_AXI_awready(0);
  Conn5_BRESP(1 downto 0) <= M06_AXI_bresp(1 downto 0);
  Conn5_BVALID(0) <= M06_AXI_bvalid(0);
  Conn5_RDATA(31 downto 0) <= M06_AXI_rdata(31 downto 0);
  Conn5_RRESP(1 downto 0) <= M06_AXI_rresp(1 downto 0);
  Conn5_RVALID(0) <= M06_AXI_rvalid(0);
  Conn5_WREADY(0) <= M06_AXI_wready(0);
  Conn6_ARREADY(0) <= M07_AXI_arready(0);
  Conn6_AWREADY(0) <= M07_AXI_awready(0);
  Conn6_BRESP(1 downto 0) <= M07_AXI_bresp(1 downto 0);
  Conn6_BVALID(0) <= M07_AXI_bvalid(0);
  Conn6_RDATA(31 downto 0) <= M07_AXI_rdata(31 downto 0);
  Conn6_RRESP(1 downto 0) <= M07_AXI_rresp(1 downto 0);
  Conn6_RVALID(0) <= M07_AXI_rvalid(0);
  Conn6_WREADY(0) <= M07_AXI_wready(0);
  M00_AXI_araddr(31 downto 0) <= PS7_axi_periph_M00_AXI_ARADDR(31 downto 0);
  M00_AXI_arvalid <= PS7_axi_periph_M00_AXI_ARVALID;
  M00_AXI_awaddr(31 downto 0) <= PS7_axi_periph_M00_AXI_AWADDR(31 downto 0);
  M00_AXI_awvalid <= PS7_axi_periph_M00_AXI_AWVALID;
  M00_AXI_bready <= PS7_axi_periph_M00_AXI_BREADY;
  M00_AXI_rready <= PS7_axi_periph_M00_AXI_RREADY;
  M00_AXI_wdata(31 downto 0) <= PS7_axi_periph_M00_AXI_WDATA(31 downto 0);
  M00_AXI_wvalid <= PS7_axi_periph_M00_AXI_WVALID;
  M02_ARESETN_1 <= aresetn75Mhz;
  M02_AXI_araddr(8 downto 0) <= Conn1_ARADDR(8 downto 0);
  M02_AXI_arvalid <= Conn1_ARVALID;
  M02_AXI_awaddr(8 downto 0) <= Conn1_AWADDR(8 downto 0);
  M02_AXI_awvalid <= Conn1_AWVALID;
  M02_AXI_bready <= Conn1_BREADY;
  M02_AXI_rready <= Conn1_RREADY;
  M02_AXI_wdata(31 downto 0) <= Conn1_WDATA(31 downto 0);
  M02_AXI_wstrb(3 downto 0) <= Conn1_WSTRB(3 downto 0);
  M02_AXI_wvalid <= Conn1_WVALID;
  M03_AXI_araddr(8 downto 0) <= Conn2_ARADDR(8 downto 0);
  M03_AXI_arvalid <= Conn2_ARVALID;
  M03_AXI_awaddr(8 downto 0) <= Conn2_AWADDR(8 downto 0);
  M03_AXI_awvalid <= Conn2_AWVALID;
  M03_AXI_bready <= Conn2_BREADY;
  M03_AXI_rready <= Conn2_RREADY;
  M03_AXI_wdata(31 downto 0) <= Conn2_WDATA(31 downto 0);
  M03_AXI_wstrb(3 downto 0) <= Conn2_WSTRB(3 downto 0);
  M03_AXI_wvalid <= Conn2_WVALID;
  M04_AXI_araddr(31 downto 0) <= Conn3_ARADDR(31 downto 0);
  M04_AXI_arprot(2 downto 0) <= Conn3_ARPROT(2 downto 0);
  M04_AXI_arvalid(0) <= Conn3_ARVALID(0);
  M04_AXI_awaddr(31 downto 0) <= Conn3_AWADDR(31 downto 0);
  M04_AXI_awprot(2 downto 0) <= Conn3_AWPROT(2 downto 0);
  M04_AXI_awvalid(0) <= Conn3_AWVALID(0);
  M04_AXI_bready(0) <= Conn3_BREADY(0);
  M04_AXI_rready(0) <= Conn3_RREADY(0);
  M04_AXI_wdata(31 downto 0) <= Conn3_WDATA(31 downto 0);
  M04_AXI_wstrb(3 downto 0) <= Conn3_WSTRB(3 downto 0);
  M04_AXI_wvalid(0) <= Conn3_WVALID(0);
  M05_AXI_araddr(31 downto 0) <= Conn4_ARADDR(31 downto 0);
  M05_AXI_arvalid <= Conn4_ARVALID;
  M05_AXI_awaddr(31 downto 0) <= Conn4_AWADDR(31 downto 0);
  M05_AXI_awvalid <= Conn4_AWVALID;
  M05_AXI_bready <= Conn4_BREADY;
  M05_AXI_rready <= Conn4_RREADY;
  M05_AXI_wdata(31 downto 0) <= Conn4_WDATA(31 downto 0);
  M05_AXI_wstrb(3 downto 0) <= Conn4_WSTRB(3 downto 0);
  M05_AXI_wvalid <= Conn4_WVALID;
  M06_AXI_araddr(31 downto 0) <= Conn5_ARADDR(31 downto 0);
  M06_AXI_arvalid(0) <= Conn5_ARVALID(0);
  M06_AXI_awaddr(31 downto 0) <= Conn5_AWADDR(31 downto 0);
  M06_AXI_awvalid(0) <= Conn5_AWVALID(0);
  M06_AXI_bready(0) <= Conn5_BREADY(0);
  M06_AXI_rready(0) <= Conn5_RREADY(0);
  M06_AXI_wdata(31 downto 0) <= Conn5_WDATA(31 downto 0);
  M06_AXI_wstrb(3 downto 0) <= Conn5_WSTRB(3 downto 0);
  M06_AXI_wvalid(0) <= Conn5_WVALID(0);
  M07_AXI_araddr(31 downto 0) <= Conn6_ARADDR(31 downto 0);
  M07_AXI_arvalid(0) <= Conn6_ARVALID(0);
  M07_AXI_awaddr(31 downto 0) <= Conn6_AWADDR(31 downto 0);
  M07_AXI_awvalid(0) <= Conn6_AWVALID(0);
  M07_AXI_bready(0) <= Conn6_BREADY(0);
  M07_AXI_rready(0) <= Conn6_RREADY(0);
  M07_AXI_wdata(31 downto 0) <= Conn6_WDATA(31 downto 0);
  M07_AXI_wstrb(3 downto 0) <= Conn6_WSTRB(3 downto 0);
  M07_AXI_wvalid(0) <= Conn6_WVALID(0);
  PS7_axi_periph_M00_AXI_ARREADY <= M00_AXI_arready;
  PS7_axi_periph_M00_AXI_AWREADY <= M00_AXI_awready;
  PS7_axi_periph_M00_AXI_BRESP(1 downto 0) <= M00_AXI_bresp(1 downto 0);
  PS7_axi_periph_M00_AXI_BVALID <= M00_AXI_bvalid;
  PS7_axi_periph_M00_AXI_RDATA(31 downto 0) <= M00_AXI_rdata(31 downto 0);
  PS7_axi_periph_M00_AXI_RRESP(1 downto 0) <= M00_AXI_rresp(1 downto 0);
  PS7_axi_periph_M00_AXI_RVALID <= M00_AXI_rvalid;
  PS7_axi_periph_M00_AXI_WREADY <= M00_AXI_wready;
  S00_AXI_arready <= VDMA1_M_AXI_MM2S_ARREADY;
  S00_AXI_rdata(63 downto 0) <= VDMA1_M_AXI_MM2S_RDATA(63 downto 0);
  S00_AXI_rlast <= VDMA1_M_AXI_MM2S_RLAST;
  S00_AXI_rresp(1 downto 0) <= VDMA1_M_AXI_MM2S_RRESP(1 downto 0);
  S00_AXI_rvalid <= VDMA1_M_AXI_MM2S_RVALID;
  S01_AXI_awready <= VDMA1_M_AXI_S2MM_AWREADY;
  S01_AXI_bresp(1 downto 0) <= VDMA1_M_AXI_S2MM_BRESP(1 downto 0);
  S01_AXI_bvalid <= VDMA1_M_AXI_S2MM_BVALID;
  S01_AXI_wready <= VDMA1_M_AXI_S2MM_WREADY;
  SYSTEM_RESETS_interconnect_aresetn <= iaresetn150Mhz;
  VDMA1_M_AXI_MM2S_ARADDR(31 downto 0) <= S00_AXI_araddr(31 downto 0);
  VDMA1_M_AXI_MM2S_ARBURST(1 downto 0) <= S00_AXI_arburst(1 downto 0);
  VDMA1_M_AXI_MM2S_ARCACHE(3 downto 0) <= S00_AXI_arcache(3 downto 0);
  VDMA1_M_AXI_MM2S_ARLEN(7 downto 0) <= S00_AXI_arlen(7 downto 0);
  VDMA1_M_AXI_MM2S_ARPROT(2 downto 0) <= S00_AXI_arprot(2 downto 0);
  VDMA1_M_AXI_MM2S_ARSIZE(2 downto 0) <= S00_AXI_arsize(2 downto 0);
  VDMA1_M_AXI_MM2S_ARVALID <= S00_AXI_arvalid;
  VDMA1_M_AXI_MM2S_RREADY <= S00_AXI_rready;
  VDMA1_M_AXI_S2MM_AWADDR(31 downto 0) <= S01_AXI_awaddr(31 downto 0);
  VDMA1_M_AXI_S2MM_AWBURST(1 downto 0) <= S01_AXI_awburst(1 downto 0);
  VDMA1_M_AXI_S2MM_AWCACHE(3 downto 0) <= S01_AXI_awcache(3 downto 0);
  VDMA1_M_AXI_S2MM_AWLEN(7 downto 0) <= S01_AXI_awlen(7 downto 0);
  VDMA1_M_AXI_S2MM_AWPROT(2 downto 0) <= S01_AXI_awprot(2 downto 0);
  VDMA1_M_AXI_S2MM_AWSIZE(2 downto 0) <= S01_AXI_awsize(2 downto 0);
  VDMA1_M_AXI_S2MM_AWVALID <= S01_AXI_awvalid;
  VDMA1_M_AXI_S2MM_BREADY <= S01_AXI_bready;
  VDMA1_M_AXI_S2MM_WDATA(63 downto 0) <= S01_AXI_wdata(63 downto 0);
  VDMA1_M_AXI_S2MM_WLAST <= S01_AXI_wlast;
  VDMA1_M_AXI_S2MM_WSTRB(7 downto 0) <= S01_AXI_wstrb(7 downto 0);
  VDMA1_M_AXI_S2MM_WVALID <= S01_AXI_wvalid;
  master_aresetn <= PS_VIDEO_FCLK_RESET0_N;
  rst_PS7_150M_peripheral_aresetn <= aresetn150Mhz;
PS7: component zynq_soc_PS7_0
     port map (
      DDR_Addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_BankAddr(2 downto 0) => DDR_ba(2 downto 0),
      DDR_CAS_n => DDR_cas_n,
      DDR_CKE => DDR_cke,
      DDR_CS_n => DDR_cs_n,
      DDR_Clk => DDR_ck_p,
      DDR_Clk_n => DDR_ck_n,
      DDR_DM(3 downto 0) => DDR_dm(3 downto 0),
      DDR_DQ(31 downto 0) => DDR_dq(31 downto 0),
      DDR_DQS(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_DQS_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_DRSTB => DDR_reset_n,
      DDR_ODT => DDR_odt,
      DDR_RAS_n => DDR_ras_n,
      DDR_VRN => FIXED_IO_ddr_vrn,
      DDR_VRP => FIXED_IO_ddr_vrp,
      DDR_WEB => DDR_we_n,
      FCLK_CLK0 => processing_system7_0_FCLK_CLK0,
      FCLK_CLK1 => PS_VIDEO_FCLK_CLK1,
      FCLK_CLK2 => PS7_FCLK_CLK2,
      FCLK_RESET0_N => PS_VIDEO_FCLK_RESET0_N,
      MIO(53 downto 0) => FIXED_IO_mio(53 downto 0),
      M_AXI_GP0_ACLK => processing_system7_0_FCLK_CLK0,
      M_AXI_GP0_ARADDR(31 downto 0) => PS7_M_AXI_GP0_ARADDR(31 downto 0),
      M_AXI_GP0_ARBURST(1 downto 0) => PS7_M_AXI_GP0_ARBURST(1 downto 0),
      M_AXI_GP0_ARCACHE(3 downto 0) => PS7_M_AXI_GP0_ARCACHE(3 downto 0),
      M_AXI_GP0_ARID(11 downto 0) => PS7_M_AXI_GP0_ARID(11 downto 0),
      M_AXI_GP0_ARLEN(3 downto 0) => PS7_M_AXI_GP0_ARLEN(3 downto 0),
      M_AXI_GP0_ARLOCK(1 downto 0) => PS7_M_AXI_GP0_ARLOCK(1 downto 0),
      M_AXI_GP0_ARPROT(2 downto 0) => PS7_M_AXI_GP0_ARPROT(2 downto 0),
      M_AXI_GP0_ARQOS(3 downto 0) => PS7_M_AXI_GP0_ARQOS(3 downto 0),
      M_AXI_GP0_ARREADY => PS7_M_AXI_GP0_ARREADY,
      M_AXI_GP0_ARSIZE(2 downto 0) => PS7_M_AXI_GP0_ARSIZE(2 downto 0),
      M_AXI_GP0_ARVALID => PS7_M_AXI_GP0_ARVALID,
      M_AXI_GP0_AWADDR(31 downto 0) => PS7_M_AXI_GP0_AWADDR(31 downto 0),
      M_AXI_GP0_AWBURST(1 downto 0) => PS7_M_AXI_GP0_AWBURST(1 downto 0),
      M_AXI_GP0_AWCACHE(3 downto 0) => PS7_M_AXI_GP0_AWCACHE(3 downto 0),
      M_AXI_GP0_AWID(11 downto 0) => PS7_M_AXI_GP0_AWID(11 downto 0),
      M_AXI_GP0_AWLEN(3 downto 0) => PS7_M_AXI_GP0_AWLEN(3 downto 0),
      M_AXI_GP0_AWLOCK(1 downto 0) => PS7_M_AXI_GP0_AWLOCK(1 downto 0),
      M_AXI_GP0_AWPROT(2 downto 0) => PS7_M_AXI_GP0_AWPROT(2 downto 0),
      M_AXI_GP0_AWQOS(3 downto 0) => PS7_M_AXI_GP0_AWQOS(3 downto 0),
      M_AXI_GP0_AWREADY => PS7_M_AXI_GP0_AWREADY,
      M_AXI_GP0_AWSIZE(2 downto 0) => PS7_M_AXI_GP0_AWSIZE(2 downto 0),
      M_AXI_GP0_AWVALID => PS7_M_AXI_GP0_AWVALID,
      M_AXI_GP0_BID(11 downto 0) => PS7_M_AXI_GP0_BID(11 downto 0),
      M_AXI_GP0_BREADY => PS7_M_AXI_GP0_BREADY,
      M_AXI_GP0_BRESP(1 downto 0) => PS7_M_AXI_GP0_BRESP(1 downto 0),
      M_AXI_GP0_BVALID => PS7_M_AXI_GP0_BVALID,
      M_AXI_GP0_RDATA(31 downto 0) => PS7_M_AXI_GP0_RDATA(31 downto 0),
      M_AXI_GP0_RID(11 downto 0) => PS7_M_AXI_GP0_RID(11 downto 0),
      M_AXI_GP0_RLAST => PS7_M_AXI_GP0_RLAST,
      M_AXI_GP0_RREADY => PS7_M_AXI_GP0_RREADY,
      M_AXI_GP0_RRESP(1 downto 0) => PS7_M_AXI_GP0_RRESP(1 downto 0),
      M_AXI_GP0_RVALID => PS7_M_AXI_GP0_RVALID,
      M_AXI_GP0_WDATA(31 downto 0) => PS7_M_AXI_GP0_WDATA(31 downto 0),
      M_AXI_GP0_WID(11 downto 0) => PS7_M_AXI_GP0_WID(11 downto 0),
      M_AXI_GP0_WLAST => PS7_M_AXI_GP0_WLAST,
      M_AXI_GP0_WREADY => PS7_M_AXI_GP0_WREADY,
      M_AXI_GP0_WSTRB(3 downto 0) => PS7_M_AXI_GP0_WSTRB(3 downto 0),
      M_AXI_GP0_WVALID => PS7_M_AXI_GP0_WVALID,
      PS_CLK => FIXED_IO_ps_clk,
      PS_PORB => FIXED_IO_ps_porb,
      PS_SRSTB => FIXED_IO_ps_srstb,
      S_AXI_HP0_ACLK => processing_system7_0_FCLK_CLK0,
      S_AXI_HP0_ARADDR(31 downto 0) => axi_mem_intercon_M00_AXI_ARADDR(31 downto 0),
      S_AXI_HP0_ARBURST(1 downto 0) => axi_mem_intercon_M00_AXI_ARBURST(1 downto 0),
      S_AXI_HP0_ARCACHE(3 downto 0) => axi_mem_intercon_M00_AXI_ARCACHE(3 downto 0),
      S_AXI_HP0_ARID(5 downto 1) => B"00000",
      S_AXI_HP0_ARID(0) => axi_mem_intercon_M00_AXI_ARID(0),
      S_AXI_HP0_ARLEN(3 downto 0) => axi_mem_intercon_M00_AXI_ARLEN(3 downto 0),
      S_AXI_HP0_ARLOCK(1 downto 0) => axi_mem_intercon_M00_AXI_ARLOCK(1 downto 0),
      S_AXI_HP0_ARPROT(2 downto 0) => axi_mem_intercon_M00_AXI_ARPROT(2 downto 0),
      S_AXI_HP0_ARQOS(3 downto 0) => axi_mem_intercon_M00_AXI_ARQOS(3 downto 0),
      S_AXI_HP0_ARREADY => axi_mem_intercon_M00_AXI_ARREADY,
      S_AXI_HP0_ARSIZE(2 downto 0) => axi_mem_intercon_M00_AXI_ARSIZE(2 downto 0),
      S_AXI_HP0_ARVALID => axi_mem_intercon_M00_AXI_ARVALID,
      S_AXI_HP0_AWADDR(31 downto 0) => axi_mem_intercon_M00_AXI_AWADDR(31 downto 0),
      S_AXI_HP0_AWBURST(1 downto 0) => axi_mem_intercon_M00_AXI_AWBURST(1 downto 0),
      S_AXI_HP0_AWCACHE(3 downto 0) => axi_mem_intercon_M00_AXI_AWCACHE(3 downto 0),
      S_AXI_HP0_AWID(5 downto 1) => B"00000",
      S_AXI_HP0_AWID(0) => axi_mem_intercon_M00_AXI_AWID(0),
      S_AXI_HP0_AWLEN(3 downto 0) => axi_mem_intercon_M00_AXI_AWLEN(3 downto 0),
      S_AXI_HP0_AWLOCK(1 downto 0) => axi_mem_intercon_M00_AXI_AWLOCK(1 downto 0),
      S_AXI_HP0_AWPROT(2 downto 0) => axi_mem_intercon_M00_AXI_AWPROT(2 downto 0),
      S_AXI_HP0_AWQOS(3 downto 0) => axi_mem_intercon_M00_AXI_AWQOS(3 downto 0),
      S_AXI_HP0_AWREADY => axi_mem_intercon_M00_AXI_AWREADY,
      S_AXI_HP0_AWSIZE(2 downto 0) => axi_mem_intercon_M00_AXI_AWSIZE(2 downto 0),
      S_AXI_HP0_AWVALID => axi_mem_intercon_M00_AXI_AWVALID,
      S_AXI_HP0_BID(5 downto 0) => axi_mem_intercon_M00_AXI_BID(5 downto 0),
      S_AXI_HP0_BREADY => axi_mem_intercon_M00_AXI_BREADY,
      S_AXI_HP0_BRESP(1 downto 0) => axi_mem_intercon_M00_AXI_BRESP(1 downto 0),
      S_AXI_HP0_BVALID => axi_mem_intercon_M00_AXI_BVALID,
      S_AXI_HP0_RACOUNT(2 downto 0) => NLW_PS7_S_AXI_HP0_RACOUNT_UNCONNECTED(2 downto 0),
      S_AXI_HP0_RCOUNT(7 downto 0) => NLW_PS7_S_AXI_HP0_RCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP0_RDATA(63 downto 0) => axi_mem_intercon_M00_AXI_RDATA(63 downto 0),
      S_AXI_HP0_RDISSUECAP1_EN => '0',
      S_AXI_HP0_RID(5 downto 0) => axi_mem_intercon_M00_AXI_RID(5 downto 0),
      S_AXI_HP0_RLAST => axi_mem_intercon_M00_AXI_RLAST,
      S_AXI_HP0_RREADY => axi_mem_intercon_M00_AXI_RREADY,
      S_AXI_HP0_RRESP(1 downto 0) => axi_mem_intercon_M00_AXI_RRESP(1 downto 0),
      S_AXI_HP0_RVALID => axi_mem_intercon_M00_AXI_RVALID,
      S_AXI_HP0_WACOUNT(5 downto 0) => NLW_PS7_S_AXI_HP0_WACOUNT_UNCONNECTED(5 downto 0),
      S_AXI_HP0_WCOUNT(7 downto 0) => NLW_PS7_S_AXI_HP0_WCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP0_WDATA(63 downto 0) => axi_mem_intercon_M00_AXI_WDATA(63 downto 0),
      S_AXI_HP0_WID(5 downto 1) => B"00000",
      S_AXI_HP0_WID(0) => axi_mem_intercon_M00_AXI_WID(0),
      S_AXI_HP0_WLAST => axi_mem_intercon_M00_AXI_WLAST,
      S_AXI_HP0_WREADY => axi_mem_intercon_M00_AXI_WREADY,
      S_AXI_HP0_WRISSUECAP1_EN => '0',
      S_AXI_HP0_WSTRB(7 downto 0) => axi_mem_intercon_M00_AXI_WSTRB(7 downto 0),
      S_AXI_HP0_WVALID => axi_mem_intercon_M00_AXI_WVALID
    );
PS7_axi_periph: entity work.zynq_soc_PS7_axi_periph_0
     port map (
      ACLK => processing_system7_0_FCLK_CLK0,
      ARESETN => SYSTEM_RESETS_interconnect_aresetn,
      M00_ACLK => processing_system7_0_FCLK_CLK0,
      M00_ARESETN => rst_PS7_150M_peripheral_aresetn,
      M00_AXI_araddr(31 downto 0) => PS7_axi_periph_M00_AXI_ARADDR(31 downto 0),
      M00_AXI_arready => PS7_axi_periph_M00_AXI_ARREADY,
      M00_AXI_arvalid => PS7_axi_periph_M00_AXI_ARVALID,
      M00_AXI_awaddr(31 downto 0) => PS7_axi_periph_M00_AXI_AWADDR(31 downto 0),
      M00_AXI_awready => PS7_axi_periph_M00_AXI_AWREADY,
      M00_AXI_awvalid => PS7_axi_periph_M00_AXI_AWVALID,
      M00_AXI_bready => PS7_axi_periph_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => PS7_axi_periph_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => PS7_axi_periph_M00_AXI_BVALID,
      M00_AXI_rdata(31 downto 0) => PS7_axi_periph_M00_AXI_RDATA(31 downto 0),
      M00_AXI_rready => PS7_axi_periph_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => PS7_axi_periph_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => PS7_axi_periph_M00_AXI_RVALID,
      M00_AXI_wdata(31 downto 0) => PS7_axi_periph_M00_AXI_WDATA(31 downto 0),
      M00_AXI_wready => PS7_axi_periph_M00_AXI_WREADY,
      M00_AXI_wvalid => PS7_axi_periph_M00_AXI_WVALID,
      M01_ACLK => processing_system7_0_FCLK_CLK0,
      M01_ARESETN => rst_PS7_150M_peripheral_aresetn,
      M01_AXI_araddr(31 downto 0) => PS7_axi_periph_M01_AXI_ARADDR(31 downto 0),
      M01_AXI_arprot(2 downto 0) => PS7_axi_periph_M01_AXI_ARPROT(2 downto 0),
      M01_AXI_arready => PS7_axi_periph_M01_AXI_ARREADY,
      M01_AXI_arvalid => PS7_axi_periph_M01_AXI_ARVALID,
      M01_AXI_awaddr(31 downto 0) => PS7_axi_periph_M01_AXI_AWADDR(31 downto 0),
      M01_AXI_awprot(2 downto 0) => PS7_axi_periph_M01_AXI_AWPROT(2 downto 0),
      M01_AXI_awready => PS7_axi_periph_M01_AXI_AWREADY,
      M01_AXI_awvalid => PS7_axi_periph_M01_AXI_AWVALID,
      M01_AXI_bready => PS7_axi_periph_M01_AXI_BREADY,
      M01_AXI_bresp(1 downto 0) => PS7_axi_periph_M01_AXI_BRESP(1 downto 0),
      M01_AXI_bvalid => PS7_axi_periph_M01_AXI_BVALID,
      M01_AXI_rdata(31 downto 0) => PS7_axi_periph_M01_AXI_RDATA(31 downto 0),
      M01_AXI_rready => PS7_axi_periph_M01_AXI_RREADY,
      M01_AXI_rresp(1 downto 0) => PS7_axi_periph_M01_AXI_RRESP(1 downto 0),
      M01_AXI_rvalid => PS7_axi_periph_M01_AXI_RVALID,
      M01_AXI_wdata(31 downto 0) => PS7_axi_periph_M01_AXI_WDATA(31 downto 0),
      M01_AXI_wready => PS7_axi_periph_M01_AXI_WREADY,
      M01_AXI_wstrb(3 downto 0) => PS7_axi_periph_M01_AXI_WSTRB(3 downto 0),
      M01_AXI_wvalid => PS7_axi_periph_M01_AXI_WVALID,
      M02_ACLK => PS7_FCLK_CLK2,
      M02_ARESETN => M02_ARESETN_1,
      M02_AXI_araddr(8 downto 0) => Conn1_ARADDR(8 downto 0),
      M02_AXI_arready => Conn1_ARREADY,
      M02_AXI_arvalid => Conn1_ARVALID,
      M02_AXI_awaddr(8 downto 0) => Conn1_AWADDR(8 downto 0),
      M02_AXI_awready => Conn1_AWREADY,
      M02_AXI_awvalid => Conn1_AWVALID,
      M02_AXI_bready => Conn1_BREADY,
      M02_AXI_bresp(1 downto 0) => Conn1_BRESP(1 downto 0),
      M02_AXI_bvalid => Conn1_BVALID,
      M02_AXI_rdata(31 downto 0) => Conn1_RDATA(31 downto 0),
      M02_AXI_rready => Conn1_RREADY,
      M02_AXI_rresp(1 downto 0) => Conn1_RRESP(1 downto 0),
      M02_AXI_rvalid => Conn1_RVALID,
      M02_AXI_wdata(31 downto 0) => Conn1_WDATA(31 downto 0),
      M02_AXI_wready => Conn1_WREADY,
      M02_AXI_wstrb(3 downto 0) => Conn1_WSTRB(3 downto 0),
      M02_AXI_wvalid => Conn1_WVALID,
      M03_ACLK => PS7_FCLK_CLK2,
      M03_ARESETN => M02_ARESETN_1,
      M03_AXI_araddr(8 downto 0) => Conn2_ARADDR(8 downto 0),
      M03_AXI_arready => Conn2_ARREADY,
      M03_AXI_arvalid => Conn2_ARVALID,
      M03_AXI_awaddr(8 downto 0) => Conn2_AWADDR(8 downto 0),
      M03_AXI_awready => Conn2_AWREADY,
      M03_AXI_awvalid => Conn2_AWVALID,
      M03_AXI_bready => Conn2_BREADY,
      M03_AXI_bresp(1 downto 0) => Conn2_BRESP(1 downto 0),
      M03_AXI_bvalid => Conn2_BVALID,
      M03_AXI_rdata(31 downto 0) => Conn2_RDATA(31 downto 0),
      M03_AXI_rready => Conn2_RREADY,
      M03_AXI_rresp(1 downto 0) => Conn2_RRESP(1 downto 0),
      M03_AXI_rvalid => Conn2_RVALID,
      M03_AXI_wdata(31 downto 0) => Conn2_WDATA(31 downto 0),
      M03_AXI_wready => Conn2_WREADY,
      M03_AXI_wstrb(3 downto 0) => Conn2_WSTRB(3 downto 0),
      M03_AXI_wvalid => Conn2_WVALID,
      M04_ACLK => processing_system7_0_FCLK_CLK0,
      M04_ARESETN => rst_PS7_150M_peripheral_aresetn,
      M04_AXI_araddr(31 downto 0) => Conn3_ARADDR(31 downto 0),
      M04_AXI_arprot(2 downto 0) => Conn3_ARPROT(2 downto 0),
      M04_AXI_arready(0) => Conn3_ARREADY(0),
      M04_AXI_arvalid(0) => Conn3_ARVALID(0),
      M04_AXI_awaddr(31 downto 0) => Conn3_AWADDR(31 downto 0),
      M04_AXI_awprot(2 downto 0) => Conn3_AWPROT(2 downto 0),
      M04_AXI_awready(0) => Conn3_AWREADY(0),
      M04_AXI_awvalid(0) => Conn3_AWVALID(0),
      M04_AXI_bready(0) => Conn3_BREADY(0),
      M04_AXI_bresp(1 downto 0) => Conn3_BRESP(1 downto 0),
      M04_AXI_bvalid(0) => Conn3_BVALID(0),
      M04_AXI_rdata(31 downto 0) => Conn3_RDATA(31 downto 0),
      M04_AXI_rready(0) => Conn3_RREADY(0),
      M04_AXI_rresp(1 downto 0) => Conn3_RRESP(1 downto 0),
      M04_AXI_rvalid(0) => Conn3_RVALID(0),
      M04_AXI_wdata(31 downto 0) => Conn3_WDATA(31 downto 0),
      M04_AXI_wready(0) => Conn3_WREADY(0),
      M04_AXI_wstrb(3 downto 0) => Conn3_WSTRB(3 downto 0),
      M04_AXI_wvalid(0) => Conn3_WVALID(0),
      M05_ACLK => processing_system7_0_FCLK_CLK0,
      M05_ARESETN => rst_PS7_150M_peripheral_aresetn,
      M05_AXI_araddr(31 downto 0) => Conn4_ARADDR(31 downto 0),
      M05_AXI_arready => Conn4_ARREADY,
      M05_AXI_arvalid => Conn4_ARVALID,
      M05_AXI_awaddr(31 downto 0) => Conn4_AWADDR(31 downto 0),
      M05_AXI_awready => Conn4_AWREADY,
      M05_AXI_awvalid => Conn4_AWVALID,
      M05_AXI_bready => Conn4_BREADY,
      M05_AXI_bresp(1 downto 0) => Conn4_BRESP(1 downto 0),
      M05_AXI_bvalid => Conn4_BVALID,
      M05_AXI_rdata(31 downto 0) => Conn4_RDATA(31 downto 0),
      M05_AXI_rready => Conn4_RREADY,
      M05_AXI_rresp(1 downto 0) => Conn4_RRESP(1 downto 0),
      M05_AXI_rvalid => Conn4_RVALID,
      M05_AXI_wdata(31 downto 0) => Conn4_WDATA(31 downto 0),
      M05_AXI_wready => Conn4_WREADY,
      M05_AXI_wstrb(3 downto 0) => Conn4_WSTRB(3 downto 0),
      M05_AXI_wvalid => Conn4_WVALID,
      M06_ACLK => processing_system7_0_FCLK_CLK0,
      M06_ARESETN => rst_PS7_150M_peripheral_aresetn,
      M06_AXI_araddr(31 downto 0) => Conn5_ARADDR(31 downto 0),
      M06_AXI_arready(0) => Conn5_ARREADY(0),
      M06_AXI_arvalid(0) => Conn5_ARVALID(0),
      M06_AXI_awaddr(31 downto 0) => Conn5_AWADDR(31 downto 0),
      M06_AXI_awready(0) => Conn5_AWREADY(0),
      M06_AXI_awvalid(0) => Conn5_AWVALID(0),
      M06_AXI_bready(0) => Conn5_BREADY(0),
      M06_AXI_bresp(1 downto 0) => Conn5_BRESP(1 downto 0),
      M06_AXI_bvalid(0) => Conn5_BVALID(0),
      M06_AXI_rdata(31 downto 0) => Conn5_RDATA(31 downto 0),
      M06_AXI_rready(0) => Conn5_RREADY(0),
      M06_AXI_rresp(1 downto 0) => Conn5_RRESP(1 downto 0),
      M06_AXI_rvalid(0) => Conn5_RVALID(0),
      M06_AXI_wdata(31 downto 0) => Conn5_WDATA(31 downto 0),
      M06_AXI_wready(0) => Conn5_WREADY(0),
      M06_AXI_wstrb(3 downto 0) => Conn5_WSTRB(3 downto 0),
      M06_AXI_wvalid(0) => Conn5_WVALID(0),
      M07_ACLK => processing_system7_0_FCLK_CLK0,
      M07_ARESETN => rst_PS7_150M_peripheral_aresetn,
      M07_AXI_araddr(31 downto 0) => Conn6_ARADDR(31 downto 0),
      M07_AXI_arready(0) => Conn6_ARREADY(0),
      M07_AXI_arvalid(0) => Conn6_ARVALID(0),
      M07_AXI_awaddr(31 downto 0) => Conn6_AWADDR(31 downto 0),
      M07_AXI_awready(0) => Conn6_AWREADY(0),
      M07_AXI_awvalid(0) => Conn6_AWVALID(0),
      M07_AXI_bready(0) => Conn6_BREADY(0),
      M07_AXI_bresp(1 downto 0) => Conn6_BRESP(1 downto 0),
      M07_AXI_bvalid(0) => Conn6_BVALID(0),
      M07_AXI_rdata(31 downto 0) => Conn6_RDATA(31 downto 0),
      M07_AXI_rready(0) => Conn6_RREADY(0),
      M07_AXI_rresp(1 downto 0) => Conn6_RRESP(1 downto 0),
      M07_AXI_rvalid(0) => Conn6_RVALID(0),
      M07_AXI_wdata(31 downto 0) => Conn6_WDATA(31 downto 0),
      M07_AXI_wready(0) => Conn6_WREADY(0),
      M07_AXI_wstrb(3 downto 0) => Conn6_WSTRB(3 downto 0),
      M07_AXI_wvalid(0) => Conn6_WVALID(0),
      S00_ACLK => processing_system7_0_FCLK_CLK0,
      S00_ARESETN => rst_PS7_150M_peripheral_aresetn,
      S00_AXI_araddr(31 downto 0) => PS7_M_AXI_GP0_ARADDR(31 downto 0),
      S00_AXI_arburst(1 downto 0) => PS7_M_AXI_GP0_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => PS7_M_AXI_GP0_ARCACHE(3 downto 0),
      S00_AXI_arid(11 downto 0) => PS7_M_AXI_GP0_ARID(11 downto 0),
      S00_AXI_arlen(3 downto 0) => PS7_M_AXI_GP0_ARLEN(3 downto 0),
      S00_AXI_arlock(1 downto 0) => PS7_M_AXI_GP0_ARLOCK(1 downto 0),
      S00_AXI_arprot(2 downto 0) => PS7_M_AXI_GP0_ARPROT(2 downto 0),
      S00_AXI_arqos(3 downto 0) => PS7_M_AXI_GP0_ARQOS(3 downto 0),
      S00_AXI_arready => PS7_M_AXI_GP0_ARREADY,
      S00_AXI_arsize(2 downto 0) => PS7_M_AXI_GP0_ARSIZE(2 downto 0),
      S00_AXI_arvalid => PS7_M_AXI_GP0_ARVALID,
      S00_AXI_awaddr(31 downto 0) => PS7_M_AXI_GP0_AWADDR(31 downto 0),
      S00_AXI_awburst(1 downto 0) => PS7_M_AXI_GP0_AWBURST(1 downto 0),
      S00_AXI_awcache(3 downto 0) => PS7_M_AXI_GP0_AWCACHE(3 downto 0),
      S00_AXI_awid(11 downto 0) => PS7_M_AXI_GP0_AWID(11 downto 0),
      S00_AXI_awlen(3 downto 0) => PS7_M_AXI_GP0_AWLEN(3 downto 0),
      S00_AXI_awlock(1 downto 0) => PS7_M_AXI_GP0_AWLOCK(1 downto 0),
      S00_AXI_awprot(2 downto 0) => PS7_M_AXI_GP0_AWPROT(2 downto 0),
      S00_AXI_awqos(3 downto 0) => PS7_M_AXI_GP0_AWQOS(3 downto 0),
      S00_AXI_awready => PS7_M_AXI_GP0_AWREADY,
      S00_AXI_awsize(2 downto 0) => PS7_M_AXI_GP0_AWSIZE(2 downto 0),
      S00_AXI_awvalid => PS7_M_AXI_GP0_AWVALID,
      S00_AXI_bid(11 downto 0) => PS7_M_AXI_GP0_BID(11 downto 0),
      S00_AXI_bready => PS7_M_AXI_GP0_BREADY,
      S00_AXI_bresp(1 downto 0) => PS7_M_AXI_GP0_BRESP(1 downto 0),
      S00_AXI_bvalid => PS7_M_AXI_GP0_BVALID,
      S00_AXI_rdata(31 downto 0) => PS7_M_AXI_GP0_RDATA(31 downto 0),
      S00_AXI_rid(11 downto 0) => PS7_M_AXI_GP0_RID(11 downto 0),
      S00_AXI_rlast => PS7_M_AXI_GP0_RLAST,
      S00_AXI_rready => PS7_M_AXI_GP0_RREADY,
      S00_AXI_rresp(1 downto 0) => PS7_M_AXI_GP0_RRESP(1 downto 0),
      S00_AXI_rvalid => PS7_M_AXI_GP0_RVALID,
      S00_AXI_wdata(31 downto 0) => PS7_M_AXI_GP0_WDATA(31 downto 0),
      S00_AXI_wid(11 downto 0) => PS7_M_AXI_GP0_WID(11 downto 0),
      S00_AXI_wlast => PS7_M_AXI_GP0_WLAST,
      S00_AXI_wready => PS7_M_AXI_GP0_WREADY,
      S00_AXI_wstrb(3 downto 0) => PS7_M_AXI_GP0_WSTRB(3 downto 0),
      S00_AXI_wvalid => PS7_M_AXI_GP0_WVALID
    );
Sine_0: component zynq_soc_Sine_0_0
     port map (
      ctrl_saxi_aclk => processing_system7_0_FCLK_CLK0,
      ctrl_saxi_araddr(6 downto 0) => PS7_axi_periph_M01_AXI_ARADDR(6 downto 0),
      ctrl_saxi_aresetn => rst_PS7_150M_peripheral_aresetn,
      ctrl_saxi_arprot(2 downto 0) => PS7_axi_periph_M01_AXI_ARPROT(2 downto 0),
      ctrl_saxi_arready => PS7_axi_periph_M01_AXI_ARREADY,
      ctrl_saxi_arvalid => PS7_axi_periph_M01_AXI_ARVALID,
      ctrl_saxi_awaddr(6 downto 0) => PS7_axi_periph_M01_AXI_AWADDR(6 downto 0),
      ctrl_saxi_awprot(2 downto 0) => PS7_axi_periph_M01_AXI_AWPROT(2 downto 0),
      ctrl_saxi_awready => PS7_axi_periph_M01_AXI_AWREADY,
      ctrl_saxi_awvalid => PS7_axi_periph_M01_AXI_AWVALID,
      ctrl_saxi_bready => PS7_axi_periph_M01_AXI_BREADY,
      ctrl_saxi_bresp(1 downto 0) => PS7_axi_periph_M01_AXI_BRESP(1 downto 0),
      ctrl_saxi_bvalid => PS7_axi_periph_M01_AXI_BVALID,
      ctrl_saxi_rdata(31 downto 0) => PS7_axi_periph_M01_AXI_RDATA(31 downto 0),
      ctrl_saxi_rready => PS7_axi_periph_M01_AXI_RREADY,
      ctrl_saxi_rresp(1 downto 0) => PS7_axi_periph_M01_AXI_RRESP(1 downto 0),
      ctrl_saxi_rvalid => PS7_axi_periph_M01_AXI_RVALID,
      ctrl_saxi_wdata(31 downto 0) => PS7_axi_periph_M01_AXI_WDATA(31 downto 0),
      ctrl_saxi_wready => PS7_axi_periph_M01_AXI_WREADY,
      ctrl_saxi_wstrb(3 downto 0) => PS7_axi_periph_M01_AXI_WSTRB(3 downto 0),
      ctrl_saxi_wvalid => PS7_axi_periph_M01_AXI_WVALID
    );
axi_mem_intercon: entity work.zynq_soc_axi_mem_intercon_0
     port map (
      ACLK => processing_system7_0_FCLK_CLK0,
      ARESETN => SYSTEM_RESETS_interconnect_aresetn,
      M00_ACLK => processing_system7_0_FCLK_CLK0,
      M00_ARESETN => rst_PS7_150M_peripheral_aresetn,
      M00_AXI_araddr(31 downto 0) => axi_mem_intercon_M00_AXI_ARADDR(31 downto 0),
      M00_AXI_arburst(1 downto 0) => axi_mem_intercon_M00_AXI_ARBURST(1 downto 0),
      M00_AXI_arcache(3 downto 0) => axi_mem_intercon_M00_AXI_ARCACHE(3 downto 0),
      M00_AXI_arid(0) => axi_mem_intercon_M00_AXI_ARID(0),
      M00_AXI_arlen(3 downto 0) => axi_mem_intercon_M00_AXI_ARLEN(3 downto 0),
      M00_AXI_arlock(1 downto 0) => axi_mem_intercon_M00_AXI_ARLOCK(1 downto 0),
      M00_AXI_arprot(2 downto 0) => axi_mem_intercon_M00_AXI_ARPROT(2 downto 0),
      M00_AXI_arqos(3 downto 0) => axi_mem_intercon_M00_AXI_ARQOS(3 downto 0),
      M00_AXI_arready => axi_mem_intercon_M00_AXI_ARREADY,
      M00_AXI_arsize(2 downto 0) => axi_mem_intercon_M00_AXI_ARSIZE(2 downto 0),
      M00_AXI_arvalid => axi_mem_intercon_M00_AXI_ARVALID,
      M00_AXI_awaddr(31 downto 0) => axi_mem_intercon_M00_AXI_AWADDR(31 downto 0),
      M00_AXI_awburst(1 downto 0) => axi_mem_intercon_M00_AXI_AWBURST(1 downto 0),
      M00_AXI_awcache(3 downto 0) => axi_mem_intercon_M00_AXI_AWCACHE(3 downto 0),
      M00_AXI_awid(0) => axi_mem_intercon_M00_AXI_AWID(0),
      M00_AXI_awlen(3 downto 0) => axi_mem_intercon_M00_AXI_AWLEN(3 downto 0),
      M00_AXI_awlock(1 downto 0) => axi_mem_intercon_M00_AXI_AWLOCK(1 downto 0),
      M00_AXI_awprot(2 downto 0) => axi_mem_intercon_M00_AXI_AWPROT(2 downto 0),
      M00_AXI_awqos(3 downto 0) => axi_mem_intercon_M00_AXI_AWQOS(3 downto 0),
      M00_AXI_awready => axi_mem_intercon_M00_AXI_AWREADY,
      M00_AXI_awsize(2 downto 0) => axi_mem_intercon_M00_AXI_AWSIZE(2 downto 0),
      M00_AXI_awvalid => axi_mem_intercon_M00_AXI_AWVALID,
      M00_AXI_bid(5 downto 0) => axi_mem_intercon_M00_AXI_BID(5 downto 0),
      M00_AXI_bready => axi_mem_intercon_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => axi_mem_intercon_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => axi_mem_intercon_M00_AXI_BVALID,
      M00_AXI_rdata(63 downto 0) => axi_mem_intercon_M00_AXI_RDATA(63 downto 0),
      M00_AXI_rid(5 downto 0) => axi_mem_intercon_M00_AXI_RID(5 downto 0),
      M00_AXI_rlast => axi_mem_intercon_M00_AXI_RLAST,
      M00_AXI_rready => axi_mem_intercon_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => axi_mem_intercon_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => axi_mem_intercon_M00_AXI_RVALID,
      M00_AXI_wdata(63 downto 0) => axi_mem_intercon_M00_AXI_WDATA(63 downto 0),
      M00_AXI_wid(0) => axi_mem_intercon_M00_AXI_WID(0),
      M00_AXI_wlast => axi_mem_intercon_M00_AXI_WLAST,
      M00_AXI_wready => axi_mem_intercon_M00_AXI_WREADY,
      M00_AXI_wstrb(7 downto 0) => axi_mem_intercon_M00_AXI_WSTRB(7 downto 0),
      M00_AXI_wvalid => axi_mem_intercon_M00_AXI_WVALID,
      S00_ACLK => processing_system7_0_FCLK_CLK0,
      S00_ARESETN => rst_PS7_150M_peripheral_aresetn,
      S00_AXI_araddr(31 downto 0) => VDMA1_M_AXI_MM2S_ARADDR(31 downto 0),
      S00_AXI_arburst(1 downto 0) => VDMA1_M_AXI_MM2S_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => VDMA1_M_AXI_MM2S_ARCACHE(3 downto 0),
      S00_AXI_arlen(7 downto 0) => VDMA1_M_AXI_MM2S_ARLEN(7 downto 0),
      S00_AXI_arprot(2 downto 0) => VDMA1_M_AXI_MM2S_ARPROT(2 downto 0),
      S00_AXI_arready => VDMA1_M_AXI_MM2S_ARREADY,
      S00_AXI_arsize(2 downto 0) => VDMA1_M_AXI_MM2S_ARSIZE(2 downto 0),
      S00_AXI_arvalid => VDMA1_M_AXI_MM2S_ARVALID,
      S00_AXI_rdata(63 downto 0) => VDMA1_M_AXI_MM2S_RDATA(63 downto 0),
      S00_AXI_rlast => VDMA1_M_AXI_MM2S_RLAST,
      S00_AXI_rready => VDMA1_M_AXI_MM2S_RREADY,
      S00_AXI_rresp(1 downto 0) => VDMA1_M_AXI_MM2S_RRESP(1 downto 0),
      S00_AXI_rvalid => VDMA1_M_AXI_MM2S_RVALID,
      S01_ACLK => processing_system7_0_FCLK_CLK0,
      S01_ARESETN => rst_PS7_150M_peripheral_aresetn,
      S01_AXI_awaddr(31 downto 0) => VDMA1_M_AXI_S2MM_AWADDR(31 downto 0),
      S01_AXI_awburst(1 downto 0) => VDMA1_M_AXI_S2MM_AWBURST(1 downto 0),
      S01_AXI_awcache(3 downto 0) => VDMA1_M_AXI_S2MM_AWCACHE(3 downto 0),
      S01_AXI_awlen(7 downto 0) => VDMA1_M_AXI_S2MM_AWLEN(7 downto 0),
      S01_AXI_awprot(2 downto 0) => VDMA1_M_AXI_S2MM_AWPROT(2 downto 0),
      S01_AXI_awready => VDMA1_M_AXI_S2MM_AWREADY,
      S01_AXI_awsize(2 downto 0) => VDMA1_M_AXI_S2MM_AWSIZE(2 downto 0),
      S01_AXI_awvalid => VDMA1_M_AXI_S2MM_AWVALID,
      S01_AXI_bready => VDMA1_M_AXI_S2MM_BREADY,
      S01_AXI_bresp(1 downto 0) => VDMA1_M_AXI_S2MM_BRESP(1 downto 0),
      S01_AXI_bvalid => VDMA1_M_AXI_S2MM_BVALID,
      S01_AXI_wdata(63 downto 0) => VDMA1_M_AXI_S2MM_WDATA(63 downto 0),
      S01_AXI_wlast => VDMA1_M_AXI_S2MM_WLAST,
      S01_AXI_wready => VDMA1_M_AXI_S2MM_WREADY,
      S01_AXI_wstrb(7 downto 0) => VDMA1_M_AXI_S2MM_WSTRB(7 downto 0),
      S01_AXI_wvalid => VDMA1_M_AXI_S2MM_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity PS_imp_1YJSW6I is
  port (
    CLK_100MHZ : out STD_LOGIC;
    CLK_150MHZ : out STD_LOGIC;
    CLK_75MHZ : out STD_LOGIC;
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    M02_AXI_araddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M02_AXI_arready : in STD_LOGIC;
    M02_AXI_arvalid : out STD_LOGIC;
    M02_AXI_awaddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M02_AXI_awready : in STD_LOGIC;
    M02_AXI_awvalid : out STD_LOGIC;
    M02_AXI_bready : out STD_LOGIC;
    M02_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_bvalid : in STD_LOGIC;
    M02_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_rready : out STD_LOGIC;
    M02_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_rvalid : in STD_LOGIC;
    M02_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_wready : in STD_LOGIC;
    M02_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M02_AXI_wvalid : out STD_LOGIC;
    M03_AXI_araddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M03_AXI_arready : in STD_LOGIC;
    M03_AXI_arvalid : out STD_LOGIC;
    M03_AXI_awaddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M03_AXI_awready : in STD_LOGIC;
    M03_AXI_awvalid : out STD_LOGIC;
    M03_AXI_bready : out STD_LOGIC;
    M03_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_bvalid : in STD_LOGIC;
    M03_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_rready : out STD_LOGIC;
    M03_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_rvalid : in STD_LOGIC;
    M03_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_wready : in STD_LOGIC;
    M03_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M03_AXI_wvalid : out STD_LOGIC;
    M04_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M04_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M04_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M04_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_arready : in STD_LOGIC;
    M05_AXI_arvalid : out STD_LOGIC;
    M05_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_awready : in STD_LOGIC;
    M05_AXI_awvalid : out STD_LOGIC;
    M05_AXI_bready : out STD_LOGIC;
    M05_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_bvalid : in STD_LOGIC;
    M05_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_rready : out STD_LOGIC;
    M05_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_rvalid : in STD_LOGIC;
    M05_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_wready : in STD_LOGIC;
    M05_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_wvalid : out STD_LOGIC;
    M06_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M06_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M07_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M07_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M07_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIS_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXIS_tlast : out STD_LOGIC;
    M_AXIS_tready : in STD_LOGIC;
    M_AXIS_tuser : out STD_LOGIC;
    M_AXIS_tvalid : out STD_LOGIC;
    S_AXIS_S2MM_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXIS_S2MM_tkeep : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXIS_S2MM_tlast : in STD_LOGIC;
    S_AXIS_S2MM_tready : out STD_LOGIC;
    S_AXIS_S2MM_tuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXIS_S2MM_tvalid : in STD_LOGIC;
    aresetn150Mhz : in STD_LOGIC;
    aresetn75Mhz : in STD_LOGIC;
    iaresetn150Mhz : in STD_LOGIC;
    master_aresetn : out STD_LOGIC
  );
end PS_imp_1YJSW6I;

architecture STRUCTURE of PS_imp_1YJSW6I is
  signal Conn1_ARADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal Conn1_ARREADY : STD_LOGIC;
  signal Conn1_ARVALID : STD_LOGIC;
  signal Conn1_AWADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal Conn1_AWREADY : STD_LOGIC;
  signal Conn1_AWVALID : STD_LOGIC;
  signal Conn1_BREADY : STD_LOGIC;
  signal Conn1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn1_BVALID : STD_LOGIC;
  signal Conn1_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn1_RREADY : STD_LOGIC;
  signal Conn1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn1_RVALID : STD_LOGIC;
  signal Conn1_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn1_WREADY : STD_LOGIC;
  signal Conn1_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn1_WVALID : STD_LOGIC;
  signal Conn2_ARADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal Conn2_ARREADY : STD_LOGIC;
  signal Conn2_ARVALID : STD_LOGIC;
  signal Conn2_AWADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal Conn2_AWREADY : STD_LOGIC;
  signal Conn2_AWVALID : STD_LOGIC;
  signal Conn2_BREADY : STD_LOGIC;
  signal Conn2_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn2_BVALID : STD_LOGIC;
  signal Conn2_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn2_RREADY : STD_LOGIC;
  signal Conn2_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn2_RVALID : STD_LOGIC;
  signal Conn2_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn2_WREADY : STD_LOGIC;
  signal Conn2_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn2_WVALID : STD_LOGIC;
  signal Conn3_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn3_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal Conn3_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn3_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn3_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn3_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal Conn3_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn3_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn3_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn3_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn3_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn3_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn3_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn3_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn3_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn3_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn3_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn3_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn3_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn4_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn4_ARREADY : STD_LOGIC;
  signal Conn4_ARVALID : STD_LOGIC;
  signal Conn4_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn4_AWREADY : STD_LOGIC;
  signal Conn4_AWVALID : STD_LOGIC;
  signal Conn4_BREADY : STD_LOGIC;
  signal Conn4_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn4_BVALID : STD_LOGIC;
  signal Conn4_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn4_RREADY : STD_LOGIC;
  signal Conn4_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn4_RVALID : STD_LOGIC;
  signal Conn4_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn4_WREADY : STD_LOGIC;
  signal Conn4_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn4_WVALID : STD_LOGIC;
  signal Conn5_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn5_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn5_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn5_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn5_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn5_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn5_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn5_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn5_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn5_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn5_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn5_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn5_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn5_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn5_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn5_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn5_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn6_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn6_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn6_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn6_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn6_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn6_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn6_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn6_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn6_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn6_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn6_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn6_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn6_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn6_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn6_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn6_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn6_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M02_ARESETN_1 : STD_LOGIC;
  signal PS7_FCLK_CLK2 : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M00_AXI_ARREADY : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_ARVALID : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M00_AXI_AWREADY : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_AWVALID : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_BREADY : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_M00_AXI_BVALID : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M00_AXI_RREADY : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_M00_AXI_RVALID : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M00_AXI_WREADY : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_WVALID : STD_LOGIC;
  signal PS_VIDEO_DDR_ADDR : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal PS_VIDEO_DDR_BA : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal PS_VIDEO_DDR_CAS_N : STD_LOGIC;
  signal PS_VIDEO_DDR_CKE : STD_LOGIC;
  signal PS_VIDEO_DDR_CK_N : STD_LOGIC;
  signal PS_VIDEO_DDR_CK_P : STD_LOGIC;
  signal PS_VIDEO_DDR_CS_N : STD_LOGIC;
  signal PS_VIDEO_DDR_DM : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS_VIDEO_DDR_DQ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS_VIDEO_DDR_DQS_N : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS_VIDEO_DDR_DQS_P : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS_VIDEO_DDR_ODT : STD_LOGIC;
  signal PS_VIDEO_DDR_RAS_N : STD_LOGIC;
  signal PS_VIDEO_DDR_RESET_N : STD_LOGIC;
  signal PS_VIDEO_DDR_WE_N : STD_LOGIC;
  signal PS_VIDEO_FCLK_CLK1 : STD_LOGIC;
  signal PS_VIDEO_FCLK_RESET0_N : STD_LOGIC;
  signal PS_VIDEO_FIXED_IO_DDR_VRN : STD_LOGIC;
  signal PS_VIDEO_FIXED_IO_DDR_VRP : STD_LOGIC;
  signal PS_VIDEO_FIXED_IO_MIO : STD_LOGIC_VECTOR ( 53 downto 0 );
  signal PS_VIDEO_FIXED_IO_PS_CLK : STD_LOGIC;
  signal PS_VIDEO_FIXED_IO_PS_PORB : STD_LOGIC;
  signal PS_VIDEO_FIXED_IO_PS_SRSTB : STD_LOGIC;
  signal PS_VIDEO_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal PS_VIDEO_M_AXIS_TLAST : STD_LOGIC;
  signal PS_VIDEO_M_AXIS_TREADY : STD_LOGIC;
  signal PS_VIDEO_M_AXIS_TUSER : STD_LOGIC;
  signal PS_VIDEO_M_AXIS_TVALID : STD_LOGIC;
  signal SYSTEM_RESETS_interconnect_aresetn : STD_LOGIC;
  signal VDMA1_M_AXI_MM2S_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal VDMA1_M_AXI_MM2S_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal VDMA1_M_AXI_MM2S_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal VDMA1_M_AXI_MM2S_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal VDMA1_M_AXI_MM2S_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal VDMA1_M_AXI_MM2S_ARREADY : STD_LOGIC;
  signal VDMA1_M_AXI_MM2S_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal VDMA1_M_AXI_MM2S_ARVALID : STD_LOGIC;
  signal VDMA1_M_AXI_MM2S_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal VDMA1_M_AXI_MM2S_RLAST : STD_LOGIC;
  signal VDMA1_M_AXI_MM2S_RREADY : STD_LOGIC;
  signal VDMA1_M_AXI_MM2S_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal VDMA1_M_AXI_MM2S_RVALID : STD_LOGIC;
  signal VDMA1_M_AXI_S2MM_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal VDMA1_M_AXI_S2MM_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal VDMA1_M_AXI_S2MM_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal VDMA1_M_AXI_S2MM_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal VDMA1_M_AXI_S2MM_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal VDMA1_M_AXI_S2MM_AWREADY : STD_LOGIC;
  signal VDMA1_M_AXI_S2MM_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal VDMA1_M_AXI_S2MM_AWVALID : STD_LOGIC;
  signal VDMA1_M_AXI_S2MM_BREADY : STD_LOGIC;
  signal VDMA1_M_AXI_S2MM_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal VDMA1_M_AXI_S2MM_BVALID : STD_LOGIC;
  signal VDMA1_M_AXI_S2MM_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal VDMA1_M_AXI_S2MM_WLAST : STD_LOGIC;
  signal VDMA1_M_AXI_S2MM_WREADY : STD_LOGIC;
  signal VDMA1_M_AXI_S2MM_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal VDMA1_M_AXI_S2MM_WVALID : STD_LOGIC;
  signal processing_system7_0_FCLK_CLK0 : STD_LOGIC;
  signal rst_PS7_150M_peripheral_aresetn : STD_LOGIC;
  signal v_ccm_0_video_out_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal v_ccm_0_video_out_TKEEP : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal v_ccm_0_video_out_TLAST : STD_LOGIC;
  signal v_ccm_0_video_out_TREADY : STD_LOGIC;
  signal v_ccm_0_video_out_TUSER : STD_LOGIC_VECTOR ( 0 to 0 );
  signal v_ccm_0_video_out_TVALID : STD_LOGIC;
begin
  CLK_100MHZ <= PS_VIDEO_FCLK_CLK1;
  CLK_150MHZ <= processing_system7_0_FCLK_CLK0;
  CLK_75MHZ <= PS7_FCLK_CLK2;
  Conn1_ARREADY <= M02_AXI_arready;
  Conn1_AWREADY <= M02_AXI_awready;
  Conn1_BRESP(1 downto 0) <= M02_AXI_bresp(1 downto 0);
  Conn1_BVALID <= M02_AXI_bvalid;
  Conn1_RDATA(31 downto 0) <= M02_AXI_rdata(31 downto 0);
  Conn1_RRESP(1 downto 0) <= M02_AXI_rresp(1 downto 0);
  Conn1_RVALID <= M02_AXI_rvalid;
  Conn1_WREADY <= M02_AXI_wready;
  Conn2_ARREADY <= M03_AXI_arready;
  Conn2_AWREADY <= M03_AXI_awready;
  Conn2_BRESP(1 downto 0) <= M03_AXI_bresp(1 downto 0);
  Conn2_BVALID <= M03_AXI_bvalid;
  Conn2_RDATA(31 downto 0) <= M03_AXI_rdata(31 downto 0);
  Conn2_RRESP(1 downto 0) <= M03_AXI_rresp(1 downto 0);
  Conn2_RVALID <= M03_AXI_rvalid;
  Conn2_WREADY <= M03_AXI_wready;
  Conn3_ARREADY(0) <= M04_AXI_arready(0);
  Conn3_AWREADY(0) <= M04_AXI_awready(0);
  Conn3_BRESP(1 downto 0) <= M04_AXI_bresp(1 downto 0);
  Conn3_BVALID(0) <= M04_AXI_bvalid(0);
  Conn3_RDATA(31 downto 0) <= M04_AXI_rdata(31 downto 0);
  Conn3_RRESP(1 downto 0) <= M04_AXI_rresp(1 downto 0);
  Conn3_RVALID(0) <= M04_AXI_rvalid(0);
  Conn3_WREADY(0) <= M04_AXI_wready(0);
  Conn4_ARREADY <= M05_AXI_arready;
  Conn4_AWREADY <= M05_AXI_awready;
  Conn4_BRESP(1 downto 0) <= M05_AXI_bresp(1 downto 0);
  Conn4_BVALID <= M05_AXI_bvalid;
  Conn4_RDATA(31 downto 0) <= M05_AXI_rdata(31 downto 0);
  Conn4_RRESP(1 downto 0) <= M05_AXI_rresp(1 downto 0);
  Conn4_RVALID <= M05_AXI_rvalid;
  Conn4_WREADY <= M05_AXI_wready;
  Conn5_ARREADY(0) <= M06_AXI_arready(0);
  Conn5_AWREADY(0) <= M06_AXI_awready(0);
  Conn5_BRESP(1 downto 0) <= M06_AXI_bresp(1 downto 0);
  Conn5_BVALID(0) <= M06_AXI_bvalid(0);
  Conn5_RDATA(31 downto 0) <= M06_AXI_rdata(31 downto 0);
  Conn5_RRESP(1 downto 0) <= M06_AXI_rresp(1 downto 0);
  Conn5_RVALID(0) <= M06_AXI_rvalid(0);
  Conn5_WREADY(0) <= M06_AXI_wready(0);
  Conn6_ARREADY(0) <= M07_AXI_arready(0);
  Conn6_AWREADY(0) <= M07_AXI_awready(0);
  Conn6_BRESP(1 downto 0) <= M07_AXI_bresp(1 downto 0);
  Conn6_BVALID(0) <= M07_AXI_bvalid(0);
  Conn6_RDATA(31 downto 0) <= M07_AXI_rdata(31 downto 0);
  Conn6_RRESP(1 downto 0) <= M07_AXI_rresp(1 downto 0);
  Conn6_RVALID(0) <= M07_AXI_rvalid(0);
  Conn6_WREADY(0) <= M07_AXI_wready(0);
  M02_ARESETN_1 <= aresetn75Mhz;
  M02_AXI_araddr(8 downto 0) <= Conn1_ARADDR(8 downto 0);
  M02_AXI_arvalid <= Conn1_ARVALID;
  M02_AXI_awaddr(8 downto 0) <= Conn1_AWADDR(8 downto 0);
  M02_AXI_awvalid <= Conn1_AWVALID;
  M02_AXI_bready <= Conn1_BREADY;
  M02_AXI_rready <= Conn1_RREADY;
  M02_AXI_wdata(31 downto 0) <= Conn1_WDATA(31 downto 0);
  M02_AXI_wstrb(3 downto 0) <= Conn1_WSTRB(3 downto 0);
  M02_AXI_wvalid <= Conn1_WVALID;
  M03_AXI_araddr(8 downto 0) <= Conn2_ARADDR(8 downto 0);
  M03_AXI_arvalid <= Conn2_ARVALID;
  M03_AXI_awaddr(8 downto 0) <= Conn2_AWADDR(8 downto 0);
  M03_AXI_awvalid <= Conn2_AWVALID;
  M03_AXI_bready <= Conn2_BREADY;
  M03_AXI_rready <= Conn2_RREADY;
  M03_AXI_wdata(31 downto 0) <= Conn2_WDATA(31 downto 0);
  M03_AXI_wstrb(3 downto 0) <= Conn2_WSTRB(3 downto 0);
  M03_AXI_wvalid <= Conn2_WVALID;
  M04_AXI_araddr(31 downto 0) <= Conn3_ARADDR(31 downto 0);
  M04_AXI_arprot(2 downto 0) <= Conn3_ARPROT(2 downto 0);
  M04_AXI_arvalid(0) <= Conn3_ARVALID(0);
  M04_AXI_awaddr(31 downto 0) <= Conn3_AWADDR(31 downto 0);
  M04_AXI_awprot(2 downto 0) <= Conn3_AWPROT(2 downto 0);
  M04_AXI_awvalid(0) <= Conn3_AWVALID(0);
  M04_AXI_bready(0) <= Conn3_BREADY(0);
  M04_AXI_rready(0) <= Conn3_RREADY(0);
  M04_AXI_wdata(31 downto 0) <= Conn3_WDATA(31 downto 0);
  M04_AXI_wstrb(3 downto 0) <= Conn3_WSTRB(3 downto 0);
  M04_AXI_wvalid(0) <= Conn3_WVALID(0);
  M05_AXI_araddr(31 downto 0) <= Conn4_ARADDR(31 downto 0);
  M05_AXI_arvalid <= Conn4_ARVALID;
  M05_AXI_awaddr(31 downto 0) <= Conn4_AWADDR(31 downto 0);
  M05_AXI_awvalid <= Conn4_AWVALID;
  M05_AXI_bready <= Conn4_BREADY;
  M05_AXI_rready <= Conn4_RREADY;
  M05_AXI_wdata(31 downto 0) <= Conn4_WDATA(31 downto 0);
  M05_AXI_wstrb(3 downto 0) <= Conn4_WSTRB(3 downto 0);
  M05_AXI_wvalid <= Conn4_WVALID;
  M06_AXI_araddr(31 downto 0) <= Conn5_ARADDR(31 downto 0);
  M06_AXI_arvalid(0) <= Conn5_ARVALID(0);
  M06_AXI_awaddr(31 downto 0) <= Conn5_AWADDR(31 downto 0);
  M06_AXI_awvalid(0) <= Conn5_AWVALID(0);
  M06_AXI_bready(0) <= Conn5_BREADY(0);
  M06_AXI_rready(0) <= Conn5_RREADY(0);
  M06_AXI_wdata(31 downto 0) <= Conn5_WDATA(31 downto 0);
  M06_AXI_wstrb(3 downto 0) <= Conn5_WSTRB(3 downto 0);
  M06_AXI_wvalid(0) <= Conn5_WVALID(0);
  M07_AXI_araddr(31 downto 0) <= Conn6_ARADDR(31 downto 0);
  M07_AXI_arvalid(0) <= Conn6_ARVALID(0);
  M07_AXI_awaddr(31 downto 0) <= Conn6_AWADDR(31 downto 0);
  M07_AXI_awvalid(0) <= Conn6_AWVALID(0);
  M07_AXI_bready(0) <= Conn6_BREADY(0);
  M07_AXI_rready(0) <= Conn6_RREADY(0);
  M07_AXI_wdata(31 downto 0) <= Conn6_WDATA(31 downto 0);
  M07_AXI_wstrb(3 downto 0) <= Conn6_WSTRB(3 downto 0);
  M07_AXI_wvalid(0) <= Conn6_WVALID(0);
  M_AXIS_tdata(15 downto 0) <= PS_VIDEO_M_AXIS_TDATA(15 downto 0);
  M_AXIS_tlast <= PS_VIDEO_M_AXIS_TLAST;
  M_AXIS_tuser <= PS_VIDEO_M_AXIS_TUSER;
  M_AXIS_tvalid <= PS_VIDEO_M_AXIS_TVALID;
  PS_VIDEO_M_AXIS_TREADY <= M_AXIS_tready;
  SYSTEM_RESETS_interconnect_aresetn <= iaresetn150Mhz;
  S_AXIS_S2MM_tready <= v_ccm_0_video_out_TREADY;
  master_aresetn <= PS_VIDEO_FCLK_RESET0_N;
  rst_PS7_150M_peripheral_aresetn <= aresetn150Mhz;
  v_ccm_0_video_out_TDATA(15 downto 0) <= S_AXIS_S2MM_tdata(15 downto 0);
  v_ccm_0_video_out_TKEEP(2 downto 0) <= S_AXIS_S2MM_tkeep(2 downto 0);
  v_ccm_0_video_out_TLAST <= S_AXIS_S2MM_tlast;
  v_ccm_0_video_out_TUSER(0) <= S_AXIS_S2MM_tuser(0);
  v_ccm_0_video_out_TVALID <= S_AXIS_S2MM_tvalid;
TO_PS: entity work.TO_PS_imp_1M0D9Z7
     port map (
      CLK_100MHZ => PS_VIDEO_FCLK_CLK1,
      CLK_150MHZ => processing_system7_0_FCLK_CLK0,
      CLK_75MHZ => PS7_FCLK_CLK2,
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      M00_AXI_araddr(31 downto 0) => PS7_axi_periph_M00_AXI_ARADDR(31 downto 0),
      M00_AXI_arready => PS7_axi_periph_M00_AXI_ARREADY,
      M00_AXI_arvalid => PS7_axi_periph_M00_AXI_ARVALID,
      M00_AXI_awaddr(31 downto 0) => PS7_axi_periph_M00_AXI_AWADDR(31 downto 0),
      M00_AXI_awready => PS7_axi_periph_M00_AXI_AWREADY,
      M00_AXI_awvalid => PS7_axi_periph_M00_AXI_AWVALID,
      M00_AXI_bready => PS7_axi_periph_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => PS7_axi_periph_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => PS7_axi_periph_M00_AXI_BVALID,
      M00_AXI_rdata(31 downto 0) => PS7_axi_periph_M00_AXI_RDATA(31 downto 0),
      M00_AXI_rready => PS7_axi_periph_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => PS7_axi_periph_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => PS7_axi_periph_M00_AXI_RVALID,
      M00_AXI_wdata(31 downto 0) => PS7_axi_periph_M00_AXI_WDATA(31 downto 0),
      M00_AXI_wready => PS7_axi_periph_M00_AXI_WREADY,
      M00_AXI_wvalid => PS7_axi_periph_M00_AXI_WVALID,
      M02_AXI_araddr(8 downto 0) => Conn1_ARADDR(8 downto 0),
      M02_AXI_arready => Conn1_ARREADY,
      M02_AXI_arvalid => Conn1_ARVALID,
      M02_AXI_awaddr(8 downto 0) => Conn1_AWADDR(8 downto 0),
      M02_AXI_awready => Conn1_AWREADY,
      M02_AXI_awvalid => Conn1_AWVALID,
      M02_AXI_bready => Conn1_BREADY,
      M02_AXI_bresp(1 downto 0) => Conn1_BRESP(1 downto 0),
      M02_AXI_bvalid => Conn1_BVALID,
      M02_AXI_rdata(31 downto 0) => Conn1_RDATA(31 downto 0),
      M02_AXI_rready => Conn1_RREADY,
      M02_AXI_rresp(1 downto 0) => Conn1_RRESP(1 downto 0),
      M02_AXI_rvalid => Conn1_RVALID,
      M02_AXI_wdata(31 downto 0) => Conn1_WDATA(31 downto 0),
      M02_AXI_wready => Conn1_WREADY,
      M02_AXI_wstrb(3 downto 0) => Conn1_WSTRB(3 downto 0),
      M02_AXI_wvalid => Conn1_WVALID,
      M03_AXI_araddr(8 downto 0) => Conn2_ARADDR(8 downto 0),
      M03_AXI_arready => Conn2_ARREADY,
      M03_AXI_arvalid => Conn2_ARVALID,
      M03_AXI_awaddr(8 downto 0) => Conn2_AWADDR(8 downto 0),
      M03_AXI_awready => Conn2_AWREADY,
      M03_AXI_awvalid => Conn2_AWVALID,
      M03_AXI_bready => Conn2_BREADY,
      M03_AXI_bresp(1 downto 0) => Conn2_BRESP(1 downto 0),
      M03_AXI_bvalid => Conn2_BVALID,
      M03_AXI_rdata(31 downto 0) => Conn2_RDATA(31 downto 0),
      M03_AXI_rready => Conn2_RREADY,
      M03_AXI_rresp(1 downto 0) => Conn2_RRESP(1 downto 0),
      M03_AXI_rvalid => Conn2_RVALID,
      M03_AXI_wdata(31 downto 0) => Conn2_WDATA(31 downto 0),
      M03_AXI_wready => Conn2_WREADY,
      M03_AXI_wstrb(3 downto 0) => Conn2_WSTRB(3 downto 0),
      M03_AXI_wvalid => Conn2_WVALID,
      M04_AXI_araddr(31 downto 0) => Conn3_ARADDR(31 downto 0),
      M04_AXI_arprot(2 downto 0) => Conn3_ARPROT(2 downto 0),
      M04_AXI_arready(0) => Conn3_ARREADY(0),
      M04_AXI_arvalid(0) => Conn3_ARVALID(0),
      M04_AXI_awaddr(31 downto 0) => Conn3_AWADDR(31 downto 0),
      M04_AXI_awprot(2 downto 0) => Conn3_AWPROT(2 downto 0),
      M04_AXI_awready(0) => Conn3_AWREADY(0),
      M04_AXI_awvalid(0) => Conn3_AWVALID(0),
      M04_AXI_bready(0) => Conn3_BREADY(0),
      M04_AXI_bresp(1 downto 0) => Conn3_BRESP(1 downto 0),
      M04_AXI_bvalid(0) => Conn3_BVALID(0),
      M04_AXI_rdata(31 downto 0) => Conn3_RDATA(31 downto 0),
      M04_AXI_rready(0) => Conn3_RREADY(0),
      M04_AXI_rresp(1 downto 0) => Conn3_RRESP(1 downto 0),
      M04_AXI_rvalid(0) => Conn3_RVALID(0),
      M04_AXI_wdata(31 downto 0) => Conn3_WDATA(31 downto 0),
      M04_AXI_wready(0) => Conn3_WREADY(0),
      M04_AXI_wstrb(3 downto 0) => Conn3_WSTRB(3 downto 0),
      M04_AXI_wvalid(0) => Conn3_WVALID(0),
      M05_AXI_araddr(31 downto 0) => Conn4_ARADDR(31 downto 0),
      M05_AXI_arready => Conn4_ARREADY,
      M05_AXI_arvalid => Conn4_ARVALID,
      M05_AXI_awaddr(31 downto 0) => Conn4_AWADDR(31 downto 0),
      M05_AXI_awready => Conn4_AWREADY,
      M05_AXI_awvalid => Conn4_AWVALID,
      M05_AXI_bready => Conn4_BREADY,
      M05_AXI_bresp(1 downto 0) => Conn4_BRESP(1 downto 0),
      M05_AXI_bvalid => Conn4_BVALID,
      M05_AXI_rdata(31 downto 0) => Conn4_RDATA(31 downto 0),
      M05_AXI_rready => Conn4_RREADY,
      M05_AXI_rresp(1 downto 0) => Conn4_RRESP(1 downto 0),
      M05_AXI_rvalid => Conn4_RVALID,
      M05_AXI_wdata(31 downto 0) => Conn4_WDATA(31 downto 0),
      M05_AXI_wready => Conn4_WREADY,
      M05_AXI_wstrb(3 downto 0) => Conn4_WSTRB(3 downto 0),
      M05_AXI_wvalid => Conn4_WVALID,
      M06_AXI_araddr(31 downto 0) => Conn5_ARADDR(31 downto 0),
      M06_AXI_arready(0) => Conn5_ARREADY(0),
      M06_AXI_arvalid(0) => Conn5_ARVALID(0),
      M06_AXI_awaddr(31 downto 0) => Conn5_AWADDR(31 downto 0),
      M06_AXI_awready(0) => Conn5_AWREADY(0),
      M06_AXI_awvalid(0) => Conn5_AWVALID(0),
      M06_AXI_bready(0) => Conn5_BREADY(0),
      M06_AXI_bresp(1 downto 0) => Conn5_BRESP(1 downto 0),
      M06_AXI_bvalid(0) => Conn5_BVALID(0),
      M06_AXI_rdata(31 downto 0) => Conn5_RDATA(31 downto 0),
      M06_AXI_rready(0) => Conn5_RREADY(0),
      M06_AXI_rresp(1 downto 0) => Conn5_RRESP(1 downto 0),
      M06_AXI_rvalid(0) => Conn5_RVALID(0),
      M06_AXI_wdata(31 downto 0) => Conn5_WDATA(31 downto 0),
      M06_AXI_wready(0) => Conn5_WREADY(0),
      M06_AXI_wstrb(3 downto 0) => Conn5_WSTRB(3 downto 0),
      M06_AXI_wvalid(0) => Conn5_WVALID(0),
      M07_AXI_araddr(31 downto 0) => Conn6_ARADDR(31 downto 0),
      M07_AXI_arready(0) => Conn6_ARREADY(0),
      M07_AXI_arvalid(0) => Conn6_ARVALID(0),
      M07_AXI_awaddr(31 downto 0) => Conn6_AWADDR(31 downto 0),
      M07_AXI_awready(0) => Conn6_AWREADY(0),
      M07_AXI_awvalid(0) => Conn6_AWVALID(0),
      M07_AXI_bready(0) => Conn6_BREADY(0),
      M07_AXI_bresp(1 downto 0) => Conn6_BRESP(1 downto 0),
      M07_AXI_bvalid(0) => Conn6_BVALID(0),
      M07_AXI_rdata(31 downto 0) => Conn6_RDATA(31 downto 0),
      M07_AXI_rready(0) => Conn6_RREADY(0),
      M07_AXI_rresp(1 downto 0) => Conn6_RRESP(1 downto 0),
      M07_AXI_rvalid(0) => Conn6_RVALID(0),
      M07_AXI_wdata(31 downto 0) => Conn6_WDATA(31 downto 0),
      M07_AXI_wready(0) => Conn6_WREADY(0),
      M07_AXI_wstrb(3 downto 0) => Conn6_WSTRB(3 downto 0),
      M07_AXI_wvalid(0) => Conn6_WVALID(0),
      S00_AXI_araddr(31 downto 0) => VDMA1_M_AXI_MM2S_ARADDR(31 downto 0),
      S00_AXI_arburst(1 downto 0) => VDMA1_M_AXI_MM2S_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => VDMA1_M_AXI_MM2S_ARCACHE(3 downto 0),
      S00_AXI_arlen(7 downto 0) => VDMA1_M_AXI_MM2S_ARLEN(7 downto 0),
      S00_AXI_arprot(2 downto 0) => VDMA1_M_AXI_MM2S_ARPROT(2 downto 0),
      S00_AXI_arready => VDMA1_M_AXI_MM2S_ARREADY,
      S00_AXI_arsize(2 downto 0) => VDMA1_M_AXI_MM2S_ARSIZE(2 downto 0),
      S00_AXI_arvalid => VDMA1_M_AXI_MM2S_ARVALID,
      S00_AXI_rdata(63 downto 0) => VDMA1_M_AXI_MM2S_RDATA(63 downto 0),
      S00_AXI_rlast => VDMA1_M_AXI_MM2S_RLAST,
      S00_AXI_rready => VDMA1_M_AXI_MM2S_RREADY,
      S00_AXI_rresp(1 downto 0) => VDMA1_M_AXI_MM2S_RRESP(1 downto 0),
      S00_AXI_rvalid => VDMA1_M_AXI_MM2S_RVALID,
      S01_AXI_awaddr(31 downto 0) => VDMA1_M_AXI_S2MM_AWADDR(31 downto 0),
      S01_AXI_awburst(1 downto 0) => VDMA1_M_AXI_S2MM_AWBURST(1 downto 0),
      S01_AXI_awcache(3 downto 0) => VDMA1_M_AXI_S2MM_AWCACHE(3 downto 0),
      S01_AXI_awlen(7 downto 0) => VDMA1_M_AXI_S2MM_AWLEN(7 downto 0),
      S01_AXI_awprot(2 downto 0) => VDMA1_M_AXI_S2MM_AWPROT(2 downto 0),
      S01_AXI_awready => VDMA1_M_AXI_S2MM_AWREADY,
      S01_AXI_awsize(2 downto 0) => VDMA1_M_AXI_S2MM_AWSIZE(2 downto 0),
      S01_AXI_awvalid => VDMA1_M_AXI_S2MM_AWVALID,
      S01_AXI_bready => VDMA1_M_AXI_S2MM_BREADY,
      S01_AXI_bresp(1 downto 0) => VDMA1_M_AXI_S2MM_BRESP(1 downto 0),
      S01_AXI_bvalid => VDMA1_M_AXI_S2MM_BVALID,
      S01_AXI_wdata(63 downto 0) => VDMA1_M_AXI_S2MM_WDATA(63 downto 0),
      S01_AXI_wlast => VDMA1_M_AXI_S2MM_WLAST,
      S01_AXI_wready => VDMA1_M_AXI_S2MM_WREADY,
      S01_AXI_wstrb(7 downto 0) => VDMA1_M_AXI_S2MM_WSTRB(7 downto 0),
      S01_AXI_wvalid => VDMA1_M_AXI_S2MM_WVALID,
      aresetn150Mhz => rst_PS7_150M_peripheral_aresetn,
      aresetn75Mhz => M02_ARESETN_1,
      iaresetn150Mhz => SYSTEM_RESETS_interconnect_aresetn,
      master_aresetn => PS_VIDEO_FCLK_RESET0_N
    );
V_DMA: entity work.V_DMA_imp_QVYQ8K
     port map (
      M_AXIS_tdata(15 downto 0) => PS_VIDEO_M_AXIS_TDATA(15 downto 0),
      M_AXIS_tlast => PS_VIDEO_M_AXIS_TLAST,
      M_AXIS_tready => PS_VIDEO_M_AXIS_TREADY,
      M_AXIS_tuser => PS_VIDEO_M_AXIS_TUSER,
      M_AXIS_tvalid => PS_VIDEO_M_AXIS_TVALID,
      M_AXI_MM2S_araddr(31 downto 0) => VDMA1_M_AXI_MM2S_ARADDR(31 downto 0),
      M_AXI_MM2S_arburst(1 downto 0) => VDMA1_M_AXI_MM2S_ARBURST(1 downto 0),
      M_AXI_MM2S_arcache(3 downto 0) => VDMA1_M_AXI_MM2S_ARCACHE(3 downto 0),
      M_AXI_MM2S_arlen(7 downto 0) => VDMA1_M_AXI_MM2S_ARLEN(7 downto 0),
      M_AXI_MM2S_arprot(2 downto 0) => VDMA1_M_AXI_MM2S_ARPROT(2 downto 0),
      M_AXI_MM2S_arready => VDMA1_M_AXI_MM2S_ARREADY,
      M_AXI_MM2S_arsize(2 downto 0) => VDMA1_M_AXI_MM2S_ARSIZE(2 downto 0),
      M_AXI_MM2S_arvalid => VDMA1_M_AXI_MM2S_ARVALID,
      M_AXI_MM2S_rdata(63 downto 0) => VDMA1_M_AXI_MM2S_RDATA(63 downto 0),
      M_AXI_MM2S_rlast => VDMA1_M_AXI_MM2S_RLAST,
      M_AXI_MM2S_rready => VDMA1_M_AXI_MM2S_RREADY,
      M_AXI_MM2S_rresp(1 downto 0) => VDMA1_M_AXI_MM2S_RRESP(1 downto 0),
      M_AXI_MM2S_rvalid => VDMA1_M_AXI_MM2S_RVALID,
      M_AXI_S2MM_awaddr(31 downto 0) => VDMA1_M_AXI_S2MM_AWADDR(31 downto 0),
      M_AXI_S2MM_awburst(1 downto 0) => VDMA1_M_AXI_S2MM_AWBURST(1 downto 0),
      M_AXI_S2MM_awcache(3 downto 0) => VDMA1_M_AXI_S2MM_AWCACHE(3 downto 0),
      M_AXI_S2MM_awlen(7 downto 0) => VDMA1_M_AXI_S2MM_AWLEN(7 downto 0),
      M_AXI_S2MM_awprot(2 downto 0) => VDMA1_M_AXI_S2MM_AWPROT(2 downto 0),
      M_AXI_S2MM_awready => VDMA1_M_AXI_S2MM_AWREADY,
      M_AXI_S2MM_awsize(2 downto 0) => VDMA1_M_AXI_S2MM_AWSIZE(2 downto 0),
      M_AXI_S2MM_awvalid => VDMA1_M_AXI_S2MM_AWVALID,
      M_AXI_S2MM_bready => VDMA1_M_AXI_S2MM_BREADY,
      M_AXI_S2MM_bresp(1 downto 0) => VDMA1_M_AXI_S2MM_BRESP(1 downto 0),
      M_AXI_S2MM_bvalid => VDMA1_M_AXI_S2MM_BVALID,
      M_AXI_S2MM_wdata(63 downto 0) => VDMA1_M_AXI_S2MM_WDATA(63 downto 0),
      M_AXI_S2MM_wlast => VDMA1_M_AXI_S2MM_WLAST,
      M_AXI_S2MM_wready => VDMA1_M_AXI_S2MM_WREADY,
      M_AXI_S2MM_wstrb(7 downto 0) => VDMA1_M_AXI_S2MM_WSTRB(7 downto 0),
      M_AXI_S2MM_wvalid => VDMA1_M_AXI_S2MM_WVALID,
      S_AXIS_S2MM_tdata(15 downto 0) => v_ccm_0_video_out_TDATA(15 downto 0),
      S_AXIS_S2MM_tkeep(2 downto 0) => v_ccm_0_video_out_TKEEP(2 downto 0),
      S_AXIS_S2MM_tlast => v_ccm_0_video_out_TLAST,
      S_AXIS_S2MM_tready => v_ccm_0_video_out_TREADY,
      S_AXIS_S2MM_tuser(0) => v_ccm_0_video_out_TUSER(0),
      S_AXIS_S2MM_tvalid => v_ccm_0_video_out_TVALID,
      S_AXI_LITE_araddr(31 downto 0) => PS7_axi_periph_M00_AXI_ARADDR(31 downto 0),
      S_AXI_LITE_arready => PS7_axi_periph_M00_AXI_ARREADY,
      S_AXI_LITE_arvalid => PS7_axi_periph_M00_AXI_ARVALID,
      S_AXI_LITE_awaddr(31 downto 0) => PS7_axi_periph_M00_AXI_AWADDR(31 downto 0),
      S_AXI_LITE_awready => PS7_axi_periph_M00_AXI_AWREADY,
      S_AXI_LITE_awvalid => PS7_axi_periph_M00_AXI_AWVALID,
      S_AXI_LITE_bready => PS7_axi_periph_M00_AXI_BREADY,
      S_AXI_LITE_bresp(1 downto 0) => PS7_axi_periph_M00_AXI_BRESP(1 downto 0),
      S_AXI_LITE_bvalid => PS7_axi_periph_M00_AXI_BVALID,
      S_AXI_LITE_rdata(31 downto 0) => PS7_axi_periph_M00_AXI_RDATA(31 downto 0),
      S_AXI_LITE_rready => PS7_axi_periph_M00_AXI_RREADY,
      S_AXI_LITE_rresp(1 downto 0) => PS7_axi_periph_M00_AXI_RRESP(1 downto 0),
      S_AXI_LITE_rvalid => PS7_axi_periph_M00_AXI_RVALID,
      S_AXI_LITE_wdata(31 downto 0) => PS7_axi_periph_M00_AXI_WDATA(31 downto 0),
      S_AXI_LITE_wready => PS7_axi_periph_M00_AXI_WREADY,
      S_AXI_LITE_wvalid => PS7_axi_periph_M00_AXI_WVALID,
      aresetn150Mhz => rst_PS7_150M_peripheral_aresetn,
      s_axis_s2mm_aclk => processing_system7_0_FCLK_CLK0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity PS_VIDEO_imp_PVWY4M is
  port (
    CLK_100MHZ : out STD_LOGIC;
    CLK_150MHZ : out STD_LOGIC;
    CLK_75MHZ : out STD_LOGIC;
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rready : out STD_LOGIC;
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC;
    M01_AXI_araddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M01_AXI_arready : in STD_LOGIC;
    M01_AXI_arvalid : out STD_LOGIC;
    M01_AXI_awaddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M01_AXI_awready : in STD_LOGIC;
    M01_AXI_awvalid : out STD_LOGIC;
    M01_AXI_bready : out STD_LOGIC;
    M01_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_bvalid : in STD_LOGIC;
    M01_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_rready : out STD_LOGIC;
    M01_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_rvalid : in STD_LOGIC;
    M01_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_wready : in STD_LOGIC;
    M01_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_wvalid : out STD_LOGIC;
    M02_AXI_araddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M02_AXI_arready : in STD_LOGIC;
    M02_AXI_arvalid : out STD_LOGIC;
    M02_AXI_awaddr : out STD_LOGIC_VECTOR ( 8 downto 0 );
    M02_AXI_awready : in STD_LOGIC;
    M02_AXI_awvalid : out STD_LOGIC;
    M02_AXI_bready : out STD_LOGIC;
    M02_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_bvalid : in STD_LOGIC;
    M02_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_rready : out STD_LOGIC;
    M02_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_rvalid : in STD_LOGIC;
    M02_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_wready : in STD_LOGIC;
    M02_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M02_AXI_wvalid : out STD_LOGIC;
    M06_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M06_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M07_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M07_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M07_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXIS_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXIS_tlast : out STD_LOGIC;
    M_AXIS_tready : in STD_LOGIC;
    M_AXIS_tuser : out STD_LOGIC;
    M_AXIS_tvalid : out STD_LOGIC;
    aresetn150Mhz : in STD_LOGIC;
    aresetn75Mhz : in STD_LOGIC;
    iaresetn150Mhz : in STD_LOGIC;
    idata : in STD_LOGIC_VECTOR ( 11 downto 0 );
    ifval : in STD_LOGIC;
    ilval : in STD_LOGIC;
    master_aresetn : out STD_LOGIC;
    pixclk : in STD_LOGIC
  );
end PS_VIDEO_imp_PVWY4M;

architecture STRUCTURE of PS_VIDEO_imp_PVWY4M is
  signal Conn1_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn1_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn1_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn1_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn1_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn1_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn1_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn1_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn1_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn1_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn1_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn1_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn1_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn1_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn1_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn2_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn2_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn2_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn2_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn2_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn2_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn2_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn2_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn2_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn2_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn2_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn2_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Conn2_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn2_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Conn2_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Conn2_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Conn2_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal PS7_FCLK_CLK2 : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M00_AXI_ARREADY : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_ARVALID : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M00_AXI_AWREADY : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_AWVALID : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_BREADY : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_M00_AXI_BVALID : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M00_AXI_RREADY : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_M00_AXI_RVALID : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M00_AXI_WREADY : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS7_axi_periph_M00_AXI_WVALID : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_ARADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal PS7_axi_periph_M01_AXI_ARREADY : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_ARVALID : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_AWADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal PS7_axi_periph_M01_AXI_AWREADY : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_AWVALID : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_BREADY : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_M01_AXI_BVALID : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M01_AXI_RREADY : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_M01_AXI_RVALID : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M01_AXI_WREADY : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS7_axi_periph_M01_AXI_WVALID : STD_LOGIC;
  signal PS7_axi_periph_M02_AXI_ARADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal PS7_axi_periph_M02_AXI_ARREADY : STD_LOGIC;
  signal PS7_axi_periph_M02_AXI_ARVALID : STD_LOGIC;
  signal PS7_axi_periph_M02_AXI_AWADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal PS7_axi_periph_M02_AXI_AWREADY : STD_LOGIC;
  signal PS7_axi_periph_M02_AXI_AWVALID : STD_LOGIC;
  signal PS7_axi_periph_M02_AXI_BREADY : STD_LOGIC;
  signal PS7_axi_periph_M02_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_M02_AXI_BVALID : STD_LOGIC;
  signal PS7_axi_periph_M02_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M02_AXI_RREADY : STD_LOGIC;
  signal PS7_axi_periph_M02_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_M02_AXI_RVALID : STD_LOGIC;
  signal PS7_axi_periph_M02_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M02_AXI_WREADY : STD_LOGIC;
  signal PS7_axi_periph_M02_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS7_axi_periph_M02_AXI_WVALID : STD_LOGIC;
  signal PS_M04_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS_M04_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal PS_M04_AXI_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal PS_M04_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal PS_M04_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS_M04_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal PS_M04_AXI_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal PS_M04_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal PS_M04_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal PS_M04_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS_M04_AXI_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal PS_M04_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS_M04_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal PS_M04_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS_M04_AXI_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal PS_M04_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS_M04_AXI_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal PS_M04_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS_M04_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal PS_VIDEO_DDR_ADDR : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal PS_VIDEO_DDR_BA : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal PS_VIDEO_DDR_CAS_N : STD_LOGIC;
  signal PS_VIDEO_DDR_CKE : STD_LOGIC;
  signal PS_VIDEO_DDR_CK_N : STD_LOGIC;
  signal PS_VIDEO_DDR_CK_P : STD_LOGIC;
  signal PS_VIDEO_DDR_CS_N : STD_LOGIC;
  signal PS_VIDEO_DDR_DM : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS_VIDEO_DDR_DQ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS_VIDEO_DDR_DQS_N : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS_VIDEO_DDR_DQS_P : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS_VIDEO_DDR_ODT : STD_LOGIC;
  signal PS_VIDEO_DDR_RAS_N : STD_LOGIC;
  signal PS_VIDEO_DDR_RESET_N : STD_LOGIC;
  signal PS_VIDEO_DDR_WE_N : STD_LOGIC;
  signal PS_VIDEO_FCLK_CLK1 : STD_LOGIC;
  signal PS_VIDEO_FCLK_RESET0_N : STD_LOGIC;
  signal PS_VIDEO_FIXED_IO_DDR_VRN : STD_LOGIC;
  signal PS_VIDEO_FIXED_IO_DDR_VRP : STD_LOGIC;
  signal PS_VIDEO_FIXED_IO_MIO : STD_LOGIC_VECTOR ( 53 downto 0 );
  signal PS_VIDEO_FIXED_IO_PS_CLK : STD_LOGIC;
  signal PS_VIDEO_FIXED_IO_PS_PORB : STD_LOGIC;
  signal PS_VIDEO_FIXED_IO_PS_SRSTB : STD_LOGIC;
  signal PS_VIDEO_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal PS_VIDEO_M_AXIS_TLAST : STD_LOGIC;
  signal PS_VIDEO_M_AXIS_TREADY : STD_LOGIC;
  signal PS_VIDEO_M_AXIS_TUSER : STD_LOGIC;
  signal PS_VIDEO_M_AXIS_TVALID : STD_LOGIC;
  signal SYSTEM_RESETS_interconnect_aresetn : STD_LOGIC;
  signal aresetn75Mhz_1 : STD_LOGIC;
  signal idata_1 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal ifval_1 : STD_LOGIC;
  signal ilval_1 : STD_LOGIC;
  signal pixclk_1 : STD_LOGIC;
  signal processing_system7_0_FCLK_CLK0 : STD_LOGIC;
  signal rst_PS7_150M_peripheral_aresetn : STD_LOGIC;
  signal v_ccm_0_video_out_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal v_ccm_0_video_out_TKEEP : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal v_ccm_0_video_out_TLAST : STD_LOGIC;
  signal v_ccm_0_video_out_TREADY : STD_LOGIC;
  signal v_ccm_0_video_out_TUSER : STD_LOGIC_VECTOR ( 0 to 0 );
  signal v_ccm_0_video_out_TVALID : STD_LOGIC;
begin
  CLK_100MHZ <= PS_VIDEO_FCLK_CLK1;
  CLK_150MHZ <= processing_system7_0_FCLK_CLK0;
  CLK_75MHZ <= PS7_FCLK_CLK2;
  Conn1_ARREADY(0) <= M06_AXI_arready(0);
  Conn1_AWREADY(0) <= M06_AXI_awready(0);
  Conn1_BRESP(1 downto 0) <= M06_AXI_bresp(1 downto 0);
  Conn1_BVALID(0) <= M06_AXI_bvalid(0);
  Conn1_RDATA(31 downto 0) <= M06_AXI_rdata(31 downto 0);
  Conn1_RRESP(1 downto 0) <= M06_AXI_rresp(1 downto 0);
  Conn1_RVALID(0) <= M06_AXI_rvalid(0);
  Conn1_WREADY(0) <= M06_AXI_wready(0);
  Conn2_ARREADY(0) <= M07_AXI_arready(0);
  Conn2_AWREADY(0) <= M07_AXI_awready(0);
  Conn2_BRESP(1 downto 0) <= M07_AXI_bresp(1 downto 0);
  Conn2_BVALID(0) <= M07_AXI_bvalid(0);
  Conn2_RDATA(31 downto 0) <= M07_AXI_rdata(31 downto 0);
  Conn2_RRESP(1 downto 0) <= M07_AXI_rresp(1 downto 0);
  Conn2_RVALID(0) <= M07_AXI_rvalid(0);
  Conn2_WREADY(0) <= M07_AXI_wready(0);
  M00_AXI_araddr(31 downto 0) <= PS7_axi_periph_M00_AXI_ARADDR(31 downto 0);
  M00_AXI_arvalid <= PS7_axi_periph_M00_AXI_ARVALID;
  M00_AXI_awaddr(31 downto 0) <= PS7_axi_periph_M00_AXI_AWADDR(31 downto 0);
  M00_AXI_awvalid <= PS7_axi_periph_M00_AXI_AWVALID;
  M00_AXI_bready <= PS7_axi_periph_M00_AXI_BREADY;
  M00_AXI_rready <= PS7_axi_periph_M00_AXI_RREADY;
  M00_AXI_wdata(31 downto 0) <= PS7_axi_periph_M00_AXI_WDATA(31 downto 0);
  M00_AXI_wstrb(3 downto 0) <= PS7_axi_periph_M00_AXI_WSTRB(3 downto 0);
  M00_AXI_wvalid <= PS7_axi_periph_M00_AXI_WVALID;
  M01_AXI_araddr(8 downto 0) <= PS7_axi_periph_M01_AXI_ARADDR(8 downto 0);
  M01_AXI_arvalid <= PS7_axi_periph_M01_AXI_ARVALID;
  M01_AXI_awaddr(8 downto 0) <= PS7_axi_periph_M01_AXI_AWADDR(8 downto 0);
  M01_AXI_awvalid <= PS7_axi_periph_M01_AXI_AWVALID;
  M01_AXI_bready <= PS7_axi_periph_M01_AXI_BREADY;
  M01_AXI_rready <= PS7_axi_periph_M01_AXI_RREADY;
  M01_AXI_wdata(31 downto 0) <= PS7_axi_periph_M01_AXI_WDATA(31 downto 0);
  M01_AXI_wstrb(3 downto 0) <= PS7_axi_periph_M01_AXI_WSTRB(3 downto 0);
  M01_AXI_wvalid <= PS7_axi_periph_M01_AXI_WVALID;
  M02_AXI_araddr(8 downto 0) <= PS7_axi_periph_M02_AXI_ARADDR(8 downto 0);
  M02_AXI_arvalid <= PS7_axi_periph_M02_AXI_ARVALID;
  M02_AXI_awaddr(8 downto 0) <= PS7_axi_periph_M02_AXI_AWADDR(8 downto 0);
  M02_AXI_awvalid <= PS7_axi_periph_M02_AXI_AWVALID;
  M02_AXI_bready <= PS7_axi_periph_M02_AXI_BREADY;
  M02_AXI_rready <= PS7_axi_periph_M02_AXI_RREADY;
  M02_AXI_wdata(31 downto 0) <= PS7_axi_periph_M02_AXI_WDATA(31 downto 0);
  M02_AXI_wstrb(3 downto 0) <= PS7_axi_periph_M02_AXI_WSTRB(3 downto 0);
  M02_AXI_wvalid <= PS7_axi_periph_M02_AXI_WVALID;
  M06_AXI_araddr(31 downto 0) <= Conn1_ARADDR(31 downto 0);
  M06_AXI_arvalid(0) <= Conn1_ARVALID(0);
  M06_AXI_awaddr(31 downto 0) <= Conn1_AWADDR(31 downto 0);
  M06_AXI_awvalid(0) <= Conn1_AWVALID(0);
  M06_AXI_bready(0) <= Conn1_BREADY(0);
  M06_AXI_rready(0) <= Conn1_RREADY(0);
  M06_AXI_wdata(31 downto 0) <= Conn1_WDATA(31 downto 0);
  M06_AXI_wstrb(3 downto 0) <= Conn1_WSTRB(3 downto 0);
  M06_AXI_wvalid(0) <= Conn1_WVALID(0);
  M07_AXI_araddr(31 downto 0) <= Conn2_ARADDR(31 downto 0);
  M07_AXI_arvalid(0) <= Conn2_ARVALID(0);
  M07_AXI_awaddr(31 downto 0) <= Conn2_AWADDR(31 downto 0);
  M07_AXI_awvalid(0) <= Conn2_AWVALID(0);
  M07_AXI_bready(0) <= Conn2_BREADY(0);
  M07_AXI_rready(0) <= Conn2_RREADY(0);
  M07_AXI_wdata(31 downto 0) <= Conn2_WDATA(31 downto 0);
  M07_AXI_wstrb(3 downto 0) <= Conn2_WSTRB(3 downto 0);
  M07_AXI_wvalid(0) <= Conn2_WVALID(0);
  M_AXIS_tdata(15 downto 0) <= PS_VIDEO_M_AXIS_TDATA(15 downto 0);
  M_AXIS_tlast <= PS_VIDEO_M_AXIS_TLAST;
  M_AXIS_tuser <= PS_VIDEO_M_AXIS_TUSER;
  M_AXIS_tvalid <= PS_VIDEO_M_AXIS_TVALID;
  PS7_axi_periph_M00_AXI_ARREADY <= M00_AXI_arready;
  PS7_axi_periph_M00_AXI_AWREADY <= M00_AXI_awready;
  PS7_axi_periph_M00_AXI_BRESP(1 downto 0) <= M00_AXI_bresp(1 downto 0);
  PS7_axi_periph_M00_AXI_BVALID <= M00_AXI_bvalid;
  PS7_axi_periph_M00_AXI_RDATA(31 downto 0) <= M00_AXI_rdata(31 downto 0);
  PS7_axi_periph_M00_AXI_RRESP(1 downto 0) <= M00_AXI_rresp(1 downto 0);
  PS7_axi_periph_M00_AXI_RVALID <= M00_AXI_rvalid;
  PS7_axi_periph_M00_AXI_WREADY <= M00_AXI_wready;
  PS7_axi_periph_M01_AXI_ARREADY <= M01_AXI_arready;
  PS7_axi_periph_M01_AXI_AWREADY <= M01_AXI_awready;
  PS7_axi_periph_M01_AXI_BRESP(1 downto 0) <= M01_AXI_bresp(1 downto 0);
  PS7_axi_periph_M01_AXI_BVALID <= M01_AXI_bvalid;
  PS7_axi_periph_M01_AXI_RDATA(31 downto 0) <= M01_AXI_rdata(31 downto 0);
  PS7_axi_periph_M01_AXI_RRESP(1 downto 0) <= M01_AXI_rresp(1 downto 0);
  PS7_axi_periph_M01_AXI_RVALID <= M01_AXI_rvalid;
  PS7_axi_periph_M01_AXI_WREADY <= M01_AXI_wready;
  PS7_axi_periph_M02_AXI_ARREADY <= M02_AXI_arready;
  PS7_axi_periph_M02_AXI_AWREADY <= M02_AXI_awready;
  PS7_axi_periph_M02_AXI_BRESP(1 downto 0) <= M02_AXI_bresp(1 downto 0);
  PS7_axi_periph_M02_AXI_BVALID <= M02_AXI_bvalid;
  PS7_axi_periph_M02_AXI_RDATA(31 downto 0) <= M02_AXI_rdata(31 downto 0);
  PS7_axi_periph_M02_AXI_RRESP(1 downto 0) <= M02_AXI_rresp(1 downto 0);
  PS7_axi_periph_M02_AXI_RVALID <= M02_AXI_rvalid;
  PS7_axi_periph_M02_AXI_WREADY <= M02_AXI_wready;
  PS_VIDEO_M_AXIS_TREADY <= M_AXIS_tready;
  SYSTEM_RESETS_interconnect_aresetn <= iaresetn150Mhz;
  aresetn75Mhz_1 <= aresetn75Mhz;
  idata_1(11 downto 0) <= idata(11 downto 0);
  ifval_1 <= ifval;
  ilval_1 <= ilval;
  master_aresetn <= PS_VIDEO_FCLK_RESET0_N;
  pixclk_1 <= pixclk;
  rst_PS7_150M_peripheral_aresetn <= aresetn150Mhz;
D5M: entity work.D5M_imp_H6UO12
     port map (
      CLK_150MHZ => processing_system7_0_FCLK_CLK0,
      aresetn150Mhz => rst_PS7_150M_peripheral_aresetn,
      config_axis_araddr(31 downto 0) => PS_M04_AXI_ARADDR(31 downto 0),
      config_axis_arprot(2 downto 0) => PS_M04_AXI_ARPROT(2 downto 0),
      config_axis_arready(0) => PS_M04_AXI_ARREADY(0),
      config_axis_arvalid(0) => PS_M04_AXI_ARVALID(0),
      config_axis_awaddr(31 downto 0) => PS_M04_AXI_AWADDR(31 downto 0),
      config_axis_awprot(2 downto 0) => PS_M04_AXI_AWPROT(2 downto 0),
      config_axis_awready(0) => PS_M04_AXI_AWREADY(0),
      config_axis_awvalid(0) => PS_M04_AXI_AWVALID(0),
      config_axis_bready(0) => PS_M04_AXI_BREADY(0),
      config_axis_bresp(1 downto 0) => PS_M04_AXI_BRESP(1 downto 0),
      config_axis_bvalid(0) => PS_M04_AXI_BVALID(0),
      config_axis_rdata(31 downto 0) => PS_M04_AXI_RDATA(31 downto 0),
      config_axis_rready(0) => PS_M04_AXI_RREADY(0),
      config_axis_rresp(1 downto 0) => PS_M04_AXI_RRESP(1 downto 0),
      config_axis_rvalid(0) => PS_M04_AXI_RVALID(0),
      config_axis_wdata(31 downto 0) => PS_M04_AXI_WDATA(31 downto 0),
      config_axis_wready(0) => PS_M04_AXI_WREADY(0),
      config_axis_wstrb(3 downto 0) => PS_M04_AXI_WSTRB(3 downto 0),
      config_axis_wvalid(0) => PS_M04_AXI_WVALID(0),
      idata(11 downto 0) => idata_1(11 downto 0),
      ifval => ifval_1,
      ilval => ilval_1,
      pixclk => pixclk_1,
      video_out_tdata(15 downto 0) => v_ccm_0_video_out_TDATA(15 downto 0),
      video_out_tkeep(2 downto 0) => v_ccm_0_video_out_TKEEP(2 downto 0),
      video_out_tlast => v_ccm_0_video_out_TLAST,
      video_out_tready => v_ccm_0_video_out_TREADY,
      video_out_tuser(0) => v_ccm_0_video_out_TUSER(0),
      video_out_tvalid => v_ccm_0_video_out_TVALID
    );
PS: entity work.PS_imp_1YJSW6I
     port map (
      CLK_100MHZ => PS_VIDEO_FCLK_CLK1,
      CLK_150MHZ => processing_system7_0_FCLK_CLK0,
      CLK_75MHZ => PS7_FCLK_CLK2,
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      M02_AXI_araddr(8 downto 0) => PS7_axi_periph_M01_AXI_ARADDR(8 downto 0),
      M02_AXI_arready => PS7_axi_periph_M01_AXI_ARREADY,
      M02_AXI_arvalid => PS7_axi_periph_M01_AXI_ARVALID,
      M02_AXI_awaddr(8 downto 0) => PS7_axi_periph_M01_AXI_AWADDR(8 downto 0),
      M02_AXI_awready => PS7_axi_periph_M01_AXI_AWREADY,
      M02_AXI_awvalid => PS7_axi_periph_M01_AXI_AWVALID,
      M02_AXI_bready => PS7_axi_periph_M01_AXI_BREADY,
      M02_AXI_bresp(1 downto 0) => PS7_axi_periph_M01_AXI_BRESP(1 downto 0),
      M02_AXI_bvalid => PS7_axi_periph_M01_AXI_BVALID,
      M02_AXI_rdata(31 downto 0) => PS7_axi_periph_M01_AXI_RDATA(31 downto 0),
      M02_AXI_rready => PS7_axi_periph_M01_AXI_RREADY,
      M02_AXI_rresp(1 downto 0) => PS7_axi_periph_M01_AXI_RRESP(1 downto 0),
      M02_AXI_rvalid => PS7_axi_periph_M01_AXI_RVALID,
      M02_AXI_wdata(31 downto 0) => PS7_axi_periph_M01_AXI_WDATA(31 downto 0),
      M02_AXI_wready => PS7_axi_periph_M01_AXI_WREADY,
      M02_AXI_wstrb(3 downto 0) => PS7_axi_periph_M01_AXI_WSTRB(3 downto 0),
      M02_AXI_wvalid => PS7_axi_periph_M01_AXI_WVALID,
      M03_AXI_araddr(8 downto 0) => PS7_axi_periph_M02_AXI_ARADDR(8 downto 0),
      M03_AXI_arready => PS7_axi_periph_M02_AXI_ARREADY,
      M03_AXI_arvalid => PS7_axi_periph_M02_AXI_ARVALID,
      M03_AXI_awaddr(8 downto 0) => PS7_axi_periph_M02_AXI_AWADDR(8 downto 0),
      M03_AXI_awready => PS7_axi_periph_M02_AXI_AWREADY,
      M03_AXI_awvalid => PS7_axi_periph_M02_AXI_AWVALID,
      M03_AXI_bready => PS7_axi_periph_M02_AXI_BREADY,
      M03_AXI_bresp(1 downto 0) => PS7_axi_periph_M02_AXI_BRESP(1 downto 0),
      M03_AXI_bvalid => PS7_axi_periph_M02_AXI_BVALID,
      M03_AXI_rdata(31 downto 0) => PS7_axi_periph_M02_AXI_RDATA(31 downto 0),
      M03_AXI_rready => PS7_axi_periph_M02_AXI_RREADY,
      M03_AXI_rresp(1 downto 0) => PS7_axi_periph_M02_AXI_RRESP(1 downto 0),
      M03_AXI_rvalid => PS7_axi_periph_M02_AXI_RVALID,
      M03_AXI_wdata(31 downto 0) => PS7_axi_periph_M02_AXI_WDATA(31 downto 0),
      M03_AXI_wready => PS7_axi_periph_M02_AXI_WREADY,
      M03_AXI_wstrb(3 downto 0) => PS7_axi_periph_M02_AXI_WSTRB(3 downto 0),
      M03_AXI_wvalid => PS7_axi_periph_M02_AXI_WVALID,
      M04_AXI_araddr(31 downto 0) => PS_M04_AXI_ARADDR(31 downto 0),
      M04_AXI_arprot(2 downto 0) => PS_M04_AXI_ARPROT(2 downto 0),
      M04_AXI_arready(0) => PS_M04_AXI_ARREADY(0),
      M04_AXI_arvalid(0) => PS_M04_AXI_ARVALID(0),
      M04_AXI_awaddr(31 downto 0) => PS_M04_AXI_AWADDR(31 downto 0),
      M04_AXI_awprot(2 downto 0) => PS_M04_AXI_AWPROT(2 downto 0),
      M04_AXI_awready(0) => PS_M04_AXI_AWREADY(0),
      M04_AXI_awvalid(0) => PS_M04_AXI_AWVALID(0),
      M04_AXI_bready(0) => PS_M04_AXI_BREADY(0),
      M04_AXI_bresp(1 downto 0) => PS_M04_AXI_BRESP(1 downto 0),
      M04_AXI_bvalid(0) => PS_M04_AXI_BVALID(0),
      M04_AXI_rdata(31 downto 0) => PS_M04_AXI_RDATA(31 downto 0),
      M04_AXI_rready(0) => PS_M04_AXI_RREADY(0),
      M04_AXI_rresp(1 downto 0) => PS_M04_AXI_RRESP(1 downto 0),
      M04_AXI_rvalid(0) => PS_M04_AXI_RVALID(0),
      M04_AXI_wdata(31 downto 0) => PS_M04_AXI_WDATA(31 downto 0),
      M04_AXI_wready(0) => PS_M04_AXI_WREADY(0),
      M04_AXI_wstrb(3 downto 0) => PS_M04_AXI_WSTRB(3 downto 0),
      M04_AXI_wvalid(0) => PS_M04_AXI_WVALID(0),
      M05_AXI_araddr(31 downto 0) => PS7_axi_periph_M00_AXI_ARADDR(31 downto 0),
      M05_AXI_arready => PS7_axi_periph_M00_AXI_ARREADY,
      M05_AXI_arvalid => PS7_axi_periph_M00_AXI_ARVALID,
      M05_AXI_awaddr(31 downto 0) => PS7_axi_periph_M00_AXI_AWADDR(31 downto 0),
      M05_AXI_awready => PS7_axi_periph_M00_AXI_AWREADY,
      M05_AXI_awvalid => PS7_axi_periph_M00_AXI_AWVALID,
      M05_AXI_bready => PS7_axi_periph_M00_AXI_BREADY,
      M05_AXI_bresp(1 downto 0) => PS7_axi_periph_M00_AXI_BRESP(1 downto 0),
      M05_AXI_bvalid => PS7_axi_periph_M00_AXI_BVALID,
      M05_AXI_rdata(31 downto 0) => PS7_axi_periph_M00_AXI_RDATA(31 downto 0),
      M05_AXI_rready => PS7_axi_periph_M00_AXI_RREADY,
      M05_AXI_rresp(1 downto 0) => PS7_axi_periph_M00_AXI_RRESP(1 downto 0),
      M05_AXI_rvalid => PS7_axi_periph_M00_AXI_RVALID,
      M05_AXI_wdata(31 downto 0) => PS7_axi_periph_M00_AXI_WDATA(31 downto 0),
      M05_AXI_wready => PS7_axi_periph_M00_AXI_WREADY,
      M05_AXI_wstrb(3 downto 0) => PS7_axi_periph_M00_AXI_WSTRB(3 downto 0),
      M05_AXI_wvalid => PS7_axi_periph_M00_AXI_WVALID,
      M06_AXI_araddr(31 downto 0) => Conn1_ARADDR(31 downto 0),
      M06_AXI_arready(0) => Conn1_ARREADY(0),
      M06_AXI_arvalid(0) => Conn1_ARVALID(0),
      M06_AXI_awaddr(31 downto 0) => Conn1_AWADDR(31 downto 0),
      M06_AXI_awready(0) => Conn1_AWREADY(0),
      M06_AXI_awvalid(0) => Conn1_AWVALID(0),
      M06_AXI_bready(0) => Conn1_BREADY(0),
      M06_AXI_bresp(1 downto 0) => Conn1_BRESP(1 downto 0),
      M06_AXI_bvalid(0) => Conn1_BVALID(0),
      M06_AXI_rdata(31 downto 0) => Conn1_RDATA(31 downto 0),
      M06_AXI_rready(0) => Conn1_RREADY(0),
      M06_AXI_rresp(1 downto 0) => Conn1_RRESP(1 downto 0),
      M06_AXI_rvalid(0) => Conn1_RVALID(0),
      M06_AXI_wdata(31 downto 0) => Conn1_WDATA(31 downto 0),
      M06_AXI_wready(0) => Conn1_WREADY(0),
      M06_AXI_wstrb(3 downto 0) => Conn1_WSTRB(3 downto 0),
      M06_AXI_wvalid(0) => Conn1_WVALID(0),
      M07_AXI_araddr(31 downto 0) => Conn2_ARADDR(31 downto 0),
      M07_AXI_arready(0) => Conn2_ARREADY(0),
      M07_AXI_arvalid(0) => Conn2_ARVALID(0),
      M07_AXI_awaddr(31 downto 0) => Conn2_AWADDR(31 downto 0),
      M07_AXI_awready(0) => Conn2_AWREADY(0),
      M07_AXI_awvalid(0) => Conn2_AWVALID(0),
      M07_AXI_bready(0) => Conn2_BREADY(0),
      M07_AXI_bresp(1 downto 0) => Conn2_BRESP(1 downto 0),
      M07_AXI_bvalid(0) => Conn2_BVALID(0),
      M07_AXI_rdata(31 downto 0) => Conn2_RDATA(31 downto 0),
      M07_AXI_rready(0) => Conn2_RREADY(0),
      M07_AXI_rresp(1 downto 0) => Conn2_RRESP(1 downto 0),
      M07_AXI_rvalid(0) => Conn2_RVALID(0),
      M07_AXI_wdata(31 downto 0) => Conn2_WDATA(31 downto 0),
      M07_AXI_wready(0) => Conn2_WREADY(0),
      M07_AXI_wstrb(3 downto 0) => Conn2_WSTRB(3 downto 0),
      M07_AXI_wvalid(0) => Conn2_WVALID(0),
      M_AXIS_tdata(15 downto 0) => PS_VIDEO_M_AXIS_TDATA(15 downto 0),
      M_AXIS_tlast => PS_VIDEO_M_AXIS_TLAST,
      M_AXIS_tready => PS_VIDEO_M_AXIS_TREADY,
      M_AXIS_tuser => PS_VIDEO_M_AXIS_TUSER,
      M_AXIS_tvalid => PS_VIDEO_M_AXIS_TVALID,
      S_AXIS_S2MM_tdata(15 downto 0) => v_ccm_0_video_out_TDATA(15 downto 0),
      S_AXIS_S2MM_tkeep(2 downto 0) => v_ccm_0_video_out_TKEEP(2 downto 0),
      S_AXIS_S2MM_tlast => v_ccm_0_video_out_TLAST,
      S_AXIS_S2MM_tready => v_ccm_0_video_out_TREADY,
      S_AXIS_S2MM_tuser(0) => v_ccm_0_video_out_TUSER(0),
      S_AXIS_S2MM_tvalid => v_ccm_0_video_out_TVALID,
      aresetn150Mhz => rst_PS7_150M_peripheral_aresetn,
      aresetn75Mhz => aresetn75Mhz_1,
      iaresetn150Mhz => SYSTEM_RESETS_interconnect_aresetn,
      master_aresetn => PS_VIDEO_FCLK_RESET0_N
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zynq_soc is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    d5m_iic_scl_i : in STD_LOGIC;
    d5m_iic_scl_o : out STD_LOGIC;
    d5m_iic_scl_t : out STD_LOGIC;
    d5m_iic_sda_i : in STD_LOGIC;
    d5m_iic_sda_o : out STD_LOGIC;
    d5m_iic_sda_t : out STD_LOGIC;
    hdmi_iic_scl_i : in STD_LOGIC;
    hdmi_iic_scl_o : out STD_LOGIC;
    hdmi_iic_scl_t : out STD_LOGIC;
    hdmi_iic_sda_i : in STD_LOGIC;
    hdmi_iic_sda_o : out STD_LOGIC;
    hdmi_iic_sda_t : out STD_LOGIC;
    idata : in STD_LOGIC_VECTOR ( 11 downto 0 );
    ifval : in STD_LOGIC;
    ilval : in STD_LOGIC;
    io_hdmio_clk : out STD_LOGIC;
    io_hdmio_data : out STD_LOGIC_VECTOR ( 15 downto 0 );
    io_hdmio_de : out STD_LOGIC;
    io_hdmio_hsync : out STD_LOGIC;
    io_hdmio_spdif : out STD_LOGIC;
    io_hdmio_vsync : out STD_LOGIC;
    leds_8bits_tri_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    o_xclkin : out STD_LOGIC;
    pixclk : in STD_LOGIC;
    reseto : out STD_LOGIC_VECTOR ( 0 to 0 );
    sws_8bits_tri_i : in STD_LOGIC_VECTOR ( 7 downto 0 );
    trigger : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of zynq_soc : entity is "zynq_soc,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=zynq_soc,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=47,numReposBlks=24,numNonXlnxBlks=2,numHierBlks=23,maxHierDepth=3,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of zynq_soc : entity is "zynq_soc.hwdef";
end zynq_soc;

architecture STRUCTURE of zynq_soc is
  component zynq_soc_CLK_GEN_148MHZ_0 is
  port (
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC
  );
  end component zynq_soc_CLK_GEN_148MHZ_0;
  component zynq_soc_DIP_SWITCHES_8BITS_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    gpio_io_i : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component zynq_soc_DIP_SWITCHES_8BITS_0;
  component zynq_soc_LEDS_8BITS_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    gpio_io_o : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component zynq_soc_LEDS_8BITS_0;
  signal CLK_GEN_148MHZ_clk_out2 : STD_LOGIC;
  signal D5M_OUTPUT_IIC_SCL_I : STD_LOGIC;
  signal D5M_OUTPUT_IIC_SCL_O : STD_LOGIC;
  signal D5M_OUTPUT_IIC_SCL_T : STD_LOGIC;
  signal D5M_OUTPUT_IIC_SDA_I : STD_LOGIC;
  signal D5M_OUTPUT_IIC_SDA_O : STD_LOGIC;
  signal D5M_OUTPUT_IIC_SDA_T : STD_LOGIC;
  signal D5M_OUTPUT_reseto : STD_LOGIC_VECTOR ( 0 to 0 );
  signal D5M_OUTPUT_trigger : STD_LOGIC_VECTOR ( 0 to 0 );
  signal DIP_SWITCHES_8BITS_GPIO_TRI_I : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal HDMI_OUTPUT_IIC_SCL_I : STD_LOGIC;
  signal HDMI_OUTPUT_IIC_SCL_O : STD_LOGIC;
  signal HDMI_OUTPUT_IIC_SCL_T : STD_LOGIC;
  signal HDMI_OUTPUT_IIC_SDA_I : STD_LOGIC;
  signal HDMI_OUTPUT_IIC_SDA_O : STD_LOGIC;
  signal HDMI_OUTPUT_IIC_SDA_T : STD_LOGIC;
  signal HDMI_OUTPUT_IO_HDMIO_CLK : STD_LOGIC;
  signal HDMI_OUTPUT_IO_HDMIO_DATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal HDMI_OUTPUT_IO_HDMIO_DE : STD_LOGIC;
  signal HDMI_OUTPUT_IO_HDMIO_HSYNC : STD_LOGIC;
  signal HDMI_OUTPUT_IO_HDMIO_SPDIF : STD_LOGIC;
  signal HDMI_OUTPUT_IO_HDMIO_VSYNC : STD_LOGIC;
  signal PS7_FCLK_CLK2 : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M00_AXI_ARREADY : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_ARVALID : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M00_AXI_AWREADY : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_AWVALID : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_BREADY : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_M00_AXI_BVALID : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M00_AXI_RREADY : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_M00_AXI_RVALID : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M00_AXI_WREADY : STD_LOGIC;
  signal PS7_axi_periph_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS7_axi_periph_M00_AXI_WVALID : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_ARADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal PS7_axi_periph_M01_AXI_ARREADY : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_ARVALID : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_AWADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal PS7_axi_periph_M01_AXI_AWREADY : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_AWVALID : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_BREADY : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_M01_AXI_BVALID : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M01_AXI_RREADY : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_M01_AXI_RVALID : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M01_AXI_WREADY : STD_LOGIC;
  signal PS7_axi_periph_M01_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS7_axi_periph_M01_AXI_WVALID : STD_LOGIC;
  signal PS7_axi_periph_M02_AXI_ARADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal PS7_axi_periph_M02_AXI_ARREADY : STD_LOGIC;
  signal PS7_axi_periph_M02_AXI_ARVALID : STD_LOGIC;
  signal PS7_axi_periph_M02_AXI_AWADDR : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal PS7_axi_periph_M02_AXI_AWREADY : STD_LOGIC;
  signal PS7_axi_periph_M02_AXI_AWVALID : STD_LOGIC;
  signal PS7_axi_periph_M02_AXI_BREADY : STD_LOGIC;
  signal PS7_axi_periph_M02_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_M02_AXI_BVALID : STD_LOGIC;
  signal PS7_axi_periph_M02_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M02_AXI_RREADY : STD_LOGIC;
  signal PS7_axi_periph_M02_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS7_axi_periph_M02_AXI_RVALID : STD_LOGIC;
  signal PS7_axi_periph_M02_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS7_axi_periph_M02_AXI_WREADY : STD_LOGIC;
  signal PS7_axi_periph_M02_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS7_axi_periph_M02_AXI_WVALID : STD_LOGIC;
  signal PS_VIDEO_DDR_ADDR : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal PS_VIDEO_DDR_BA : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal PS_VIDEO_DDR_CAS_N : STD_LOGIC;
  signal PS_VIDEO_DDR_CKE : STD_LOGIC;
  signal PS_VIDEO_DDR_CK_N : STD_LOGIC;
  signal PS_VIDEO_DDR_CK_P : STD_LOGIC;
  signal PS_VIDEO_DDR_CS_N : STD_LOGIC;
  signal PS_VIDEO_DDR_DM : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS_VIDEO_DDR_DQ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS_VIDEO_DDR_DQS_N : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS_VIDEO_DDR_DQS_P : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS_VIDEO_DDR_ODT : STD_LOGIC;
  signal PS_VIDEO_DDR_RAS_N : STD_LOGIC;
  signal PS_VIDEO_DDR_RESET_N : STD_LOGIC;
  signal PS_VIDEO_DDR_WE_N : STD_LOGIC;
  signal PS_VIDEO_FCLK_CLK1 : STD_LOGIC;
  signal PS_VIDEO_FCLK_RESET0_N : STD_LOGIC;
  signal PS_VIDEO_FIXED_IO_DDR_VRN : STD_LOGIC;
  signal PS_VIDEO_FIXED_IO_DDR_VRP : STD_LOGIC;
  signal PS_VIDEO_FIXED_IO_MIO : STD_LOGIC_VECTOR ( 53 downto 0 );
  signal PS_VIDEO_FIXED_IO_PS_CLK : STD_LOGIC;
  signal PS_VIDEO_FIXED_IO_PS_PORB : STD_LOGIC;
  signal PS_VIDEO_FIXED_IO_PS_SRSTB : STD_LOGIC;
  signal PS_VIDEO_M06_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS_VIDEO_M06_AXI_ARREADY : STD_LOGIC;
  signal PS_VIDEO_M06_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal PS_VIDEO_M06_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS_VIDEO_M06_AXI_AWREADY : STD_LOGIC;
  signal PS_VIDEO_M06_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal PS_VIDEO_M06_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal PS_VIDEO_M06_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS_VIDEO_M06_AXI_BVALID : STD_LOGIC;
  signal PS_VIDEO_M06_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS_VIDEO_M06_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal PS_VIDEO_M06_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS_VIDEO_M06_AXI_RVALID : STD_LOGIC;
  signal PS_VIDEO_M06_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS_VIDEO_M06_AXI_WREADY : STD_LOGIC;
  signal PS_VIDEO_M06_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS_VIDEO_M06_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal PS_VIDEO_M07_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS_VIDEO_M07_AXI_ARREADY : STD_LOGIC;
  signal PS_VIDEO_M07_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal PS_VIDEO_M07_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS_VIDEO_M07_AXI_AWREADY : STD_LOGIC;
  signal PS_VIDEO_M07_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal PS_VIDEO_M07_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal PS_VIDEO_M07_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS_VIDEO_M07_AXI_BVALID : STD_LOGIC;
  signal PS_VIDEO_M07_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS_VIDEO_M07_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal PS_VIDEO_M07_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PS_VIDEO_M07_AXI_RVALID : STD_LOGIC;
  signal PS_VIDEO_M07_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PS_VIDEO_M07_AXI_WREADY : STD_LOGIC;
  signal PS_VIDEO_M07_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal PS_VIDEO_M07_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal PS_VIDEO_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal PS_VIDEO_M_AXIS_TLAST : STD_LOGIC;
  signal PS_VIDEO_M_AXIS_TREADY : STD_LOGIC;
  signal PS_VIDEO_M_AXIS_TUSER : STD_LOGIC;
  signal PS_VIDEO_M_AXIS_TVALID : STD_LOGIC;
  signal SYSTEM_RESETS_interconnect_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal VIDEO_PIPELINE_vid_io_out_ACTIVE_VIDEO : STD_LOGIC;
  signal VIDEO_PIPELINE_vid_io_out_DATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal VIDEO_PIPELINE_vid_io_out_HSYNC : STD_LOGIC;
  signal VIDEO_PIPELINE_vid_io_out_VSYNC : STD_LOGIC;
  signal axi_gpio_0_GPIO_TRI_O : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal clk_wiz_0_clk_out1 : STD_LOGIC;
  signal idata_1 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal ifval_1 : STD_LOGIC;
  signal ilval_1 : STD_LOGIC;
  signal pixclk_1 : STD_LOGIC;
  signal processing_system7_0_FCLK_CLK0 : STD_LOGIC;
  signal rst_PS7_150M_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal rst_PS7_75M_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  D5M_OUTPUT_IIC_SCL_I <= d5m_iic_scl_i;
  D5M_OUTPUT_IIC_SDA_I <= d5m_iic_sda_i;
  DIP_SWITCHES_8BITS_GPIO_TRI_I(7 downto 0) <= sws_8bits_tri_i(7 downto 0);
  HDMI_OUTPUT_IIC_SCL_I <= hdmi_iic_scl_i;
  HDMI_OUTPUT_IIC_SDA_I <= hdmi_iic_sda_i;
  d5m_iic_scl_o <= D5M_OUTPUT_IIC_SCL_O;
  d5m_iic_scl_t <= D5M_OUTPUT_IIC_SCL_T;
  d5m_iic_sda_o <= D5M_OUTPUT_IIC_SDA_O;
  d5m_iic_sda_t <= D5M_OUTPUT_IIC_SDA_T;
  hdmi_iic_scl_o <= HDMI_OUTPUT_IIC_SCL_O;
  hdmi_iic_scl_t <= HDMI_OUTPUT_IIC_SCL_T;
  hdmi_iic_sda_o <= HDMI_OUTPUT_IIC_SDA_O;
  hdmi_iic_sda_t <= HDMI_OUTPUT_IIC_SDA_T;
  idata_1(11 downto 0) <= idata(11 downto 0);
  ifval_1 <= ifval;
  ilval_1 <= ilval;
  io_hdmio_clk <= HDMI_OUTPUT_IO_HDMIO_CLK;
  io_hdmio_data(15 downto 0) <= HDMI_OUTPUT_IO_HDMIO_DATA(15 downto 0);
  io_hdmio_de <= HDMI_OUTPUT_IO_HDMIO_DE;
  io_hdmio_hsync <= HDMI_OUTPUT_IO_HDMIO_HSYNC;
  io_hdmio_spdif <= HDMI_OUTPUT_IO_HDMIO_SPDIF;
  io_hdmio_vsync <= HDMI_OUTPUT_IO_HDMIO_VSYNC;
  leds_8bits_tri_o(7 downto 0) <= axi_gpio_0_GPIO_TRI_O(7 downto 0);
  o_xclkin <= CLK_GEN_148MHZ_clk_out2;
  pixclk_1 <= pixclk;
  reseto(0) <= D5M_OUTPUT_reseto(0);
  trigger(0) <= D5M_OUTPUT_trigger(0);
CLK_GEN_148MHZ: component zynq_soc_CLK_GEN_148MHZ_0
     port map (
      clk_in1 => PS_VIDEO_FCLK_CLK1,
      clk_out1 => clk_wiz_0_clk_out1,
      clk_out2 => CLK_GEN_148MHZ_clk_out2
    );
D5M_OUTPUT: entity work.D5M_OUTPUT_imp_KZVKLU
     port map (
      CLK_75MHZ => PS7_FCLK_CLK2,
      D5M_IIC_scl_i => D5M_OUTPUT_IIC_SCL_I,
      D5M_IIC_scl_o => D5M_OUTPUT_IIC_SCL_O,
      D5M_IIC_scl_t => D5M_OUTPUT_IIC_SCL_T,
      D5M_IIC_sda_i => D5M_OUTPUT_IIC_SDA_I,
      D5M_IIC_sda_o => D5M_OUTPUT_IIC_SDA_O,
      D5M_IIC_sda_t => D5M_OUTPUT_IIC_SDA_T,
      S_AXI_araddr(8 downto 0) => PS7_axi_periph_M01_AXI_ARADDR(8 downto 0),
      S_AXI_arready => PS7_axi_periph_M01_AXI_ARREADY,
      S_AXI_arvalid => PS7_axi_periph_M01_AXI_ARVALID,
      S_AXI_awaddr(8 downto 0) => PS7_axi_periph_M01_AXI_AWADDR(8 downto 0),
      S_AXI_awready => PS7_axi_periph_M01_AXI_AWREADY,
      S_AXI_awvalid => PS7_axi_periph_M01_AXI_AWVALID,
      S_AXI_bready => PS7_axi_periph_M01_AXI_BREADY,
      S_AXI_bresp(1 downto 0) => PS7_axi_periph_M01_AXI_BRESP(1 downto 0),
      S_AXI_bvalid => PS7_axi_periph_M01_AXI_BVALID,
      S_AXI_rdata(31 downto 0) => PS7_axi_periph_M01_AXI_RDATA(31 downto 0),
      S_AXI_rready => PS7_axi_periph_M01_AXI_RREADY,
      S_AXI_rresp(1 downto 0) => PS7_axi_periph_M01_AXI_RRESP(1 downto 0),
      S_AXI_rvalid => PS7_axi_periph_M01_AXI_RVALID,
      S_AXI_wdata(31 downto 0) => PS7_axi_periph_M01_AXI_WDATA(31 downto 0),
      S_AXI_wready => PS7_axi_periph_M01_AXI_WREADY,
      S_AXI_wstrb(3 downto 0) => PS7_axi_periph_M01_AXI_WSTRB(3 downto 0),
      S_AXI_wvalid => PS7_axi_periph_M01_AXI_WVALID,
      reseto(0) => D5M_OUTPUT_reseto(0),
      s_axi_aresetn => rst_PS7_75M_peripheral_aresetn(0),
      trigger(0) => D5M_OUTPUT_trigger(0)
    );
DIP_SWITCHES_8BITS: component zynq_soc_DIP_SWITCHES_8BITS_0
     port map (
      gpio_io_i(7 downto 0) => DIP_SWITCHES_8BITS_GPIO_TRI_I(7 downto 0),
      s_axi_aclk => processing_system7_0_FCLK_CLK0,
      s_axi_araddr(8 downto 0) => PS_VIDEO_M06_AXI_ARADDR(8 downto 0),
      s_axi_aresetn => rst_PS7_150M_peripheral_aresetn(0),
      s_axi_arready => PS_VIDEO_M06_AXI_ARREADY,
      s_axi_arvalid => PS_VIDEO_M06_AXI_ARVALID(0),
      s_axi_awaddr(8 downto 0) => PS_VIDEO_M06_AXI_AWADDR(8 downto 0),
      s_axi_awready => PS_VIDEO_M06_AXI_AWREADY,
      s_axi_awvalid => PS_VIDEO_M06_AXI_AWVALID(0),
      s_axi_bready => PS_VIDEO_M06_AXI_BREADY(0),
      s_axi_bresp(1 downto 0) => PS_VIDEO_M06_AXI_BRESP(1 downto 0),
      s_axi_bvalid => PS_VIDEO_M06_AXI_BVALID,
      s_axi_rdata(31 downto 0) => PS_VIDEO_M06_AXI_RDATA(31 downto 0),
      s_axi_rready => PS_VIDEO_M06_AXI_RREADY(0),
      s_axi_rresp(1 downto 0) => PS_VIDEO_M06_AXI_RRESP(1 downto 0),
      s_axi_rvalid => PS_VIDEO_M06_AXI_RVALID,
      s_axi_wdata(31 downto 0) => PS_VIDEO_M06_AXI_WDATA(31 downto 0),
      s_axi_wready => PS_VIDEO_M06_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => PS_VIDEO_M06_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => PS_VIDEO_M06_AXI_WVALID(0)
    );
HDMI_OUTPUT: entity work.HDMI_OUTPUT_imp_13QHMTJ
     port map (
      CLK_148MHZ => clk_wiz_0_clk_out1,
      CLK_75MHZ => PS7_FCLK_CLK2,
      HDMI_IIC_scl_i => HDMI_OUTPUT_IIC_SCL_I,
      HDMI_IIC_scl_o => HDMI_OUTPUT_IIC_SCL_O,
      HDMI_IIC_scl_t => HDMI_OUTPUT_IIC_SCL_T,
      HDMI_IIC_sda_i => HDMI_OUTPUT_IIC_SDA_I,
      HDMI_IIC_sda_o => HDMI_OUTPUT_IIC_SDA_O,
      HDMI_IIC_sda_t => HDMI_OUTPUT_IIC_SDA_T,
      IO_HDMIO_clk => HDMI_OUTPUT_IO_HDMIO_CLK,
      IO_HDMIO_data(15 downto 0) => HDMI_OUTPUT_IO_HDMIO_DATA(15 downto 0),
      IO_HDMIO_de => HDMI_OUTPUT_IO_HDMIO_DE,
      IO_HDMIO_hsync => HDMI_OUTPUT_IO_HDMIO_HSYNC,
      IO_HDMIO_spdif => HDMI_OUTPUT_IO_HDMIO_SPDIF,
      IO_HDMIO_vsync => HDMI_OUTPUT_IO_HDMIO_VSYNC,
      S_AXI_araddr(8 downto 0) => PS7_axi_periph_M02_AXI_ARADDR(8 downto 0),
      S_AXI_arready => PS7_axi_periph_M02_AXI_ARREADY,
      S_AXI_arvalid => PS7_axi_periph_M02_AXI_ARVALID,
      S_AXI_awaddr(8 downto 0) => PS7_axi_periph_M02_AXI_AWADDR(8 downto 0),
      S_AXI_awready => PS7_axi_periph_M02_AXI_AWREADY,
      S_AXI_awvalid => PS7_axi_periph_M02_AXI_AWVALID,
      S_AXI_bready => PS7_axi_periph_M02_AXI_BREADY,
      S_AXI_bresp(1 downto 0) => PS7_axi_periph_M02_AXI_BRESP(1 downto 0),
      S_AXI_bvalid => PS7_axi_periph_M02_AXI_BVALID,
      S_AXI_rdata(31 downto 0) => PS7_axi_periph_M02_AXI_RDATA(31 downto 0),
      S_AXI_rready => PS7_axi_periph_M02_AXI_RREADY,
      S_AXI_rresp(1 downto 0) => PS7_axi_periph_M02_AXI_RRESP(1 downto 0),
      S_AXI_rvalid => PS7_axi_periph_M02_AXI_RVALID,
      S_AXI_wdata(31 downto 0) => PS7_axi_periph_M02_AXI_WDATA(31 downto 0),
      S_AXI_wready => PS7_axi_periph_M02_AXI_WREADY,
      S_AXI_wstrb(3 downto 0) => PS7_axi_periph_M02_AXI_WSTRB(3 downto 0),
      S_AXI_wvalid => PS7_axi_periph_M02_AXI_WVALID,
      VID_IO_IN_active_video => VIDEO_PIPELINE_vid_io_out_ACTIVE_VIDEO,
      VID_IO_IN_data(15 downto 0) => VIDEO_PIPELINE_vid_io_out_DATA(15 downto 0),
      VID_IO_IN_hsync => VIDEO_PIPELINE_vid_io_out_HSYNC,
      VID_IO_IN_vsync => VIDEO_PIPELINE_vid_io_out_VSYNC,
      s_axi_aresetn => rst_PS7_75M_peripheral_aresetn(0)
    );
LEDS_8BITS: component zynq_soc_LEDS_8BITS_0
     port map (
      gpio_io_o(7 downto 0) => axi_gpio_0_GPIO_TRI_O(7 downto 0),
      s_axi_aclk => processing_system7_0_FCLK_CLK0,
      s_axi_araddr(8 downto 0) => PS_VIDEO_M07_AXI_ARADDR(8 downto 0),
      s_axi_aresetn => rst_PS7_150M_peripheral_aresetn(0),
      s_axi_arready => PS_VIDEO_M07_AXI_ARREADY,
      s_axi_arvalid => PS_VIDEO_M07_AXI_ARVALID(0),
      s_axi_awaddr(8 downto 0) => PS_VIDEO_M07_AXI_AWADDR(8 downto 0),
      s_axi_awready => PS_VIDEO_M07_AXI_AWREADY,
      s_axi_awvalid => PS_VIDEO_M07_AXI_AWVALID(0),
      s_axi_bready => PS_VIDEO_M07_AXI_BREADY(0),
      s_axi_bresp(1 downto 0) => PS_VIDEO_M07_AXI_BRESP(1 downto 0),
      s_axi_bvalid => PS_VIDEO_M07_AXI_BVALID,
      s_axi_rdata(31 downto 0) => PS_VIDEO_M07_AXI_RDATA(31 downto 0),
      s_axi_rready => PS_VIDEO_M07_AXI_RREADY(0),
      s_axi_rresp(1 downto 0) => PS_VIDEO_M07_AXI_RRESP(1 downto 0),
      s_axi_rvalid => PS_VIDEO_M07_AXI_RVALID,
      s_axi_wdata(31 downto 0) => PS_VIDEO_M07_AXI_WDATA(31 downto 0),
      s_axi_wready => PS_VIDEO_M07_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => PS_VIDEO_M07_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => PS_VIDEO_M07_AXI_WVALID(0)
    );
PS_VIDEO: entity work.PS_VIDEO_imp_PVWY4M
     port map (
      CLK_100MHZ => PS_VIDEO_FCLK_CLK1,
      CLK_150MHZ => processing_system7_0_FCLK_CLK0,
      CLK_75MHZ => PS7_FCLK_CLK2,
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      M00_AXI_araddr(31 downto 0) => PS7_axi_periph_M00_AXI_ARADDR(31 downto 0),
      M00_AXI_arready => PS7_axi_periph_M00_AXI_ARREADY,
      M00_AXI_arvalid => PS7_axi_periph_M00_AXI_ARVALID,
      M00_AXI_awaddr(31 downto 0) => PS7_axi_periph_M00_AXI_AWADDR(31 downto 0),
      M00_AXI_awready => PS7_axi_periph_M00_AXI_AWREADY,
      M00_AXI_awvalid => PS7_axi_periph_M00_AXI_AWVALID,
      M00_AXI_bready => PS7_axi_periph_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => PS7_axi_periph_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => PS7_axi_periph_M00_AXI_BVALID,
      M00_AXI_rdata(31 downto 0) => PS7_axi_periph_M00_AXI_RDATA(31 downto 0),
      M00_AXI_rready => PS7_axi_periph_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => PS7_axi_periph_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => PS7_axi_periph_M00_AXI_RVALID,
      M00_AXI_wdata(31 downto 0) => PS7_axi_periph_M00_AXI_WDATA(31 downto 0),
      M00_AXI_wready => PS7_axi_periph_M00_AXI_WREADY,
      M00_AXI_wstrb(3 downto 0) => PS7_axi_periph_M00_AXI_WSTRB(3 downto 0),
      M00_AXI_wvalid => PS7_axi_periph_M00_AXI_WVALID,
      M01_AXI_araddr(8 downto 0) => PS7_axi_periph_M01_AXI_ARADDR(8 downto 0),
      M01_AXI_arready => PS7_axi_periph_M01_AXI_ARREADY,
      M01_AXI_arvalid => PS7_axi_periph_M01_AXI_ARVALID,
      M01_AXI_awaddr(8 downto 0) => PS7_axi_periph_M01_AXI_AWADDR(8 downto 0),
      M01_AXI_awready => PS7_axi_periph_M01_AXI_AWREADY,
      M01_AXI_awvalid => PS7_axi_periph_M01_AXI_AWVALID,
      M01_AXI_bready => PS7_axi_periph_M01_AXI_BREADY,
      M01_AXI_bresp(1 downto 0) => PS7_axi_periph_M01_AXI_BRESP(1 downto 0),
      M01_AXI_bvalid => PS7_axi_periph_M01_AXI_BVALID,
      M01_AXI_rdata(31 downto 0) => PS7_axi_periph_M01_AXI_RDATA(31 downto 0),
      M01_AXI_rready => PS7_axi_periph_M01_AXI_RREADY,
      M01_AXI_rresp(1 downto 0) => PS7_axi_periph_M01_AXI_RRESP(1 downto 0),
      M01_AXI_rvalid => PS7_axi_periph_M01_AXI_RVALID,
      M01_AXI_wdata(31 downto 0) => PS7_axi_periph_M01_AXI_WDATA(31 downto 0),
      M01_AXI_wready => PS7_axi_periph_M01_AXI_WREADY,
      M01_AXI_wstrb(3 downto 0) => PS7_axi_periph_M01_AXI_WSTRB(3 downto 0),
      M01_AXI_wvalid => PS7_axi_periph_M01_AXI_WVALID,
      M02_AXI_araddr(8 downto 0) => PS7_axi_periph_M02_AXI_ARADDR(8 downto 0),
      M02_AXI_arready => PS7_axi_periph_M02_AXI_ARREADY,
      M02_AXI_arvalid => PS7_axi_periph_M02_AXI_ARVALID,
      M02_AXI_awaddr(8 downto 0) => PS7_axi_periph_M02_AXI_AWADDR(8 downto 0),
      M02_AXI_awready => PS7_axi_periph_M02_AXI_AWREADY,
      M02_AXI_awvalid => PS7_axi_periph_M02_AXI_AWVALID,
      M02_AXI_bready => PS7_axi_periph_M02_AXI_BREADY,
      M02_AXI_bresp(1 downto 0) => PS7_axi_periph_M02_AXI_BRESP(1 downto 0),
      M02_AXI_bvalid => PS7_axi_periph_M02_AXI_BVALID,
      M02_AXI_rdata(31 downto 0) => PS7_axi_periph_M02_AXI_RDATA(31 downto 0),
      M02_AXI_rready => PS7_axi_periph_M02_AXI_RREADY,
      M02_AXI_rresp(1 downto 0) => PS7_axi_periph_M02_AXI_RRESP(1 downto 0),
      M02_AXI_rvalid => PS7_axi_periph_M02_AXI_RVALID,
      M02_AXI_wdata(31 downto 0) => PS7_axi_periph_M02_AXI_WDATA(31 downto 0),
      M02_AXI_wready => PS7_axi_periph_M02_AXI_WREADY,
      M02_AXI_wstrb(3 downto 0) => PS7_axi_periph_M02_AXI_WSTRB(3 downto 0),
      M02_AXI_wvalid => PS7_axi_periph_M02_AXI_WVALID,
      M06_AXI_araddr(31 downto 0) => PS_VIDEO_M06_AXI_ARADDR(31 downto 0),
      M06_AXI_arready(0) => PS_VIDEO_M06_AXI_ARREADY,
      M06_AXI_arvalid(0) => PS_VIDEO_M06_AXI_ARVALID(0),
      M06_AXI_awaddr(31 downto 0) => PS_VIDEO_M06_AXI_AWADDR(31 downto 0),
      M06_AXI_awready(0) => PS_VIDEO_M06_AXI_AWREADY,
      M06_AXI_awvalid(0) => PS_VIDEO_M06_AXI_AWVALID(0),
      M06_AXI_bready(0) => PS_VIDEO_M06_AXI_BREADY(0),
      M06_AXI_bresp(1 downto 0) => PS_VIDEO_M06_AXI_BRESP(1 downto 0),
      M06_AXI_bvalid(0) => PS_VIDEO_M06_AXI_BVALID,
      M06_AXI_rdata(31 downto 0) => PS_VIDEO_M06_AXI_RDATA(31 downto 0),
      M06_AXI_rready(0) => PS_VIDEO_M06_AXI_RREADY(0),
      M06_AXI_rresp(1 downto 0) => PS_VIDEO_M06_AXI_RRESP(1 downto 0),
      M06_AXI_rvalid(0) => PS_VIDEO_M06_AXI_RVALID,
      M06_AXI_wdata(31 downto 0) => PS_VIDEO_M06_AXI_WDATA(31 downto 0),
      M06_AXI_wready(0) => PS_VIDEO_M06_AXI_WREADY,
      M06_AXI_wstrb(3 downto 0) => PS_VIDEO_M06_AXI_WSTRB(3 downto 0),
      M06_AXI_wvalid(0) => PS_VIDEO_M06_AXI_WVALID(0),
      M07_AXI_araddr(31 downto 0) => PS_VIDEO_M07_AXI_ARADDR(31 downto 0),
      M07_AXI_arready(0) => PS_VIDEO_M07_AXI_ARREADY,
      M07_AXI_arvalid(0) => PS_VIDEO_M07_AXI_ARVALID(0),
      M07_AXI_awaddr(31 downto 0) => PS_VIDEO_M07_AXI_AWADDR(31 downto 0),
      M07_AXI_awready(0) => PS_VIDEO_M07_AXI_AWREADY,
      M07_AXI_awvalid(0) => PS_VIDEO_M07_AXI_AWVALID(0),
      M07_AXI_bready(0) => PS_VIDEO_M07_AXI_BREADY(0),
      M07_AXI_bresp(1 downto 0) => PS_VIDEO_M07_AXI_BRESP(1 downto 0),
      M07_AXI_bvalid(0) => PS_VIDEO_M07_AXI_BVALID,
      M07_AXI_rdata(31 downto 0) => PS_VIDEO_M07_AXI_RDATA(31 downto 0),
      M07_AXI_rready(0) => PS_VIDEO_M07_AXI_RREADY(0),
      M07_AXI_rresp(1 downto 0) => PS_VIDEO_M07_AXI_RRESP(1 downto 0),
      M07_AXI_rvalid(0) => PS_VIDEO_M07_AXI_RVALID,
      M07_AXI_wdata(31 downto 0) => PS_VIDEO_M07_AXI_WDATA(31 downto 0),
      M07_AXI_wready(0) => PS_VIDEO_M07_AXI_WREADY,
      M07_AXI_wstrb(3 downto 0) => PS_VIDEO_M07_AXI_WSTRB(3 downto 0),
      M07_AXI_wvalid(0) => PS_VIDEO_M07_AXI_WVALID(0),
      M_AXIS_tdata(15 downto 0) => PS_VIDEO_M_AXIS_TDATA(15 downto 0),
      M_AXIS_tlast => PS_VIDEO_M_AXIS_TLAST,
      M_AXIS_tready => PS_VIDEO_M_AXIS_TREADY,
      M_AXIS_tuser => PS_VIDEO_M_AXIS_TUSER,
      M_AXIS_tvalid => PS_VIDEO_M_AXIS_TVALID,
      aresetn150Mhz => rst_PS7_150M_peripheral_aresetn(0),
      aresetn75Mhz => rst_PS7_75M_peripheral_aresetn(0),
      iaresetn150Mhz => SYSTEM_RESETS_interconnect_aresetn(0),
      idata(11 downto 0) => idata_1(11 downto 0),
      ifval => ifval_1,
      ilval => ilval_1,
      master_aresetn => PS_VIDEO_FCLK_RESET0_N,
      pixclk => pixclk_1
    );
SYSTEM_RESETS: entity work.SYSTEM_RESETS_imp_5I36KH
     port map (
      CLK_150MHZ => processing_system7_0_FCLK_CLK0,
      CLK_75MHZ => PS7_FCLK_CLK2,
      aresetn150Mhz(0) => rst_PS7_150M_peripheral_aresetn(0),
      aresetn75Mhz(0) => rst_PS7_75M_peripheral_aresetn(0),
      iaresetn150Mhz(0) => SYSTEM_RESETS_interconnect_aresetn(0),
      master_aresetn => PS_VIDEO_FCLK_RESET0_N
    );
VIDEO_PIPELINE: entity work.VIDEO_PIPELINE_imp_1COWDW3
     port map (
      CLK_148MHZ => clk_wiz_0_clk_out1,
      CLK_150MHZ => processing_system7_0_FCLK_CLK0,
      ctrl_araddr(31 downto 0) => PS7_axi_periph_M00_AXI_ARADDR(31 downto 0),
      ctrl_arready => PS7_axi_periph_M00_AXI_ARREADY,
      ctrl_arvalid => PS7_axi_periph_M00_AXI_ARVALID,
      ctrl_awaddr(31 downto 0) => PS7_axi_periph_M00_AXI_AWADDR(31 downto 0),
      ctrl_awready => PS7_axi_periph_M00_AXI_AWREADY,
      ctrl_awvalid => PS7_axi_periph_M00_AXI_AWVALID,
      ctrl_bready => PS7_axi_periph_M00_AXI_BREADY,
      ctrl_bresp(1 downto 0) => PS7_axi_periph_M00_AXI_BRESP(1 downto 0),
      ctrl_bvalid => PS7_axi_periph_M00_AXI_BVALID,
      ctrl_rdata(31 downto 0) => PS7_axi_periph_M00_AXI_RDATA(31 downto 0),
      ctrl_rready => PS7_axi_periph_M00_AXI_RREADY,
      ctrl_rresp(1 downto 0) => PS7_axi_periph_M00_AXI_RRESP(1 downto 0),
      ctrl_rvalid => PS7_axi_periph_M00_AXI_RVALID,
      ctrl_wdata(31 downto 0) => PS7_axi_periph_M00_AXI_WDATA(31 downto 0),
      ctrl_wready => PS7_axi_periph_M00_AXI_WREADY,
      ctrl_wstrb(3 downto 0) => PS7_axi_periph_M00_AXI_WSTRB(3 downto 0),
      ctrl_wvalid => PS7_axi_periph_M00_AXI_WVALID,
      s_axi_aresetn => rst_PS7_150M_peripheral_aresetn(0),
      vid_io_out_active_video => VIDEO_PIPELINE_vid_io_out_ACTIVE_VIDEO,
      vid_io_out_data(15 downto 0) => VIDEO_PIPELINE_vid_io_out_DATA(15 downto 0),
      vid_io_out_hsync => VIDEO_PIPELINE_vid_io_out_HSYNC,
      vid_io_out_vsync => VIDEO_PIPELINE_vid_io_out_VSYNC,
      video_in_tdata(15 downto 0) => PS_VIDEO_M_AXIS_TDATA(15 downto 0),
      video_in_tlast => PS_VIDEO_M_AXIS_TLAST,
      video_in_tready => PS_VIDEO_M_AXIS_TREADY,
      video_in_tuser => PS_VIDEO_M_AXIS_TUSER,
      video_in_tvalid => PS_VIDEO_M_AXIS_TVALID
    );
end STRUCTURE;

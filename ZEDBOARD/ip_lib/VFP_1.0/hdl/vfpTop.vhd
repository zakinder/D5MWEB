--04282019 [04-28-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity VFP_v1_0 is
generic (
    revision_number             : std_logic_vector(31 downto 0) := x"04282019";
    C_rgb_m_axis_TDATA_WIDTH    : integer := 16;
    C_rgb_m_axis_START_COUNT    : integer := 32;
    C_rgb_s_axis_TDATA_WIDTH    : integer := 16;
    C_m_axis_mm2s_TDATA_WIDTH   : integer := 16;
    C_m_axis_mm2s_START_COUNT   : integer := 32;
    C_vfpConfig_DATA_WIDTH      : integer := 32;
    C_vfpConfig_ADDR_WIDTH      : integer := 8;
    i_data_width                : integer := 8;
    s_data_width                : integer := 16;
    b_data_width                : integer := 32;
    i_precision                 : integer := 12;
    i_full_range                : boolean := FALSE;
    conf_data_width             : integer := 32;
    conf_addr_width             : integer := 4;
    img_width                   : integer := 4096;
    p_data_width                : integer := 11);
port (
    -- d5m input
    pixclk                      : in std_logic;
    ifval                       : in std_logic;
    ilval                       : in std_logic;
    idata                       : in std_logic_vector(p_data_width downto 0);
    --tx channel                
    rgb_m_axis_aclk             : in std_logic;
    rgb_m_axis_aresetn          : in std_logic;
    rgb_m_axis_tvalid           : out std_logic;
    rgb_m_axis_tlast            : out std_logic;
    rgb_m_axis_tuser            : out std_logic;
    rgb_m_axis_tready           : in std_logic;
    rgb_m_axis_tdata            : out std_logic_vector(C_rgb_m_axis_TDATA_WIDTH-1 downto 0);
    --rx channel                
    rgb_s_axis_aclk             : in std_logic;
    rgb_s_axis_aresetn          : in std_logic;
    rgb_s_axis_tready           : out std_logic;
    rgb_s_axis_tvalid           : in std_logic;
    rgb_s_axis_tuser            : in std_logic;
    rgb_s_axis_tlast            : in std_logic;
    rgb_s_axis_tdata            : in std_logic_vector(C_rgb_s_axis_TDATA_WIDTH-1 downto 0);
    --destination channel       
    m_axis_mm2s_aclk            : in std_logic;
    m_axis_mm2s_aresetn         : in std_logic;
    m_axis_mm2s_tready          : in std_logic;
    m_axis_mm2s_tvalid          : out std_logic;
    m_axis_mm2s_tuser           : out std_logic;
    m_axis_mm2s_tlast           : out std_logic;
    m_axis_mm2s_tdata           : out std_logic_vector(C_m_axis_mm2s_TDATA_WIDTH-1 downto 0);
    m_axis_mm2s_tkeep           : out std_logic_vector(2 downto 0);
    m_axis_mm2s_tstrb           : out std_logic_vector(2 downto 0);
    m_axis_mm2s_tid             : out std_logic_vector(0 downto 0);
    m_axis_mm2s_tdest           : out std_logic_vector(0 downto 0);
    --video configuration       
    vfpconfig_aclk              : in std_logic;
    vfpconfig_aresetn           : in std_logic;
    vfpconfig_awaddr            : in std_logic_vector(C_vfpConfig_ADDR_WIDTH-1 downto 0);
    vfpconfig_awprot            : in std_logic_vector(2 downto 0);
    vfpconfig_awvalid           : in std_logic;
    vfpconfig_awready           : out std_logic;
    vfpconfig_wdata             : in std_logic_vector(C_vfpConfig_DATA_WIDTH-1 downto 0);
    vfpconfig_wstrb             : in std_logic_vector((C_vfpConfig_DATA_WIDTH/8)-1 downto 0);
    vfpconfig_wvalid            : in std_logic;
    vfpconfig_wready            : out std_logic;
    vfpconfig_bresp             : out std_logic_vector(1 downto 0);
    vfpconfig_bvalid            : out std_logic;
    vfpconfig_bready            : in std_logic;
    vfpconfig_araddr            : in std_logic_vector(C_vfpConfig_ADDR_WIDTH-1 downto 0);
    vfpconfig_arprot            : in std_logic_vector(2 downto 0);
    vfpconfig_arvalid           : in std_logic;
    vfpconfig_arready           : out std_logic;
    vfpconfig_rdata             : out std_logic_vector(C_vfpConfig_DATA_WIDTH-1 downto 0);
    vfpconfig_rresp             : out std_logic_vector(1 downto 0);
    vfpconfig_rvalid            : out std_logic;
    vfpconfig_rready            : in std_logic);
end VFP_v1_0;
architecture arch_imp of VFP_v1_0 is
    signal rx_axis_tready   : std_logic;
    signal rx_axis_tvalid   : std_logic;
    signal rx_axis_tuser    : std_logic;
    signal rx_axis_tlast    : std_logic;
    signal rx_axis_tdata    : std_logic_vector(m_axis_mm2s_tdata'range);
    signal aBusSelect       : std_logic_vector(vfpconfig_wdata'range):= (others => '0');
    signal videoChannel     : std_logic_vector(vfpconfig_wdata'range):= (others => '0');
    signal edgeType         : std_logic_vector(vfpconfig_wdata'range):= (others => '0');
    signal cRgbOsharp       : std_logic_vector(vfpconfig_wdata'range):= (others => '0');
    signal dChannel         : std_logic_vector(vfpconfig_wdata'range):= (others => '0');
    signal cChannel         : std_logic_vector(vfpconfig_wdata'range):= (others => '0');
    signal fifoStatus       : std_logic_vector(vfpconfig_wdata'range);
    signal gridLockDatao    : std_logic_vector(vfpconfig_wdata'range);
    signal seconds          : std_logic_vector(5 downto 0);
    signal minutes          : std_logic_vector(5 downto 0);
    signal hours            : std_logic_vector(4 downto 0);
    signal threshold        : std_logic_vector(15 downto 0);
    signal dCord            : coord;
    signal kls              : coefficient;
    signal als              : coefficient;
    signal rgbCoord         : region;
    signal pRegion          : poi;
    signal ycbcr            : channel;
    signal rawData          : rData;
    signal rawTp            : rTp;
    signal rgbSet           : rRgb;
    signal frameData        : fcolors;
    signal eof              : std_logic;
    signal sof              : std_logic;
    signal wrRegs           : mRegs;
    signal rdRegs           : mRegs;
begin
---------------------------------------------------------------------------------
-- d5mRawData
---------------------------------------------------------------------------------
d5mRawData_inst: d5m_raw_data
generic map(
    img_width            => img_width)
port map(
    m_axis_aclk          => m_axis_mm2s_aclk,
    m_axis_aresetn       => m_axis_mm2s_aresetn,
    pixclk               => pixclk,
    ifval                => ifval,
    ilval                => ilval,
    idata                => idata,
    oRawData             => rawData);
---------------------------------------------------------------------------------
-- bufferController
---------------------------------------------------------------------------------
bufferController_inst: dataTaps
generic map(
    img_width            => img_width,
    adwr_width           => 15,
    p_data_width         => p_data_width,
    addr_width           => 11)
port map(
    aclk                 => m_axis_mm2s_aclk,
    iRawData             => rawData,
    oTpData              => rawTp);
---------------------------------------------------------------------------------
-- raw2rgb
---------------------------------------------------------------------------------
raw2rgb_inst: raw2rgb
port map(
    clk                  => m_axis_mm2s_aclk,
    rst_l                => m_axis_mm2s_aresetn,
    iTpData              => rawTp,
    oRgbSet              => rgbSet);
---------------------------------------------------------------------------------
-- frameProcess
---------------------------------------------------------------------------------
frameProcess_inst: frameProcess
generic map(
    i_data_width        => i_data_width,
    s_data_width        => s_data_width,
    b_data_width        => b_data_width,
    img_width           => img_width,
    adwr_width          => 15,
    addr_width          => 11)
port map(
    clk                 => m_axis_mm2s_aclk,
    rst_l               => m_axis_mm2s_aresetn,
    iRgbSet             => rgbSet,
    --cpu side in
    iEdgeType           => edgeType,
    iPoiRegion          => pRegion,
    iThreshold          => threshold,
    iKls                => kls,
    iAls                => als,
    iRgbCoord           => rgbCoord,
    --to cpu
    oFifoStatus         => fifoStatus,
    oGridLockData       => gridLockDatao,
    --
    oFrameData          => frameData);
---------------------------------------------------------------------------------
-- videoSelect
---------------------------------------------------------------------------------
videoSelect_inst: videoSelect
port map(
    clk                 => m_axis_mm2s_aclk,              
    rst_l               => m_axis_mm2s_aresetn,
    videoChannel        => videoChannel,
    cRgbOsharp          => cRgbOsharp,
    dChannel            => dChannel,
    cChannel            => cChannel,
    iFrameData          => frameData,
    oRgb                => ycbcr,
    oEof                => eof,
    oSof                => sof,
    oCord               => dCord);
---------------------------------------------------------------------------------
-- videoProcess_v1_0_rgb_m_axis
---------------------------------------------------------------------------------
mAxis_inst: videoProcess_v1_0_rgb_m_axis
generic map (
    i_data_width         => i_data_width,
    s_data_width         => s_data_width)
port map (
    --stream clock/reset
    m_axis_mm2s_aclk     =>  rgb_s_axis_aclk,
    m_axis_mm2s_aresetn  =>  rgb_s_axis_aresetn,
    --config
    aBusSelect           =>  aBusSelect,
    --ycbcr
    mpeg444Y             =>  ycbcr.red,
    mpeg444CB            =>  ycbcr.green,
    mpeg444CR            =>  ycbcr.blue,
    color_valid          =>  ycbcr.valid,
    --image resolution
    iEof                 =>  eof,
    iSof                 =>  sof,
	iCord                =>  dCord,
    --stream to master
    rx_axis_tready_o     =>  rx_axis_tready,
    rx_axis_tvalid       =>  rx_axis_tvalid,
    rx_axis_tuser        =>  rx_axis_tuser,
    rx_axis_tlast        =>  rx_axis_tlast,
    rx_axis_tdata        =>  rx_axis_tdata,
    --tx channel
    rgb_m_axis_tvalid    =>  rgb_m_axis_tvalid,
    rgb_m_axis_tlast     =>  rgb_m_axis_tlast,
    rgb_m_axis_tuser     =>  rgb_m_axis_tuser,
    rgb_m_axis_tready    =>  rgb_m_axis_tready,
    rgb_m_axis_tdata     =>  rgb_m_axis_tdata,
    --rx channel
    rgb_s_axis_tready    =>  rgb_s_axis_tready,
    rgb_s_axis_tvalid    =>  rgb_s_axis_tvalid,
    rgb_s_axis_tuser     =>  rgb_s_axis_tuser,
    rgb_s_axis_tlast     =>  rgb_s_axis_tlast,
    rgb_s_axis_tdata     =>  rgb_s_axis_tdata);
---------------------------------------------------------------------------------
-- videoProcess_v1_0_m_axis_mm2s
---------------------------------------------------------------------------------
mm2s_inst: videoProcess_v1_0_m_axis_mm2s
generic map(
    s_data_width         => s_data_width)
port map(
    aclk                 => rgb_m_axis_aclk,
    aresetn              => rgb_m_axis_aresetn,
    rgb_s_axis_tready    => rx_axis_tready,
    rgb_s_axis_tvalid    => rx_axis_tvalid,
    rgb_s_axis_tuser     => rx_axis_tuser,
    rgb_s_axis_tlast     => rx_axis_tlast,
    rgb_s_axis_tdata     => rx_axis_tdata,
    m_axis_mm2s_tkeep    => m_axis_mm2s_tkeep,
    m_axis_mm2s_tstrb    => m_axis_mm2s_tstrb,
    m_axis_mm2s_tid      => m_axis_mm2s_tid,
    m_axis_mm2s_tdest    => m_axis_mm2s_tdest,
    m_axis_mm2s_tready   => m_axis_mm2s_tready,
    m_axis_mm2s_tvalid   => m_axis_mm2s_tvalid,
    m_axis_mm2s_tuser    => m_axis_mm2s_tuser,
    m_axis_mm2s_tlast    => m_axis_mm2s_tlast,    
    m_axis_mm2s_tdata    => m_axis_mm2s_tdata);
---------------------------------------------------------------------------------
-- videoProcess_v1_0_Config
---------------------------------------------------------------------------------
vfpConfig_inst : videoProcess_v1_0_Config
generic map(
    revision_number      => revision_number,
    C_S_AXI_DATA_WIDTH   => conf_data_width,
    C_S_AXI_ADDR_WIDTH   => C_vfpConfig_ADDR_WIDTH)
port map(
    wrRegsOut            => wrRegs,
    rdRegsIn             => rdRegs,
    S_AXI_ACLK           => vfpconfig_aclk,
    S_AXI_ARESETN        => vfpconfig_aresetn,
    S_AXI_AWADDR         => vfpconfig_awaddr,
    S_AXI_AWPROT         => vfpconfig_awprot,
    S_AXI_AWVALID        => vfpconfig_awvalid,
    S_AXI_AWREADY        => vfpconfig_awready,
    S_AXI_WDATA          => vfpconfig_wdata,
    S_AXI_WSTRB          => vfpconfig_wstrb,
    S_AXI_WVALID         => vfpconfig_wvalid,
    S_AXI_WREADY         => vfpconfig_wready,
    S_AXI_BRESP          => vfpconfig_bresp,
    S_AXI_BVALID         => vfpconfig_bvalid,
    S_AXI_BREADY         => vfpconfig_bready,
    S_AXI_ARADDR         => vfpconfig_araddr,
    S_AXI_ARPROT         => vfpconfig_arprot,
    S_AXI_ARVALID        => vfpconfig_arvalid,
    S_AXI_ARREADY        => vfpconfig_arready,
    S_AXI_RDATA          => vfpconfig_rdata,
    S_AXI_RRESP          => vfpconfig_rresp,
    S_AXI_RVALID         => vfpconfig_rvalid,
    S_AXI_RREADY         => vfpconfig_rready);
---------------------------------------------------------------------------------
-- mWrRd
--------------------------------------------------------------------------------- 
mWrRd_inst: mWrRd
generic map(
    revision_number      => revision_number,
    data_width           => C_vfpConfig_DATA_WIDTH)
port map(
    seconds              => seconds,
    minutes              => minutes,
    hours                => hours,
    rgbCoord             => rgbCoord,
    aBusSelect           => aBusSelect,
    threshold            => threshold,
    videoChannel         => videoChannel,
    dChannel             => dChannel,
    cChannel             => cChannel,
    oRgbOsharp           => cRgbOsharp,
    oEdgeType            => edgeType,
    pRegion              => pRegion,
    als                  => als,
    kls                  => kls,
    fifoStatus           => fifoStatus,
    gridLockDatao        => gridLockDatao,
    wrRegsIn             => wrRegs,
    rdRegsOut            => rdRegs);
---------------------------------------------------------------------------------
-- DigiClk
--------------------------------------------------------------------------------- 
digiClk_inst: digiClk
port map(
    clk1                 => vfpconfig_aclk,
    seconds              => seconds,
    minutes              => minutes,
    hours                => hours);
end arch_imp;
--01222019 [01-22-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.portspackage.all;
entity videoProcess_v1_0 is
generic (
    revision_number             : std_logic_vector(31 downto 0) := x"02052019";
    C_rgb_m_axis_TDATA_WIDTH    : integer := 16;
    C_rgb_m_axis_START_COUNT    : integer := 32;
    C_rgb_s_axis_TDATA_WIDTH    : integer := 16;
    C_m_axis_mm2s_TDATA_WIDTH   : integer := 16;
    C_m_axis_mm2s_START_COUNT   : integer := 32;
    C_config_axis_DATA_WIDTH    : integer := 32;
    C_config_axis_ADDR_WIDTH    : integer := 7;
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
    config_axis_aclk            : in std_logic;
    config_axis_aresetn         : in std_logic;
    config_axis_awaddr          : in std_logic_vector(C_config_axis_ADDR_WIDTH-1 downto 0);
    config_axis_awprot          : in std_logic_vector(2 downto 0);
    config_axis_awvalid         : in std_logic;
    config_axis_awready         : out std_logic;
    config_axis_wdata           : in std_logic_vector(C_config_axis_DATA_WIDTH-1 downto 0);
    config_axis_wstrb           : in std_logic_vector((C_config_axis_DATA_WIDTH/8)-1 downto 0);
    config_axis_wvalid          : in std_logic;
    config_axis_wready          : out std_logic;
    config_axis_bresp           : out std_logic_vector(1 downto 0);
    config_axis_bvalid          : out std_logic;
    config_axis_bready          : in std_logic;
    config_axis_araddr          : in std_logic_vector(C_config_axis_ADDR_WIDTH-1 downto 0);
    config_axis_arprot          : in std_logic_vector(2 downto 0);
    config_axis_arvalid         : in std_logic;
    config_axis_arready         : out std_logic;
    config_axis_rdata           : out std_logic_vector(C_config_axis_DATA_WIDTH-1 downto 0);
    config_axis_rresp           : out std_logic_vector(1 downto 0);
    config_axis_rvalid          : out std_logic;
    config_axis_rready          : in std_logic);
end videoProcess_v1_0;
architecture arch_imp of videoProcess_v1_0 is
    signal rx_axis_tready : std_logic;
    signal rx_axis_tvalid : std_logic;
    signal rx_axis_tuser  : std_logic;
    signal rx_axis_tlast  : std_logic;
    signal rx_axis_tdata  : std_logic_vector(C_m_axis_mm2s_TDATA_WIDTH-1 downto 0);
    signal aBusSelect     : std_logic_vector(C_config_axis_DATA_WIDTH-1 downto 0):= (others => '0');
    signal videoChannel   : std_logic_vector(C_config_axis_DATA_WIDTH-1 downto 0):= (others => '0');
    signal dChannel       : std_logic_vector(C_config_axis_DATA_WIDTH-1 downto 0):= (others => '0');
    signal cChannel       : std_logic_vector(C_config_axis_DATA_WIDTH-1 downto 0):= (others => '0');
    signal fifoStatus     : std_logic_vector(C_config_axis_DATA_WIDTH-1 downto 0);    
    signal en1pvalid      : std_logic:='0';
    signal en2pvalid      : std_logic:='0';
    signal seconds        : std_logic_vector(5 downto 0);
    signal minutes        : std_logic_vector(5 downto 0);
    signal hours          : std_logic_vector(4 downto 0);
    signal vTap0x         : std_logic_vector(p_data_width downto 0);
    signal vTap1x         : std_logic_vector(p_data_width downto 0);
    signal vTap2x         : std_logic_vector(p_data_width downto 0);
    signal pData          : std_logic_vector(p_data_width downto 0);
    signal endOfFrame     : std_logic;
    signal threshold      : std_logic_vector(15 downto 0);
    signal gridLockDatao  : std_logic_vector(C_config_axis_DATA_WIDTH-1 downto 0);
    signal gridDataRdEn   : std_logic;
    signal rgb            : channel;
    signal ycbcr          : channel;
    signal dCord          : coord;
    signal txCord         : coord;
    signal kls            : coefficient;
    signal als            : coefficient;
    signal rgbCoord       : region;
    signal pRegion        : poi;
begin
---------------------------------------------------------------------------------
-- d5m_raw_data
---------------------------------------------------------------------------------
mod1_inst: d5m_raw_data
port map(
    pixclk              => pixclk,
    ifval               => ifval,
    ilval               => ilval,
    idata               => idata,
    endOfFrame          => endOfFrame,
    p_tdata             => pData,
    p_tvalid            => en1pvalid,
    oCord               => txCord,
    m_axis_aclk         => m_axis_mm2s_aclk,
    m_axis_aresetn      => m_axis_mm2s_aresetn);
---------------------------------------------------------------------------------
-- buffer_controller
---------------------------------------------------------------------------------
mod2_inst: buffer_controller
    generic map(
    img_width            => img_width,
    adwr_width           => 15,
    p_data_width         => p_data_width,
    addr_width           => 11)
    port map(
    aclk                 => m_axis_mm2s_aclk,
    i_enable             => en1pvalid,
    i_data               => pData,
    i_wadd               => txCord.x,
    i_radd               => txCord.x,
    en_datao             => en2pvalid,
    taps0x               => vTap0x,
    taps1x               => vTap1x,
    taps2x               => vTap2x);
---------------------------------------------------------------------------------
-- raw2rgb
---------------------------------------------------------------------------------
mod3_inst: raw2rgb
generic map(
    rgbo_width           => i_data_width,
    cont_width           => s_data_width,
    p_data_width         => p_data_width)
port map(
    clk                  => m_axis_mm2s_aclk,
    rst_l                => m_axis_mm2s_aresetn,
    iValid               => en1pvalid,
    i_tap0               => vTap0x,
    i_tap1               => vTap1x,
    i_tap2               => vTap2x,
    rxCord               => txCord,
    oRgb                 => rgb);
---------------------------------------------------------------------------------
-- frameProcess
---------------------------------------------------------------------------------
mod5_inst: frameProcess
generic map(
    i_data_width        => i_data_width,
    s_data_width        => s_data_width,
    b_data_width        => b_data_width,
    i_precision         => i_precision,
    i_full_range        => FALSE,
    img_width           => img_width,
    adwr_width          => 15,
    addr_width          => 11)
port map(
    clk                 => m_axis_mm2s_aclk,
    rst_l               => m_axis_mm2s_aresetn,
    iRgb                => rgb,
    oRgb                => ycbcr,
	videoChannel        => videoChannel,
    dChannel            => dChannel,
    cChannel            => cChannel,
    pRegion             => pRegion,
    fifoStatus          => fifoStatus,
    gridLockDatao       => gridLockDatao,
    gridDataRdEn        => gridDataRdEn,
    threshold           => threshold,
    endOfFrame          => endOfFrame,
	kls                 => kls,
	als                 => als,
    rgbCoord            => rgbCoord,
    iCord               => txCord,
    oCord               => dCord);
---------------------------------------------------------------------------------
-- videoProcess_v1_0_rgb_m_axis
---------------------------------------------------------------------------------
mod7_inst: videoProcess_v1_0_rgb_m_axis
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
    pXcont               =>  dCord.x,
    pYcont               =>  dCord.y,
    endOfFrame           =>  endOfFrame,
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
mod8_inst: videoProcess_v1_0_m_axis_mm2s
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
-- videoProcess_v1_0_config_axis
---------------------------------------------------------------------------------
mod9_inst : videoProcess_v1_0_config_axis
generic map(
    revision_number      => revision_number,
    C_S_AXI_DATA_WIDTH   => conf_data_width,
    C_S_AXI_ADDR_WIDTH   => C_config_axis_ADDR_WIDTH)
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
    pRegion              => pRegion,
    fifoStatus           => fifoStatus,
    gridLockDatao        => gridLockDatao,
    gridDataRdEn         => gridDataRdEn,
	kls                  => kls,
    als                  => als,
    S_AXI_ACLK           => config_axis_aclk,
    S_AXI_ARESETN        => config_axis_aresetn,
    S_AXI_AWADDR         => config_axis_awaddr,
    S_AXI_AWPROT         => config_axis_awprot,
    S_AXI_AWVALID        => config_axis_awvalid,
    S_AXI_AWREADY        => config_axis_awready,
    S_AXI_WDATA          => config_axis_wdata,
    S_AXI_WSTRB          => config_axis_wstrb,
    S_AXI_WVALID         => config_axis_wvalid,
    S_AXI_WREADY         => config_axis_wready,
    S_AXI_BRESP          => config_axis_bresp,
    S_AXI_BVALID         => config_axis_bvalid,
    S_AXI_BREADY         => config_axis_bready,
    S_AXI_ARADDR         => config_axis_araddr,
    S_AXI_ARPROT         => config_axis_arprot,
    S_AXI_ARVALID        => config_axis_arvalid,
    S_AXI_ARREADY        => config_axis_arready,
    S_AXI_RDATA          => config_axis_rdata,
    S_AXI_RRESP          => config_axis_rresp,
    S_AXI_RVALID         => config_axis_rvalid,
    S_AXI_RREADY         => config_axis_rready);
---------------------------------------------------------------------------------
-- digi_clk
---------------------------------------------------------------------------------
mod10_inst: digi_clk
port map(
    clk1                 => config_axis_aclk,
    seconds              => seconds,
    minutes              => minutes,
    hours                => hours);
end arch_imp;
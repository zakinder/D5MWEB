--01062019 [01-06-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
use work.commonpackage.all;
entity videoProcess_tb is
end videoProcess_tb;
    -------------------------------------------------------------------------
architecture behavioral of videoProcess_tb is
    -------------------------------------------------------------------------
    constant img_width                 : integer := 512;--row[1 to x]
    constant p_data_width              : integer := 11; 
    constant line_hight                : integer := 5;  
    component VFP_v1_0 is
    generic (
    revision_number             : std_logic_vector(31 downto 0) := x"02172019";
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
    vfpconfig_aclk            : in std_logic;
    vfpconfig_aresetn         : in std_logic;
    vfpconfig_awaddr          : in std_logic_vector(C_vfpConfig_ADDR_WIDTH-1 downto 0);
    vfpconfig_awprot          : in std_logic_vector(2 downto 0);
    vfpconfig_awvalid         : in std_logic;
    vfpconfig_awready         : out std_logic;
    vfpconfig_wdata           : in std_logic_vector(C_vfpConfig_DATA_WIDTH-1 downto 0);
    vfpconfig_wstrb           : in std_logic_vector((C_vfpConfig_DATA_WIDTH/8)-1 downto 0);
    vfpconfig_wvalid          : in std_logic;
    vfpconfig_wready          : out std_logic;
    vfpconfig_bresp           : out std_logic_vector(1 downto 0);
    vfpconfig_bvalid          : out std_logic;
    vfpconfig_bready          : in std_logic;
    vfpconfig_araddr          : in std_logic_vector(C_vfpConfig_ADDR_WIDTH-1 downto 0);
    vfpconfig_arprot          : in std_logic_vector(2 downto 0);
    vfpconfig_arvalid         : in std_logic;
    vfpconfig_arready         : out std_logic;
    vfpconfig_rdata           : out std_logic_vector(C_vfpConfig_DATA_WIDTH-1 downto 0);
    vfpconfig_rresp           : out std_logic_vector(1 downto 0);
    vfpconfig_rvalid          : out std_logic;
    vfpconfig_rready          : in std_logic);
    end component VFP_v1_0;
    component dut_d5m is
    generic (
    pixclk_freq                 : real    := 90.00e6;
    img_width                   : integer := 112;
    line_hight                  : integer := 122;
    p_data_width                : integer := 11);
    port (
    pixclk                      : out std_logic;
    ifval                       : out std_logic;
    ilval                       : out std_logic;
    idata                       : out std_logic_vector(p_data_width downto 0));
    end component dut_d5m;
    component dut_configAxis is
    generic (
    aclk_freq                   : real    := 75.00e6;
    C_vfpConfig_DATA_WIDTH    : integer := 32;
    C_vfpConfig_ADDR_WIDTH    : integer := 8);
    port (
    vfpconfig_aclk            : out std_logic;
    vfpconfig_aresetn         : out std_logic;
    vfpconfig_awaddr          : out std_logic_vector(C_vfpConfig_ADDR_WIDTH-1 downto 0);
    vfpconfig_awprot          : out std_logic_vector(2 downto 0);
    vfpconfig_awvalid         : out std_logic;
    vfpconfig_awready         : in std_logic;
    vfpconfig_wdata           : out std_logic_vector(C_vfpConfig_DATA_WIDTH-1 downto 0);
    vfpconfig_wstrb           : out std_logic_vector((C_vfpConfig_DATA_WIDTH/8)-1 downto 0);
    vfpconfig_wvalid          : out std_logic;
    vfpconfig_wready          : in std_logic;
    vfpconfig_bresp           : in std_logic_vector(1 downto 0);
    vfpconfig_bvalid          : in std_logic;
    vfpconfig_bready          : out std_logic;
    vfpconfig_araddr          : out std_logic_vector(C_vfpConfig_ADDR_WIDTH-1 downto 0);
    vfpconfig_arprot          : out std_logic_vector(2 downto 0);
    vfpconfig_arvalid         : out std_logic;
    vfpconfig_arready         : in std_logic;
    vfpconfig_rdata           : in std_logic_vector(C_vfpConfig_DATA_WIDTH-1 downto 0);
    vfpconfig_rresp           : in std_logic_vector(1 downto 0);
    vfpconfig_rvalid          : in std_logic;
    vfpconfig_rready          : out std_logic);
    end component dut_configAxis;
    -------------------------------------------------------------------------
    component dut_frameProcess is
    port (
    clk            : in std_logic;
    resetn         : in std_logic);
    end component dut_frameProcess;
    constant revision_number     : std_logic_vector(31 downto 0) := x"02212019";
    signal resetn                : std_logic :='0';
    -- d5m input
    signal pixclk                : std_logic;
    signal ifval                 : std_logic;
    signal ilval                 : std_logic;
    signal idata                 : std_logic_vector(p_data_width downto 0);
    --tx channel
    signal rgb_m_axis_aclk       : std_logic;
    signal rgb_m_axis_aresetn    : std_logic :='0';
    
    signal rgb_m_axis_tvalid     : std_logic;
    signal rgb_m_axis_tlast      : std_logic;
    signal rgb_m_axis_tuser      : std_logic;
    signal rgb_m_axis_tready     : std_logic;
    signal rgb_m_axis_tdata      : std_logic_vector(s_data_width-1 downto 0);
    --rx channel
    signal rgb_s_axis_aclk       : std_logic;
    signal rgb_s_axis_aresetn    : std_logic :='0';
    signal rgb_s_axis_tready     : std_logic;
    signal rgb_s_axis_tvalid     : std_logic;
    signal rgb_s_axis_tuser      : std_logic;
    signal rgb_s_axis_tlast      : std_logic;
    signal rgb_s_axis_tdata      : std_logic_vector(s_data_width-1 downto 0);
    --destination channel
    signal m_axis_mm2s_aclk      : std_logic;
    signal m_axis_mm2s_aresetn   : std_logic :='0';
    signal m_axis_mm2s_tready    : std_logic;
    signal m_axis_mm2s_tvalid    : std_logic;
    signal m_axis_mm2s_tuser     : std_logic;
    signal m_axis_mm2s_tlast     : std_logic;
    signal m_axis_mm2s_tdata     : std_logic_vector(s_data_width-1 downto 0);
    signal m_axis_mm2s_tkeep     : std_logic_vector(2 downto 0);
    signal m_axis_mm2s_tstrb     : std_logic_vector(2 downto 0);
    signal m_axis_mm2s_tid       : std_logic_vector(0 downto 0);
    signal m_axis_mm2s_tdest     : std_logic_vector(0 downto 0);
    --video configuration
    signal vfpconfig_aclk      : std_logic;
    signal vfpconfig_aresetn   : std_logic :='0';
    signal vfpconfig_awaddr    : std_logic_vector(C_vfpConfig_ADDR_WIDTH-1 downto 0);
    signal vfpconfig_awprot    : std_logic_vector(2 downto 0);
    signal vfpconfig_awvalid   : std_logic;
    signal vfpconfig_awready   : std_logic;
    signal vfpconfig_wdata     : std_logic_vector(conf_data_width-1 downto 0);
    signal vfpconfig_wstrb     : std_logic_vector((conf_data_width/8)-1 downto 0);
    signal vfpconfig_wvalid    : std_logic;
    signal vfpconfig_wready    : std_logic;
    signal vfpconfig_bresp     : std_logic_vector(1 downto 0);
    signal vfpconfig_bvalid    : std_logic;
    signal vfpconfig_bready    : std_logic;
    signal vfpconfig_araddr    : std_logic_vector(C_vfpConfig_ADDR_WIDTH-1 downto 0);
    signal vfpconfig_arprot    : std_logic_vector(2 downto 0);
    signal vfpconfig_arvalid   : std_logic;
    signal vfpconfig_arready   : std_logic;
    signal vfpconfig_rdata     : std_logic_vector(conf_data_width-1 downto 0);
    signal vfpconfig_rresp     : std_logic_vector(1 downto 0);
    signal vfpconfig_rvalid    : std_logic;
    signal vfpconfig_rready    : std_logic;
begin
    -------------------------------------------------------------------------
    clk_gen(m_axis_mm2s_aclk, 150.00e6);
    clk_gen(rgb_m_axis_aclk, 150.00e6);
    clk_gen(rgb_s_axis_aclk, 150.00e6);
    -------------------------------------------------------------------------
    rgb_s_axis_tvalid    <= rgb_m_axis_tvalid;
    rgb_s_axis_tlast     <= rgb_m_axis_tlast;
    rgb_s_axis_tuser     <= rgb_m_axis_tuser;
    rgb_m_axis_tready    <= rgb_s_axis_tready;
    rgb_s_axis_tdata     <= rgb_m_axis_tdata;
    -------------------------------------------------------------------------
    process begin
        m_axis_mm2s_aresetn  <= '0';
        rgb_s_axis_aresetn   <= '0';
        rgb_m_axis_aresetn   <= '0';
        resetn               <= '0';
    wait for 2 ns;
        resetn               <= '1';
    wait for 10 ns;
        m_axis_mm2s_aresetn  <= '1';
        rgb_s_axis_aresetn   <= '1';
        rgb_m_axis_aresetn   <= '1';   
    wait;
    end process;
dut_d5m_inst: dut_d5m
generic map(
    pixclk_freq                 => pixclk_freq,
    img_width                   => img_width,
    line_hight                  => line_hight,
    p_data_width                => p_data_width)    
port map(
    pixclk                      => pixclk,
    ifval                       => ifval,
    ilval                       => ilval,
    idata                       => idata);
dut_configAxis_inst: dut_configAxis
generic map(
    aclk_freq                   => aclk_freq,
    C_vfpConfig_DATA_WIDTH    => C_vfpConfig_DATA_WIDTH,
    C_vfpConfig_ADDR_WIDTH    => C_vfpConfig_ADDR_WIDTH)    
port map(
    --video configuration       
    vfpconfig_aclk            => vfpconfig_aclk,
    vfpconfig_aresetn         => vfpconfig_aresetn,
    vfpconfig_awaddr          => vfpconfig_awaddr,
    vfpconfig_awprot          => vfpconfig_awprot,
    vfpconfig_awvalid         => vfpconfig_awvalid,
    vfpconfig_awready         => vfpconfig_awready,
    vfpconfig_wdata           => vfpconfig_wdata,
    vfpconfig_wstrb           => vfpconfig_wstrb,
    vfpconfig_wvalid          => vfpconfig_wvalid,
    vfpconfig_wready          => vfpconfig_wready,
    vfpconfig_bresp           => vfpconfig_bresp,
    vfpconfig_bvalid          => vfpconfig_bvalid,
    vfpconfig_bready          => vfpconfig_bready,
    vfpconfig_araddr          => vfpconfig_araddr,
    vfpconfig_arprot          => vfpconfig_arprot,
    vfpconfig_arvalid         => vfpconfig_arvalid,
    vfpconfig_arready         => vfpconfig_arready,
    vfpconfig_rdata           => vfpconfig_rdata,
    vfpconfig_rresp           => vfpconfig_rresp,
    vfpconfig_rvalid          => vfpconfig_rvalid,
    vfpconfig_rready          => vfpconfig_rready);  
d5m_camera_inst: VFP_v1_0
generic map(
    revision_number             => revision_number,
    C_rgb_m_axis_TDATA_WIDTH    => C_rgb_m_axis_TDATA_WIDTH,
    C_rgb_m_axis_START_COUNT    => C_rgb_m_axis_START_COUNT,
    C_rgb_s_axis_TDATA_WIDTH    => C_rgb_s_axis_TDATA_WIDTH,
    C_m_axis_mm2s_TDATA_WIDTH   => C_m_axis_mm2s_TDATA_WIDTH,
    C_m_axis_mm2s_START_COUNT   => C_m_axis_mm2s_START_COUNT,
    C_vfpConfig_DATA_WIDTH      => C_vfpConfig_DATA_WIDTH,
    C_vfpConfig_ADDR_WIDTH      => C_vfpConfig_ADDR_WIDTH,
    i_data_width                => i_data_width,
    s_data_width                => s_data_width,
    b_data_width                => b_data_width,
    i_precision                 => i_precision,
    i_full_range                => i_full_range,
    conf_data_width             => conf_data_width,
    conf_addr_width             => conf_addr_width,
    img_width                   => img_width,
    p_data_width                => p_data_width)
port map(
    -- d5m input
    pixclk                      => pixclk,
    ifval                       => ifval,
    ilval                       => ilval,
    idata                       => idata,
    --tx channel
    rgb_m_axis_aclk             => rgb_m_axis_aclk,
    rgb_m_axis_aresetn          => rgb_m_axis_aresetn,
    rgb_m_axis_tvalid           => rgb_m_axis_tvalid,
    rgb_m_axis_tlast            => rgb_m_axis_tlast,
    rgb_m_axis_tuser            => rgb_m_axis_tuser,
    rgb_m_axis_tready           => rgb_m_axis_tready,
    rgb_m_axis_tdata            => rgb_m_axis_tdata,
    --rx channel                
    rgb_s_axis_aclk             => rgb_s_axis_aclk,
    rgb_s_axis_aresetn          => rgb_s_axis_aresetn,
    rgb_s_axis_tready           => rgb_s_axis_tready,
    rgb_s_axis_tvalid           => rgb_s_axis_tvalid,
    rgb_s_axis_tuser            => rgb_s_axis_tuser,
    rgb_s_axis_tlast            => rgb_s_axis_tlast,
    rgb_s_axis_tdata            => rgb_s_axis_tdata,
    --destination channel       
    m_axis_mm2s_aclk            => m_axis_mm2s_aclk,
    m_axis_mm2s_aresetn         => m_axis_mm2s_aresetn,
    m_axis_mm2s_tready          => m_axis_mm2s_tready,
    m_axis_mm2s_tvalid          => m_axis_mm2s_tvalid,
    m_axis_mm2s_tuser           => m_axis_mm2s_tuser,
    m_axis_mm2s_tlast           => m_axis_mm2s_tlast,
    m_axis_mm2s_tdata           => m_axis_mm2s_tdata,
    m_axis_mm2s_tkeep           => m_axis_mm2s_tkeep,
    m_axis_mm2s_tstrb           => m_axis_mm2s_tstrb,
    m_axis_mm2s_tid             => m_axis_mm2s_tid,
    m_axis_mm2s_tdest           => m_axis_mm2s_tdest,
    --video configuration       
    vfpconfig_aclk            => vfpconfig_aclk,
    vfpconfig_aresetn         => vfpconfig_aresetn,
    vfpconfig_awaddr          => vfpconfig_awaddr,
    vfpconfig_awprot          => vfpconfig_awprot,
    vfpconfig_awvalid         => vfpconfig_awvalid,
    vfpconfig_awready         => vfpconfig_awready,
    vfpconfig_wdata           => vfpconfig_wdata,
    vfpconfig_wstrb           => vfpconfig_wstrb,
    vfpconfig_wvalid          => vfpconfig_wvalid,
    vfpconfig_wready          => vfpconfig_wready,
    vfpconfig_bresp           => vfpconfig_bresp,
    vfpconfig_bvalid          => vfpconfig_bvalid,
    vfpconfig_bready          => vfpconfig_bready,
    vfpconfig_araddr          => vfpconfig_araddr,
    vfpconfig_arprot          => vfpconfig_arprot,
    vfpconfig_arvalid         => vfpconfig_arvalid,
    vfpconfig_arready         => vfpconfig_arready,
    vfpconfig_rdata           => vfpconfig_rdata,
    vfpconfig_rresp           => vfpconfig_rresp,
    vfpconfig_rvalid          => vfpconfig_rvalid,
    vfpconfig_rready          => vfpconfig_rready);
    -------------------------------------------------------------------------------------------
frameProcess_test : dut_frameProcess
port map(
    clk          => rgb_m_axis_aclk,
    resetn       => resetn);
end behavioral;
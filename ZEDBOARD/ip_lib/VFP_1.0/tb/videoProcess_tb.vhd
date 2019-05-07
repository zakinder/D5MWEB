--01062019 [01-06-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
use work.tbPackage.all;
use work.dutPortsPackage.all;
entity videoProcess_tb is
end videoProcess_tb;
architecture behavioral of videoProcess_tb is
    signal resetn                        : std_logic :='0';
    signal clk                           : std_logic;
    constant DUT_VFP_ENABLED             : boolean := false;
    constant DUT_FRAMEPROCESS_ENABLED    : boolean := false;
    constant DUT_POINTOFINTEREST_ENABLED : boolean := true;
begin
    clk_gen(clk, 150.00e6);
    process begin
        resetn  <= '0';
    wait for 2 ns;
        resetn  <= '1';
    wait;
    end process;
POINTOFINTEREST_ENABLED : if (DUT_POINTOFINTEREST_ENABLED = true) generate
constant adwrWidth      : integer := 16;
constant addrWidth      : integer := 12;
signal txCord           : coord;
signal pRegion          : poi;
signal oGridLockData    : std_logic_vector(b_data_width-1 downto 0);
signal oFifoStatus      : std_logic_vector(b_data_width-1 downto 0);
signal rgbPoiLock       : std_logic;
signal endOfFrame       : std_logic;
signal wrAddress        : std_logic_vector (13 downto 0);
signal wrAddrsGlCtr     : integer := 0;
signal enableWrite      : std_logic;
signal rgbCoord         : region;
signal rgbDetectLock    : std_logic;
signal hsv              : hsvChannel;
signal rgbIn            : channel;
signal rgbPoi           : channel;
signal oRgbGrid         : channel;
signal blur1vx          : channel;
signal blur2vx          : channel;
signal blur3vx          : channel;
signal blur4vx          : channel;
signal blur5vx          : channel;
signal rgbCorrect1      : channel;
signal rgbCorrect2      : channel;
signal sharp            : channel;
signal als              : coefficient;
signal kls              : coefficient;
begin
als.k1                  <= x"0000000D";--  1.375
als.k2                  <= x"000000FE";-- -0.250
als.k3                  <= x"000000FF";-- -0.125
als.k4                  <= x"000000FF";-- -0.125
als.k5                  <= x"0000000E";--  1.375 green gain by po
als.k6                  <= x"000000FE";-- -0.250
als.k7                  <= x"000000FE";-- -0.250
als.k8                  <= x"000000FF";-- -0.125
als.k9                  <= x"0000000D";--  1.375
als.config              <= 1;
kls.k1                  <= x"00000000";
kls.k2                  <= x"00000000";
kls.k3                  <= x"00000000";
kls.k4                  <= x"00000000";
kls.k5                  <= x"00000000";
kls.k6                  <= x"00000000";
kls.k7                  <= x"00000000";
kls.k8                  <= x"00000000";
kls.k9                  <= x"00000000";
kls.config              <= 0;
enableWrite             <= hi;
IMAGE2_imageRead: imageRead
generic map (
    i_data_width       => 8,
    input_file         => readbmp)
port map (                  
    clk                => clk,
    reset              => resetn,
    oRgb               => rgbIn,
    oCord              => txCord,
    endOfFrame         => endOfFrame,
    rl                 => rgbCoord.rl,
    rh                 => rgbCoord.rh,
    gl                 => rgbCoord.gl,
    gh                 => rgbCoord.gh,
    bl                 => rgbCoord.bl,
    bh                 => rgbCoord.bh);
sharpFilterInst: sharpFilter
generic map(
    i_data_width        => i_data_width,
    img_width           => img_width,
    adwrWidth           => adwrWidth,
    addrWidth           => addrWidth)
port map(   
    clk                 => clk,
    rst_l               => resetn,
    iRgb                => rgbIn,
    endOfFrame          => endOfFrame,
    kls                 => kls,
    oRgb                => sharp);
blurFilter1xInst: blurFilter
generic map(
    iMSB                => blurMsb,
    iLSB                => blurLsb,
    i_data_width        => i_data_width,
    img_width           => img_width,
    adwrWidth           => adwrWidth,
    addrWidth           => addrWidth)
port map(
    clk                 => clk,
    rst_l               => resetn,
    iRgb                => sharp,
    oRgb                => blur1vx);
blurFilter2xInst: blurFilter
generic map(
    iMSB                => blurMsb - 1,
    iLSB                => blurLsb - 1,
    i_data_width        => i_data_width,
    img_width           => img_width,
    adwrWidth           => adwrWidth,
    addrWidth           => addrWidth)
port map(
    clk                 => clk,
    rst_l               => resetn,
    iRgb                => blur1vx,
    oRgb                => blur2vx);
blurFilter3xInst: blurFilter
generic map(
    iMSB                => blurMsb - 1,
    iLSB                => blurLsb - 1,
    i_data_width        => i_data_width,
    img_width           => img_width,
    adwrWidth           => adwrWidth,
    addrWidth           => addrWidth)
port map(
    clk                 => clk,
    rst_l               => resetn,
    iRgb                => blur2vx,
    oRgb                => blur3vx);
blurFilter4xInst: blurFilter
generic map(
    iMSB                => blurMsb - 1,
    iLSB                => blurLsb - 1,
    i_data_width        => i_data_width,
    img_width           => img_width,
    adwrWidth           => adwrWidth,
    addrWidth           => addrWidth)
port map(
    clk                 => clk,
    rst_l               => resetn,
    iRgb                => blur3vx,
    oRgb                => blur4vx);
colorCorrection1Inst: colorCorrection
generic map(
    i_data_width        => i_data_width)
port map(           
    clk                 => clk,
    rst_l               => resetn,
    iRgb                => blur4vx,
    als                 => als,    
    oRgb                => rgbCorrect1);
hsvInst: hsv_c
generic map(
    i_data_width        => 8)
port map(   
    clk                 => clk,
    reset               => resetn,
    iRgb                => rgbCorrect1,
    oHsv                => hsv);
    ----------------------------------
    rgbPoi.red            <= hsv.h;
    rgbPoi.green          <= hsv.s;
    rgbPoi.blue           <= hsv.v;
    rgbPoi.valid          <= hsv.valid;
    ----------------------------------
blurFilter5xInst: blurFilter
generic map(
    iMSB                => blurMsb,
    iLSB                => blurLsb,
    i_data_width        => i_data_width,
    img_width           => img_width,
    adwrWidth           => adwrWidth,
    addrWidth           => addrWidth)
port map(
    clk                 => clk,
    rst_l               => resetn,
    iRgb                => rgbPoi,
    oRgb                => blur5vx); 
colorCorrection2Inst: colorCorrection
generic map(
    i_data_width        => i_data_width)
port map(           
    clk                 => clk,
    rst_l               => resetn,
    iRgb                => blur5vx,
    als                 => als,    
    oRgb                => rgbCorrect2);
WRITEIMAGE1: imageWrite
generic map (
    enImageText        => true,
    enImageIndex       => false,
    i_data_width       => 8,
    test               => "images",
    input_file         => readbmp,
    output_file        => "rgbPoi")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => rgbCorrect2);
-- enableWrite <= not(oFifoStatus(1));
-- pointOfInterest_inst: pointOfInterest
-- generic map(
    -- i_data_width       => i_data_width,
    -- s_data_width       => s_data_width,
    -- b_data_width       => b_data_width)
-- port map(
    -- clk                => clk,
    -- rst_l              => resetn,
    -- iRgb               => rgbIn,
    -- iCord              => txCord,
    -- endOfFrame         => endOfFrame,
    -- gridLockDatao      => oGridLockData,
    -- pRegion            => pRegion,
    -- fifoStatus         => oFifoStatus,
    -- oGridLocation      => rgbPoiLock,
    -- oRgb               => rgbPoi);
--enableWrite <= '1' when rgbCoord.rh = x"f0";
-- detectInst: detect
-- generic map(
    -- i_data_width        => 8)
-- port map(
    -- clk                 => clk,
    -- rst_l               => resetn,
    -- iRgb                => rgbIn,
    -- rgbCoord            => rgbCoord,
    -- endOfFrame          => endOfFrame,
    -- iCord               => txCord,
    -- pDetect             => rgbDetectLock,
    -- oRgb                => rgbPoi);
    oRgbGrid.red            <= oGridLockData(23 downto 16);
    oRgbGrid.green          <= oGridLockData(15 downto 8);
    oRgbGrid.blue           <= oGridLockData(7 downto 0);
    oRgbGrid.valid          <= oFifoStatus(2);
    pRegion.pointInterest   <= 10;
    pRegion.deltaConfig     <= 0;
    pRegion.cpuAckoffFrame  <= '0';
    pRegion.fifoReadAddress <= wrAddress;
    pRegion.clearFifoData   <= '0';
    pRegion.cpuAckGoAgain   <= not(oFifoStatus(2)) and endOfFrame;
    GlEnablePointer: process (clk)begin
        if rising_edge(clk) then
            if (oFifoStatus(0) = '1')then
                pRegion.cpuWgridLock    <= '0';
                if(wrAddrsGlCtr < 8192) then
                    wrAddrsGlCtr           <= wrAddrsGlCtr + 1;
                    pRegion.fifoReadEnable <= '1';
                else
                    wrAddrsGlCtr           <= wrAddrsGlCtr;
                    pRegion.fifoReadEnable <= '0';
                end if;
            else
                pRegion.fifoReadEnable <= '0';
                wrAddrsGlCtr           <=  0;
                pRegion.cpuWgridLock   <= endOfFrame;
            end if;
            wrAddress     <= std_logic_vector(to_unsigned(wrAddrsGlCtr,14));
        end if;
    end process GlEnablePointer;
end generate POINTOFINTEREST_ENABLED;
FRAMEPROCESS_ENABLED : if (DUT_FRAMEPROCESS_ENABLED = true) generate
frameProcess_test : dut_frameProcess
port map(
    clk          => clk,
    resetn       => resetn);
end generate FRAMEPROCESS_ENABLED;
VFP_ENABLED : if (DUT_VFP_ENABLED = true) generate
    -- d5m input
    signal pixclk                : std_logic;
    signal ifval                 : std_logic;
    signal ilval                 : std_logic;
    signal idata                 : std_logic_vector(dataWidth - 1 downto 0);
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
    signal vfpconfig_aclk        : std_logic;
    signal vfpconfig_aresetn     : std_logic :='0';
    signal vfpconfig_awaddr      : std_logic_vector(C_vfpConfig_ADDR_WIDTH-1 downto 0);
    signal vfpconfig_awprot      : std_logic_vector(2 downto 0);
    signal vfpconfig_awvalid     : std_logic;
    signal vfpconfig_awready     : std_logic;
    signal vfpconfig_wdata       : std_logic_vector(conf_data_width-1 downto 0);
    signal vfpconfig_wstrb       : std_logic_vector((conf_data_width/8)-1 downto 0);
    signal vfpconfig_wvalid      : std_logic;
    signal vfpconfig_wready      : std_logic;
    signal vfpconfig_bresp       : std_logic_vector(1 downto 0);
    signal vfpconfig_bvalid      : std_logic;
    signal vfpconfig_bready      : std_logic;
    signal vfpconfig_araddr      : std_logic_vector(C_vfpConfig_ADDR_WIDTH-1 downto 0);
    signal vfpconfig_arprot      : std_logic_vector(2 downto 0);
    signal vfpconfig_arvalid     : std_logic;
    signal vfpconfig_arready     : std_logic;
    signal vfpconfig_rdata       : std_logic_vector(conf_data_width-1 downto 0);
    signal vfpconfig_rresp       : std_logic_vector(1 downto 0);
    signal vfpconfig_rvalid      : std_logic;
    signal vfpconfig_rready      : std_logic;
begin
    clk_gen(m_axis_mm2s_aclk, 150.00e6);
    clk_gen(rgb_s_axis_aclk, 150.00e6);
    clk_gen(rgb_m_axis_aclk, 150.00e6);
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
    dataWidth                   => dataWidth)    
port map(
    pixclk                      => pixclk,
    ifval                       => ifval,
    ilval                       => ilval,
    idata                       => idata);
dut_configAxis_inst : dut_configAxis
generic map(
    aclk_freq                   => aclk_freq,
    C_vfpConfig_DATA_WIDTH      => C_vfpConfig_DATA_WIDTH,
    C_vfpConfig_ADDR_WIDTH      => C_vfpConfig_ADDR_WIDTH)    
port map(
    --video configuration       
    vfpconfig_aclk              => vfpconfig_aclk,
    vfpconfig_aresetn           => vfpconfig_aresetn,
    vfpconfig_awaddr            => vfpconfig_awaddr,
    vfpconfig_awprot            => vfpconfig_awprot,
    vfpconfig_awvalid           => vfpconfig_awvalid,
    vfpconfig_awready           => vfpconfig_awready,
    vfpconfig_wdata             => vfpconfig_wdata,
    vfpconfig_wstrb             => vfpconfig_wstrb,
    vfpconfig_wvalid            => vfpconfig_wvalid,
    vfpconfig_wready            => vfpconfig_wready,
    vfpconfig_bresp             => vfpconfig_bresp,
    vfpconfig_bvalid            => vfpconfig_bvalid,
    vfpconfig_bready            => vfpconfig_bready,
    vfpconfig_araddr            => vfpconfig_araddr,
    vfpconfig_arprot            => vfpconfig_arprot,
    vfpconfig_arvalid           => vfpconfig_arvalid,
    vfpconfig_arready           => vfpconfig_arready,
    vfpconfig_rdata             => vfpconfig_rdata,
    vfpconfig_rresp             => vfpconfig_rresp,
    vfpconfig_rvalid            => vfpconfig_rvalid,
    vfpconfig_rready            => vfpconfig_rready);
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
    dataWidth                   => dataWidth)
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
    vfpconfig_aclk              => vfpconfig_aclk,
    vfpconfig_aresetn           => vfpconfig_aresetn,
    vfpconfig_awaddr            => vfpconfig_awaddr,
    vfpconfig_awprot            => vfpconfig_awprot,
    vfpconfig_awvalid           => vfpconfig_awvalid,
    vfpconfig_awready           => vfpconfig_awready,
    vfpconfig_wdata             => vfpconfig_wdata,
    vfpconfig_wstrb             => vfpconfig_wstrb,
    vfpconfig_wvalid            => vfpconfig_wvalid,
    vfpconfig_wready            => vfpconfig_wready,
    vfpconfig_bresp             => vfpconfig_bresp,
    vfpconfig_bvalid            => vfpconfig_bvalid,
    vfpconfig_bready            => vfpconfig_bready,
    vfpconfig_araddr            => vfpconfig_araddr,
    vfpconfig_arprot            => vfpconfig_arprot,
    vfpconfig_arvalid           => vfpconfig_arvalid,
    vfpconfig_arready           => vfpconfig_arready,
    vfpconfig_rdata             => vfpconfig_rdata,
    vfpconfig_rresp             => vfpconfig_rresp,
    vfpconfig_rvalid            => vfpconfig_rvalid,
    vfpconfig_rready            => vfpconfig_rready);
end generate VFP_ENABLED;
end behavioral;
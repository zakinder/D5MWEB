--04112019 [04-11-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.tbPackage.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
use work.dutPortsPackage.all;
entity dut_frameProcess is
port (
    clk            : in std_logic;
    resetn         : in std_logic);
end dut_frameProcess;
architecture arch_imp of dut_frameProcess is
    constant FIFO_ADDR_WIDTH : integer := 13;
    signal wrAddress         : std_logic_vector (13 downto 0);
    signal wrAddrsGlCtr      : integer := 0;
    signal startFrame        : std_logic :='1';
    signal fifoStatus        : std_logic_vector(31 downto 0);    
    signal videoChannel      : std_logic_vector(31 downto 0):=x"00000006";--configRegister5
    signal dChannel          : std_logic_vector(31 downto 0):=x"00000001";--configRegister6
    signal cChannel          : std_logic_vector(31 downto 0):=x"00000000";--configRegister7
    signal cRgbOsharp        : std_logic_vector(31 downto 0):=x"00000000";
    signal gridLockDatao     : std_logic_vector(31 downto 0);
    signal endOfFrame        : std_logic;
    signal threshold         : std_logic_vector(15 downto 0) :=x"006E";
    signal rgb               : channel;
    signal rgbio             : channel;
    signal dCord             : coord;
    signal txCord            : coord;
    signal kls               : coefficient;
    signal als               : coefficient;
    signal rgbCoord          : region;
    signal pRegion           : poi;
    signal soble             : channel;
    signal rgbRemix          : channel;
    signal rgbDetect         : channel;
    signal rgbPoi            : channel;
    signal hsv               : channel;
    signal sharp             : channel;
    signal blur1x            : channel;
    signal blur2x            : channel;
    signal blur3x            : channel;
    signal blur4x            : channel;
    signal rgbcorrect        : channel;
    signal ycbcr             : channel;
    signal rgbDetectLock     : std_logic;
    signal rgbPoiLock        : std_logic;
    signal rgbSum            : tpRgb;
    signal rgbSet            : rRgb;
    signal frameData         : fcolors;
    signal enableFrame       : std_logic := hi;
begin
---------------------------------------------------------------------------------
-- frameProcess
---------------------------------------------------------------------------------
WRITEIMAGE1: imageWrite
generic map (
    enImageText        => false,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    input_file         => readbmp,
    test               => "images",
    output_file        => "blur1x")
port map (                  
    pixclk             => clk,
    enableWrite        => enableFrame,
    iRgb               => blur1x);
WRITEIMAGE2: imageWrite
generic map (
    enImageText        => false,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    input_file         => readbmp,
    test               => "images",
    output_file        => "blur2x")
port map (                  
    pixclk             => clk,
    enableWrite        => enableFrame,
    iRgb               => blur2x);
WRITEIMAGE3: imageWrite
generic map (
    enImageText        => false,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    input_file         => readbmp,
    test               => "images",
    output_file        => "blur3x")
port map (                  
    pixclk             => clk,
    enableWrite        => enableFrame,
    iRgb               => blur3x);
WRITEIMAGE4: imageWrite
generic map (
    enImageText        => false,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    input_file         => readbmp,
    test               => "images",
    output_file        => "blur4x")
port map (                  
    pixclk             => clk,
    enableWrite        => enableFrame,
    iRgb               => blur4x);
WRITEIMAGE5: imageWrite
generic map (
    enImageText        => false,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    input_file         => readbmp,
    test               => "images",
    output_file        => "sharp")
port map (                  
    pixclk             => clk,
    enableWrite        => enableFrame,
    iRgb               => sharp);
WRITEIMAGE6: imageWrite
generic map (
    enImageText        => false,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    input_file         => readbmp,
    test               => "images",
    output_file        => "ycbcr")
port map (                  
    pixclk             => clk,
    enableWrite        => enableFrame,
    iRgb               => ycbcr);
mod5_8_inst: rgb_ycbcr
generic map(
    i_data_width         => i_data_width,
    i_precision          => i_precision,
    i_full_range         => FALSE)
port map(
    clk                  => clk,
    rst_l                => resetn,
    iRgb                 => rgb,
    y                    => ycbcr.red,
    cb                   => ycbcr.green,
    cr                   => ycbcr.blue,
    oValid               => ycbcr.valid);
IMAGE2_imageRead: imageRead
generic map (
    i_data_width       => i_data_width,
    input_file         => readbmp)
port map (                  
    clk                => clk,
    reset              => resetn,
    oRgb               => rgbio,
    oCord              => txCord,
    endOfFrame         => endOfFrame,
    rl                 => rgbCoord.rl,
    rh                 => rgbCoord.rh,
    gl                 => rgbCoord.gl,
    gh                 => rgbCoord.gh,
    bl                 => rgbCoord.bl,
    bh                 => rgbCoord.bh);
mod5_inst: frameProcess
generic map(
    i_data_width        => i_data_width,
    s_data_width        => s_data_width,
    b_data_width        => b_data_width,
    img_width           => img_width,
    adwrWidth           => 16,
    addrWidth           => 12)
port map(
    clk                 => clk,
    rst_l               => resetn,
    iRgbSet             => rgbSet,
    --cpu side in
	iEdgeType           => videoChannel,
    iPoiRegion          => pRegion,
    iThreshold          => threshold,
	iKls                => kls,
	iAls                => als,
    iRgbCoord           => rgbCoord,
    oFifoStatus         => fifoStatus,
    oGridLockData       => gridLockDatao,
    oFrameData          => frameData);
---------------------------------------------------------------------------------
    hsv                   <= frameData.hsv;
    rgb                   <= frameData.rgb;
    sharp                 <= frameData.sharp;
    blur1x                <= frameData.blur1x;
    blur2x                <= frameData.blur2x;
    blur3x                <= frameData.blur3x;
    blur4x                <= frameData.blur4x;
    rgbCorrect            <= frameData.rgbCorrect;
    soble                 <= frameData.soble;
    rgbRemix              <= frameData.rgbRemix;
    rgbDetect             <= frameData.rgbDetect;
    rgbPoi                <= frameData.rgbPoi;
    rgbSum                <= frameData.rgbSum;
    rgbDetectLock         <= frameData.rgbDetectLock;
    rgbPoiLock            <= frameData.rgbPoiLock;
---------------------------------------------------------------------------------
    rgbSet.red            <= rgbio.red;
    rgbSet.green          <= rgbio.green;
    rgbSet.blue           <= rgbio.blue;
    rgbSet.valid          <= rgbio.valid;
    rgbSet.pEof           <= endOfFrame;
    rgbSet.cord.x         <= txCord.x;
    rgbSet.cord.y         <= txCord.y;
---------------------------------------------------------------------------------
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
    pRegion.pointInterest   <= 10;--set the point
    pRegion.deltaConfig     <= 0;--set the point delta
    pRegion.cpuAckGoAgain   <= '0';
    pRegion.cpuWgridLock    <= '1';
    pRegion.cpuAckoffFrame  <= '0';
    pRegion.fifoReadAddress <= wrAddress;--fifo read address location upto cpuGridCont[Max-Locations]
    --pRegion.fifoReadEnable  <= fifoStatus(2);--fifo read enable
    pRegion.clearFifoData   <= '0';--clear the fifo
    
    -----------------------------------------------------------
    GlEnablePointer: process (clk)begin
        if rising_edge(clk) then
            if (fifoStatus(2) = '1') then
                pRegion.fifoReadEnable  <= '1';
                wrAddrsGlCtr <= wrAddrsGlCtr + 1;
            else
                pRegion.fifoReadEnable <= '0';
                wrAddrsGlCtr  <=  0;
            end if;
            
        end if;
    end process GlEnablePointer;
    -----------------------------------------------------------
    wrAddress     <= std_logic_vector(to_unsigned(wrAddrsGlCtr,14));
    -----------------------------------------------------------
---------------------------------------------------------------------------------
end arch_imp;
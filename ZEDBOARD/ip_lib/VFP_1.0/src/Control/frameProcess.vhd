--05012019 [05-01-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity frameProcess is
generic (
    i_data_width            : integer := 8;
    s_data_width            : integer := 16;
    b_data_width            : integer := 32;
    img_width               : integer := 256;
    adwrWidth               : integer := 16;
    addrWidth               : integer := 12);
port (
    clk                     : in std_logic;
    rst_l                   : in std_logic;
    iRgbSet                 : in rRgb;
    --cpu side in
    iRgbCoord               : in region;
    iPoiRegion              : in poi;
    iKls                    : in coefficient;
    iAls                    : in coefficient;
    iEdgeType               : in std_logic_vector(b_data_width-1 downto 0);
    iThreshold              : in std_logic_vector(s_data_width-1 downto 0); 
    --out
    oFrameData              : out fcolors;
    --to cpu
    oFifoStatus             : out std_logic_vector(b_data_width-1 downto 0);
    oGridLockData           : out std_logic_vector(b_data_width-1 downto 0));
end entity;
architecture arch of frameProcess is
    constant RGBTR_FRAME    : boolean := true;
    constant RGBLP_FRAME    : boolean := true;
    signal sharp            : channel;
    signal rgbV1Correct     : channel;
    signal rgbV2Correct     : channel;
    signal soble            : channel;
    signal rgbRemix         : channel;
    signal rgbPoi           : channel;
    signal blur1vx          : channel;
    signal blur2vx          : channel;
    signal blur3vx          : channel;
    signal blur4vx          : channel;
    signal rgbDetect        : channel;
    signal hsv              : hsvChannel;
    signal hsl              : hsvChannel;
    signal hsvCcBlur4vx     : hsvChannel;
    signal cord             : coord;
    signal syncxy           : coord;
    signal cordIn           : coord;
    signal rgbIn            : channel;
    signal rgbSum           : tpRgb;
    signal rgbDetectLock    : std_logic;
    signal rgbPoiLock       : std_logic;
    signal edgeValid        : std_logic;
    signal sValid           : std_logic;
    signal colorTrm         : channel;
    signal colorLmp         : channel;
    signal iLumTh           : integer := 30;
    signal lumThreshold     : std_logic_vector(7 downto 0);
begin
    lumThreshold                  <= std_logic_vector(to_unsigned(iLumTh,8));
    oFrameData.hsl.red            <= hsl.h;
    oFrameData.hsl.green          <= hsl.s;
    oFrameData.hsl.blue           <= hsl.v;
    oFrameData.hsl.valid          <= hsl.valid;
    oFrameData.hsv.red            <= hsv.h;
    oFrameData.hsv.green          <= hsv.s;
    oFrameData.hsv.blue           <= hsv.v;
    oFrameData.hsv.valid          <= hsv.valid;
    oFrameData.hsvCcBl.red        <= hsvCcBlur4vx.h;
    oFrameData.hsvCcBl.green      <= hsvCcBlur4vx.s;
    oFrameData.hsvCcBl.blue       <= hsvCcBlur4vx.v;
    oFrameData.hsvCcBl.valid      <= hsvCcBlur4vx.valid;
    oFrameData.rgb.red            <= iRgbSet.red;
    oFrameData.rgb.green          <= iRgbSet.green;
    oFrameData.rgb.blue           <= iRgbSet.blue;
    oFrameData.rgb.valid          <= iRgbSet.valid;
    oFrameData.sharp              <= sharp;
    oFrameData.blur1x             <= blur1vx;
    oFrameData.blur2x             <= blur2vx;
    oFrameData.blur3x             <= blur3vx;
    oFrameData.blur4x             <= blur4vx;
    oFrameData.rgbCorrect         <= rgbV1Correct;
    oFrameData.soble              <= soble;
    oFrameData.rgbRemix           <= rgbRemix;
    oFrameData.rgbDetect          <= rgbDetect;
    oFrameData.rgbPoi             <= rgbPoi;
    oFrameData.colorTrm           <= colorTrm;
    oFrameData.colorLmp           <= colorLmp;
    oFrameData.rgbSum             <= rgbSum;
    oFrameData.rgbDetectLock      <= rgbDetectLock;
    oFrameData.rgbPoiLock         <= rgbPoiLock;
    oFrameData.cod                <= syncxy;
    oFrameData.pEof               <= iRgbSet.pEof;
    oFrameData.pSof               <= iRgbSet.pSof;
    rgbIn.red                     <= iRgbSet.red;
    rgbIn.green                   <= iRgbSet.green;
    rgbIn.blue                    <= iRgbSet.blue;
    rgbIn.valid                   <= iRgbSet.valid;
    cordIn.x                      <= iRgbSet.cord.x;
    cordIn.y                      <= iRgbSet.cord.y;
pipCoordP: process (clk) begin
    if rising_edge(clk) then
        syncxy          <= cordIn;
        cord            <= syncxy;
    end if;
end process pipCoordP;
colorCorrectionInst: colorCorrection
generic map(
    i_data_width        => i_data_width)
port map(           
    clk                 => clk,
    rst_l               => rst_l,
    iRgb                => rgbIn,
    als                 => iAls,    
    oRgb                => rgbV1Correct);
sobelFilterInst: sobelFilter
generic map(
    i_data_width        => i_data_width,
    img_width           => img_width,
    adwrWidth           => adwrWidth,
    addrWidth           => addrWidth)
port map(   
    clk                 => clk,
    rst_l               => rst_l,
    iEdgeType           => iEdgeType,
    endOfFrame          => iRgbSet.pEof,
    iRgb                => rgbIn,
    threshold           => iThreshold,
    kls                 => iKls,
    oRgb                => soble,
    sValid              => sValid,
    edgeValid           => edgeValid);
edgeObjectsInst: edgeObjects
generic map(
    i_data_width        => i_data_width)
port map(   
    clk                 => clk,
    rst_l               => rst_l,
    iRgb                => rgbIn,
    bRgb                => blur1vx,
    sRgb                => sharp,
    edgeValid           => edgeValid,
    sValid              => sValid,
    oRgbRemix           => rgbRemix);
sharpFilterInst: sharpFilter
generic map(
    i_data_width        => i_data_width,
    img_width           => img_width,
    adwrWidth           => adwrWidth,
    addrWidth           => addrWidth)
port map(   
    clk                 => clk,
    rst_l               => rst_l,
    iRgb                => rgbIn,
    endOfFrame          => iRgbSet.pEof,
    kls                 => iKls,
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
    rst_l               => rst_l,
    iRgb                => rgbIn,
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
    rst_l               => rst_l,
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
    rst_l               => rst_l,
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
    rst_l               => rst_l,
    iRgb                => blur3vx,
    oRgb                => blur4vx);
colorCorrection1Inst: colorCorrection
generic map(
    i_data_width        => i_data_width)
port map(           
    clk                 => clk,
    rst_l               => rst_l,
    iRgb                => blur4vx,
    als                 => iAls,    
    oRgb                => rgbV2Correct);
hsv_blur4xInst: hsv_c
generic map(
    i_data_width        => i_data_width)
port map(   
    clk                 => clk,
    reset               => rst_l,
    iRgb                => rgbV2Correct,
    oHsv                => hsvCcBlur4vx);
detectInst: detect
generic map(
    i_data_width        => i_data_width)
port map(
    clk                 => clk,
    rst_l               => rst_l,
    iRgb                => rgbIn,
    rgbCoord            => iRgbCoord,
    endOfFrame          => iRgbSet.pEof,
    iCord               => cord,
    pDetect             => rgbDetectLock,
    oRgb                => rgbDetect);
pointOfInterestInst: pointOfInterest
generic map(
    i_data_width        => i_data_width,
    s_data_width        => s_data_width,
    b_data_width        => b_data_width)
port map(
    clk                 => clk,
    rst_l               => rst_l,
    iRgb                => rgbIn,
    iCord               => cord,
    endOfFrame          => iRgbSet.pEof,
    gridLockDatao       => oGridLockData,
    pRegion             => iPoiRegion,
    fifoStatus          => oFifoStatus,
    oGridLocation       => rgbPoiLock,
    oRgb                => rgbPoi);
hslInst: hsl_c
generic map(
    i_data_width        => i_data_width)
port map(   
    clk                 => clk,
    reset               => rst_l,
    iRgb                => rgbIn,
    oHsl                => hsl);
hsvInst: hsv_c
generic map(
    i_data_width        => i_data_width)
port map(   
    clk                 => clk,
    reset               => rst_l,
    iRgb                => rgbIn,
    oHsv                => hsv);
frameTestPatternInst: frameTestPattern
generic map(
    s_data_width        => s_data_width)
port map(   
    clk                 => clk,
    iValid              => rgbIn.valid,
    iCord               => cord,
    oRgb                => rgbSum);
--RGBTRIM_FRAME_ENABLE: if (RGBTR_FRAME = true) generate
--begin
ColorTrimInst: ColorTrim
generic map(
    i_data_width       => i_data_width)
port map(   
    clk                => clk,
    reset              => rst_l,
    iRgb               => rgbIn,
    oRgb               => colorTrm);
--end generate RGBTRIM_FRAME_ENABLE;
--RGBLUMP_FRAME_ENABLE: if (RGBLP_FRAME = true) generate
--begin
SegmentColorsInst: SegmentColors
port map(   
    clk                => clk,
    reset              => rst_l,
    lumThreshold       => lumThreshold,
    iRgb               => rgbIn,
    oRgb               => colorLmp);
--end generate RGBLUMP_FRAME_ENABLE;
end architecture;
--02062019 [02-06-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity frameProcess is
generic (
    i_data_width      : integer := 8;
    s_data_width      : integer := 16;
    b_data_width      : integer := 32;
    img_width         : integer := 256;
    adwr_width        : integer := 16;
    addr_width        : integer := 11);
port (
    clk               : in std_logic;
    rst_l             : in std_logic;
    iRgbSet           : in rRgb;
    --cpu side in
    iRgbCoord         : in region;
    iPoiRegion        : in poi;
    iKls              : in coefficient;
    iAls              : in coefficient;
    iEdgeType         : in std_logic_vector(b_data_width-1 downto 0);
    iThreshold        : in std_logic_vector(s_data_width-1 downto 0); 
    --out
    oFrameData        : out fcolors;
    --to cpu
    oFifoStatus       : out std_logic_vector(b_data_width-1 downto 0);
    oGridLockData     : out std_logic_vector(b_data_width-1 downto 0));
end entity;
architecture arch of frameProcess is
    signal sharp            : channel;
    signal rgbCorrect       : channel;
    signal soble            : channel;
    signal rgbRemix         : channel;
    signal rgbPoi           : channel;
    signal blur1vx          : channel;
    signal blur2vx          : channel;
    signal blur3vx          : channel;
    signal blur4vx          : channel;
    signal rgbDetect        : channel;
    signal hsv              : hsvChannel;
    signal cord             : coord;
    signal syncxy           : coord;
    signal blur1x           : blurchannel;
    signal blur2x           : blurchannel;
    signal blur3x           : blurchannel;
    signal blur4x           : blurchannel;
    signal cordIn           : coord;
    signal rgbIn            : channel;
    signal rgbSum           : tpRgb;
    signal rgbDetectLock    : std_logic;
    signal rgbPoiLock       : std_logic;
begin
    -----------------------------------------------------
    oFrameData.hsv.red            <= hsv.h;
    oFrameData.hsv.green          <= hsv.s;
    oFrameData.hsv.blue           <= hsv.v;
    oFrameData.hsv.valid          <= hsv.valid;
    oFrameData.rgb.red            <= iRgbSet.red;
    oFrameData.rgb.green          <= iRgbSet.green;
    oFrameData.rgb.blue           <= iRgbSet.blue;
    oFrameData.rgb.valid          <= iRgbSet.valid;
    oFrameData.sharp              <= sharp;
    oFrameData.blur1x             <= blur1vx;
    oFrameData.blur2x             <= blur2vx;
    oFrameData.blur3x             <= blur3vx;
    oFrameData.blur4x             <= blur4vx;
    oFrameData.rgbCorrect         <= rgbCorrect;
    oFrameData.soble              <= soble;
    oFrameData.rgbRemix           <= rgbRemix;
    oFrameData.rgbDetect          <= rgbDetect;
    oFrameData.rgbPoi             <= rgbPoi;
    oFrameData.rgbSum             <= rgbSum;
    oFrameData.rgbDetectLock      <= rgbDetectLock;
    oFrameData.rgbPoiLock         <= rgbPoiLock;
    oFrameData.cod                <= syncxy;
    oFrameData.pEof               <= iRgbSet.pEof;
    oFrameData.pSof               <= iRgbSet.pSof;
    -----------------------------------------------------
    rgbIn.red                     <= iRgbSet.red;
    rgbIn.green                   <= iRgbSet.green;
    rgbIn.blue                    <= iRgbSet.blue;
    rgbIn.valid                   <= iRgbSet.valid;
    cordIn.x                      <= iRgbSet.cord.x;
    cordIn.y                      <= iRgbSet.cord.y;
    -----------------------------------------------------
    process (clk) begin
    if rising_edge(clk) then
        syncxy          <= cordIn;
        cord            <= syncxy;
    end if;
    end process;
    colorCorrection_inst: colorCorrection
    generic map(
        i_data_width        => i_data_width)
    port map(           
        clk                 => clk,
        rst_l               => rst_l,
        iRgb                => rgbIn,
        als                 => iAls,    
        oRgb                => rgbCorrect);
    sobel_inst: sobel
    generic map(
        i_data_width        => i_data_width,
        img_width           => img_width,
        adwr_width          => adwr_width,
        addr_width          => addr_width)
    port map(   
        clk                 => clk,
        rst_l               => rst_l,
        videoChannel        => iEdgeType,
        endOfFrame          => iRgbSet.pEof,
        iRgb                => rgbIn,
        bRgb                => blur1vx,
        sRgb                => sharp,
        threshold           => iThreshold,
        kls                 => iKls,
        oRgbRemix           => rgbRemix,
        oRgb                => soble);
    sharpFilter_inst: sharpFilter
    generic map(
        i_data_width        => i_data_width,
        img_width           => img_width,
        adwr_width          => 15,
        addr_width          => 11)
    port map(   
        clk                 => clk,
        rst_l               => rst_l,
        iRgb                => rgbIn,
        endOfFrame          => iRgbSet.pEof,
        kls                 => iKls,
        oRgb                => sharp);
    blurFilter1x_inst: blurFilter
    generic map(
        i_data_width        => i_data_width,
        img_width           => img_width,
        adwr_width          => 16,
        addr_width          => 11)
    port map(
        clk                 => clk,
        rst_l               => rst_l,
        iRgb                => rgbIn,
        oRgb                => blur1x);
        blur1vx.red   <= blur1x.red(11 downto 4);
        blur1vx.green <= blur1x.green(11 downto 4);
        blur1vx.blue  <= blur1x.blue(11 downto 4);
        blur1vx.valid <= blur1x.valid;
    blurFilter2x_inst: blurFilter
    generic map(
        i_data_width        => i_data_width,
        img_width           => img_width,
        adwr_width          => 16,
        addr_width          => 11)
    port map(
        clk                 => clk,
        rst_l               => rst_l,
        iRgb                => blur1vx,
        oRgb                => blur2x);
        blur2vx.red       <= blur2x.red(10 downto 3);
        blur2vx.green     <= blur2x.green(10 downto 3);
        blur2vx.blue      <= blur2x.blue(10 downto 3);
        blur2vx.valid     <= blur2x.valid;
    blurFilter3x_inst: blurFilter
    generic map(
        i_data_width        => i_data_width,
        img_width           => img_width,
        adwr_width          => 16,
        addr_width          => 11)
    port map(
        clk                 => clk,
        rst_l               => rst_l,
        iRgb                => blur2vx,
        oRgb                => blur3x);
        blur3vx.red       <= blur3x.red(10 downto 3);
        blur3vx.green     <= blur3x.green(10 downto 3);
        blur3vx.blue      <= blur3x.blue(10 downto 3);
        blur3vx.valid     <= blur3x.valid;
    blurFilter4x_inst: blurFilter
    generic map(
        i_data_width        => i_data_width,
        img_width           => img_width,
        adwr_width          => 16,
        addr_width          => 11)
    port map(
        clk                 => clk,
        rst_l               => rst_l,
        iRgb                => blur3vx,
        oRgb                => blur4x);
        blur4vx.red   <= blur4x.red(10 downto 3);
        blur4vx.green <= blur4x.green(10 downto 3);
        blur4vx.blue  <= blur4x.blue(10 downto 3);
        blur4vx.valid <= blur4x.valid;
    detect_inst: detect
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
    pointOfInterest_inst: pointOfInterest
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
    hsv_inst: hsv_c
    generic map(
        i_data_width        => i_data_width)
    port map(   
        clk                 => clk,
        reset               => rst_l,
        iRgb                => rgbIn,
        oHsv                => hsv);
    frameTestPattern_inst: frameTestPattern
    generic map(
        s_data_width        => s_data_width)
    port map(   
        clk                 => clk,
        iValid              => rgbIn.valid,
        iCord               => cord,
        oRgb                => rgbSum);
end architecture;
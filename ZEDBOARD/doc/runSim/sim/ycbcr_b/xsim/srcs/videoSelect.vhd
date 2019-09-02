--02092019 [02-17-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity videoSelect is
generic (
    img_width         : integer := 4096;
    i_data_width      : integer := 8;
    b_data_width      : integer := 32;
    s_data_width      : integer := 16);
port (
    clk               : in std_logic;
    rst_l             : in std_logic;
    videoChannel      : in std_logic_vector(b_data_width-1 downto 0);
    dChannel          : in std_logic_vector(b_data_width-1 downto 0);
    cChannel          : in std_logic_vector(b_data_width-1 downto 0);
    cRgbOsharp        : in std_logic_vector(b_data_width-1 downto 0);
    iFrameData        : in fcolors;
    oEof              : out std_logic;
    oSof              : out std_logic;
    oCord             : out coord;
    oRgb              : out channel);
end videoSelect;
architecture Behavioral of videoSelect is
    signal vChannelSelect     : integer;
    signal eChannelSelect     : integer;
    signal ycbcr              : channel;
    signal channels           : channel;
    signal kCoeffYcbcr        : kernelCoeff;
begin
    kCoeffYcbcr.k1    <= x"0101";-- [ 0.257]
    kCoeffYcbcr.k2    <= x"01F8";-- [ 0.504]
    kCoeffYcbcr.k3    <= x"0062";-- [ 0.098]
    kCoeffYcbcr.k4    <= x"FF6C";-- [-0.148]
    kCoeffYcbcr.k5    <= x"FEDD";-- [-0.291]
    kCoeffYcbcr.k6    <= x"01B7";-- [ 0.439]
    kCoeffYcbcr.k7    <= x"01B7";-- [ 0.439]
    kCoeffYcbcr.k8    <= x"FE90";-- [-0.368]
    kCoeffYcbcr.k9    <= x"FFB9";-- [-0.071]
    kCoeffYcbcr.kSet  <= zero;
    vChannelSelect    <= to_integer(unsigned(videoChannel));
    eChannelSelect    <= to_integer(unsigned(dChannel));
    oEof              <= iFrameData.pEof;
    oSof              <= iFrameData.pSof;
---------------------------------------------------------------------------------
-- oRgb.valid must be 2nd condition else valid value
---------------------------------------------------------------------------------
videoOutP: process (clk) begin
    if rising_edge(clk) then
        if (vChannelSelect = soble) then
            channels     <= iFrameData.sobel;
        elsif(vChannelSelect = sobRgb)then
                channels.valid <= iFrameData.rgbDetect.valid;
            if (iFrameData.rgbDetectLock = hi) then 
                channels.red   <= iFrameData.sobel.red;
                channels.green <= iFrameData.sobel.green;
                channels.blue  <= iFrameData.sobel.blue;
            else                   
                channels.red   <= iFrameData.rgbDetect.red;
                channels.green <= iFrameData.rgbDetect.green;
                channels.blue  <= iFrameData.rgbDetect.blue;
            end if;
        elsif(vChannelSelect = sobPoi)then
                channels.valid <= iFrameData.rgbPoi.valid;
            if (iFrameData.rgbPoiLock = hi) then 
                channels.red   <= iFrameData.sobel.red;
                channels.green <= iFrameData.sobel.green;
                channels.blue  <= iFrameData.sobel.blue;
            else                   
                channels.red   <= iFrameData.rgbPoi.red;
                channels.green <= iFrameData.rgbPoi.green;
                channels.blue  <= iFrameData.rgbPoi.blue;
            end if;
        elsif(vChannelSelect = hsvPoi)then
                channels.valid <= iFrameData.rgbPoi.valid;
            if (iFrameData.rgbPoiLock = hi) then 
                channels.red   <= iFrameData.hsv.red;
                channels.green <= iFrameData.hsv.green;
                channels.blue  <= iFrameData.hsv.blue;
            else                   
                channels.red   <= iFrameData.rgbPoi.red;
                channels.green <= iFrameData.rgbPoi.green;
                channels.blue  <= iFrameData.rgbPoi.blue;
            end if;
        elsif(vChannelSelect = blur1x)then
            channels     <= iFrameData.blur1x;
        elsif(vChannelSelect = blur2x)then
            channels     <= iFrameData.blur2x;
        elsif(vChannelSelect = blur3x)then
            channels     <= iFrameData.blur3x;
        elsif(vChannelSelect = blur4x)then
            channels     <= iFrameData.blur4x;
        elsif(vChannelSelect = rgbRemix)then
            channels     <= iFrameData.rgbRemix;
        elsif(vChannelSelect = tPatter1)then
            channels.valid     <= iFrameData.rgbSum.valid;
            channels.red       <= iFrameData.rgbSum.red(i_data_width-1 downto 0);
            channels.green     <= iFrameData.rgbSum.green(i_data_width-1 downto 0);
            channels.blue      <= iFrameData.rgbSum.blue(i_data_width-1 downto 0);
        elsif(vChannelSelect = tPatter2)then
            channels.valid     <= iFrameData.rgbSum.valid;
            channels.red       <= x"0" & iFrameData.rgbSum.red(3 downto 0);
            channels.green     <= x"0" & iFrameData.rgbSum.green(7 downto 4);
            channels.blue      <= x"0" & iFrameData.rgbSum.blue(11 downto 8);
        elsif(vChannelSelect = tPatter3)then
            channels.valid     <= iFrameData.rgbSum.valid;
            channels.red       <= iFrameData.rgbSum.red(i_data_width-1 downto 0);
            channels.green     <= x"0" & iFrameData.rgbSum.green(7 downto 4);
            channels.blue      <= x"0" & iFrameData.rgbSum.blue(11 downto 8);
        elsif(vChannelSelect = tPatter4)then
            channels.valid     <= iFrameData.rgbSum.valid;
            channels.red       <= x"0" & iFrameData.rgbSum.red(3 downto 0);
            channels.green     <= iFrameData.rgbSum.green(i_data_width-1 downto 0);
            channels.blue      <= x"0" & iFrameData.rgbSum.blue(11 downto 8);
        elsif(vChannelSelect = tPatter5)then
            channels.valid     <= iFrameData.rgbSum.valid;
            channels.red       <= x"0" & iFrameData.rgbSum.red(3 downto 0);
            channels.green     <= x"0" & iFrameData.rgbSum.green(7 downto 4);
            channels.blue      <= iFrameData.rgbSum.blue(i_data_width-1 downto 0);
        elsif(vChannelSelect = rgbCorrect)then
            channels           <= iFrameData.rgbCorrect;
        elsif(vChannelSelect = hsl)then
            channels           <= iFrameData.hsl;
        elsif(vChannelSelect = hsvCcBl)then
            channels           <= iFrameData.hsvCcBl;
        elsif(vChannelSelect = rgb)then
            channels           <= iFrameData.inrgb;
        elsif(vChannelSelect = 21)then
            channels           <= iFrameData.sobel;
        elsif(vChannelSelect = 22)then
            channels           <= iFrameData.embos;
        elsif(vChannelSelect = 23)then
            channels           <= iFrameData.blur;
        elsif(vChannelSelect = sharp)then
            channels           <= iFrameData.sharp;
        elsif(vChannelSelect = 25)then
            channels           <= iFrameData.cgain;
        elsif(vChannelSelect = 26)then
            channels           <= iFrameData.ycbcr;
        elsif(vChannelSelect = 28)then
            channels           <= iFrameData.hsl;
        elsif(vChannelSelect = hsv)then
            channels           <= iFrameData.hsv;
        elsif(vChannelSelect = 29)then
            channels           <= iFrameData.colorTrm;
        elsif(vChannelSelect = 30)then
            channels           <= iFrameData.tPattern;
        elsif(vChannelSelect = 31)then
            channels           <= iFrameData.colorLmp;
        else
            channels           <= iFrameData.rgbCorrect;
        end if;
    end if;
end process videoOutP;
Kernel_Ycbcr_Inst: KernelCore
generic map(
    SHARP_FRAME   => false,
    BLURE_FRAME   => false,
    EMBOS_FRAME   => false,
    YCBCR_FRAME   => true,
    SOBEL_FRAME   => false,
    CGAIN_FRAME   => false,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => channels,
    kCoeff         => kCoeffYcbcr,
    oRgb           => ycbcr);
channelOutP: process (clk) begin
    if rising_edge(clk) then
        oCord <= iFrameData.cod;
        if (eChannelSelect = 0) then
            oRgb     <= ycbcr;
        else
            oRgb     <= channels;
        end if;
    end if;
end process channelOutP;
end Behavioral;
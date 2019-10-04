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
    kCoeffYcbcr.kSet  <= 6;
    vChannelSelect    <= to_integer(unsigned(videoChannel));
    eChannelSelect    <= to_integer(unsigned(dChannel));
    oEof              <= iFrameData.pEof;
    oSof              <= iFrameData.pSof;
---------------------------------------------------------------------------------
-- oRgb.valid must be 2nd condition else valid value
---------------------------------------------------------------------------------
videoOutP: process (clk) begin
    if rising_edge(clk) then
        if (vChannelSelect = 0) then
            channels           <= iFrameData.cgain;
        elsif(vChannelSelect = 1)then
            channels           <= iFrameData.sharp;
        elsif(vChannelSelect = 2)then
            channels           <= iFrameData.blur;
        elsif(vChannelSelect = 3)then
            channels           <= iFrameData.hsl;
        elsif(vChannelSelect = 4)then
            channels           <= iFrameData.hsv;
        elsif(vChannelSelect = 5)then
            channels           <= iFrameData.inrgb;
        elsif(vChannelSelect = 6)then
            channels           <= iFrameData.sobel;
        elsif(vChannelSelect = 7)then
            channels           <= iFrameData.embos;
        elsif(vChannelSelect = 8)then
            channels           <= iFrameData.maskSobelLum;
        elsif(vChannelSelect = 9)then
            channels           <= iFrameData.maskSobelTrm;
        elsif(vChannelSelect = 10)then
            channels           <= iFrameData.maskSobelRgb;
        elsif(vChannelSelect = 11)then
            channels           <= iFrameData.maskSobelShp;
        elsif(vChannelSelect = 12)then
            channels           <= iFrameData.maskSobelShp;
        elsif(vChannelSelect = 13)then
            channels           <= iFrameData.maskSobelBlu;
        elsif(vChannelSelect = 14)then
            channels           <= iFrameData.maskSobelYcc;
        elsif(vChannelSelect = 15)then
            channels           <= iFrameData.maskSobelHsv;
        elsif(vChannelSelect = 16)then
            channels           <= iFrameData.maskSobelHsl;
        elsif(vChannelSelect = 17)then
            channels           <= iFrameData.maskSobelCga;
        elsif(vChannelSelect = 18)then
            channels           <= iFrameData.colorTrm;
        elsif(vChannelSelect = 19)then
            channels           <= iFrameData.colorLmp;
        elsif(vChannelSelect = 20)then
            channels           <= iFrameData.tPattern;
        elsif(vChannelSelect = 21)then
            channels           <= iFrameData.cgainToCgain;
        elsif(vChannelSelect = 22)then
            channels           <= iFrameData.cgainToHsl;
        elsif(vChannelSelect = 23)then
            channels           <= iFrameData.cgainToHsv;
        elsif(vChannelSelect = 24)then
            channels           <= iFrameData.cgainToYcbcr;
        elsif(vChannelSelect = 25)then
            channels           <= iFrameData.cgainToShp;
        elsif(vChannelSelect = 26)then
            channels           <= iFrameData.cgainToBlu;
        elsif(vChannelSelect = 27)then
            channels           <= iFrameData.shpToCgain;
        elsif(vChannelSelect = 28)then
            channels           <= iFrameData.shpToHsl;
        elsif(vChannelSelect = 29)then
            channels           <= iFrameData.shpToHsv;
        elsif(vChannelSelect = 30)then
            channels           <= iFrameData.shpToYcbcr;
        elsif(vChannelSelect = 31)then
            channels           <= iFrameData.shpToShp;
        elsif(vChannelSelect = 32)then
            channels           <= iFrameData.shpToBlu;
        elsif(vChannelSelect = 33)then
            channels           <= iFrameData.bluToBlu;
        elsif(vChannelSelect = 34)then
            channels           <= iFrameData.bluToCga;
        elsif(vChannelSelect = 35)then
            channels           <= iFrameData.bluToShp;
        elsif(vChannelSelect = 36)then
            channels           <= iFrameData.bluToYcc;
        elsif(vChannelSelect = 37)then
            channels           <= iFrameData.bluToHsv;
        elsif(vChannelSelect = 38)then
            channels           <= iFrameData.bluToHsl;
        elsif(vChannelSelect = 39)then
            channels           <= iFrameData.bluToCgaShp;
        elsif(vChannelSelect = 40)then
            channels           <= iFrameData.bluToCgaShpYcc;
        elsif(vChannelSelect = 41)then
            channels           <= iFrameData.bluToCgaShpHsv;
        elsif(vChannelSelect = 42)then
            channels           <= iFrameData.bluToShpCga;
        elsif(vChannelSelect = 43)then
            channels           <= iFrameData.bluToShpCgaYcc;
        elsif(vChannelSelect = 44)then
            channels           <= iFrameData.bluToShpCgaHsv;
        elsif(vChannelSelect = 45)then
            channels           <= iFrameData.rgbCorrect;
        elsif(vChannelSelect = 46)then
            channels           <= iFrameData.rgbRemix;
        elsif(vChannelSelect = 47)then
            channels           <= iFrameData.rgbDetect;
        elsif(vChannelSelect = 48)then
            channels           <= iFrameData.rgbPoi;
        elsif(vChannelSelect = 49)then
            channels           <= iFrameData.ycbcr;
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
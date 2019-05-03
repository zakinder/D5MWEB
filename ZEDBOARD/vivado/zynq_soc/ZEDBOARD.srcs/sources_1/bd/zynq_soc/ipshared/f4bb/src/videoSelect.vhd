--02092019 [02-17-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity videoSelect is
generic (
    i_data_width           : integer := 8;
    b_data_width           : integer := 32;
    s_data_width           : integer := 16);
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
begin
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
            channels     <= iFrameData.soble;
        elsif(vChannelSelect = sobRgb)then
                channels.valid <= iFrameData.rgbDetect.valid;
            if (iFrameData.rgbDetectLock = hi) then 
                channels.red   <= iFrameData.soble.red;
                channels.green <= iFrameData.soble.green;
                channels.blue  <= iFrameData.soble.blue;
            else                   
                channels.red   <= iFrameData.rgbDetect.red;
                channels.green <= iFrameData.rgbDetect.green;
                channels.blue  <= iFrameData.rgbDetect.blue;
            end if;
        elsif(vChannelSelect = sobPoi)then
                channels.valid <= iFrameData.rgbPoi.valid;
            if (iFrameData.rgbPoiLock = hi) then 
                channels.red   <= iFrameData.soble.red;
                channels.green <= iFrameData.soble.green;
                channels.blue  <= iFrameData.soble.blue;
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
        elsif(vChannelSelect = sharp)then
            channels    <= iFrameData.sharp;
        elsif(vChannelSelect = blur1x)then
            channels     <= iFrameData.blur1x;
        elsif(vChannelSelect = blur2x)then
            channels     <= iFrameData.blur2x;
        elsif(vChannelSelect = blur3x)then
            channels     <= iFrameData.blur3x;
        elsif(vChannelSelect = blur4x)then
            channels     <= iFrameData.blur4x;
        elsif(vChannelSelect = hsv)then
            channels      <= iFrameData.hsv;
        elsif(vChannelSelect = rgb)then
            channels     <= iFrameData.rgb;
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
            channels          <= iFrameData.rgbCorrect;
        else
            channels          <= iFrameData.rgbCorrect;
        end if;
    end if;
end process videoOutP;
ycbcrInst: rgb_ycbcr
generic map(
    i_data_width         => i_data_width,
    i_precision          => i_precision,
    i_full_range         => FALSE)
port map(
    clk                  => clk,
    rst_l                => rst_l,
    iRgb                 => channels,
    y                    => ycbcr.red,
    cb                   => ycbcr.green,
    cr                   => ycbcr.blue,
    oValid               => ycbcr.valid);
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
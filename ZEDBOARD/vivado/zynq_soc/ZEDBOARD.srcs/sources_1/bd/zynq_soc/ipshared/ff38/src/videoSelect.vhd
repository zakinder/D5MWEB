--02092019 [02-17-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity videoSelect is
    port (
    clk               : in std_logic;
    rst_l             : in std_logic;
    videoChannel      : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    dChannel          : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    cChannel          : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    cRgbOsharp        : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    iFrameData        : in fcolors;
    oEof              : out std_logic;
    oSof              : out std_logic;
    oCord             : out coord;
    oRgb              : out channel);
end videoSelect;
architecture Behavioral of videoSelect is
    signal videoChannel6r : integer;
    signal dChannel7r     : integer;
    signal ycbcr          : channel;
    signal channels       : channel;
begin
videoChannel6r    <= to_integer(unsigned(videoChannel));
dChannel7r        <= to_integer(unsigned(dChannel));
oEof              <= iFrameData.pEof;
oSof              <= iFrameData.pSof;
---------------------------------------------------------------------------------
-- DIRECT LINES SELECT
-- oRgb.valid must be 2nd condition else valid value
---------------------------------------------------------------------------------
  VideoOut : process (clk) begin
    if rising_edge(clk) then
        if (videoChannel6r = 0) then
        ---------------------------------------------------------
        --SOBEL/PREWITT
        ---------------------------------------------------------
            channels     <= iFrameData.soble;
        elsif(videoChannel6r = 1)then
        ---------------------------------------------------------
        --SOBEL_M1
        ---------------------------------------------------------
                channels.valid <= iFrameData.rgbDetect.valid;
            if (iFrameData.rgbDetectLock = '1') then 
                channels.red   <= iFrameData.soble.red;
                channels.green <= iFrameData.soble.green;
                channels.blue  <= iFrameData.soble.blue;
            else                   
                channels.red   <= iFrameData.rgbDetect.red;
                channels.green <= iFrameData.rgbDetect.green;
                channels.blue  <= iFrameData.rgbDetect.blue;
            end if;
        elsif(videoChannel6r = 2)then 
        ---------------------------------------------------------
        --SOBEL_M2
        ---------------------------------------------------------
            channels.valid  <= iFrameData.rgbPoi.valid;
            if (iFrameData.rgbPoiLock = '1') then 
                channels.red   <= iFrameData.soble.red;
                channels.green <= iFrameData.soble.green;
                channels.blue  <= iFrameData.soble.blue;
            else                   
                channels.red   <= iFrameData.rgbPoi.red;
                channels.green <= iFrameData.rgbPoi.green;
                channels.blue  <= iFrameData.rgbPoi.blue;
            end if;
        elsif(videoChannel6r = 3)then
        ---------------------------------------------------------
        --HSV_M1
        ---------------------------------------------------------
            channels.valid  <= iFrameData.rgbPoi.valid;
            if (iFrameData.rgbPoiLock = '1') then 
                channels.red   <= iFrameData.hsv.red;
                channels.green <= iFrameData.hsv.green;
                channels.blue  <= iFrameData.hsv.blue;
            else                   
                channels.red   <= iFrameData.rgbPoi.red;
                channels.green <= iFrameData.rgbPoi.green;
                channels.blue  <= iFrameData.rgbPoi.blue;
            end if;
        elsif(videoChannel6r = 4)then
        ---------------------------------------------------------
        --SHARP
        ---------------------------------------------------------
            channels    <= iFrameData.sharp;
        elsif(videoChannel6r = 5)then
        ---------------------------------------------------------
        --BLUR
        ---------------------------------------------------------
            channels     <= iFrameData.blur1x;
        elsif(videoChannel6r = 6)then
        ---------------------------------------------------------
        --BLUR
        ---------------------------------------------------------
            channels     <= iFrameData.blur2x;
        elsif(videoChannel6r = 7)then
        ---------------------------------------------------------
        --BLUR
        ---------------------------------------------------------
            channels     <= iFrameData.blur3x;
        elsif(videoChannel6r = 8)then
        ---------------------------------------------------------
        --BLUR
        ---------------------------------------------------------
            channels     <= iFrameData.blur4x;
        elsif(videoChannel6r = 9)then
        ---------------------------------------------------------
        --HSV
        ---------------------------------------------------------
            channels      <= iFrameData.hsv;
        elsif(videoChannel6r = 10)then
        ---------------------------------------------------------
        --RGB
        ---------------------------------------------------------
            channels     <= iFrameData.rgb;
        elsif(videoChannel6r = 11)then
        ---------------------------------------------------------
        --RGB
        ---------------------------------------------------------
            channels     <= iFrameData.rgbRemix;
        elsif(videoChannel6r = 12)then
        ---------------------------------------------------------
        --TESTPATTERN_V1
        ---------------------------------------------------------
            channels.valid     <= iFrameData.rgbSum.valid;
            channels.red       <= iFrameData.rgbSum.red(i_data_width-1 downto 0);
            channels.green     <= iFrameData.rgbSum.green(i_data_width-1 downto 0);
            channels.blue      <= iFrameData.rgbSum.blue(i_data_width-1 downto 0);
        elsif(videoChannel6r = 13)then
        ---------------------------------------------------------
        --TESTPATTERN_V2
        ---------------------------------------------------------
            channels.valid     <= iFrameData.rgbSum.valid;
            channels.red       <= x"0" & iFrameData.rgbSum.red(3 downto 0);
            channels.green     <= x"0" & iFrameData.rgbSum.green(7 downto 4);
            channels.blue      <= x"0" & iFrameData.rgbSum.blue(11 downto 8);
        elsif(videoChannel6r = 14)then
        ---------------------------------------------------------
        --TESTPATTERN_V3
        ---------------------------------------------------------
            channels.valid     <= iFrameData.rgbSum.valid;
            channels.red       <= iFrameData.rgbSum.red(i_data_width-1 downto 0);
            channels.green     <= x"0" & iFrameData.rgbSum.green(7 downto 4);
            channels.blue      <= x"0" & iFrameData.rgbSum.blue(11 downto 8);
        elsif(videoChannel6r = 15)then
        ---------------------------------------------------------
        --TESTPATTERN_V4
        ---------------------------------------------------------
            channels.valid     <= iFrameData.rgbSum.valid;
            channels.red       <= x"0" & iFrameData.rgbSum.red(3 downto 0);
            channels.green     <= iFrameData.rgbSum.green(i_data_width-1 downto 0);
            channels.blue      <= x"0" & iFrameData.rgbSum.blue(11 downto 8);
        elsif(videoChannel6r = 16)then
        ---------------------------------------------------------
        --TESTPATTERN_V5
        ---------------------------------------------------------
            channels.valid     <= iFrameData.rgbSum.valid;
            channels.red       <= x"0" & iFrameData.rgbSum.red(3 downto 0);
            channels.green     <= x"0" & iFrameData.rgbSum.green(7 downto 4);
            channels.blue      <= iFrameData.rgbSum.blue(i_data_width-1 downto 0);
        else
        ---------------------------------------------------------
        --DEFAULT : Rgbcorrect
        ---------------------------------------------------------
            channels          <= iFrameData.rgbCorrect;
        end if;
    end if;
  end process VideoOut;
---------------------------------------------------------------------------------
-- YCBCR 
-- IN  : CHANNEL
-- OUT : oPIXELS
---------------------------------------------------------------------------------
mod5_8_inst: rgb_ycbcr
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
---------------------------------------------------------------------------------
--CHANNEL OUT
---------------------------------------------------------------------------------
  ChannelOut : process (clk) begin
    if rising_edge(clk) then
        oCord <= iFrameData.cod;
        if (dChannel7r = 0) then
            oRgb     <= ycbcr;
        else
            oRgb     <= channels;
        end if;
    end if;
  end process ChannelOut;
end Behavioral;
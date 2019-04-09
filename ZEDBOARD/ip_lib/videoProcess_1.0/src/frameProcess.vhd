--01212019 [01-21-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.portspackage.all;
entity frameProcess is
generic (
    i_data_width    : integer := 8;
    s_data_width    : integer := 16;
    b_data_width    : integer := 32;
    i_precision     : integer := 12;
    i_full_range    : boolean := FALSE;
    img_width       : integer := 256;
    adwr_width      : integer := 16;
    addr_width      : integer := 11);
port (
    clk             : in std_logic;
    rst_l           : in std_logic;
    iRgb            : in channel;
    oRgb            : out channel;
    rgbCoord        : in region;
    videoChannel    : in std_logic_vector(b_data_width-1 downto 0);
    dChannel        : in std_logic_vector(b_data_width-1 downto 0);
    cChannel        : in std_logic_vector(b_data_width-1 downto 0);
    pRegion         : in poi;
    fifoStatus      : out std_logic_vector(b_data_width-1 downto 0);
    gridLockDatao   : out std_logic_vector(b_data_width-1 downto 0);
    gridDataRdEn    : in std_logic;
    endOfFrame      : in std_logic;
    threshold       : in std_logic_vector(s_data_width-1 downto 0); 
    kls             : in coefficient;
    als             : in coefficient;
    iCord           : in coord;
    oCord           : out coord);
end entity;
architecture arch of frameProcess is
    type videoColor is record
        valid                    : std_logic;
        red                      : std_logic_vector(i_data_width-1 downto 0);
        green                    : std_logic_vector(i_data_width-1 downto 0);
        blue                     : std_logic_vector(i_data_width-1 downto 0);
    end record;
    signal soble                 : videoColor;
    signal grid                  : videoColor;
    signal grid2                 : videoColor;
    signal hsv                   : videoColor;
    signal sharp                 : videoColor;
    signal blur                  : videoColor;
    signal channels              : videoColor;
    signal rgbcorrect            : videoColor;
    signal rgbcorrectSelect      : videoColor;
    signal ycbcr                 : videoColor;
    signal cord                  : coord;
    signal local                 : coord;
    signal gridLock              : std_logic;
    signal grid2Lock             : std_logic;
    signal rgbSum                : std_logic_vector(11 downto 0);
    signal config_Reg6           : integer;
    signal config_Reg7           : integer;
    signal config_Reg8           : integer;
---------------------------------------------------------------------------------
begin
---------------------------------------------------------------------------------
    config_Reg6   <= to_integer(unsigned(videoChannel));
    config_Reg7   <= to_integer(unsigned(dChannel));
    config_Reg8   <= to_integer(unsigned(cChannel));
---------------------------------------------------------------------------------
-- COLOR_CORRECTION
---------------------------------------------------------------------------------
mod5_0_inst: color_correction
generic map(
    i_data_width         => i_data_width,
    C_WHOLE_WIDTH        => 3,
    C_FRAC_WIDTH         => 8)
port map(           
    clk                  => clk,
    rst                  => rst_l,
    iRgb                 => iRgb,
    als                  => als,    
    iXcont               => iCord.x,
    iYcont               => iCord.y,
    Xcont                => local.x,
    Ycont                => local.y,
    oXcont               => oCord.x,
    oYcont               => oCord.y,
    oRed                 => rgbcorrectSelect.red,
    oGreen               => rgbcorrectSelect.green,
    oBlue                => rgbcorrectSelect.blue,
    oValid               => rgbcorrectSelect.valid);
---------------------------------------------------------------------------------
--CHANNEL OUT
---------------------------------------------------------------------------------
  ChannelCorrect : process (clk, rst_l) begin
    if rst_l = '0' then
        rgbcorrect.red    <= (others => '0');
        rgbcorrect.green  <= (others => '0');
        rgbcorrect.blue   <= (others => '0');
        rgbcorrect.valid  <= '0';
        cord.x            <= (others => '0');
        cord.y            <= (others => '0');
    elsif rising_edge(clk) then
        if (config_Reg8 = 0) then -- DIRECT.SOBLE
            rgbcorrect.valid     <= rgbcorrectSelect.valid;
            rgbcorrect.red       <= rgbcorrectSelect.red;
            rgbcorrect.green     <= rgbcorrectSelect.green;
            rgbcorrect.blue      <= rgbcorrectSelect.blue;
            cord.x               <= local.x;
            cord.y               <= local.y;          
        else
            rgbcorrect.valid     <= iRgb.valid;
            rgbcorrect.red       <= iRgb.red;
            rgbcorrect.green     <= iRgb.green;
            rgbcorrect.blue      <= iRgb.blue;
            cord.x               <= iCord.x;
            cord.y               <= iCord.y;
        end if;
    end if;
  end process ChannelCorrect;
---------------------------------------------------------------------------------
-- SOBEL
---------------------------------------------------------------------------------
mod5_1_inst: sobel
    generic map(
    i_data_width         => i_data_width,
    img_width            => img_width,
    adwr_width           => adwr_width,
    addr_width           => addr_width)
    port map(
    clk                 => clk,
    rst_l               => rst_l,
    videoChannel        => videoChannel,
    endOfFrame          => endOfFrame,
    iRed                => rgbcorrect.red,
    iGreen              => rgbcorrect.green,
    iBlue               => rgbcorrect.blue,
    iValid              => rgbcorrect.valid,
    threshold           => threshold,
    iaddress            => cord.x,
    kls                 => kls,
    oRed                => soble.red,
    oGreen              => soble.green,
    oBlue               => soble.blue,
    oValid              => soble.valid);
---------------------------------------------------------------------------------
-- sharpFilter
---------------------------------------------------------------------------------
mod5_2_inst: sharpFilter
generic map(
    i_data_width       => i_data_width,
    img_width          => img_width,
    adwr_width         => 15,
    addr_width         => 11)
port map(
    clk                => clk,
    rst_l              => rst_l,
    --input
    iRed               => rgbcorrect.red,
    iGreen             => rgbcorrect.green,
    iBlue              => rgbcorrect.blue,
    iValid             => rgbcorrect.valid,
    iaddress           => cord.x,
    endOfFrame         => endOfFrame,
    kls                => kls,    
    oRed               => sharp.red,
    oGreen             => sharp.green,
    oBlue              => sharp.blue,
    oValid             => sharp.valid);
mod5_3_inst: blurFilter
generic map(
    i_data_width       => i_data_width,
    img_width          => img_width,
    adwr_width         => 16,
    addr_width         => 11)
port map(
    clk                => clk,
    rst_l              => rst_l,
    iaddress           => cord.x,
    iValid             => rgbcorrect.valid,
    iRed               => rgbcorrect.red,
    iGreen             => rgbcorrect.green,
    iBlue              => rgbcorrect.blue,
    oRed               => blur.red,
    oGreen             => blur.green,
    oBlue              => blur.blue,
    oValid             => blur.valid);
---------------------------------------------------------------------------------
-- DETECT
---------------------------------------------------------------------------------
mod5_4_inst: detect
generic map(
    i_data_width        => i_data_width)
port map(
    clk                 => clk,
    rst_l               => rst_l,
    iRed                => sharp.red,
    iGreen              => sharp.green,
    iBlue               => sharp.blue,
    rgbCoord            => rgbCoord,
    endOfFrame          => endOfFrame,
    pValid              => sharp.valid,
    Xcont               => cord.x,
    Ycont               => cord.y,
    pDetect             => gridLock,
    oRed                => grid.red,
    oGreen              => grid.green,
    oBlue               => grid.blue,
    oValid              => grid.valid);
mod5_5_inst: pointOfInterest
generic map(
    i_data_width        => i_data_width,
    s_data_width        => s_data_width,
    b_data_width        => b_data_width)
port map(
    clk                 => clk,
    rst_l               => rst_l,
    iValid              => rgbcorrect.valid,
    iRed                => rgbcorrect.red,
    iGreen              => rgbcorrect.green,
    iBlue               => rgbcorrect.blue,
    iXcont              => cord.x,
    iYcont              => cord.y,
    endOfFrame          => endOfFrame,
    gridDataRdEn        => gridDataRdEn,
    gridLockDatao       => gridLockDatao,
    pRegion             => pRegion,
    fifoStatus          => fifoStatus,
    oGridLocation       => grid2Lock,
    oRed                => grid2.red,
    oGreen              => grid2.green,
    oBlue               => grid2.blue,
    oValid              => grid2.valid);
---------------------------------------------------------------------------------
-- HSV
---------------------------------------------------------------------------------
mod5_6_inst: hsv_c
generic map(
    i_data_width  => i_data_width)
port map(   
    pixclk        => clk,
    reset         => rst_l,
    iRed          => rgbcorrect.red,
    iGreen        => rgbcorrect.green,
    iBlue         => rgbcorrect.blue,
    oH            => hsv.red,
    oS            => hsv.green,
    oV            => hsv.blue);
---------------------------------------------------------------------------------
-- HSV
---------------------------------------------------------------------------------
mod5_7_inst: frameTestPattern
generic map(
    s_data_width  => s_data_width)
port map(   
    clk        => clk,
    iValid     => rgbcorrect.valid,
    Xcont      => cord.x,
    Ycont      => cord.y,
    rgbSum     => rgbSum);
---------------------------------------------------------------------------------
-- DIRECT LINES SELECT
-- channels.valid must be 2nd condition else valid value
---------------------------------------------------------------------------------
  VideoOut : process (clk, rst_l) begin
    if rst_l = '0' then
        channels.red   <= (others => '0');
        channels.green <= (others => '0');
        channels.blue  <= (others => '0');
        channels.valid  <= '0';
    elsif rising_edge(clk) then
        if (config_Reg6 = 0) then -- DIRECT.SOBLE
            channels.valid     <= soble.valid;
            channels.red       <= soble.red;
            channels.green     <= soble.green;
            channels.blue      <= soble.blue;
        elsif(config_Reg6 = 1)then -- DIRECT.SOBLE
            channels.valid     <= soble.valid;
            channels.red       <= soble.red;
            channels.green     <= soble.green;
            channels.blue      <= soble.blue;
        elsif(config_Reg6 = 2)then -- DIRECT.GRID
            channels.valid  <= grid.valid;
            if (gridLock = '1') then -- DIRECT.GRID.SOBLE
                channels.red   <= soble.red;
                channels.green <= soble.green;
                channels.blue  <= soble.blue;
            else                   -- DIRECT.GRID.LINES
                channels.red   <= grid.red;
                channels.green <= grid.green;
                channels.blue  <= grid.blue;
            end if;
        elsif(config_Reg6 = 4)then -- DIRECT.GRID
            channels.valid  <= grid2.valid;
            if (grid2Lock = '1') then -- DIRECT.GRID.SOBLE
                channels.red   <= soble.red;
                channels.green <= soble.green;
                channels.blue  <= soble.blue;
            else                   -- DIRECT.GRID.LINES
                channels.red   <= grid2.red;
                channels.green <= grid2.green;
                channels.blue  <= grid2.blue;
            end if;
        elsif(config_Reg6 = 5)then -- DIRECT.GRID
            channels.valid  <= grid2.valid;
            if (grid2Lock = '1') then -- DIRECT.GRID.SOBLE
                channels.red   <= hsv.red;
                channels.green <= hsv.green;
                channels.blue  <= hsv.blue;
            else                   -- DIRECT.GRID.LINES
                channels.red   <= grid2.red;
                channels.green <= grid2.green;
                channels.blue  <= grid2.blue;
            end if;
        elsif(config_Reg6 = 6)then -- DIRECT.SHARP
            channels.valid     <= sharp.valid;
            channels.red       <= sharp.red;
            channels.green     <= sharp.green;
            channels.blue      <= sharp.blue;
        elsif(config_Reg6 = 7)then -- DIRECT.SHARP
            channels.valid     <= blur.valid;
            channels.red       <= blur.red;
            channels.green     <= blur.green;
            channels.blue      <= blur.blue;
        elsif(config_Reg6 = 8)then -- DIRECT.HSL
            channels.valid     <= rgbcorrect.valid;
            channels.red       <= hsv.red;
            channels.green     <= hsv.green;
            channels.blue      <= hsv.blue;
        elsif(config_Reg6 = 9)then -- DIRECT.RGB
            channels.valid       <= iRgb.valid;
            channels.red       <= iRgb.red;
            channels.green     <= iRgb.green;
            channels.blue      <= iRgb.blue;
        elsif(config_Reg6 = 10)then -- DIRECT.HSL
            channels.valid      <= rgbcorrect.valid;
            channels.red       <= rgbsum(i_data_width-1 downto 0);
            channels.green     <= rgbsum(i_data_width-1 downto 0);
            channels.blue      <= rgbsum(i_data_width-1 downto 0);
        elsif(config_Reg6 = 11)then -- DIRECT.HSL
            channels.valid      <= rgbcorrect.valid;
            channels.red       <= x"0" & rgbsum(3 downto 0);
            channels.green     <= x"0" & rgbsum(7 downto 4);
            channels.blue      <= x"0" & rgbsum(11 downto 8);
        elsif(config_Reg6 = 12)then -- DIRECT.HSL
            channels.valid      <= rgbcorrect.valid;
            channels.red       <= rgbsum(i_data_width-1 downto 0);
            channels.green     <= x"0" & rgbsum(7 downto 4);
            channels.blue      <= x"0" & rgbsum(11 downto 8);
        elsif(config_Reg6 = 13)then -- DIRECT.HSL
            channels.valid      <= rgbcorrect.valid;
            channels.red       <= x"0" & rgbsum(3 downto 0);
            channels.green     <= rgbsum(i_data_width-1 downto 0);
            channels.blue      <= x"0" & rgbsum(11 downto 8);
        elsif(config_Reg6 = 14)then -- DIRECT.HSL
            channels.valid      <= rgbcorrect.valid;
            channels.red       <= x"0" & rgbsum(3 downto 0);
            channels.green     <= x"0" & rgbsum(7 downto 4);
            channels.blue      <= rgbsum(i_data_width-1 downto 0);
        else
            channels.valid     <= rgbcorrect.valid;
            channels.red       <= rgbcorrect.red;
            channels.green     <= rgbcorrect.green;
            channels.blue      <= rgbcorrect.blue;
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
    iRed                 => channels.red,
    iGreen               => channels.green,
    iBlue                => channels.blue,
    iValid               => channels.valid,
    y                    => ycbcr.red,
    cb                   => ycbcr.green,
    cr                   => ycbcr.blue,
    oValid               => ycbcr.valid);
---------------------------------------------------------------------------------
--CHANNEL OUT
---------------------------------------------------------------------------------
  ChannelOut : process (clk, rst_l) begin
    if rst_l = '0' then
        oRgb.red    <= (others => '0');
        oRgb.green  <= (others => '0');
        oRgb.blue   <= (others => '0');
        oRgb.valid  <= '0';
    elsif rising_edge(clk) then
        if (config_Reg7 = 0) then
            oRgb.valid     <= ycbcr.valid;
            oRgb.red       <= ycbcr.red;
            oRgb.green     <= ycbcr.green;
            oRgb.blue      <= ycbcr.blue;
        else
            oRgb.valid     <= channels.valid;
            oRgb.red       <= channels.red;
            oRgb.green     <= channels.green;
            oRgb.blue      <= channels.blue;
        end if;
    end if;
  end process ChannelOut;
end architecture;
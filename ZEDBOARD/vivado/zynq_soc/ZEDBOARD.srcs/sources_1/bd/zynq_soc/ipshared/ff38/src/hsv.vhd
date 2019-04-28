--02092019 [02-09-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity hsv_c is
generic (
    i_data_width   : integer := 8);
port (
    clk         : in  std_logic;
    reset          : in  std_logic;
    iRgb           : in channel;
    oHsv           : out hsvChannel);
end hsv_c;
architecture behavioral of hsv_c is
    signal u1Rgb                : uChannel;
    signal u2Rgb                : uChannel;
    signal rgbMin               : unsigned(i_data_width-1 downto 0):= (others => '0'); 
    signal rgbMax               : unsigned(i_data_width-1 downto 0):= (others => '0'); 
    signal rgbDelta             : unsigned(i_data_width-1 downto 0):= (others => '0'); 
    signal hue                  : unsigned(15 downto 0):= (others => '0'); 
    signal hueTop               : unsigned(15 downto 0):= (others => '0');  
    signal hueBottom            : unsigned(15 downto 0):= (others => '0'); 
    signal hueQuotient          : unsigned(15 downto 0):= (others => '0'); 
    signal hQuotient            : std_logic_vector(15 downto 0):= (others => '0'); 
    signal hueRgbAbsolute       : std_logic := '0'; 
    signal toHueAbsolute        : unsigned(18 downto 0):= (others => '0'); 
    type hue_Degree is array (0 to 17) of unsigned (15 downto 0);
    signal hueDegree            : hue_Degree := (others => (others => '0'));
    signal hueDegreeRgb         : unsigned(15 downto 0):= (others => '0'); 
    signal satTop               : unsigned(15 downto 0):= (others => '0'); 
    signal satBottom            : unsigned(15 downto 0):= (others => '0');
    signal saturateQuotient     : std_logic_vector(15 downto 0):= (others => '0'); 
    signal saturate             : std_logic_vector(i_data_width-1 downto 0):= (others => '0'); 
    signal rgbMaxSat            : unsigned(i_data_width-1 downto 0):= (others => '0'); 
    type rgbMaxSat_Delayed is array (0 to 17) of unsigned (i_data_width-1 downto 0);
    signal rgbMaxSatDelayed     : rgbMaxSat_Delayed := (others => (others => '0')); 
    signal sValue               : std_logic_vector(i_data_width-1 downto 0):= (others => '0');
    signal rgbMaxValue          : unsigned(i_data_width-1 downto 0):= (others => '0');
    signal u3Red                : unsigned(i_data_width-1 downto 0):= (others => '0'); 
    signal u3Green              : unsigned(i_data_width-1 downto 0):= (others => '0'); 
    signal u3Blue               : unsigned(i_data_width-1 downto 0):= (others => '0');
    signal u3Valid              : std_logic;
begin
satDivider: divider
port map(
    clk           => clk,
    dividend      => std_logic_vector(satTop),
    divisor       => std_logic_vector(satBottom),
    quotient      => saturateQuotient,
    remainder     => open);
hueDivider: divider
port map(
    clk           => clk,
    dividend      => std_logic_vector(hueTop),
    divisor       => std_logic_vector(hueBottom),
    quotient      => hQuotient,
    remainder     => open);
    hueQuotient  <= unsigned(hQuotient);
rgbDelay: process (clk) begin
    if rising_edge(clk) then 
        if reset = '0' then
            u1Rgb.red    <= (others => '0');
            u1Rgb.green  <= (others => '0');
            u1Rgb.blue   <= (others => '0');
            u1Rgb.valid  <= '0';
        else
            u1Rgb.red    <= unsigned(iRgb.red);
            u1Rgb.green  <= unsigned(iRgb.green);
            u1Rgb.blue   <= unsigned(iRgb.blue);
            u1Rgb.valid  <= iRgb.valid;
            u2Rgb        <= u1Rgb;
            u3Red        <= u2Rgb.red;
            u3Green      <= u2Rgb.green;
            u3Blue       <= u2Rgb.blue;
            u3Valid      <= u2Rgb.valid;
    end if;
  end if;
end process rgbDelay;
rgbMaxP: process (clk) begin
  if rising_edge(clk) then 
    if ((u1Rgb.red >= u1Rgb.green) and (u1Rgb.red >= u1Rgb.blue)) then
        rgbMax <= u1Rgb.red;
    elsif((u1Rgb.green >= u1Rgb.red) and (u1Rgb.green >= u1Rgb.blue))then
        rgbMax <= u1Rgb.green;
    else
        rgbMax <= u1Rgb.blue;
    end if;
  end if;
end process rgbMaxP;
rgbMinP: process (clk) begin
  if rising_edge(clk) then 
    if ((u1Rgb.red <= u1Rgb.green) and (u1Rgb.red <= u1Rgb.blue)) then
        rgbMin <= u1Rgb.red;
    elsif((u1Rgb.green <= u1Rgb.red) and (u1Rgb.green <= u1Rgb.blue)) then
        rgbMin <= u1Rgb.green;
    else
        rgbMin <= u1Rgb.blue;
    end if;
  end if;
end process rgbMinP;
rgbDeltaP: process (clk) begin
    if rising_edge(clk) then 
        rgbDelta      <= rgbMax - rgbMin;
    end if;
end process rgbDeltaP;
satNumniatorP: process (clk) begin
    if rising_edge(clk) then 
        satTop      <= x"FF" * rgbDelta;
    end if;
end process satNumniatorP;
rgbMaxSyncP: process (clk) begin
  if rising_edge(clk) then 
    rgbMaxValue          <= rgbMax;
    rgbMaxSatDelayed(0)  <= rgbMaxValue;
    rgbMaxSatDelayed(1)  <= rgbMaxSatDelayed(0);
    rgbMaxSatDelayed(2)  <= rgbMaxSatDelayed(1);
    rgbMaxSatDelayed(3)  <= rgbMaxSatDelayed(2);
    rgbMaxSatDelayed(4)  <= rgbMaxSatDelayed(3);
    rgbMaxSatDelayed(5)  <= rgbMaxSatDelayed(4);
    rgbMaxSatDelayed(6)  <= rgbMaxSatDelayed(5);
    rgbMaxSatDelayed(7)  <= rgbMaxSatDelayed(6);
    rgbMaxSatDelayed(8)  <= rgbMaxSatDelayed(7);
    rgbMaxSatDelayed(9)  <= rgbMaxSatDelayed(8);
    rgbMaxSatDelayed(10) <= rgbMaxSatDelayed(9);
    rgbMaxSatDelayed(11) <= rgbMaxSatDelayed(10);
    rgbMaxSatDelayed(12) <= rgbMaxSatDelayed(11);
    rgbMaxSatDelayed(13) <= rgbMaxSatDelayed(12);
    rgbMaxSatDelayed(14) <= rgbMaxSatDelayed(13);
    rgbMaxSatDelayed(15) <= rgbMaxSatDelayed(14);
    rgbMaxSatDelayed(16) <= rgbMaxSatDelayed(15);
    rgbMaxSatDelayed(17) <= rgbMaxSatDelayed(16);
    rgbMaxSat            <= rgbMaxSatDelayed(17);
  end if;
end process rgbMaxSyncP;
hueP: process (clk) begin
  if rising_edge(clk) then 
    if (u3Red  = rgbMaxValue) then
        if (u3Green >= u3Blue) then
            hueTop <= (u3Green - u3Blue) * x"2B";
            hueRgbAbsolute <= '0';
        else
            hueTop <= (u3Blue - u3Green) * x"2B";
            hueRgbAbsolute <= '1';
        end if;
        hueDegree(0) <= (others => '0');
    elsif(u3Green = rgbMaxValue)  then
        if (u3Blue >= u3Red ) then
            hueTop <= (u3Blue - u3Red ) * x"2B";
            hueRgbAbsolute <= '0';
        else
            hueTop <= (u3Red  - u3Blue) * x"2B";
            hueRgbAbsolute <= '1';
        end if;
        hueDegree(0) <= x"0055";
    elsif(u3Blue = rgbMaxValue)  then
        if (u3Red  >= u3Green) then
            hueTop <= (u3Red  - u3Green) * x"2B";
            hueRgbAbsolute <= '0';
        else
            hueTop <= (u3Green - u3Red ) * x"2B";
            hueRgbAbsolute <= '1';
        end if;
        hueDegree(0) <= x"00AB";
    end if;
    toHueAbsolute     <= toHueAbsolute(17 downto 0) & hueRgbAbsolute;
    hueDegree(1)  <= hueDegree(0);
    hueDegree(2)  <= hueDegree(1);
    hueDegree(3)  <= hueDegree(2);
    hueDegree(4)  <= hueDegree(3);
    hueDegree(5)  <= hueDegree(4);
    hueDegree(6)  <= hueDegree(5);
    hueDegree(7)  <= hueDegree(6);
    hueDegree(8)  <= hueDegree(7);
    hueDegree(9)  <= hueDegree(8);
    hueDegree(10) <= hueDegree(9);
    hueDegree(11) <= hueDegree(10);
    hueDegree(12) <= hueDegree(11);
    hueDegree(13) <= hueDegree(12);
    hueDegree(14) <= hueDegree(13);
    hueDegree(15) <= hueDegree(14);
    hueDegree(16) <= hueDegree(15);
    hueDegree(17) <= hueDegree(16);
    hueDegreeRgb  <= hueDegree(17);
  end if;
end process hueP;
satDominaCal: process (clk) begin
    if rising_edge(clk) then 
        if (rgbMaxValue > x"00") then
            satBottom <= x"00" & rgbMaxValue;
        else
            satBottom <= (others => '1');
        end if;
    end if;
end process satDominaCal;
hueDominaCal: process (clk) begin
    if rising_edge(clk) then 
        if (rgbDelta > x"00") then
            hueBottom <= rgbDelta  * x"01";
        else
            hueBottom <= x"0006";
        end if;
    end if;
end process hueDominaCal;
huesatValCal: process (clk) begin
    if rising_edge(clk) then 
        if ((toHueAbsolute(18) = '1') and (hueQuotient > hueDegreeRgb)) then
            hue <= x"FF" - hueQuotient(i_data_width-1 downto 0) + hueDegreeRgb;
        elsif(toHueAbsolute(18) = '1') then
            hue <= hueDegreeRgb - hueQuotient(i_data_width-1 downto 0);
        else
            hue <= hueQuotient(i_data_width-1 downto 0) + hueDegreeRgb;
        end if;
        saturate <= saturateQuotient(i_data_width-1 downto 0);
        sValue   <= std_logic_vector(rgbMaxSat(i_data_width-1 downto 0));
    end if;
end process huesatValCal;
hsvOut: process (clk) begin
    if rising_edge(clk) then 
        oHsv.h     <= std_logic_vector(hue(i_data_width-1 downto 0));    
        oHsv.s     <= saturate;
        oHsv.v     <= sValue;
        oHsv.valid <= u3Valid;
    end if;
end process hsvOut;
end behavioral;
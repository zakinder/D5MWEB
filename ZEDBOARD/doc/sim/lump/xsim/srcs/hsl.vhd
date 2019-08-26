--05062019 [05-06-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.fixed_pkg.all;
use work.float_pkg.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity hsl_c is
generic (
    i_data_width   : integer := 8);
port (
    clk            : in  std_logic;
    reset          : in  std_logic;
    iRgb           : in channel;
    oHsl           : out hslChannel);
end hsl_c;
architecture behavioral of hsl_c is
    --RGB Floating
    signal uFs1Rgb       : rgbToUfRecord := (valid => lo, red => (others => '0'), green => (others => '0'), blue => (others => '0'));
    signal uFs2Rgb       : rgbToUfRecord := (valid => lo, red => (others => '0'), green => (others => '0'), blue => (others => '0'));
    signal uFs3Rgb       : rgbToUfRecord := (valid => lo, red => (others => '0'), green => (others => '0'), blue => (others => '0'));
    --RGB Max Min
    signal rgbMax        : ufixed(7 downto 0) :=(others => '0');
    signal rgbMin        : ufixed(7 downto 0) :=(others => '0');
    signal maxValue      : ufixed(7 downto 0) :=(others => '0');
    signal rgbDelta      : ufixed(8 downto 0) :=(others => '0');
    signal maxMinSum     : ufixed(8 downto 0) :=(others => '0');
    --Valid
    signal rgbSyncValid  : std_logic_vector(7 downto 0)  := x"00";
    --HValue
    signal hValue1xD     : std_logic_vector(i_data_width-1 downto 0) :=(others => '0');
    signal hValue2xD     : std_logic_vector(i_data_width-1 downto 0) :=(others => '0');
    signal hValue3xD     : std_logic_vector(i_data_width-1 downto 0) :=(others => '0');
    signal hValue4xD     : std_logic_vector(i_data_width-1 downto 0) :=(others => '0');
    --Lum
    signal lumValueQuot  : ufixed(8 downto -9) :=(others => '0');
    signal lumValue      : ufixed(7 downto 0)  :=(others => '0');
    signal lumValue1xD   : std_logic_vector(i_data_width-1 downto 0) :=(others => '0');
    signal lumValue2xD   : std_logic_vector(i_data_width-1 downto 0) :=(others => '0');
    --Saturate
    signal satUfTop      : ufixed(17 downto 0) :=(others => '0');
    signal satUfTopV     : ufixed(17 downto 0) :=(others => '0');
    signal satUfBott     : ufixed(7 downto 0) :=(others => '0');
    signal satValueQuot  : ufixed(17 downto -8) :=(others => '0');
    signal satValueQuotV : ufixed(17 downto -8) :=(others => '0');
    signal satValue      : ufixed(7 downto 0) :=(others => '0');
    signal satValue1xD   : std_logic_vector(7 downto 0) :=(others => '0');
    --Hue Rsiz
    signal hueTop        : ufixed(17 downto 0) :=(others => '0');
    signal hueBot        : ufixed(8 downto 0) :=(others => '0');
    signal hueQuot       : ufixed(17 downto -9) :=(others => '0');
    signal hueQuot1x     : ufixed(7 downto 0) :=(others => '0');
    signal hueDeg        : ufixed(26 downto 0) :=(others => '0');
    signal hueDeg1x      : ufixed(7 downto 0) :=(others => '0');
    signal hueValue      : unsigned(7 downto 0):= (others => '0');
begin
-----------------------------------------------------------------------------------------------
--Coeff To Ufixed
-----------------------------------------------------------------------------------------------
rgbToUfP: process (clk,reset)begin
    if (reset = lo) then
        uFs1Rgb.red    <= (others => '0');
        uFs1Rgb.green  <= (others => '0');
        uFs1Rgb.blue   <= (others => '0');
    elsif rising_edge(clk) then 
        uFs1Rgb.red    <= to_ufixed(iRgb.red,uFs1Rgb.red);
        uFs1Rgb.green  <= to_ufixed(iRgb.green,uFs1Rgb.green);
        uFs1Rgb.blue   <= to_ufixed(iRgb.blue,uFs1Rgb.blue);
        uFs1Rgb.valid  <= iRgb.valid;
    end if; 
end process rgbToUfP;
pipRgbD2P: process (clk) begin
    if rising_edge(clk) then 
        uFs2Rgb <= uFs1Rgb;
    end if;
end process pipRgbD2P;
pipRgbD3P: process (clk) begin
    if rising_edge(clk) then 
        uFs3Rgb <= uFs2Rgb;
    end if;
end process pipRgbD3P;
rgbMaxP: process (clk) begin
    if rising_edge(clk) then 
        if ((uFs1Rgb.red >= uFs1Rgb.green) and (uFs1Rgb.red >= uFs1Rgb.blue)) then
            rgbMax <= uFs1Rgb.red;
        elsif((uFs1Rgb.green >= uFs1Rgb.red) and (uFs1Rgb.green >= uFs1Rgb.blue))then
            rgbMax <= uFs1Rgb.green;
        else
            rgbMax <= uFs1Rgb.blue;
        end if;
    end if;
end process rgbMaxP;
rgbMinP: process (clk) begin
    if rising_edge(clk) then 
        if ((uFs1Rgb.red <= uFs1Rgb.green) and (uFs1Rgb.red <= uFs1Rgb.blue)) then
            rgbMin <= uFs1Rgb.red;
        elsif((uFs1Rgb.green <= uFs1Rgb.red) and (uFs1Rgb.green <= uFs1Rgb.blue)) then
            rgbMin <= uFs1Rgb.green;
        else
            rgbMin <= uFs1Rgb.blue;
        end if;
    end if;
end process rgbMinP;
rgbDeltaP: process (clk) begin
    if rising_edge(clk) then 
        rgbDelta      <= rgbMax - rgbMin;
    end if;
end process rgbDeltaP;
maxMinUfSumP: process (clk) begin
    if rising_edge(clk) then 
        maxMinSum    <= rgbMax + rgbMin;
    end if;
end process maxMinUfSumP;
pipRgbMaxUfD1P: process (clk) begin
    if rising_edge(clk) then 
        maxValue          <= rgbMax;
    end if;
end process pipRgbMaxUfD1P;
-------------------------------------------------
-- LUM
-------------------------------------------------
lumP: process (clk) begin
    if rising_edge(clk) then 
        lumValueQuot   <= maxMinSum / 2.0;
    end if;
end process lumP;
lumResizeP: process (clk) begin
    if rising_edge(clk) then 
        lumValue    <= resize(lumValueQuot,lumValue);
        lumValue1xD <= std_logic_vector(to_unsigned(lumValue,8));
        lumValue2xD <= lumValue1xD;
    end if;
end process lumResizeP;
-------------------------------------------------
-- VALUE
-------------------------------------------------
hValueP: process (clk) begin
    if rising_edge(clk) then 
        hValue1xD <= std_logic_vector(to_unsigned(maxValue,8));
        hValue2xD <= hValue1xD;
        hValue3xD <= hValue2xD;
        hValue4xD <= hValue3xD;
    end if;
end process hValueP;
-------------------------------------------------
-- SATURATE
-------------------------------------------------
satUfTopV      <= (256.0 * rgbDelta);
------------------------------------------------
satNumniatorUfP: process (clk) begin
    if rising_edge(clk) then 
        satUfTop      <= satUfTopV;
    end if;
end process satNumniatorUfP;
------------------------------------------------
satDominaUfCalP: process (clk) begin
    if rising_edge(clk) then 
        if (maxValue > 0) then
            satUfBott <= maxValue;
        end if;
    end if;
end process satDominaUfCalP;
------------------------------------------------
satValueQuotV <= (satUfTop / satUfBott) when (satUfTop > 0 and satUfBott > 0) ;
satDividerP: process (clk) begin
    if rising_edge(clk) then 
        satValueQuot <= satValueQuotV;
    end if;
end process satDividerP;
------------------------------------------------
satDividerResizeP: process (clk) begin
    if rising_edge(clk) then 
        satValue    <= resize(satValueQuot,satValue);
        satValue1xD <= std_logic_vector(to_unsigned(satValue,8));
    end if;
end process satDividerResizeP;
-------------------------------------------------
-- HUE
-------------------------------------------------
hueBottomP: process (clk) begin
    if rising_edge(clk) then 
        if (rgbDelta > 0) then
            hueBot <= rgbDelta;
        else
            hueBot <= to_ufixed (6.0,hueBot);
        end if;
    end if;
end process hueBottomP;
hueP: process (clk) begin
  if rising_edge(clk) then 
    if (uFs3Rgb.red  = maxValue) then
            hueDeg <= to_ufixed (0.0,hueDeg);
        if (uFs3Rgb.green >= uFs3Rgb.blue) then
            hueTop        <= (uFs3Rgb.green - uFs3Rgb.blue) * 43;
        else
            hueTop        <= (uFs3Rgb.blue - uFs3Rgb.green) * 43;
        end if;
    elsif(uFs3Rgb.green = maxValue)  then
            hueDeg <= to_ufixed (85.0,hueDeg);
        if (uFs3Rgb.blue >= uFs3Rgb.red ) then
            hueTop       <= (uFs3Rgb.blue - uFs3Rgb.red ) * 43;
        else
            hueTop       <= (uFs3Rgb.red  - uFs3Rgb.blue) * 43;
        end if;
    else
            hueDeg <= to_ufixed (171.0,hueDeg);
        if (uFs3Rgb.red  >= uFs3Rgb.green) then
            hueTop       <= (uFs3Rgb.red  - uFs3Rgb.green) * 43;
        else
            hueTop       <= (uFs3Rgb.green - uFs3Rgb.red ) * 43;
        end if;
    end if;
  end if;
end process hueP;
hueDividerP: process (clk) begin
    if rising_edge(clk) then 
        if (hueTop > 0) and (hueBot > 0) then 
        hueQuot  <= hueTop / hueBot;
        end if;
    end if;
end process hueDividerP;
hueDegreeP: process (clk) begin
    if rising_edge(clk) then 
        hueDeg1x <= resize(hueDeg,hueDeg1x);
    end if;
end process hueDegreeP;
hueDividerResizeP: process (clk) begin
    if rising_edge(clk) then 
        hueQuot1x <= resize(hueQuot,hueQuot1x);
    end if;
end process hueDividerResizeP;
hueValueP: process (clk) begin
    if rising_edge(clk) then 
        hueValue <= (to_unsigned(hueQuot1x,8) + to_unsigned(hueDeg1x,8));
    end if;
end process hueValueP;
-------------------------------------------------
-- VALID
-------------------------------------------------
pipValidP: process (clk) begin
    if rising_edge(clk) then 
        rgbSyncValid(0)   <= iRgb.valid;
        rgbSyncValid(1)   <= rgbSyncValid(0);
        rgbSyncValid(2)   <= rgbSyncValid(1);
        rgbSyncValid(3)   <= rgbSyncValid(2);
        rgbSyncValid(4)   <= rgbSyncValid(3);
        rgbSyncValid(5)   <= rgbSyncValid(4);
        rgbSyncValid(6)   <= rgbSyncValid(5);
        rgbSyncValid(7)   <= rgbSyncValid(6);
    end if;
end process pipValidP;
hslOut: process (clk) begin
    if rising_edge(clk) then 
        oHsl.h      <= std_logic_vector(hueValue(i_data_width-1 downto 0));
        oHsl.s      <= satValue1xD;
        oHsl.l      <= lumValue2xD;
        oHsl.valid  <= rgbSyncValid(7);
    end if;
end process hslOut;
end behavioral;
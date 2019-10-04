--05062019 [05-06-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.fixed_pkg.all;
use work.float_pkg.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity hsv_c is
generic (
    i_data_width   : integer := 8);
port (
    clk            : in  std_logic;
    reset          : in  std_logic;
    iRgb           : in channel;
    oHsv           : out hsvChannel);
end hsv_c;
architecture behavioral of hsv_c is
    --RGB Floating
    signal uFs1Rgb       : rgbToUfRecord;
    signal uFs2Rgb       : rgbToUfRecord;
    signal uFs3Rgb       : rgbToUfRecord;
    --RGB Max Min
    signal rgbMax        : ufixed(7 downto 0) :=(others => '0');
    signal rgbMin        : ufixed(7 downto 0) :=(others => '0');
    signal maxValue      : ufixed(7 downto 0) :=(others => '0');
    signal minValue      : ufixed(7 downto 0) :=(others => '0');
    signal rgbDelta      : ufixed(8 downto 0) :=(others => '0');
    signal maxMinSum     : ufixed(8 downto 0) :=(others => '0');
    --Valid
    signal valid1xD      : std_logic := '0';
    signal valid2xD      : std_logic := '0';
    signal valid3xD      : std_logic := '0';
    signal valid4xD      : std_logic := '0';
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
        minValue          <= rgbMin;
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
        lumValue <= resize(lumValueQuot,lumValue);
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
satNumniatorUfP: process (clk) begin
    if rising_edge(clk) then 
        satUfTop      <= satUfTopV;
    end if;
end process satNumniatorUfP;
satDominaUfCalP: process (clk) begin
    if rising_edge(clk) then 
        if (maxValue > 0) then
            satUfBott <= maxValue;
        end if;
    end if;
end process satDominaUfCalP;
satValueQuotV <= (satUfTop / satUfBott);
satDividerP: process (clk) begin
    if rising_edge(clk) then 
        satValueQuot <= satValueQuotV;
    end if;
end process satDividerP;
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
    elsif(uFs3Rgb.blue = maxValue)  then
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
        hueQuot  <= hueTop / hueBot;
    end if;
end process hueDividerP;
hueDegreeP: process (clk) begin
    if rising_edge(clk) then 
        hueDeg1x       <= resize(hueDeg,hueDeg1x);
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
        valid1xD   <= uFs3Rgb.valid;
        valid2xD   <= valid1xD;
        valid3xD   <= valid2xD;
        valid4xD   <= valid3xD;
    end if;
end process pipValidP;
hsvOut: process (clk) begin
    if rising_edge(clk) then 
        oHsv.h     <= std_logic_vector(hueValue(i_data_width-1 downto 0));
        oHsv.s     <= satValue1xD;
        oHsv.v     <= hValue4xD;
        oHsv.valid <= valid4xD;
    end if;
end process hsvOut;
end behavioral;
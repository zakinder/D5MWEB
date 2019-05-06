--02092019 [02-09-2019]
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
    signal uFd1Rgb              : rgbToUfRecord;
    signal uFd2Rgb              : rgbToUfRecord;
    signal uFd3Rgb              : rgbToUfRecord;
    --RGB Max Min
    signal rgbMax               : ufixed(7 downto 0) :=(others => '0');
    signal rgbMin               : ufixed(7 downto 0) :=(others => '0');
    signal rgbMaxValue          : ufixed(7 downto 0) :=(others => '0');
    signal rgbDelta             : ufixed(8 downto 0) :=(others => '0');
    signal rgbMaxMinSum         : ufixed(8 downto 0) :=(others => '0');
    --Valid
    signal valid1xD             : std_logic := '0';
    signal valid2xD             : std_logic := '0';
    signal valid3xD             : std_logic := '0';
    signal valid4xD             : std_logic := '0';
    --HValue
    signal hValue1xD            : std_logic_vector(i_data_width-1 downto 0) :=(others => '0');
    signal hValue2xD            : std_logic_vector(i_data_width-1 downto 0) :=(others => '0');
    signal hValue3xD            : std_logic_vector(i_data_width-1 downto 0) :=(others => '0');
    signal hValue4xD            : std_logic_vector(i_data_width-1 downto 0) :=(others => '0');
    --Lum
    signal lumValueQuotient     : ufixed(8 downto -9) :=(others => '0');
    signal lumValue             : ufixed(7 downto 0)  :=(others => '0');
    signal lumValue1xD          : std_logic_vector(i_data_width-1 downto 0) :=(others => '0');
    signal lumValue2xD          : std_logic_vector(i_data_width-1 downto 0) :=(others => '0');
    signal lumValue3xD          : std_logic_vector(i_data_width-1 downto 0) :=(others => '0');
    signal lumValue4xD          : std_logic_vector(i_data_width-1 downto 0) :=(others => '0');
    --Saturate
    signal satUfTop             : ufixed(17 downto 0) :=(others => '0');
    signal satUfBottom          : ufixed(7 downto 0) :=(others => '0');
    signal satValueQuotient     : ufixed(17 downto -8) :=(others => '0');
    signal satValue             : ufixed(7 downto 0) :=(others => '0');
    signal satValue1xD          : std_logic_vector(7 downto 0) :=(others => '0');
    signal satValue2xD          : std_logic_vector(7 downto 0) :=(others => '0');
    --Hue
    signal hueTop               : ufixed(17 downto 0) :=(others => '0');
    signal hueBottom            : ufixed(8 downto 0) :=(others => '0');
    signal hueQuotient          : ufixed(17 downto -9) :=(others => '0');
    signal hueQuotientResize    : ufixed(7 downto 0) :=(others => '0');
    signal hueDegree            : ufixed(26 downto 0) :=(others => '0');
    signal hueDegreeResize      : ufixed(7 downto 0) :=(others => '0');
    signal hueDegreeResize2xD   : ufixed(7 downto 0) :=(others => '0');
    signal hueAbsolute          : std_logic := '0';
    signal hueAbsolute1xD       : std_logic := '0';
    signal hueAbsolute2xD       : std_logic := '0';
    signal hueValue             : unsigned(7 downto 0):= (others => '0');
begin
rgbToUfP: process (clk,reset)begin
    if (reset = lo) then
        uFd1Rgb.red    <= (others => '0');
        uFd1Rgb.green  <= (others => '0');
        uFd1Rgb.blue   <= (others => '0');
    elsif rising_edge(clk) then 
        uFd1Rgb.red    <= to_ufixed(iRgb.red,uFd1Rgb.red);
        uFd1Rgb.green  <= to_ufixed(iRgb.green,uFd1Rgb.green);
        uFd1Rgb.blue   <= to_ufixed(iRgb.blue,uFd1Rgb.blue);
        uFd1Rgb.valid  <= iRgb.valid;
    end if; 
end process rgbToUfP;
pipRgbD2P: process (clk) begin
    if rising_edge(clk) then 
        uFd2Rgb <= uFd1Rgb;
    end if;
end process pipRgbD2P;
pipRgbD3P: process (clk) begin
    if rising_edge(clk) then 
        uFd3Rgb <= uFd2Rgb;
    end if;
end process pipRgbD3P;
rgbMaxP: process (clk) begin
    if rising_edge(clk) then 
        if ((uFd1Rgb.red >= uFd1Rgb.green) and (uFd1Rgb.red >= uFd1Rgb.blue)) then
            rgbMax <= uFd1Rgb.red;
        elsif((uFd1Rgb.green >= uFd1Rgb.red) and (uFd1Rgb.green >= uFd1Rgb.blue))then
            rgbMax <= uFd1Rgb.green;
        else
            rgbMax <= uFd1Rgb.blue;
        end if;
    end if;
end process rgbMaxP;
rgbMinP: process (clk) begin
    if rising_edge(clk) then 
        if ((uFd1Rgb.red <= uFd1Rgb.green) and (uFd1Rgb.red <= uFd1Rgb.blue)) then
            rgbMin <= uFd1Rgb.red;
        elsif((uFd1Rgb.green <= uFd1Rgb.red) and (uFd1Rgb.green <= uFd1Rgb.blue)) then
            rgbMin <= uFd1Rgb.green;
        else
            rgbMin <= uFd1Rgb.blue;
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
        rgbMaxMinSum   <= rgbMax + rgbMin;
    end if;
end process maxMinUfSumP;
lumP: process (clk) begin
    if rising_edge(clk) then 
        lumValueQuotient   <= rgbMaxMinSum / 2.0;
    end if;
end process lumP;
lumResizeP: process (clk) begin
    if rising_edge(clk) then 
        lumValue <= resize(lumValueQuotient,lumValue);
        lumValue1xD <= std_logic_vector(to_unsigned(lumValue,8));
        lumValue2xD <= lumValue1xD;
        lumValue3xD <= lumValue2xD;
        lumValue4xD <= lumValue3xD;
    end if;
end process lumResizeP;
satNumniatorUfP: process (clk) begin
    if rising_edge(clk) then 
        satUfTop      <= 256.0 * rgbDelta;
    end if;
end process satNumniatorUfP;
pipRgbMaxUfD1P: process (clk) begin
    if rising_edge(clk) then 
        rgbMaxValue          <= rgbMax;
    end if;
end process pipRgbMaxUfD1P;
satDominaUfCalP: process (clk) begin
    if rising_edge(clk) then 
        if (rgbMaxValue > 0) then
            satUfBottom <= rgbMaxValue;
        end if;
    end if;
end process satDominaUfCalP;
satDividerP: process (clk) begin
    if rising_edge(clk) then 
        satValueQuotient <= satUfTop / satUfBottom;
    end if;
end process satDividerP;
satDividerResizeP: process (clk) begin
    if rising_edge(clk) then 
        satValue    <= resize(satValueQuotient,satValue);
        satValue1xD <= std_logic_vector(to_unsigned(satValue,8));
        satValue2xD <= satValue1xD;
    end if;
end process satDividerResizeP;
hueBottomP: process (clk) begin
    if rising_edge(clk) then 
        if (rgbDelta > 0) then
            hueBottom <= rgbDelta;
        else
            hueBottom <= to_ufixed (6.0,hueBottom);
        end if;
    end if;
end process hueBottomP;
hueP: process (clk) begin
  if rising_edge(clk) then 
    if (uFd3Rgb.red  = rgbMaxValue) then
            hueDegree <= to_ufixed (0.0,hueDegree);
        if (uFd3Rgb.green >= uFd3Rgb.blue) then
            hueTop        <= (uFd3Rgb.green - uFd3Rgb.blue) * 43;
            hueAbsolute   <= lo;
        else
            hueTop        <= (uFd3Rgb.blue - uFd3Rgb.green) * 43;
            hueAbsolute   <= hi;
        end if;

    elsif(uFd3Rgb.green = rgbMaxValue)  then
            hueDegree <= to_ufixed (85.0,hueDegree);
        if (uFd3Rgb.blue >= uFd3Rgb.red ) then
            hueTop       <= (uFd3Rgb.blue - uFd3Rgb.red ) * 43;
            hueAbsolute  <= lo;
        else
            hueTop       <= (uFd3Rgb.red  - uFd3Rgb.blue) * 43;
            hueAbsolute  <= hi;
        end if;

    elsif(uFd3Rgb.blue = rgbMaxValue)  then
            hueDegree <= to_ufixed (171.0,hueDegree);
        if (uFd3Rgb.red  >= uFd3Rgb.green) then
            hueTop       <= (uFd3Rgb.red  - uFd3Rgb.green) * 43;
            hueAbsolute  <= lo;
        else
            hueTop       <= (uFd3Rgb.green - uFd3Rgb.red ) * 43;
            hueAbsolute  <= hi;
        end if;

    end if;
  end if;
end process hueP;
hueDegreeP: process (clk) begin
    if rising_edge(clk) then 
        hueAbsolute1xD     <= hueAbsolute;
        hueAbsolute2xD     <= hueAbsolute1xD;
        hueDegreeResize    <= resize(hueDegree,hueDegreeResize);
        hueDegreeResize2xD <= hueDegreeResize;
    end if;
end process hueDegreeP;
hueDividerP: process (clk) begin
    if rising_edge(clk) then 
        hueQuotient  <= hueTop / hueBottom;
    end if;
end process hueDividerP;
hueDividerResizeP: process (clk) begin
    if rising_edge(clk) then 
        hueQuotientResize <= resize(hueQuotient,hueQuotientResize);
    end if;
end process hueDividerResizeP;
hueValueP: process (clk) begin
    if rising_edge(clk) then 
        if ((hueAbsolute2xD = '1') and (hueQuotient > hueDegreeResize2xD)) then
            hueValue <= x"FF" - to_unsigned(hueQuotientResize,8) + to_unsigned(hueDegreeResize,8);
        elsif(hueAbsolute2xD = '1') then
            hueValue <= to_unsigned(hueDegreeResize,8) - to_unsigned(hueQuotientResize,8);
        else
            hueValue <= to_unsigned(hueQuotientResize,8);
        end if;
    end if;
end process hueValueP;
hValueP: process (clk) begin
    if rising_edge(clk) then 
        hValue1xD <= std_logic_vector(to_unsigned(rgbMaxValue,8));
        hValue2xD <= hValue1xD;
        hValue3xD <= hValue2xD;
        hValue4xD <= hValue3xD;
    end if;
end process hValueP;
pipValidP: process (clk) begin
    if rising_edge(clk) then 
        valid1xD <= uFd3Rgb.valid;
        valid2xD <= valid1xD;
        valid3xD <= valid2xD;
        valid4xD <= valid3xD;
    end if;
end process pipValidP;
hsvOut: process (clk) begin
    if rising_edge(clk) then 
        oHsv.h     <= std_logic_vector(hueValue(i_data_width-1 downto 0));
        oHsv.s     <= satValue2xD;
        oHsv.v     <= hValue4xD;
        oHsv.valid <= valid4xD;
    end if;
end process hsvOut;
end behavioral;
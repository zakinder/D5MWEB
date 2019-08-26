--05062019 [05-06-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.fixed_pkg.all;
use work.float_pkg.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity ColorTrim is
generic (
    i_data_width   : integer := 8);
port (
    clk            : in  std_logic;
    reset          : in  std_logic;
    iRgb           : in channel;
    oRgb           : out channel);
end ColorTrim;
architecture behavioral of ColorTrim is
    signal uF1Rgb           : tpToFloatRecord;
    signal uF2Rgb           : tpToFloatRecord;
    signal uF3Rgb           : tpToFloatRecord;
    signal uF4Rgb           : rgbToUfRecord;
    signal uF5Rgb           : rgbToUf2BytesRecord;
    signal rgbFpoints       : float32;
    signal rgbFupdate       : float32;
    signal rgbTrimValue     : ufixed(7 downto 0)    :=(others => '0');   
begin
    rgbFpoints   <= to_float(0.001,rgbFpoints);
    rgbFupdate   <= to_float(100.0,rgbFupdate);
    rgbTrimValue <= to_ufixed(10,rgbTrimValue);
-----------------------------------------------------------------------------------------------
-- STAGE 1
-----------------------------------------------------------------------------------------------
process (clk,reset) begin
    if (reset = lo) then
        uF1Rgb.red   <= (others => '0');
        uF1Rgb.green <= (others => '0');
        uF1Rgb.blue  <= (others => '0');
    elsif rising_edge(clk) then 
        uF1Rgb.red   <= to_float(unsigned(iRgb.red), uF1Rgb.red);
        uF1Rgb.green <= to_float(unsigned(iRgb.green), uF1Rgb.green);
        uF1Rgb.blue  <= to_float(unsigned(iRgb.blue), uF1Rgb.blue);
        uF1Rgb.valid <= iRgb.valid;
    end if;
end process;
-----------------------------------------------------------------------------------------------
-- STAGE 2
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then
        uF2Rgb.red   <= (uF1Rgb.red * rgbFpoints);
        uF2Rgb.green <= (uF1Rgb.green * rgbFpoints);
        uF2Rgb.blue  <= (uF1Rgb.blue * rgbFpoints);
        uF2Rgb.valid <= uF1Rgb.valid;
    end if;
end process;
-----------------------------------------------------------------------------------------------
-- STAGE 3
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then
        uF3Rgb.red   <= (uF2Rgb.red * rgbFupdate);
        uF3Rgb.green <= (uF2Rgb.green * rgbFupdate);
        uF3Rgb.blue  <= (uF2Rgb.blue * rgbFupdate);
        uF3Rgb.valid <= uF2Rgb.valid;
    end if;
end process;
-----------------------------------------------------------------------------------------------
-- STAGE 4
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then
        uF4Rgb.red    <= to_ufixed(uF3Rgb.red,uF4Rgb.red);
        uF4Rgb.green  <= to_ufixed(uF3Rgb.green,uF4Rgb.green);
        uF4Rgb.blue   <= to_ufixed(uF3Rgb.blue,uF4Rgb.blue); 
        uF4Rgb.valid  <= uF3Rgb.valid;
    end if;
end process;
-----------------------------------------------------------------------------------------------
-- STAGE 5
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then
        uF5Rgb.red    <= uF4Rgb.red * rgbTrimValue; 
        uF5Rgb.green  <= uF4Rgb.green * rgbTrimValue;
        uF5Rgb.blue   <= uF4Rgb.blue * rgbTrimValue;
        uF5Rgb.valid  <= uF4Rgb.valid;
    end if;
end process;
-----------------------------------------------------------------------------------------------
-- STAGE 6
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then 
        oRgb.red   <= std_logic_vector(to_unsigned(uF5Rgb.red,8));
        oRgb.green <= std_logic_vector(to_unsigned(uF5Rgb.green,8));
        oRgb.blue  <= std_logic_vector(to_unsigned(uF5Rgb.blue,8));
        oRgb.valid <= uF5Rgb.valid;
    end if;
end process;
end behavioral;
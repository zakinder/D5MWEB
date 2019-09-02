--01062019 [01-06-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity TestPattern is
port (
    clk                   : in std_logic;
    ChannelS              : in integer;
    rgbSum                : in tpRgb;
    oRgb                  : out channel);
end TestPattern;
architecture arch_imp of TestPattern is
begin
process (clk) begin
    if rising_edge(clk) then
        if(ChannelS = 0)then
            oRgb.valid     <= rgbSum.valid;
            oRgb.red       <= rgbSum.red(7 downto 0);
            oRgb.green     <= rgbSum.green(7 downto 0);
            oRgb.blue      <= rgbSum.blue(7 downto 0);
        elsif(ChannelS = 1)then
            oRgb.valid     <= rgbSum.valid;
            oRgb.red       <= x"0" & rgbSum.red(3 downto 0);
            oRgb.green     <= x"0" & rgbSum.green(7 downto 4);
            oRgb.blue      <= x"0" & rgbSum.blue(11 downto 8);
        elsif(ChannelS = 2)then
            oRgb.valid     <= rgbSum.valid;
            oRgb.red       <= rgbSum.red(7 downto 0);
            oRgb.green     <= x"0" & rgbSum.green(7 downto 4);
            oRgb.blue      <= x"0" & rgbSum.blue(11 downto 8);
        elsif(ChannelS = 3)then
            oRgb.valid     <= rgbSum.valid;
            oRgb.red       <= x"0" & rgbSum.red(3 downto 0);
            oRgb.green     <= rgbSum.green(7 downto 0);
            oRgb.blue      <= x"0" & rgbSum.blue(11 downto 8);
        else
            oRgb.valid     <= rgbSum.valid;
            oRgb.red       <= x"0" & rgbSum.red(3 downto 0);
            oRgb.green     <= x"0" & rgbSum.green(7 downto 4);
            oRgb.blue      <= rgbSum.blue(7 downto 0);
        end if;
    end if;
end process;
end arch_imp;
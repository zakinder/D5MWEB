--01062019 [01-06-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity frameTestPattern is
generic (
    s_data_width	       : integer := 16);
port (
    clk                   : in std_logic;
    iValid                : in std_logic;
    iCord                 : in coord;
    oRgb                  : out tpRgb);
end frameTestPattern;
architecture arch_imp of frameTestPattern is
    signal xCounter           : integer;
    signal yCounter           : integer;
    signal rowdist            : integer;
    signal nrowdist           : integer;
    signal coldist            : integer;
    signal ncoldist           : integer;
    signal irgbSum            : integer;
begin
    xCounter    <= to_integer(unsigned(iCord.x));
    yCounter    <= to_integer(unsigned(iCord.y));
tPattenP: Process (clk) begin
    if rising_edge(clk) then
        if iValid = '1'  then
            if xcounter > 960 then
                rowdist <= xcounter - 960;
            else
                rowdist <= 960 - xcounter;
            end if;
            if rowdist > 480 then
                nrowdist <= rowdist - 480;
            else
                nrowdist <= 480 - rowdist;
            end if;	
            if ycounter > 540 then
                coldist <= ycounter -540;
            else
                coldist <= 540 - ycounter;
            end if;
            if coldist > 270 then
                ncoldist <= coldist - 270;
            else
                ncoldist <= 270 - coldist;
            end if;
            irgbSum <= nrowdist + ncoldist;
        end if;
    end if;
end process tPattenP;
rgbSumP: Process (clk) begin
    if rising_edge(clk) then
        oRgb.valid    <= iValid;
        oRgb.red      <= std_logic_vector(to_unsigned(irgbSum,12));
        oRgb.green    <= std_logic_vector(to_unsigned(irgbSum,12));
        oRgb.blue     <= std_logic_vector(to_unsigned(irgbSum,12));
    end if;
end process rgbSumP;
end arch_imp;
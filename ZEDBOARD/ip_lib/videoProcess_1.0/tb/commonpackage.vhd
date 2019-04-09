--01062019 [01-06-2019]
library ieee;
library work;
use ieee.std_logic_1164.all;
package commonpackage is
procedure clk_gen(signal clk : out std_logic; constant FREQ : real) ;
end package;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
package body commonpackage is
procedure clk_gen(signal clk : out std_logic; constant FREQ : real) is
    constant PERIOD : time := 1 sec / FREQ;
    constant HIGH_TIME : time := PERIOD / 2;
    constant LOW_TIME : time := PERIOD - HIGH_TIME;
    begin
        loop
        clk <= '1';
        wait for HIGH_TIME;
        clk <= '0';
        wait for LOW_TIME;
    end loop;
end procedure;
end package body;
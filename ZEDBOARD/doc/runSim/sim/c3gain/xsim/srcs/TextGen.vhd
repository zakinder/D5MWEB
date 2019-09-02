library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity TextGen is
generic(
    img_width        : integer := 4096;
    img_height       : integer := 4096;
    displayText      : string  := (others => NUL));
port (
    clk              : in std_logic;
    rst_l            : in std_logic;
    txCord           : in coord;
    location         : in cord;
    iRgb             : in channel;
    oRgb             : out channel);
end TextGen;
architecture Behavioral of TextGen is
    signal grid  :  cord;
    signal pixOn : std_logic := '0';
begin
grid.x <= to_integer(unsigned(txCord.x(11 downto 0)));
grid.y <= img_height - to_integer(unsigned(txCord.y(11 downto 0)));
textElement2: PixelOnDisplay
generic map (
    displayText => displayText)
port map(
    clk       => clk,
    location  => location,
    grid      => grid,
    pixel     => pixOn);
process (clk) begin
    if rising_edge(clk) then
    if (rst_l = lo) then
        oRgb.red   <= black;
        oRgb.green <= black;
        oRgb.blue  <= black;
    else
     oRgb.valid  <= iRgb.valid;
        if (iRgb.valid = hi) then
            if (pixOn = hi) then
                oRgb.red   <= black;
                oRgb.green <= black;
                oRgb.blue  <= black;
            else
                oRgb.red   <= iRgb.red;
                oRgb.green <= iRgb.green;
                oRgb.blue  <= iRgb.blue;
            end if;
        end if;    
    end if;
    end if;
end process;
end Behavioral;
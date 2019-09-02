library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.portspackage.all;
use work.vpfRecords.all;
use work.constantspackage.all;
entity PixelOnDisplay is
generic(
    displayText : string  := (others => NUL));
port (
    clk         : in std_logic;
    location    : in cord;
    grid        : in cord;
    pixel       : out std_logic);
end PixelOnDisplay;
architecture Behavioral of PixelOnDisplay is
    signal fontAddress      : integer := 0;
    signal charBitInRow     : std_logic_vector(FONT_WIDTH-1 downto 0) := (others => '0');
    signal charCode         : integer := 0;
    signal charPosition     : integer := 1;
    signal charPositionS    : integer := 1;
    signal bitPosition      : integer := 0;
begin
charPosition <= (grid.x - location.x)/FONT_WIDTH + 1;
bitPosition  <= (grid.x - location.x) mod FONT_WIDTH;
charCode     <= character'pos(displayText(charPosition)) when (charPosition > 0 and charPosition < displayText'LENGTH);
fontAddress  <= charCode*16+(grid.y - location.y);
FontRomInst: FontRom
port map(
    clk     => clk,
    addr    => fontAddress,
    fontRow => charBitInRow);
pixelOn: process(clk)
    variable inXRange: boolean := false;
    variable inYRange: boolean := false;
begin
    if rising_edge(clk) then
        inXRange := false;
        inYRange := false;
        pixel   <= '0';
        if grid.x >= location.x and grid.x < location.x + (FONT_WIDTH * displayText'length) then
            inXRange := true;
        end if;
        if grid.y >= location.y and grid.y < location.y + FONT_HEIGHT then
            inYRange := true;
        end if;
        if inXRange and inYRange then
            if charBitInRow((FONT_WIDTH-1)-bitPosition) = '1' then
                pixel <= '1';
            end if;                    
        end if;
    end if;
end process;
end Behavioral;
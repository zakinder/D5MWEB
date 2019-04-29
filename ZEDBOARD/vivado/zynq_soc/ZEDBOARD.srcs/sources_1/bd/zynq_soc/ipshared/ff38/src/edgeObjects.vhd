--04282019 [04-28-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.fixed_pkg.all;
use work.float_pkg.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity edgeObjects is
generic (
    i_data_width   : integer := 8);
port (
    clk            : in std_logic;
    rst_l          : in std_logic;
    iRgb           : in channel;
    bRgb           : in channel;
    sRgb           : in channel;
    edgeValid      : in std_logic;
    sValid         : in std_logic;
    oRgbRemix      : out channel);
end entity;
architecture arch of edgeObjects is
signal rMax             : std_logic_vector(i_data_width-1 downto 0);
signal rMin             : std_logic_vector(i_data_width-1 downto 0);
signal gMax             : std_logic_vector(i_data_width-1 downto 0);
signal gMin             : std_logic_vector(i_data_width-1 downto 0);
signal bMax             : std_logic_vector(i_data_width-1 downto 0);
signal bMin             : std_logic_vector(i_data_width-1 downto 0);
signal dGrid            : std_logic;
signal rgb1Int          : intChannel;
signal rgb2Int          : intChannel;
signal rgb3Int          : intChannel;
signal rgb4Int          : intChannel;
signal rgb1b            : channel;
signal rgb2b            : channel;
signal rgb3b            : channel;
signal rgb4b            : channel;
signal rgb1s            : channel;
signal rgb2s            : channel;
begin
piplRgbSharpP : process (clk) begin
    if rising_edge(clk) then
      rgb1s          <= sRgb;
      rgb2s          <= rgb1s;
    end if;
end process piplRgbSharpP;
piplRgbBlurP : process (clk) begin
    if rising_edge(clk) then
      rgb1b          <= bRgb;
      rgb2b          <= rgb1b;
      rgb3b          <= rgb2b;
      rgb4b          <= rgb3b;
    end if;
end process piplRgbBlurP;
piplRgbBlurXP : process (clk) begin
    if rising_edge(clk) then
      rgb1Int.red    <= to_integer(unsigned(bRgb.red));
      rgb1Int.green  <= to_integer(unsigned(bRgb.green));
      rgb1Int.blue   <= to_integer(unsigned(bRgb.blue));
      rgb1Int.valid  <= bRgb.valid;
      rgb2Int        <= rgb1Int;
      rgb3Int        <= rgb2Int;
      rgb4Int        <= rgb3Int;
    end if;
end process piplRgbBlurXP;
oRgbRemix.valid <= sValid;
------------------------------------------------------------------------------------------------
rgbRemix : process (clk) begin
    if rising_edge(clk) then
    if rst_l = '0' then
        oRgbRemix.red   <= (others => '0');
        oRgbRemix.green <= (others => '0');
        oRgbRemix.blue  <= (others => '0');
        rMax            <= (others => '0');
        rMin            <= (others => '1');
        gMax            <= (others => '0');
        gMin            <= (others => '1');
        bMax            <= (others => '0');
        bMin            <= (others => '1');
        dGrid           <= lo;
    else
        if (edgeValid = hi) then
            oRgbRemix.red   <= black;
            oRgbRemix.green <= black;
            oRgbRemix.blue  <= black;
        else
        if((rgb2Int.red > 40 and rgb2Int.red < 150) and (rgb2Int.green > 40 and rgb2Int.green < 150) and (rgb2Int.blue > 40 and rgb2Int.blue< 150)) then
        --if(rgb2Int.red < 72 and rgb2Int.green < 100) and (rgb2Int.green < rgb2Int.blue) then -- blue is red and vice versa
            if(rgb2Int.green < rgb2Int.blue) then -- blue is red and vice versa
                    ---------------------------------------
                    oRgbRemix.red   <= rgb2b.red;
                    oRgbRemix.green <= rgb2b.green;
                    oRgbRemix.blue  <= rgb2b.blue;
                    ---------------------------------------
                    dGrid      <= hi;
                    if(rgb2b.red > rMax) then
                        rMax   <= rgb2b.red;
                    end if;
                    if(rgb2b.red < rMin) then
                        rMin   <= rgb2b.red;
                    end if;
                    if(rgb2b.green > gMax) then
                        gMax   <= rgb2b.green;
                    end if;
                    if(rgb2b.green < gMin) then
                        gMin   <= rgb2b.green;
                    end if;
                    if(rgb2b.red > bMax) then
                        bMax   <= rgb2b.red;
                    end if;
                    if(rgb2b.blue < bMin) then
                        bMin   <= rgb2b.blue;
                    end if;
                    ---------------------------------------
                else
                    oRgbRemix.red   <= black;
                    oRgbRemix.green <= black;
                    oRgbRemix.blue  <= black;
                    dGrid           <= lo;
                end if;
        end if;
        end if;
    end if;
    end if;
end process rgbRemix;
------------------------------------------------------------------------------------------------
end architecture;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity SegmentColors is
port (
    clk            : in  std_logic;
    reset          : in  std_logic;
    lumThreshold   : in  std_logic_vector(7 downto 0);
    iRgb           : in channel;
    oRgb           : out channel);
end SegmentColors;
architecture behavioral of SegmentColors is
    signal rgbLgt     : channel;
    signal rgbDrk     : channel;
    signal rgbLum     : channel;
begin
rgbLgtInst: LumValues
generic map(
    F_LGT              => true,
    F_DRK              => false,
    F_LUM              => false,
    i_data_width       => i_data_width)
port map(   
    clk                => clk,
    reset              => reset,
    iRgb               => iRgb,
    oRgb               => rgbLgt);
rgbDrkInst: LumValues
generic map(
    F_LGT              => false,
    F_DRK              => true,
    F_LUM              => false,
    i_data_width       => i_data_width)
port map(   
    clk                => clk,
    reset              => reset,
    iRgb               => iRgb,
    oRgb               => rgbDrk);
rgbLumInst: LumValues
generic map(
    F_LGT              => false,
    F_DRK              => false,
    F_LUM              => true,
    i_data_width       => i_data_width)
port map(   
    clk                => clk,
    reset              => reset,
    iRgb               => iRgb,
    oRgb               => rgbLum);
process (clk) begin
    if rising_edge(clk) then
        if (rgbLum.red > lumThreshold) and (rgbLum.green > lumThreshold) and (rgbLum.blue > lumThreshold)  then
            oRgb       <= rgbLgt;
        else
            oRgb       <= rgbDrk;
        end if;
    end if;
end process;
end behavioral;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity FrameMask is
generic (
    eBlack         : boolean := false);
port (
    clk            : in std_logic;
    reset          : in  std_logic;
    iEdgeValid     : in std_logic;
    i1Rgb          : in channel;
    i2Rgb          : in channel;
    oRgb           : out channel);
end FrameMask;
architecture behavioral of FrameMask is
    signal d1Rgb     : channel;
begin
SyncFrames32Inst: SyncFrames
generic map(
    pixelDelay => 31) --LATENCY 32
port map(
    clk        => clk,
    reset      => reset,
    iRgb       => i2Rgb,
    oRgb       => d1Rgb);
EBLACK_ENABLED: if (eBlack = true) generate
    process (clk) begin
        if rising_edge(clk) then
            if (iEdgeValid = hi) then
                oRgb.red   <= black;
                oRgb.green <= black;
                oRgb.blue  <= black;
            else
                oRgb.red   <= d1Rgb.red;
                oRgb.green <= d1Rgb.green;
                oRgb.blue  <= d1Rgb.blue;
            end if;
                oRgb.valid <= i1Rgb.valid;
        end if;
    end process;
end generate EBLACK_ENABLED;
EBLACK_DISABLED: if (eBlack = false) generate
    process (clk) begin
        if rising_edge(clk) then
            if (iEdgeValid = hi) then
                oRgb.red   <= i1Rgb.red;
                oRgb.green <= i1Rgb.green;
                oRgb.blue  <= i1Rgb.blue;
            else
                oRgb.red   <= d1Rgb.red;
                oRgb.green <= d1Rgb.green;
                oRgb.blue  <= d1Rgb.blue;
            end if;
                oRgb.valid <= i1Rgb.valid;
        end if;
    end process;
end generate EBLACK_DISABLED;
end behavioral;
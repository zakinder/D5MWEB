library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity SyncFrames is
generic (
    pixelDelay     : integer := 8);
port (
    clk            : in  std_logic;
    reset          : in  std_logic;
    iRgb           : in channel;
    oRgb           : out channel);
end SyncFrames;
architecture behavioral of SyncFrames is
    signal rgbDelays      : rgbArray(0 to 31);
begin
oRgb <= rgbDelays(pixelDelay).rgb;
process (clk) begin
    if rising_edge(clk) then
        rgbDelays(0).rgb      <= iRgb;
        rgbDelays(1)          <= rgbDelays(0);
        rgbDelays(2)          <= rgbDelays(1); 
        rgbDelays(3)          <= rgbDelays(2); 
        rgbDelays(4)          <= rgbDelays(3); 
        rgbDelays(5)          <= rgbDelays(4); 
        rgbDelays(6)          <= rgbDelays(5); 
        rgbDelays(7)          <= rgbDelays(6); 
        rgbDelays(8)          <= rgbDelays(7); 
        rgbDelays(9)          <= rgbDelays(8); 
        rgbDelays(10)         <= rgbDelays(9); 
        rgbDelays(11)         <= rgbDelays(10);
        rgbDelays(12)         <= rgbDelays(11);
        rgbDelays(13)         <= rgbDelays(12);
        rgbDelays(14)         <= rgbDelays(13);
        rgbDelays(15)         <= rgbDelays(14);
        rgbDelays(16)         <= rgbDelays(15);
        rgbDelays(17)         <= rgbDelays(16);
        rgbDelays(18)         <= rgbDelays(17);
        rgbDelays(19)         <= rgbDelays(18);
        rgbDelays(20)         <= rgbDelays(19);
        rgbDelays(21)         <= rgbDelays(20);
        rgbDelays(22)         <= rgbDelays(21);
        rgbDelays(23)         <= rgbDelays(22);
        rgbDelays(24)         <= rgbDelays(23);
        rgbDelays(25)         <= rgbDelays(24);
        rgbDelays(26)         <= rgbDelays(25);
        rgbDelays(27)         <= rgbDelays(26);
        rgbDelays(28)         <= rgbDelays(27);
        rgbDelays(29)         <= rgbDelays(28);
        rgbDelays(30)         <= rgbDelays(29);
        rgbDelays(31)         <= rgbDelays(30);
    end if;
end process;
end behavioral;
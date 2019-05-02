library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity raw2rgb is
port (
    clk            : in std_logic;
    rst_l          : in std_logic;
    iTpData        : in rTp;
    oRgbSet        : out rRgb);
end entity;
architecture arch of raw2rgb is
    signal rgb           : rawRgb;
    signal tpd1          : uTp;
    signal tpd2          : uTp;
    signal r1Valid       : std_logic :='0';
    signal r2Valid       : std_logic :='0';
    signal d1TpData      : rTp;
    signal d2TpData      : rTp;
begin
validSyncP: process(clk) begin
    if rising_edge(clk) then
        r1Valid       <= iTpData.valid;
        r2Valid       <= r1Valid;
        oRgbSet.valid <= r2Valid;
        d1TpData      <= iTpData;
        d2TpData      <= d1TpData;
        oRgbSet.pEof  <= d2TpData.pEof;
        oRgbSet.pSof  <= d2TpData.pSof;
        oRgbSet.cord  <= d2TpData.cord;
    end if;
end process validSyncP;
syncDataP: process (clk) begin
    if rising_edge(clk) then
        if rst_l = '0' then
            tpd1.tp3  <=(others => '0');
            tpd2.tp3  <=(others => '0');
            tpd1.tp2  <=(others => '0');
            tpd2.tp2  <=(others => '0');
            tpd1.tp1  <=(others => '0');
            tpd2.tp1  <=(others => '0');
            else
            tpd1.tp1  <=unsigned(iTpData.taps.tp1);
            tpd1.tp2  <=unsigned(iTpData.taps.tp2);
            tpd1.tp3  <=unsigned(iTpData.taps.tp3);
            tpd2.tp1  <=tpd1.tp1;
            tpd2.tp2  <=tpd1.tp2;
            tpd2.tp3  <=tpd1.tp3;
            end if;
        end if;
end process syncDataP;
rawToRgbP: process (clk)
    variable loc_addr : std_logic_vector(1 downto 0);
    begin
        if rising_edge(clk) then
        if rst_l = '0' then
            rgb.red   <=(others => '0');
            rgb.green <=(others => '0');
            rgb.blue  <=(others => '0'); 
        else
        loc_addr := iTpData.cord.y(0) & iTpData.cord.x(0);
        case loc_addr IS
            when b"11" => 
                if (iTpData.cord.y(11 downto 0) = x"001") then
                    rgb.red   <= tpd1.tp2;
                    rgb.green <= '0' & (tpd1.tp3 + unsigned(iTpData.taps.tp2));
                    rgb.blue  <= unsigned(iTpData.taps.tp3);
                else          
                    rgb.red   <= tpd1.tp2;
                    rgb.green <= '0' & (unsigned(iTpData.taps.tp2) + tpd1.tp1);
                    rgb.blue  <= unsigned(iTpData.taps.tp1);
                end if;
            when b"10" => 
                if (iTpData.cord.y(11 downto 0) = x"001") then
                    if (iTpData.cord.x(11 downto 0) = x"000") then
                        rgb.red    <= tpd2.tp3;
                        rgb.green  <= tpd2.tp2 & '0';
                        rgb.blue   <= tpd1.tp2;
                    else
                        rgb.red    <= unsigned(iTpData.taps.tp2);
                        rgb.green  <= '0' & (tpd1.tp2 + unsigned(iTpData.taps.tp3));
                        rgb.blue   <= tpd1.tp3;    
                    end if;
                else
                    if (iTpData.cord.x(11 downto 0) = x"000") then
                        rgb.red    <= tpd2.tp1;
                        rgb.green  <= tpd1.tp1 & '0';
                        rgb.blue   <= tpd1.tp2;
                    else
                        rgb.red    <= unsigned(iTpData.taps.tp2);
                        rgb.green  <= '0' & (tpd1.tp2 + unsigned(iTpData.taps.tp1));
                        rgb.blue   <= tpd1.tp1;    
                    end if;
                end if;
            when b"01" => 
                rgb.red      <= tpd1.tp1;
                rgb.green    <= '0' & (unsigned(iTpData.taps.tp1) + tpd1.tp2);
                rgb.blue     <= unsigned(iTpData.taps.tp2);    
            when b"00" => 
                if (iTpData.cord.x(11 downto 0) = x"000") then
                    rgb.red     <= tpd2.tp2;
                    rgb.green   <= tpd2.tp1 & '0';
                    rgb.blue    <= tpd1.tp1;
                else
                    rgb.red     <= unsigned(iTpData.taps.tp1);
                    rgb.green   <= '0' & (tpd1.tp1 + unsigned(iTpData.taps.tp2));
                    rgb.blue    <= tpd1.tp2;    
                end if;
            when others => 
                rgb.red     <= rgb.red;
                rgb.green   <= rgb.green;
                rgb.blue    <= rgb.blue;
        end case;
        end if;
        end if; 
end process rawToRgbP;
    oRgbSet.red    <= std_logic_vector(rgb.red(11 downto 4));
    oRgbSet.green  <= std_logic_vector(rgb.green(12 downto 5));
    oRgbSet.blue   <= std_logic_vector(rgb.blue(11 downto 4));
end architecture;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity RawToRgb is
port (
    clk            : in std_logic;
    rstLow         : in std_logic;
    iTp1           : in unsigned(15 downto 0);
    iTp2           : in unsigned(15 downto 0);
    iTp3           : in unsigned(15 downto 0);
    iX             : in std_logic_vector(15 downto 0);
    iY             : in std_logic_vector(15 downto 0);
    oRed           : out std_logic_vector(7 downto 0);
    oGreen         : out std_logic_vector(7 downto 0);
    oBlue          : out std_logic_vector(7 downto 0));
end entity;
architecture rtl of RawToRgb is
	type uTp is record
		tp1              : unsigned(11 downto 0);
		tp2              : unsigned(11 downto 0);
		tp3              : unsigned(11 downto 0);
	end record;
    signal tpd1          : uTp;
    signal tpd2          : uTp;
    signal uRed          : unsigned(11 downto 0);
    signal uGreen        : unsigned(12 downto 0);
    signal uBlue         : unsigned(11 downto 0);
begin

syncDataP: process (clk) begin
    if rising_edge(clk) then
        if (rstLow = '0') then
				tpd1.tp3  <=(others => '0');
				tpd2.tp3  <=(others => '0');
				tpd1.tp2  <=(others => '0');
				tpd2.tp2  <=(others => '0');
				tpd1.tp1  <=(others => '0');
				tpd2.tp1  <=(others => '0');
            else
				tpd1.tp1  <= iTp1(11 downto 0);
				tpd1.tp2  <= iTp2(11 downto 0);
				tpd1.tp3  <= iTp3(11 downto 0);
				tpd2.tp1  <= tpd1.tp1;
				tpd2.tp2  <= tpd1.tp2;
				tpd2.tp3  <= tpd1.tp3;
            end if;
        end if;
end process syncDataP;
rawToRgbP: process (clk)
    variable loc_addr : std_logic_vector(1 downto 0);
    begin
        if rising_edge(clk) then
        if (rstLow = '0') then
            uRed   <=(others => '0');
            uGreen <=(others => '0');
            uBlue  <=(others => '0'); 
        else
        loc_addr := iY(0) & iX(0);
        case loc_addr IS
            when b"11" => 
                if (iY(11 downto 0) = x"001") then
                    uRed   <= tpd1.tp2;
                    uGreen <= '0' & (tpd1.tp3 + iTp2(11 downto 0));
                    uBlue  <= iTp3(11 downto 0);
                else          
                    uRed   <= tpd1.tp2;
                    uGreen <= '0' & (iTp2(11 downto 0) + tpd1.tp1);
                    uBlue  <= iTp1(11 downto 0);
                end if;
            when b"10" => 
                if (iY(11 downto 0) = x"001") then
                    if (iX(11 downto 0) = x"000") then
                        uRed    <= tpd2.tp3;
                        uGreen  <= tpd2.tp2 & '0';
                        uBlue   <= tpd1.tp2;
                    else
                        uRed    <= iTp2(11 downto 0);
                        uGreen  <= '0' & (tpd1.tp2 + iTp3(11 downto 0));
                        uBlue   <= tpd1.tp3;    
                    end if;
                else
                    if (iX(11 downto 0) = x"000") then
                        uRed    <= tpd2.tp1;
                        uGreen  <= tpd1.tp1 & '0';
                        uBlue   <= tpd1.tp2;
                    else
                        uRed    <= iTp2(11 downto 0);
                        uGreen  <= '0' & (tpd1.tp2 + iTp1(11 downto 0));
                        uBlue   <= tpd1.tp1;    
                    end if;
                end if;
            when b"01" => 
                uRed      <= tpd1.tp1;
                uGreen    <= '0' & (iTp1(11 downto 0) + tpd1.tp2);
                uBlue     <= iTp2(11 downto 0);    
            when b"00" => 
                if (iX(11 downto 0) = x"000") then
                    uRed     <= tpd2.tp2;
                    uGreen   <= tpd2.tp1 & '0';
                    uBlue    <= tpd1.tp1;
                else
                    uRed     <= iTp1(11 downto 0);
                    uGreen   <= '0' & (tpd1.tp1 + iTp2(11 downto 0));
                    uBlue    <= tpd1.tp2;    
                end if;
            when others => 
                uRed     <= uRed;
                uGreen   <= uGreen;
                uBlue    <= uBlue;
        end case;
        end if;
        end if; 
end process rawToRgbP;
    oRed    <= std_logic_vector(uRed(11 downto 4));
    oGreen  <= std_logic_vector(uGreen(12 downto 5));
    oBlue   <= std_logic_vector(uBlue(11 downto 4));
end rtl;
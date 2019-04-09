library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.portspackage.all;
entity raw2rgb is
generic (
    rgbo_width     : integer := 8;
    cont_width     : integer := 16;
    p_data_width   : integer := 11);
port (
    clk            : in std_logic;
    rst_l          : in std_logic;
    iValid         : in std_logic;
    i_tap0         : in std_logic_vector(p_data_width downto 0);
    i_tap1         : in std_logic_vector(p_data_width downto 0);
    i_tap2         : in std_logic_vector(p_data_width downto 0);
    rxCord         : in coord;
    oRgb           : out channel);
end entity;
architecture arch of raw2rgb is
    signal rred          : unsigned(11 downto 0);
    signal rgreen        : unsigned(12 downto 0);
    signal rblue         : unsigned(11 downto 0);
    signal tap2_d1       : unsigned(p_data_width downto 0);
    signal tap1_d1       : unsigned(p_data_width downto 0);
    signal tap0_d1       : unsigned(p_data_width downto 0);
    signal tap2_d2       : unsigned(p_data_width downto 0);
    signal tap1_d2       : unsigned(p_data_width downto 0);
    signal tap0_d2       : unsigned(p_data_width downto 0);
begin
    process (clk)begin
        if rising_edge(clk) then
            if rst_l = '0' then
                    tap2_d1  <=(others => '0');
                    tap2_d2  <=(others => '0');
                    tap1_d1  <=(others => '0');
                    tap1_d2  <=(others => '0');
                    tap0_d1  <=(others => '0');
                    tap0_d2  <=(others => '0');
            else
                    tap2_d1  <=unsigned(i_tap2);
                    tap2_d2  <=tap2_d1;
                    tap1_d1  <=unsigned(i_tap1);
                    tap1_d2  <=tap1_d1;
                    tap0_d1  <=unsigned(i_tap0);
                    tap0_d2  <=tap0_d1;  
            end if;
        end if;
    end process;
    process (clk)
    variable loc_addr : std_logic_vector(1 downto 0);
    begin
        if rising_edge(clk) then
        if rst_l = '0' then
            rred   <=(others => '0');
            rgreen <=(others => '0');
            rblue  <=(others => '0'); 
        else
        loc_addr := rxCord.y(0) & rxCord.x(0);
        case loc_addr IS
            when b"11" => 
                if (rxCord.y(11 downto 0) = x"001" ) then
                    rred   <= tap1_d1;
                    rgreen <= '0' & (tap2_d1 + unsigned(i_tap1));
                    rblue  <= unsigned(i_tap2);
                else          
                    rred   <= tap1_d1;
                    rgreen <= '0' & (unsigned(i_tap1) + tap0_d1);
                    rblue  <= unsigned(i_tap0);
                end if;
            when b"10" => 
                if (rxCord.y(11 downto 0) = x"001" ) then
                    if (rxCord.x(11 downto 0) = x"000" ) then
                        rred    <= tap2_d2;
                        rgreen  <= tap1_d2 & '0';
                        rblue   <= tap1_d1;
                    else
                        rred    <= unsigned(i_tap1);
                        rgreen  <= '0' & (tap1_d1 + unsigned(i_tap2));
                        rblue   <= tap2_d1;    
                    end if;
                else
                    if (rxCord.x(11 downto 0) = x"000" ) then
                        rred    <= tap0_d2;
                        rgreen  <= tap0_d1 & '0';
                        rblue   <= tap1_d1;
                    else
                        rred    <= unsigned(i_tap1);
                        rgreen  <= '0' & (tap1_d1 + unsigned(i_tap0));
                        rblue   <= tap0_d1;    
                    end if;
                end if;
            when b"01" => 
                rred      <= tap0_d1;
                rgreen    <= '0' & (unsigned(i_tap0) + tap1_d1);
                rblue     <= unsigned(i_tap1);    
            when b"00" => 
                if (rxCord.x(11 downto 0) = x"000" ) then
                    rred     <= tap1_d2;
                    rgreen   <= tap0_d2 & '0';
                    rblue    <= tap0_d1;
                else
                    rred     <= unsigned(i_tap0);
                    rgreen   <= '0' & (tap0_d1 + unsigned(i_tap1));
                    rblue    <= tap1_d1;    
                end if;
            when others => 
                rred     <= rred;
                rgreen   <= rgreen;
                rblue    <= rblue;
        end case;
        end if;
        end if; 
    end process;
    oRgb.red    <= std_logic_vector(rred(11 downto 4));
    oRgb.green  <= std_logic_vector(rgreen(12 downto 5));
    oRgb.blue   <= std_logic_vector(rblue(11 downto 4));
    oRgb.valid  <= iValid;    
end architecture;
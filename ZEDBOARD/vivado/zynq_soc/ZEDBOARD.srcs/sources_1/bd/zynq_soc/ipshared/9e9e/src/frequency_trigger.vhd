library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;
entity frequency_trigger is
    port(
        clk_in              : in std_logic;
        sw0                 : in std_logic;
        div_factor_freqhigh : in std_logic_vector(31 downto 0);
        div_factor_freqlow  : in std_logic_vector(31 downto 0);
        freq_trig           : out std_logic                     
        );
end entity;
architecture rtl of frequency_trigger is
    signal freq_cnt_s : integer := 0; 
begin
    freq_ce_p : process
    begin
        wait until rising_edge(clk_in);
        freq_trig <= '0';             
        freq_cnt_s <= freq_cnt_s + 1; 
        if (sw0 = '0') then
            if (freq_cnt_s >= div_factor_freqlow - 1) then
                freq_trig <= '1';
                freq_cnt_s <= 0; 
            end if;
        else
            if (freq_cnt_s >= div_factor_freqhigh - 1) then
                freq_trig <= '1';
                freq_cnt_s <= 0; 
            end if;
        end if;
    end process;
end;
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;
entity pwm is
    generic(
        width_g : integer range 1 to 99 := 12 
        );
    port(
        clk_in              : in std_logic;                       
        sw0                 : in std_logic;                       
        sine_ampl           : in std_logic_vector(width_g-1 downto 0); 
        div_factor_freqhigh : in std_logic_vector(31 downto 0);   
        div_factor_freqlow  : in std_logic_vector(31 downto 0);   
        pwm_out             : out std_logic                       
        );
end entity;
architecture rtl of pwm is
    type state_t is (load_new_ampl, pwm_high, pwm_low);   
    signal state: state_t ;
    signal ce_s : std_logic := '0';                       
begin
    process1_p : process (clk_in)
        variable threshold_v : integer range 0 to ((2**width_g)-1) := 0;
        variable count_v     : integer range 0 to ((2**width_g)-1) := 0;
    begin
        if (clk_in = '1' and clk_in'event) then
            if (ce_s = '1') then
                case state is
                    when load_new_ampl => 
                        threshold_v := conv_integer (sine_ampl);
                        count_v := 0;             
                        if (sine_ampl > 0) then
                            state <= pwm_high;  
                        elsif (sine_ampl = 0) then
                            state <= pwm_low;
                        end if;
                    when pwm_high =>
                        count_v := count_v + 1;   
                        if (count_v < ((2**width_g)-1) and count_v < threshold_v) then 
                            state <= pwm_high;
                        elsif (count_v = ((2**width_g)-1)) then
                            state <= load_new_ampl;          
                        elsif (count_v < ((2**width_g)-1) and count_v = threshold_v) then
                            state <= pwm_low;
                        end if;
                    when pwm_low =>
                        count_v := count_v + 1;   
                        if (count_v < ((2**width_g)-1)) then
                            state <= pwm_low;
                        elsif (count_v = ((2**width_g)-1)) then 
                            state <= load_new_ampl;
                        end if;
                end case;
            end if;
        end if;
    end process process1_p;
    process2_p : process (state)
    begin
        case state is
            when load_new_ampl => 
            pwm_out <= '0';
            when pwm_high  => 
            pwm_out <= '1';
            when pwm_low       => 
            pwm_out <= '0';
        end case;
    end process process2_p;
    fsm_ce: entity work.frequency_trigger(rtl)   
        port map (
            clk_in              => clk_in,
            sw0                 => sw0,
            div_factor_freqhigh => div_factor_freqhigh,
            div_factor_freqlow  => div_factor_freqlow,
            freq_trig           => ce_s
        );
end;
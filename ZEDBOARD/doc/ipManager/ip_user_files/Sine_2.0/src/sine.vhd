library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;
    use work.modulator_pkg.all;
entity sine is
    generic(
        depth_g : integer range 1 to 99 := 8; 
        width_g : integer range 1 to 99 := 12 
        );
    port(
        clk_in   : in std_logic;                            
        ampl_cnt : in std_logic_vector(depth_g-1 downto 0); 
        sine_outo : out std_logic_vector(width_g-1 downto 0); 
        sine_out : out std_logic_vector(width_g-1 downto 0) 
    );
end entity;
architecture rtl of sine is
    constant sin_ampl_c : vector_t_arr := init_sin_f(depth_g, width_g);    
    signal ampl_cnt_s : integer range 0 to 255 := 0;                       
    signal sine_s : std_logic_vector(width_g-1 downto 0) := (others=>'0'); 
begin
    sine_p : process
    begin
        wait until rising_edge(clk_in);
        ampl_cnt_s <= conv_integer(ampl_cnt);
        sine_s <= conv_std_logic_vector(sin_ampl_c(ampl_cnt_s), width_g); 
    end process;
    sine_out <= sine_s;
    sine_outo <=sine_s;
end;
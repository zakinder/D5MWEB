library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;
entity counter is
    generic(
        cnt_value_g : integer; 
        depth_g     : integer  
        );
    port(
        clk_in  : in std_logic;                               
        cnt_en  : in std_logic;                               
        cnt_out : out std_logic_vector (depth_g - 1 downto 0) 
        );
end entity;
architecture rtl of counter is
    signal cnt_out_s : std_logic_vector (depth_g - 1 downto 0) := (others => '0'); 
begin
     counter_p: process
     begin
        wait until rising_edge(clk_in);
            if (cnt_en = '1') then
                if (cnt_out_s = conv_std_logic_vector (cnt_value_g, depth_g)) then
                    cnt_out_s <= (others => '0'); 
                else
                    cnt_out_s <= cnt_out_s + 1;   
                end if;
            end if;
    end process;
    cnt_out <= cnt_out_s;
end;
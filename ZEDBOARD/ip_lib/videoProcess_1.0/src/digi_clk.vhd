library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity digi_clk is
    port (
    clk1    : in std_logic;
    seconds : out std_logic_vector(5 downto 0);
    minutes : out std_logic_vector(5 downto 0);
    hours   : out std_logic_vector(4 downto 0));
end digi_clk;
architecture Behavioral of digi_clk is
signal sec,min,hour : integer range 0 to 60 :=0;
signal count : integer   :=1;
signal clk   : std_logic :='0';
begin
    seconds <= conv_std_logic_vector(sec,6);
    minutes <= conv_std_logic_vector(min,6);
    hours   <= conv_std_logic_vector(hour,5);
process(clk1)begin
    if(clk1'event and clk1='1') then
        count <=count+1;
        if(count = 37500000) then
            clk     <= not clk;
            count   <=1;
        end if;
    end if;
end process;
process(clk)begin
    if(clk'event and clk='1') then
        sec <= sec+ 1;
        if(sec = 59) then
            sec<=0;
            min <= min + 1;
            if(min = 59) then
                hour <= hour + 1;
                min <= 0;
                if(hour = 23) then
                    hour <= 0;
                end if;
            end if;
        end if;
    end if;
end process;
end Behavioral;
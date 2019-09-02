library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
use work.tbPackage.all;
entity ReadCoeffFile is
generic (
    s_data_width  : integer := 16;
    input_file    : string  := "input_image");
port (
    clk             : in std_logic;
    reset           : in std_logic;
    kSet1Out        : out  kernelCoeff);
end ReadCoeffFile;
architecture Behavioral of ReadCoeffFile is
signal Coeffs       : coeffIntegerData;
constant projFold   : string := "Z:/sim/readFiles";
constant backSlash  : string := "/";
file test_vector    : text open read_mode is projFold&backSlash&input_file&".txt";
constant NUM_COL                : integer := 10;
type t_integer_array		    is array(integer range <> )  of integer;
begin
p_read : process(reset,clk)
variable row                    : line;
variable v_data_read            : t_integer_array(1 to NUM_COL);
variable v_data_row_counter     : integer := 0;
begin
    if(reset='0') then
        v_data_row_counter     := 0;
        v_data_read            := (others=> 0);
    elsif(rising_edge(clk)) then
    if(v_data_read(10) = 0) then
        if(not endfile(test_vector)) then
            v_data_row_counter := v_data_row_counter + 1;
            readline(test_vector,row);
        end if;
        for kk in 1 to NUM_COL loop
            read(row,v_data_read(kk));
        end loop;
    end if;
        kSet1Out.k1    <= std_logic_vector(to_signed((v_data_read(1)),16));
        kSet1Out.k2    <= std_logic_vector(to_signed((v_data_read(2)),16));
        kSet1Out.k3    <= std_logic_vector(to_signed((v_data_read(3)),16));
        kSet1Out.k4    <= std_logic_vector(to_signed((v_data_read(4)),16));
        kSet1Out.k5    <= std_logic_vector(to_signed((v_data_read(5)),16));
        kSet1Out.k6    <= std_logic_vector(to_signed((v_data_read(6)),16));
        kSet1Out.k7    <= std_logic_vector(to_signed((v_data_read(7)),16));
        kSet1Out.k8    <= std_logic_vector(to_signed((v_data_read(8)),16));
        kSet1Out.k9    <= std_logic_vector(to_signed((v_data_read(9)),16));
        kSet1Out.kSet  <= (v_data_read(10));
    end if;
end process p_read;
end Behavioral;
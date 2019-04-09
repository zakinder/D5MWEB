library ieee;
use ieee.math_real.all;
use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;
-- VHDL package is a way of grouping related declarations that serve a common purpose
-- Each VHDL package contains package declaration and package body
-- Package declaration:
package modulator_pkg is
    type module_is_top_t is (yes, no); -- only the top module can instantiate a diff clk buffer
    type board_type_t    is (lx9, zedboard, ml605, kc705, microzed, socius);
    type has_diff_clk_t  is (yes, no);
    type board_setting_t_rec is record
        board_name   : board_type_t;   -- specifies the name of the board that we are using
        fclk         : real;           -- specifies the reference clock frequency that is presented 
                                       -- on the board (in Hz)
        has_diff_clk : has_diff_clk_t; -- specifies if board has differential clock or not
    end record board_setting_t_rec;
    -- place the information about the new boards here:
    constant lx9_c      : board_setting_t_rec := (lx9, 100000000.0, no);      -- Spartan-6
    constant zedboard_c : board_setting_t_rec := (zedboard, 100000000.0, no); -- Zynq-7000
    constant ml605_c    : board_setting_t_rec := (ml605, 200000000.0, yes);   -- Virtex-6
    constant kc705_c    : board_setting_t_rec := (kc705, 200000000.0, yes);   -- Kintex-7
    constant microzed_c : board_setting_t_rec := (microzed, 33333333.3, no);  -- MicroZed
    constant socius_c   : board_setting_t_rec := (socius, 50000000.0, no);    -- Socius
    -- array holding information about supported boards 
    type board_info_t_arr is array (1 to 6) of board_setting_t_rec;
    constant board_info_c: board_info_t_arr := (lx9_c, zedboard_c, ml605_c, kc705_c, microzed_c, socius_c);
    type vector_t_arr is array (natural range <>) of integer; 
    constant per_c : time := 20 ns; -- clock period (T=1/50 MHz), that is used in almost all test benches
    type design_setting_t_rec is record
        cntampl_value : integer;       -- counter amplitude border, 
                                       -- it's value should be equal to (2^depth)-1
        f_low : real;                  -- first frequency for the PWM signal, specified in Hz
        f_high: real;                  -- second frequency for the PWM signal, specified in Hz
        depth : integer range 0 to 99; -- the number of samples in one period of the signal
        width : integer range 0 to 99; -- the number of bits used to represent amplitude value
    end record design_setting_t_rec;
    constant design_setting_c : design_setting_t_rec := (255, 1.0, 3.5, 8, 12);
    -- init_sin_f function declaration
    function init_sin_f
        (
        constant depth_c : in integer; -- number of samples in one period of the signal (2^8=256)
        constant width_c : in integer  -- number of bits used to represent amplitude value (2^12=4096)
        )
    return vector_t_arr;
    -- function that returns the information about the selected development board
    function get_board_info_f
        (
        constant board_name_c : in string
        )
    return board_setting_t_rec;
    procedure clk_gen(signal clk : out std_logic; constant freq : real);
end;
-- In the package body will be calculated sine signal
-- Package body:
package body modulator_pkg is
    -- init_sin_f function definition
    function init_sin_f
        (
        constant depth_c : in integer;
        constant width_c : in integer
        )
    return vector_t_arr is
        variable init_arr_v : vector_t_arr(0 to (2 ** depth_c - 1));
    begin
        for i in 0 to ((2 ** depth_c)- 1) loop   -- calculate amplitude values
            init_arr_v(i) := integer(round(sin((math_2_pi / real(2 ** depth_c))*real(i)) * 
                             (real(2 ** (width_c - 1)) - 1.0))) + integer(2 ** (width_c - 1) - 1); 
                          -- sin (2*pi*i / N) * (2width_c-1 - 1) + 2width_c-1 - 1, N = 2depth_c
        end loop;
        return init_arr_v;
    end;
    -- function that returns the information about the selected development board
    function get_board_info_f
        (
        constant board_name_c : in string
        )
    return board_setting_t_rec is
    begin
        for i in 1 to board_info_c'length loop
            -- if supplied board name equals some of supported boards, 
            -- return board information for that board
            if (board_type_t'image(board_info_c(i).board_name) = board_name_c(2 to board_name_c'length-1)) then
                return board_info_c(i);
            end if;
        end loop;
    end;
	procedure clk_gen(signal clk : out std_logic; constant freq : real) is
    constant period : time := 1 sec / freq;
    constant high_time : time := period / 2;
    constant low_time : time := period - high_time;
    begin
    loop
    clk <= '1';
    wait for high_time;
    clk <= '0';
    wait for low_time;
    end loop;
    end procedure;    
end;
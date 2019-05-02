--04282019 [04-28-2019]
library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
package constantspackage is
    -------------------------------------------------------------------------
    constant yes                       : std_logic := '1';
    constant no                        : std_logic := '0';
    constant hi                        : std_logic := '1';
    constant lo                        : std_logic := '0';
    constant one                       : integer   := 1;
    constant zero                      : integer   := 0;
    constant ch0                       : integer   := 0;
    constant ch1                       : integer   := 1;
    constant ch2                       : integer   := 2;
    constant ch3                       : integer   := 3;
    -------------------------------------------------------------------------
    -- videoProcess constants
    -------------------------------------------------------------------------
    constant C_S_AXI_DATA_WIDTH        : integer := 32;
    constant C_rgb_m_axis_TDATA_WIDTH  : integer := 16;
    constant C_rgb_m_axis_START_COUNT  : integer := 32;
    constant C_rgb_s_axis_TDATA_WIDTH  : integer := 16;
    constant C_m_axis_mm2s_TDATA_WIDTH : integer := 16;
    constant C_m_axis_mm2s_START_COUNT : integer := 32;
    constant C_vfpConfig_DATA_WIDTH    : integer := 32;
    constant C_vfpConfig_ADDR_WIDTH    : integer := 8;
    constant i_data_width              : integer := 8;
    constant s_data_width              : integer := 16;
    constant b_data_width              : integer := 32;
    constant i_precision               : integer := 12;
    constant i_full_range              : boolean := FALSE;
    constant conf_data_width           : integer := 32;
    constant conf_addr_width           : integer := 4;
    -------------------------------------------------------------------------
    constant blurMsb                   : integer := 11;
    constant blurLsb                   : integer := 4;
    constant rgb_msb                   : integer := 12;
    constant rgb_lsb                   : integer := 5;
    constant XYCOORD                   : integer := 16;
    -------------------------------------------------------------------------
    constant STREAM_TESTPATTERN1       : std_logic_vector(31 downto 0) := x"00000001";
    constant STREAM_TESTPATTERN2       : std_logic_vector(31 downto 0) := x"00000002";
    constant EXTERNAL_AXIS_STREAM      : std_logic_vector(31 downto 0) := x"00000000";
    -------------------------------------------------------------------------
    constant blurMacKernel_1           : unsigned(i_data_width-1 downto 0) :=x"01";
    constant blurMacKernel_2           : unsigned(i_data_width-1 downto 0) :=x"01";
    constant blurMacKernel_3           : unsigned(i_data_width-1 downto 0) :=x"01";
    constant blurMacKernel_4           : unsigned(i_data_width-1 downto 0) :=x"01";
    constant blurMacKernel_5           : unsigned(i_data_width-1 downto 0) :=x"01";
    constant blurMacKernel_6           : unsigned(i_data_width-1 downto 0) :=x"01";
    constant blurMacKernel_7           : unsigned(i_data_width-1 downto 0) :=x"01";
    constant blurMacKernel_8           : unsigned(i_data_width-1 downto 0) :=x"01";
    constant blurMacKernel_9           : unsigned(i_data_width-1 downto 0) :=x"01";
    constant white                     : std_logic_vector(7 downto 0)      :=x"FF";
    constant black                     : std_logic_vector(7 downto 0)      :=x"00";
    -------------------------------------------------------------------------
    constant C_WHOLE_WIDTH            : integer := 3;  
    constant DATA_EXT_WIDTH           : natural := i_data_width + 1;
    constant FRAC_BITS_TO_KEEP        : natural := 3;  
    constant MULT_RESULT_WIDTH        : natural := DATA_EXT_WIDTH + C_WHOLE_WIDTH + FRAC_BITS_TO_KEEP;
    constant ADD_RESULT_WIDTH         : natural := MULT_RESULT_WIDTH + 1;
    constant ROUND_RESULT_WIDTH       : natural := ADD_RESULT_WIDTH - FRAC_BITS_TO_KEEP;
    constant ROUND                    : signed(ADD_RESULT_WIDTH-1 downto 0) := to_signed(0, ADD_RESULT_WIDTH-FRAC_BITS_TO_KEEP)&'1' & to_signed(0, FRAC_BITS_TO_KEEP-1);  
    -------------------------------------------------------------------------
end package;
--01062019 [01-06-2019]
library ieee;
library work;
use ieee.std_logic_1164.all;
package constantspackage is
    -------------------------------------------------------------------------
    constant yes                    : std_logic := '1';
    constant no                     : std_logic := '0';
    constant hi                     : std_logic := '1';
    constant lo                     : std_logic := '0';
    constant one                    : integer := 1;
    constant zero                   : integer := 0;
    -------------------------------------------------------------------------
    -- videoProcess tb constants
    -------------------------------------------------------------------------
    constant pixclk_freq                      : real    := 90.00e6;
    constant aclk_freq                        : real    := 75.00e6;
    constant line_hight                       : integer := 122;
    -------------------------------------------------------------------------
    -- videoProcess constants
    -------------------------------------------------------------------------
    constant revision_number                      : std_logic_vector(31 downto 0) := x"01062019";
    constant C_rgb_m_axis_TDATA_WIDTH             : integer := 16;
    constant C_rgb_m_axis_START_COUNT             : integer := 32;
    constant C_rgb_s_axis_TDATA_WIDTH             : integer := 16;
    constant C_m_axis_mm2s_TDATA_WIDTH            : integer := 16;
    constant C_m_axis_mm2s_START_COUNT            : integer := 32;
    constant C_config_axis_DATA_WIDTH             : integer := 32;
    constant C_config_axis_ADDR_WIDTH             : integer := 7;
    constant i_data_width                         : integer := 8;
    constant s_data_width                         : integer := 16;
    constant b_data_width                         : integer := 32;
    constant i_precision                          : integer := 12;
    constant i_full_range                         : boolean := FALSE;
    constant conf_data_width                      : integer := 32;
    constant conf_addr_width                      : integer := 4;
    constant img_width                            : integer := 112;
    constant p_data_width                         : integer := 11;
    -------------------------------------------------------------------------
    constant C_S_AXI_DATA_WIDTH                   : integer := 32;
    constant rgb_msb                              : integer := 12;
    constant rgb_lsb                              : integer := 5;
    constant XYCOORD                              : integer := 16;
    -------------------------------------------------------------------------
    constant STREAM_TESTPATTERN1  : std_logic_vector(31 downto 0) := x"00000001";
    constant STREAM_TESTPATTERN2  : std_logic_vector(31 downto 0) := x"00000002";
    constant EXTERNAL_AXIS_STREAM : std_logic_vector(31 downto 0) := x"00000000";
    -------------------------------------------------------------------------
end package;
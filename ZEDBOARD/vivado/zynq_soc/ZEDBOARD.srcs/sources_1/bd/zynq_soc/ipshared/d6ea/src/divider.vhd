library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
entity divider is
  port (
    clk                 : in std_logic;
    dividend            : in std_logic_vector(15 downto 0);
    divisor             : in std_logic_vector(15 downto 0);
    quotient            : out std_logic_vector(15 downto 0);
    remainder           : out std_logic_vector(15 downto 0));
end divider;
architecture behavioral of divider is

component div_gen_0
port (
    aclk                    : IN STD_LOGIC;
    s_axis_divisor_tvalid   : in std_logic;
    s_axis_divisor_tdata    : in std_logic_vector(15 downto 0);
    s_axis_dividend_tvalid  : in std_logic;
    s_axis_dividend_tdata   : in std_logic_vector(15 downto 0);
    m_axis_dout_tvalid      : out std_logic;
    m_axis_dout_tdata       : out std_logic_vector(31 downto 0));
end component;

signal s_axis_divisor_tvalid   :  std_logic;
signal s_axis_dividend_tvalid  :  std_logic;
signal m_axis_dout_tvalid      :  std_logic;
signal m_axis_dout_tdata       :  std_logic_vector(31 downto 0) := (others => '0');  -- tdata for channel dout

begin

    s_axis_divisor_tvalid   <='1';
    s_axis_dividend_tvalid  <='1';
    remainder               <= m_axis_dout_tdata(15 downto 0);
    quotient                <= m_axis_dout_tdata(31 downto 16);
    
div_gen_d2: div_gen_0
port map(
      aclk                      => clk,
      s_axis_dividend_tvalid    => s_axis_dividend_tvalid,
      s_axis_dividend_tdata     => dividend,
      s_axis_divisor_tvalid     => s_axis_divisor_tvalid,
      s_axis_divisor_tdata      => divisor,
      m_axis_dout_tvalid        => m_axis_dout_tvalid,
      m_axis_dout_tdata         => m_axis_dout_tdata);
      
end behavioral;
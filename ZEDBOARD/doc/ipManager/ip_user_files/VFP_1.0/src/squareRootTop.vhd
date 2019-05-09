--01062019 [01-06-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.fixed_pkg.all;
use work.float_pkg.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity squareRootTop is
port (
    clk            : in std_logic;
    ivalid         : in std_logic;
    idata          : in std_logic_vector(31 downto 0);
    ovalid         : out std_logic;
    odata          : out std_logic_vector(31 downto 0));
end entity;
architecture arch of squareRootTop is
    signal idataStd         : std_logic_vector(31 downto 0) := (others => '0');
    signal odataStd         : std_logic_vector(31 downto 0) := (others => '0');
    signal odataFl          : float32;
    signal idataFl          : float32;
begin
    idataFl       <= to_float(unsigned(idata),idataFl);
    idataStd      <= to_slv(idataFl);
    odataFl       <= to_float(odataStd,odataFl);
    odata         <= std_logic_vector(to_unsigned(odataFl,32));
squareRoot_inst: squareRoot
    port map(
      aclk                    => clk,
      s_axis_a_tvalid         => ivalid,
      s_axis_a_tdata          => idataStd,
      m_axis_result_tvalid    => ovalid,
      m_axis_result_tdata     => odataStd);
end architecture;
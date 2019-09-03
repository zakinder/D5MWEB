library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity squareRootTop is
port (
    aclk           : in std_logic;
    sFXtFoTvalid   : in std_logic;
    sFXtFoTdata    : in std_logic_vector(31 downto 0);
    mFOtFxRtvalid  : out std_logic;
    mFOtFxRtdata   : out std_logic_vector(31 downto 0));
end entity;
architecture arch of squareRootTop is

component fixedToFloat is
port (                
    aclk                    : in STD_LOGIC;
    s_axis_a_tvalid         : in STD_LOGIC;
    s_axis_a_tdata          : in STD_LOGIC_VECTOR (31 downto 0 );
    m_axis_result_tvalid    : out STD_LOGIC;
    m_axis_result_tdata     : out STD_LOGIC_VECTOR (31 downto 0));
end component fixedToFloat;
component floatToFixed is
port (                
    aclk                    : in STD_LOGIC;
    s_axis_a_tvalid         : in STD_LOGIC;
    s_axis_a_tdata          : in STD_LOGIC_VECTOR (31 downto 0 );
    m_axis_result_tvalid    : out STD_LOGIC;
    m_axis_result_tdata     : out STD_LOGIC_VECTOR (31 downto 0));
end component floatToFixed;
component squareRoot is
port (                
    aclk                    : in STD_LOGIC;
    s_axis_a_tvalid         : in STD_LOGIC;
    s_axis_a_tdata          : in STD_LOGIC_VECTOR (31 downto 0 );
    m_axis_result_tvalid    : out STD_LOGIC;
    m_axis_result_tdata     : out STD_LOGIC_VECTOR (31 downto 0));
end component squareRoot;

---------------------------------------------------------------------------------
--fixedToFloat FXtFO
  --signal sFXtFoTvalid     : std_logic := '0';  -- payload is valid
  --signal sFXtFoTdata      : std_logic_vector(31 downto 0) := (others => '0');  -- data payload
  signal mFXtFoRtvalid    : std_logic := '0';
  signal mFXtFoRtdata     : std_logic_vector(31 downto 0) := (others => '0');  -- data payload
---------------------------------------------------------------------------------
--fixedToFloat FOtFX
  signal sFOSqTvalid     : std_logic := '0';  -- payload is valid
  signal sFOSqTdata      : std_logic_vector(31 downto 0) := (others => '0');  -- data payload
  signal mFOSqRtvalid    : std_logic := '0';
  signal mFOSqRtdata     : std_logic_vector(31 downto 0) := (others => '0');  -- data payload
---------------------------------------------------------------------------------

--fixedToFloat FOtFX
  signal sFOtFxTvalid     : std_logic := '0';  -- payload is valid
  signal sFOtFxTdata      : std_logic_vector(31 downto 0) := (others => '0');  -- data payload
--signal mFOtFxRtvalid    : std_logic := '0';
--signal mFOtFxRtdata     : std_logic_vector(31 downto 0) := (others => '0');  -- data payload
---------------------------------------------------------------------------------
begin

fixedToFloat_inst: fixedToFloat
    port map(
      aclk                    => aclk,
      s_axis_a_tvalid         => sFXtFoTvalid,
      s_axis_a_tdata          => sFXtFoTdata,
      m_axis_result_tvalid    => mFXtFoRtvalid,
      m_axis_result_tdata     => mFXtFoRtdata);
      
      
squareRoot_inst: squareRoot
    port map(
      aclk                    => aclk,
      s_axis_a_tvalid         => mFXtFoRtvalid,
      s_axis_a_tdata          => mFXtFoRtdata,
      m_axis_result_tvalid    => mFOSqRtvalid,
      m_axis_result_tdata     => mFOSqRtdata);     

      
floatToFixed_inst: floatToFixed
    port map(
      aclk                    => aclk,
      s_axis_a_tvalid         => mFOSqRtvalid,
      s_axis_a_tdata          => mFOSqRtdata,
      m_axis_result_tvalid    => mFOtFxRtvalid,
      m_axis_result_tdata     => mFOtFxRtdata);
      
end architecture;
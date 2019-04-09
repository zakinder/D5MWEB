--01162019 [01-16-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.portspackage.all;
entity sharpFilter is
generic (
    i_data_width  : integer := 8;
    img_width     : integer := 256;
    adwr_width    : integer := 16;
    addr_width    : integer := 11);
port (
    clk           : in std_logic;
    rst_l         : in std_logic;
    iRed          : in std_logic_vector(i_data_width-1 downto 0);
    iGreen        : in std_logic_vector(i_data_width-1 downto 0);
    iBlue         : in std_logic_vector(i_data_width-1 downto 0);
    iValid        : in std_logic;
    iaddress      : in std_logic_vector(15 downto 0); 
    kls           : in coefficient;
    endOfFrame    : in std_logic;     
    oRed          : out std_logic_vector(i_data_width-1 downto 0);
    oGreen        : out std_logic_vector(i_data_width-1 downto 0);
    oBlue         : out std_logic_vector(i_data_width-1 downto 0);
    oValid        : out std_logic);
end entity;
architecture arch of sharpFilter is
component buffer_controller is
generic (
    img_width    : integer := 4096;
    adwr_width   : integer := 15;
    p_data_width : integer := 11;
    addr_width   : integer := 11);
port (           
    aclk         : in std_logic;
    i_enable     : in std_logic;
    i_data       : in std_logic_vector(p_data_width downto 0);
    i_wadd       : in std_logic_vector(adwr_width downto 0);
    i_radd       : in std_logic_vector(adwr_width downto 0);
    en_datao     : out std_logic;
    taps0x       : out std_logic_vector(p_data_width downto 0);
    taps1x       : out std_logic_vector(p_data_width downto 0);
    taps2x       : out std_logic_vector(p_data_width downto 0));
end component buffer_controller;
component sharpMac is
port (                
    clk         : in std_logic;
    rst_l       : in std_logic;
    vTap0x      : in std_logic_vector(7 downto 0);
    vTap1x      : in std_logic_vector(7 downto 0);
    vTap2x      : in std_logic_vector(7 downto 0);
    kls           : in coefficient;  
    endOfFrame     : in std_logic;     
    DataO       : out std_logic_vector(7 downto 0));
end component sharpMac;
---------------------------------------------------------------------------------
    signal vTapRGB0x   : std_logic_vector(23 downto 0);
    signal vTapRGB1x   : std_logic_vector(23 downto 0);
    signal vTapRGB2x   : std_logic_vector(23 downto 0);
    signal v1TapRGB0x  : std_logic_vector(23 downto 0);
    signal v1TapRGB1x  : std_logic_vector(23 downto 0);
    signal v1TapRGB2x  : std_logic_vector(23 downto 0);
    signal enable      : std_logic;
    signal d1en        : std_logic;
    signal d2en        : std_logic;
    signal d3en        : std_logic;
    signal d4en        : std_logic;
    signal d1R         : std_logic_vector(i_data_width-1 downto 0);
    signal d2R         : std_logic_vector(i_data_width-1 downto 0);
    signal d1G         : std_logic_vector(i_data_width-1 downto 0);
    signal d2G         : std_logic_vector(i_data_width-1 downto 0);
    signal d1B         : std_logic_vector(i_data_width-1 downto 0);
    signal d2B         : std_logic_vector(i_data_width-1 downto 0);
    signal d2RGB       : std_logic_vector(23 downto 0);
   
    
---------------------------------------------------------------------------------
begin



RGB_inst: buffer_controller
    generic map(
    img_width       => img_width,
    adwr_width      => 15,
    p_data_width    => 23,
    addr_width      => 11)
    port map(
    aclk            => clk,
    i_enable        => iValid,
    i_data          => d2RGB,
    i_wadd          => iaddress,
    i_radd          => iaddress,
    en_datao        => enable,
    taps0x          => v1TapRGB0x,
    taps1x          => v1TapRGB1x,
    taps2x          => v1TapRGB2x);
MAC_R_inst: sharpMac
    port map(
    clk             => clk,
    rst_l           => rst_l,
    vTap0x          => vTapRGB0x(23 downto 16),
    vTap1x          => vTapRGB1x(23 downto 16),
    vTap2x          => vTapRGB2x(23 downto 16),
    endOfFrame      => endOfFrame,
    kls             => kls,
    DataO           => oRed);
MAC_G_inst: sharpMac
    port map(
    clk             => clk,
    rst_l           => rst_l,
    vTap0x          => vTapRGB0x(15 downto 8),
    vTap1x          => vTapRGB1x(15 downto 8),
    vTap2x          => vTapRGB2x(15 downto 8),
    endOfFrame      => endOfFrame,
    kls             => kls,    
    DataO           => oGreen);
MAC_B_inst: sharpMac
    port map(
    clk             => clk,
    rst_l           => rst_l,
    vTap0x          => vTapRGB0x(i_data_width-1 downto 0),
    vTap1x          => vTapRGB1x(i_data_width-1 downto 0),
    vTap2x          => vTapRGB2x(i_data_width-1 downto 0),
    endOfFrame      => endOfFrame,
    kls             => kls,   
    DataO           => oBlue);
  TAP_SIGNED : process (clk, rst_l) begin
    if rst_l = '0' then
      d1en      <= '0';
      d2en      <= '0';
      d3en      <= '0';
      d4en      <= '0';
    elsif rising_edge(clk) then
      d1R      <= iRed;  
      d2R      <= d1R;
      d1G      <= iGreen;  
      d2G      <= d1G;
      d1B      <= iBlue;  
      d2B      <= d1B;
      d2RGB    <= d1R & d1G & d1B;
      d1en     <= enable;
      d2en     <= d1en;
      oValid   <= d2en;
      d4en     <= d3en;
      if(enable = '1') then
          vTapRGB0x <=v1TapRGB0x;
          vTapRGB1x <=v1TapRGB1x;
          vTapRGB2x <=v1TapRGB2x;
      else
          vTapRGB0x <=(others => '0');
          vTapRGB1x <=(others => '0');
          vTapRGB2x <=(others => '0');
      end if;
    end if;
end process TAP_SIGNED;
end arch;
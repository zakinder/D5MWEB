--02092019 [02-09-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
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
    iRgb          : in channel;
    kls           : in coefficient;
    endOfFrame    : in std_logic;   
    oRgb          : out channel);
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
    kls         : in coefficient;  
    endOfFrame  : in std_logic;     
    DataO       : out std_logic_vector(7 downto 0));
end component sharpMac;
---------------------------------------------------------------------------------
    signal vTapRGB0x        : std_logic_vector(23 downto 0) := (others => '0');
    signal vTapRGB1x        : std_logic_vector(23 downto 0) := (others => '0');
    signal vTapRGB2x        : std_logic_vector(23 downto 0) := (others => '0');
    signal v1TapRGB0x       : std_logic_vector(23 downto 0) := (others => '0');
    signal v1TapRGB1x       : std_logic_vector(23 downto 0) := (others => '0');
    signal v1TapRGB2x       : std_logic_vector(23 downto 0) := (others => '0');
    signal enable           : std_logic;
    signal d1en             : std_logic;
    signal d2en             : std_logic;
    signal d3en             : std_logic;
    signal d4en             : std_logic;
    signal d5en             : std_logic;
    signal d6en             : std_logic;

    signal rCountAddress    : integer;
    signal rAddress         : std_logic_vector(15 downto 0);
    signal rgb1x            : channel;
    signal rgb2x            : channel;
    signal d2RGB            : std_logic_vector(23 downto 0) := (others => '0');
---------------------------------------------------------------------------------
begin
    process(clk)begin
        if rising_edge(clk) then
            if (iRgb.valid = '1') then
                rCountAddress  <= rCountAddress + 1;
            else
                rCountAddress  <= 0;
            end if;
        end if;
    end process;
    rAddress  <= std_logic_vector(to_unsigned(rCountAddress, 16));
    RGB_inst: buffer_controller
    generic map(
        img_width       => img_width,
        adwr_width      => 15,
        p_data_width    => 23,
        addr_width      => 11)
    port map(
        aclk            => clk,
        i_enable        => iRgb.valid,
        i_data          => d2RGB,
        i_wadd          => rAddress,
        i_radd          => rAddress,
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
        DataO           => oRgb.red);
    MAC_G_inst: sharpMac
    port map(
        clk             => clk,
        rst_l           => rst_l,
        vTap0x          => vTapRGB0x(15 downto 8),
        vTap1x          => vTapRGB1x(15 downto 8),
        vTap2x          => vTapRGB2x(15 downto 8),
        endOfFrame      => endOfFrame,
        kls             => kls,    
        DataO           => oRgb.green);
    MAC_B_inst: sharpMac
    port map(
        clk             => clk,
        rst_l           => rst_l,
        vTap0x          => vTapRGB0x(i_data_width-1 downto 0),
        vTap1x          => vTapRGB1x(i_data_width-1 downto 0),
        vTap2x          => vTapRGB2x(i_data_width-1 downto 0),
        endOfFrame      => endOfFrame,
        kls             => kls,   
        DataO           => oRgb.blue);
  TAP_SIGNED : process (clk) begin
    if rising_edge(clk) then
      rgb1x      <= iRgb;  
      rgb2x      <= rgb1x;
      d2RGB      <= rgb2x.red & rgb2x.green & rgb2x.blue;
      d1en       <= enable;
      d2en       <= d1en;
      d3en       <= d2en;
      d4en       <= d3en;
      d5en       <= d4en;
      oRgb.valid <= d5en;
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
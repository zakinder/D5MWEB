--02092019 [02-09-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity blurFilter is
generic (
    iMSB          : integer := 11;
    iLSB          : integer := 4;
    i_data_width  : integer := 8;
    img_width     : integer := 256;
    adwr_width    : integer := 16;
    addr_width    : integer := 11);
port (
    clk            : in std_logic;
    rst_l          : in std_logic;
    iRgb           : in channel;
    oRgb           : out channel);
end entity;
architecture arch of blurFilter is
---------------------------------------------------------------------------------
    signal vTapRGB0x        : std_logic_vector(23 downto 0);
    signal vTapRGB1x        : std_logic_vector(23 downto 0);
    signal vTapRGB2x        : std_logic_vector(23 downto 0);
    signal v1TapRGB0x       : std_logic_vector(23 downto 0);
    signal v1TapRGB1x       : std_logic_vector(23 downto 0);
    signal v1TapRGB2x       : std_logic_vector(23 downto 0);
    signal enable           : std_logic;
    signal d1en             : std_logic;
    signal d2en             : std_logic;
    signal d3RGB            : std_logic_vector(23 downto 0);
    signal rCountAddress    : integer;
    signal rAddress         : std_logic_vector(15 downto 0);
    signal rgb1x            : channel;
    signal rgb2x            : channel;
    signal rgb3x            : channel;
    signal blurRgb          : blurchannel;
---------------------------------------------------------------------------------
begin
    oRgb.red   <= blurRgb.red(iMSB downto iLSB);
    oRgb.green <= blurRgb.green(iMSB downto iLSB);
    oRgb.blue  <= blurRgb.blue(iMSB downto iLSB);
    oRgb.valid <= blurRgb.valid;
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
        i_enable        => rgb2x.valid,
        i_data          => d3RGB,
        i_wadd          => rAddress,
        i_radd          => rAddress,
        en_datao        => enable,
        taps0x          => v1TapRGB0x,
        taps1x          => v1TapRGB1x,
        taps2x          => v1TapRGB2x);
    MAC_R_inst: blurMac
    port map(
        clk             => clk,
        rst_l           => rst_l,
        vTap0x          => vTapRGB0x(23 downto 16),
        vTap1x          => vTapRGB1x(23 downto 16),
        vTap2x          => vTapRGB2x(23 downto 16),
        DataO           => blurRgb.red);
    MAC_G_inst: blurMac
    port map(
        clk             => clk,
        rst_l           => rst_l,
        vTap0x          => vTapRGB0x(15 downto 8),
        vTap1x          => vTapRGB1x(15 downto 8),
        vTap2x          => vTapRGB2x(15 downto 8),
        DataO           => blurRgb.green);
    MAC_B_inst: blurMac
    port map(
        clk             => clk,
        rst_l           => rst_l,
        vTap0x          => vTapRGB0x(i_data_width-1 downto 0),
        vTap1x          => vTapRGB1x(i_data_width-1 downto 0),
        vTap2x          => vTapRGB2x(i_data_width-1 downto 0),
        DataO           => blurRgb.blue);
    TAP_SIGNED : process (clk) begin
        if rising_edge(clk) then
            rgb1x         <= iRgb;  
            rgb2x         <= rgb1x;
            rgb3x         <= rgb2x;
            d3RGB         <= rgb3x.red & rgb3x.green & rgb3x.blue;
            d1en          <= enable;
            d2en          <= d1en;
            blurRgb.valid <= d2en;
        if(rgb3x.valid = '1') then
            vTapRGB0x <= v1TapRGB0x;
            vTapRGB1x <= v1TapRGB1x;
            vTapRGB2x <= v1TapRGB2x;
        else
            vTapRGB0x <= (others => '0');
            vTapRGB1x <= (others => '0');
            vTapRGB2x <= (others => '0');
        end if;
        end if;
    end process TAP_SIGNED;
end architecture;
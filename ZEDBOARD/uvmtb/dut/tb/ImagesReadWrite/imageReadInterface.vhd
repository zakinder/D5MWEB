library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.constantspackage.all;
use work.vpfrecords.all;
use work.portspackage.all;
entity imageReadInterface is
port (
    clk           : in  std_logic;
    reset         : in  std_logic;
    readyToRead   : in  std_logic;
    valid         : out std_logic;
    red           : out std_logic_vector(7 downto 0);
    green         : out std_logic_vector(7 downto 0);
    blue          : out std_logic_vector(7 downto 0);
    xCord         : out std_logic_vector(11 downto 0);
    yCord         : out std_logic_vector(11 downto 0);
    endOfFrame    : out std_logic);
end imageReadInterface;
architecture Behavioral of imageReadInterface is
constant readbmp             : string  := "128_128";
constant i_data_width        : integer := 8;
constant img_width           : integer := 128;
constant img_height          : integer := 128;

signal rgbRead               :  channel;
signal txCord                :  coord;
signal enableWrite           :  std_logic := lo;
begin
ImageReadInst: imageRead
generic map (
    i_data_width          => i_data_width,
    img_width             => img_width,
    img_height            => img_height,
    input_file            => readbmp)
port map (                  
    clk                   => clk,
    reset                 => reset,
    readyToRead           => readyToRead,
    oRgb                  => rgbRead,
    oCord                 => txCord,
    endOfFrame            => endOfFrame);
enableWrite <= hi when (rgbRead.valid = hi);
imageWriteInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    img_width             => img_width,
    img_height            => img_height,
    input_file            => readbmp,
    output_file           => "maskSobelCga")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbRead);
    valid         <= rgbRead.valid;
    red           <= rgbRead.red;
    green         <= rgbRead.green;
    blue          <= rgbRead.blue;
    xCord         <= txCord.x(11 downto 0);
    yCord         <= txCord.y(11 downto 0);
end Behavioral;
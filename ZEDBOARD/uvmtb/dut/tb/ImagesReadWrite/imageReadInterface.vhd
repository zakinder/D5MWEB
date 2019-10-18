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
    clk                  : in  std_logic;
    reset                : in  std_logic;
    readyToRead          : in  std_logic;
    m_axis_mm2s_aclk     : in  std_logic;
    m_axis_mm2s_tvalid   : in  std_logic;
    m_axis_mm2s_tdata    : in std_logic_vector(23 downto 0);
    valid                : out std_logic;
    red                  : out std_logic_vector(7 downto 0);
    green                : out std_logic_vector(7 downto 0);
    blue                 : out std_logic_vector(7 downto 0);
    rgb                  : out std_logic_vector(23 downto 0);
    lvalid               : out std_logic;
    fvalid               : out std_logic;
    xCord                : out std_logic_vector(11 downto 0);
    yCord                : out std_logic_vector(11 downto 0);
    endOfFrame           : out std_logic);
end imageReadInterface;
architecture Behavioral of imageReadInterface is
    constant readbmp             : string  := "400_300";
    constant i_data_width        : integer := 8;
    constant img_width           : integer := 400;
    constant img_height          : integer := 300;
    signal   rgbRead             : channel;
    signal   txCord              : coord;
    signal   enableWrite         : std_logic := lo;
    signal   doneWrite           : std_logic := lo;
    signal   mm2rgb              : channel;
    signal   doneTask            : std_logic := lo;
    signal   end_of_frame        : std_logic := lo;
begin
    rgb                          <= rgbRead.red & rgbRead.green &  rgbRead.blue;
    mm2rgb.valid                 <= m_axis_mm2s_tvalid;
    mm2rgb.red                   <= m_axis_mm2s_tdata(23 downto 16);
    mm2rgb.green                 <= m_axis_mm2s_tdata(15 downto 8);
    mm2rgb.blue                  <= m_axis_mm2s_tdata(7 downto 0);
    valid                        <= rgbRead.valid;
    red                          <= rgbRead.red;
    green                        <= rgbRead.green;
    blue                         <= rgbRead.blue;
    xCord                        <= txCord.x(11 downto 0);
    yCord                        <= txCord.y(11 downto 0);
    enableWrite                  <= hi when (mm2rgb.valid = hi and end_of_frame = hi);
    doneTask                     <= hi when (readyToRead = hi and doneWrite = lo) else lo;
    endOfFrame                   <= hi when (doneWrite = hi) else lo;
ImageReadInst: imageRead
generic map (
    i_data_width          => i_data_width,
    img_width             => img_width,
    img_height            => img_height,
    input_file            => readbmp)
port map (                  
    clk                   => clk,
    reset                 => reset,
    readyToRead           => doneTask,
    fvalid                => fvalid,
    lvalid                => lvalid,
    oRgb                  => rgbRead,
    oCord                 => txCord,
    endOfFrame            => end_of_frame);
imageWriteInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    img_width             => img_width,
    img_height            => img_height,
    input_file            => readbmp,
    output_file           => readbmp)
port map (                  
    pixclk                => m_axis_mm2s_aclk,
    enableWrite           => enableWrite,
    doneWrite             => doneWrite,
    iRgb                  => mm2rgb);
end Behavioral;
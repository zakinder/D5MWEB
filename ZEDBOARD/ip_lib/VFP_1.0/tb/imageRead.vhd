library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity imageRead is
generic (
    i_data_width  : integer := 8;
    input_file    : string  := "input_image");
port (
    clk           : in  std_logic;
    oRgb          : out channel;
    oCord         : out coord;
    rl            : out std_logic_vector(i_data_width-1 downto 0);
    rh            : out std_logic_vector(i_data_width-1 downto 0);
    gl            : out std_logic_vector(i_data_width-1 downto 0);
    gh            : out std_logic_vector(i_data_width-1 downto 0);
    bl            : out std_logic_vector(i_data_width-1 downto 0);
    bh            : out std_logic_vector(i_data_width-1 downto 0);
    endOfFrame    : out std_logic);
end imageRead;
architecture Behavioral of imageRead is
    constant img_width  : integer := 128;
    constant img_height : integer := 128;
    constant readbmp    : string := input_file&".bmp";
    type bit_file is file of bit_vector;
    file read_file      : bit_file open read_mode  is readbmp;
    type t_color is array(1 to 3) of std_logic_vector(i_data_width-1 downto 0);
    type t_bmp is array(0 to img_width -1, 0 to img_height -1) of t_color;
    signal bmp_read     : t_bmp;
    signal ReadyToRead  : std_logic := '0';
    signal lineValid    : std_logic := '0';
    signal Xcont        : integer := 0;
    signal Ycont        : integer := 0;
    signal xImagecont   : integer := 0;
    signal yImagecont   : integer := 0;
    signal i_count      : integer := 0;
begin
    endOfFrame  <= '1' when (Xcont = 127 and Ycont = 127 and ReadyToRead = '1') else '0';
    oRgb.valid  <= lineValid when (Xcont < 128 and Ycont < 128 and ReadyToRead = '1') else '0';
    oCord.x     <= std_logic_vector(to_unsigned(xImagecont, 16));
    oCord.y     <= std_logic_vector(to_unsigned(yImagecont, 16));
    -------------------------------------------------------------------------
    pcreate_pixelpositions: process(clk)begin
        if rising_edge(clk) then
            if (ReadyToRead = '1') then
                if(Xcont < 131 and Ycont < 131)then --frame delay of 128
                    Xcont  <= Xcont + 1;
                else
                    Xcont  <= 0;
                end if;
                if(Xcont = 129 and Ycont < 131)then
                    Ycont  <= Ycont + 1;
                elsif(Xcont = 130 and Ycont = 131)then
                    Ycont     <= 0;
                else
                    Ycont  <= Ycont;
                end if;
                if(Xcont < 128 and Ycont < 128)then
                    xImagecont  <= Xcont;
                    lineValid   <= '1';
                else
                    xImagecont  <= 0;
                    lineValid   <= '0';
                end if;
                if(Ycont < 128)then
                    yImagecont  <= Ycont;
                else
                    yImagecont  <= 0;
                end if;
                if(xImagecont = 127 and yImagecont = 127)then
                    i_count   <= i_count + 1;
                end if;
                if (i_count = 0) then
                    rl<=x"64";
                    rh<=x"FD";
                    gl<=x"86";
                    gh<=x"A1";
                    bl<=x"5E";
                    bh<=x"7A";
               elsif (i_count = 1) then
                    rl<=x"C6";
                    rh<=x"FD";
                    gl<=x"86";
                    gh<=x"A1";
                    bl<=x"5E";
                    bh<=x"7A";
               elsif (i_count = 2) then
                    rl<=x"09";
                    rh<=x"FA";
                    gl<=x"09";
                    gh<=x"FA";
                    bl<=x"09";
                    bh<=x"F9";
               elsif (i_count = 3) then
                    rl<=x"09";
                    rh<=x"F0";
                    gl<=x"09";
                    gh<=x"F0";
                    bl<=x"09";
                    bh<=x"F0";
               elsif (i_count = 4) then
                    rl<=x"09";
                    rh<=x"F0";
                    gl<=x"09";
                    gh<=x"F0";
                    bl<=x"09";
                    bh<=x"F0";
               else
                    rl<=x"02";
                    rh<=x"30";
                    gl<=x"02";
                    gh<=x"30";
                    bl<=x"02";
                    bh<=x"30";
               end if;
            oRgb.red     <= bmp_read(xImagecont, yImagecont)(1);
            oRgb.green   <= bmp_read(xImagecont, yImagecont)(2);
            oRgb.blue    <= bmp_read(xImagecont, yImagecont)(3);
            else
            oRgb.red     <= (others => '0');
            oRgb.green   <= (others => '0');
            oRgb.blue    <= (others => '0');
                    rl<=x"00";
                    rh<=x"00";
                    gl<=x"00";
                    gh<=x"00";
                    bl<=x"00";
                    bh<=x"00";
            end if;
        end if;
    end process pcreate_pixelpositions;
    -------------------------------------------------------------------------
    pfile_actions : process
            variable next_vector    : bit_vector (0 downto 0);
            variable actual_len     : natural;
            variable addr           : unsigned(17 downto 0) := (others => '0');
            variable to_write       : signed(15 downto 0);
            variable read_byte      : std_logic_vector(7 downto 0);
            function conv_std_logic_vector(ARG : integer; SIZE : integer) return std_logic_vector is
            variable result         : std_logic_vector (SIZE - 1 downto 0);
            variable temp           : integer;
            begin
            temp := ARG;
                for i in 0 to SIZE - 1 loop
                    if (temp mod 2) = 1 then
                        result(i) := '1';
                    else
                        result(i) := '0';
                    end if;
                    if temp > 0 then
                        temp := temp / 2;
                    elsif (temp > integer'low) then
                        temp := (temp - 1) / 2;
                    else
                        temp := temp / 2;
                    end if;
                end loop; 
            return result;
            end;
            begin
            -- READ IN BMP COLOR DATA                   --HEIGHT * WIDTH * 3
            for y in 0 to img_height - 1 loop           --HEIGHT
                for x in 0 to img_width - 1 loop        --WIDTH
                    for c in 1 to 3 loop                --RGB   
                        read(read_file, next_vector, actual_len);
                        read_byte := conv_std_logic_vector(bit'pos(next_vector(0)), 8);
                        bmp_read(x, y)(c) <= read_byte;
                    end loop;
                end loop;
            end loop;
            wait for 10 ns;
            ReadyToRead <= '1';
            wait;        
    end process pfile_actions;
end Behavioral;
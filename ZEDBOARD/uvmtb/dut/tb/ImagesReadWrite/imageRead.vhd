library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.constantspackage.all;
use work.vpfrecords.all;
use work.portspackage.all;
--use work.tbpackage.all;
entity imageRead is
generic (
    i_data_width  : integer := 8;
    img_width     : integer := 400;
    img_height    : integer := 300;
    input_file    : string  := "input_image");
port (
    clk           : in  std_logic;
    reset         : in  std_logic;
    readyToRead   : in  std_logic;
    oRgb          : out channel;
    oCord         : out coord;
    endOfFrame    : out std_logic);
end imageRead;
architecture Behavioral of imageRead is
    -------------------------------------------------------------------------
    constant proj_fol  : string := "Z:/ZEDBOARD/uvmtb/dut/tb/uvm_images/read";
    constant bacslash  : string := "/";
    constant readbmp   : string := proj_fol&bacslash&input_file&".bmp";
    -------------------------------------------------------------------------
    type bit_file is file of bit_vector;
    file read_file      : bit_file open read_mode  is readbmp;
    type t_color is array(1 to 3) of std_logic_vector(i_data_width-1 downto 0);
    type t_bmp is array(0 to img_width -1, 0 to img_height -1) of t_color;
    signal bmp_read     : t_bmp;
    signal SetToRead    : std_logic := '0';
    signal lineValid    : std_logic := '0';
    signal Xcont        : integer := 0;
    signal Ycont        : integer := 0;
    signal xImagecont   : integer := 0;
    signal yImagecont   : integer := 0;
    signal i_count      : integer := 0;
    signal olm          : rgbConstraint;
begin
    endOfFrame  <= '1' when (Xcont = img_width - 1 and Ycont = img_height - 1 and SetToRead = '1') else '0';
    oRgb.valid  <= lineValid when (Xcont < img_width and Ycont < img_height and SetToRead = '1') else '0';
    oCord.x     <= std_logic_vector(to_unsigned(xImagecont, 16));
    oCord.y     <= std_logic_vector(to_unsigned(yImagecont, 16));
    -------------------------------------------------------------------------
    pcreate_pixelpositions: process(clk,reset)begin
        if (reset = lo) then
            oRgb.red     <= (others => '0');
            oRgb.green   <= (others => '0');
            oRgb.blue    <= (others => '0');
            olm.rl <= 0;
            olm.rh <= 0;
            olm.gl <= 0;
            olm.gh <= 0;
            olm.bl <= 0;
            olm.bh <= 0;
        elsif rising_edge(clk) then
            if (SetToRead = '1' and readyToRead = '1') then
                if(Xcont < img_width + 3 and Ycont < img_height + 3)then
                    Xcont  <= Xcont + 1;
                else
                    Xcont  <= 0;
                end if;
                if(Xcont < img_width and Ycont < img_height)then
                    xImagecont  <= Xcont;
                    lineValid   <= '1';
                else
                    xImagecont  <= 0;
                    lineValid   <= '0';
                end if;
                if(Xcont = img_width + 1 and Ycont < img_height + 3)then
                    Ycont  <= Ycont + 1;
                elsif(Xcont = img_width + 2 and Ycont = img_height + 3)then
                    Ycont  <= 0;
                else
                    Ycont  <= Ycont;
                end if;
                if(Ycont < img_height)then
                    yImagecont  <= Ycont;
                else
                    yImagecont  <= 0;
                end if;
                if(xImagecont = img_width - 1 and yImagecont = img_height - 1)then
                    i_count   <= i_count + 1;
                end if;
                if (i_count = 0) then
                    olm.rl <= 60;
                    olm.rh <= 255;
                    olm.gl <= 60;
                    olm.gh <= 255;
                    olm.bl <= 60;
                    olm.bh <= 255;
                elsif (i_count = 1) then
                    olm.rl <= 60;
                    olm.rh <= 255;
                    olm.gl <= 60;
                    olm.gh <= 255;
                    olm.bl <= 60;
                    olm.bh <= 255;
                elsif (i_count = 2) then
                    olm.rl <= 60;
                    olm.rh <= 255;
                    olm.gl <= 60;
                    olm.gh <= 255;
                    olm.bl <= 60;
                    olm.bh <= 255;
                elsif (i_count = 3) then
                    olm.rl <= 60;
                    olm.rh <= 255;
                    olm.gl <= 60;
                    olm.gh <= 255;
                    olm.bl <= 60;
                    olm.bh <= 255;
                elsif (i_count = 4) then
                    olm.rl <= 60;
                    olm.rh <= 255;
                    olm.gl <= 60;
                    olm.gh <= 255;
                    olm.bl <= 60;
                    olm.bh <= 255;
                else
                    olm.rl <= 60;
                    olm.rh <= 255;
                    olm.gl <= 60;
                    olm.gh <= 255;
                    olm.bl <= 60;
                    olm.bh <= 255;
                end if;
                oRgb.red     <= bmp_read(xImagecont, yImagecont)(3);
                oRgb.green   <= bmp_read(xImagecont, yImagecont)(2);
                oRgb.blue    <= bmp_read(xImagecont, yImagecont)(1);
            else
                oRgb.red     <= (others => '0');
                oRgb.green   <= (others => '0');
                oRgb.blue    <= (others => '0');
                olm.rl <= 0;
                olm.rh <= 0;
                olm.gl <= 0;
                olm.gh <= 0;
                olm.bl <= 0;
                olm.bh <= 0;
            end if;
        end if;
    end process pcreate_pixelpositions;
    -------------------------------------------------------------------------
    pfile_actions : process
            variable next_vector    : bit_vector (0 downto 0);
            variable actual_len     : natural;
            variable read_byte      : std_logic_vector(7 downto 0);
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
            SetToRead <= '1';
            wait;        
    end process pfile_actions;
end Behavioral;
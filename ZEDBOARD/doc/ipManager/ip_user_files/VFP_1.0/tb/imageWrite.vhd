library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
use work.tbPackage.all;
entity imageWrite is
  generic (
    i_data_width  : integer := 8;
    test          : string  := "folder";
    input_file    : string  := "input_image";
    output_file   : string  := "output_image");
  port (
    pixclk        : in  std_logic;
    enableWrite   : in  std_logic;
    iRgb          : in channel);
end imageWrite;
architecture Behavioral of imageWrite is
    -------------------------------------------------------------------------
    constant projFold   : string := "Z:/ZEDBOARD/doc/ipManager/ip_user_files/VFP_1.0/tb";
    constant backSlash  : string := "\";
    constant wrBmp      : string := projFold&backSlash&test&backSlash&output_file&".bmp";
    constant wrBmpLog   : string := projFold&backSlash&test&backSlash&output_file&".txt";
    --constant readbmp    : string := "130_130.bmp";
    constant readbmp    : string := input_file&".bmp";
    type bit_file is file of bit_vector;
    file read_file      : bit_file open read_mode  is readbmp;
    type std_file is file of character;
    file wrBmpfile      : std_file open write_mode is wrBmp;
    file wrBmpLogfile   : text open write_mode is wrBmpLog;
    type imageHeaderTable is array(0 to 60) of integer range 0 to 255;
    constant imageHeader    : imageHeaderTable := (0,66,77,54,192,0,0,0,0,0,0,54,0,0,0,40,0,0,0,128,0,0,0,128,0,0,0,1,0,24,0,0,0,0,0,0,192,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
    type t_color is array(1 to 3) of std_logic_vector(i_data_width-1 downto 0);
    type t_bmp is array(0 to img_width -1, 0 to img_height -1) of t_color;
    signal bmp_out          : t_bmp := (others => (others => (others => (others => '0'))));
    signal Xcont            : integer := 0;
    signal Ycont            : integer := 0;
    signal writeToImageFile : std_logic :='0';
    signal frameEnable      : std_logic :='0';
begin
    frameEnable <= '1' when (enableWrite = '1');
    -------------------------------------------------------------------------
    pcreate_pixelpositions: process(pixclk)begin
        if rising_edge(pixclk) then
            if(frameEnable = '1') then
                if (iRgb.valid = '1' and writeToImageFile = '0') then
                    Xcont  <= Xcont + 1;
                end if;
                    bmp_out(Xcont, Ycont)(1) <= iRgb.red;
                    bmp_out(Xcont, Ycont)(2) <= iRgb.green;
                    bmp_out(Xcont, Ycont)(3) <= iRgb.blue;
                    if(Xcont = img_width - 1)then
                        Ycont  <= Ycont + 1;
                        Xcont  <= 0;
                    end if;
                    if(Xcont = img_width - 1 and Ycont = img_height - 1)then
                        Ycont  <= 0;
                    end if;
            end if;        
        end if;
    end process pcreate_pixelpositions;
    ppositions: process(Ycont,Xcont)begin
    if (Xcont = img_width - 1 and Ycont = img_height - 1) then
        writeToImageFile <= '1';
    end if;
    end process ppositions;
    -------------------------------------------------------------------------
    pfile_actions : process
            
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
            
            variable std_buffer     : character;
            variable outline        : line;
            variable cnt            : integer := 0;
            variable pixelIndex     : integer := 0;
            variable rowIndex       : integer := 0;
            variable pixelLocation  : integer := 0;
            variable v_SPACE        : character := ' ';
            variable next_vector    : bit_vector (0 downto 0);
            variable actual_len     : natural;
            begin
            wait until writeToImageFile = '1';
            -- for i in 1 to 60 loop
                -- cnt := cnt + 1;
                -- std_buffer := character'val(imageHeader(cnt));
                -- write(wrBmpfile, std_buffer);
            -- end loop;
         for i in 0 to 53 loop
               read(read_file, next_vector, actual_len);
               std_buffer := character'val(to_integer(unsigned(conv_std_logic_vector(bit'pos(next_vector(0)), 8))));
               write(wrBmpfile, std_buffer);
         end loop;
            for y in 0 to img_height - 1 loop       --HEIGHT
                rowIndex := rowIndex + 1;
                pixelLocation := 0;
                for x in 0 to img_width - 1 loop    --WIDTH
                    for c in 1 to 3 loop            --RGB
                        if (pixelIndex > 20) then
                            std_buffer := character'val(to_integer(unsigned(bmp_out(x, y)(c))));
                            write(wrBmpfile, std_buffer);
                        end if;
                    end loop;
                    pixelLocation := pixelLocation + 1;
                    pixelIndex    := pixelIndex + 1;
                    -- write(outline,pixelIndex);
                    -- write(outline,v_SPACE);
                    -- write(outline,rowIndex);
                    -- write(outline,v_SPACE);
                    -- write(outline,pixelLocation);
                    -- write(outline,v_SPACE);
                    write(outline,(to_integer(unsigned(bmp_out(x, y)(1)))));
                    write(outline,v_SPACE);
                    write(outline,(to_integer(unsigned(bmp_out(x, y)(2)))));
                    write(outline,v_SPACE);
                    write(outline,(to_integer(unsigned(bmp_out(x, y)(3)))));
                    writeline(wrBmpLogfile, outline);
                end loop;
            end loop;
            wait;   
    end process pfile_actions;
    -------------------------------------------------------------------------
end Behavioral;
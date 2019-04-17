library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity imageWrite is
  generic (
    i_data_width  : integer := 8;
    img_width     : integer := 128;
    img_height    : integer := 128;
    test          : string  := "test1";  
    output_file   : string  := "output_image");
  port (
    pixclk        : in  std_logic;
    iRgb          : in channel);
end imageWrite;
architecture Behavioral of imageWrite is
    -------------------------------------------------------------------------
    constant proj_fol  : string := "Z:/ipManager/ip_user_files/VFP_1.0";
    constant bacslash  : string := "\";
    constant writbmp   : string := proj_fol&bacslash&test&bacslash&output_file&".bmp";
    constant writbmp1  : string := proj_fol&bacslash&test&bacslash&output_file&".txt";
    -------------------------------------------------------------------------
    type std_file is file of character;
    file write_file    : std_file open write_mode is writbmp;
    file write1file    : text open write_mode is writbmp1;
    type imageHeaderTable is array(0 to 51) of integer range 0 to 255;
    constant imageHeader  : imageHeaderTable := (0,66,77,54,192,0,0,0,0,0,0,54,0,0,0,40,0,0,0,128,0,0,0,128,0,0,0,1,0,24,0,0,0,0,0,0,192,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
    type t_color is array(1 to 3) of std_logic_vector(i_data_width-1 downto 0);
    type t_bmp is array(0 to img_width -1, 0 to img_height -1) of t_color;
    signal bmp_out          : t_bmp := (others => (others => (others => (others => '0'))));
    signal Xcont            : integer := 0;
    signal Ycont            : integer := 0;
    signal valid1s          : std_logic;
    signal valid2s          : std_logic;
    signal valid3s          : std_logic;
    signal writeToImageFile : std_logic :='0';
begin
    -------------------------------------------------------------------------
    pcreate_pixelpositions: process(pixclk)begin
        if rising_edge(pixclk) then
            if (iRgb.valid = '1' and writeToImageFile = '0') then
                Xcont  <= Xcont + 1;
            end if;
                bmp_out(Xcont, Ycont)(1) <= iRgb.red;
                bmp_out(Xcont, Ycont)(2) <= iRgb.green;
                bmp_out(Xcont, Ycont)(3) <= iRgb.blue;
                if(Xcont = 127)then
                    Ycont  <= Ycont + 1;
                    Xcont  <= 0;
                end if;
                if(Xcont = 127 and Ycont = 127)then
                    Ycont  <= 0;
                end if;
        end if;
    end process pcreate_pixelpositions;
    ppositions: process(Ycont,Xcont)begin
    if (Xcont = 127 and Ycont = 127) then
        writeToImageFile <= '1';
    end if;
    end process ppositions;
    -------------------------------------------------------------------------
    pfile_actions : process
            function conv_std_logic_vector(ARG : integer; SIZE : integer) return std_logic_vector is
            variable result         : std_logic_vector (SIZE - 1 downto 0);
            variable temp           : integer;
            variable outline : line;
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
            begin
            wait until writeToImageFile = '1';
            for i in 1 to 51 loop
                cnt := cnt + 1;
                std_buffer := character'val(imageHeader(cnt));
                write(write_file, std_buffer);
            end loop;
            for y in 0 to img_height - 1 loop       --HEIGHT
                rowIndex := rowIndex + 1;
                pixelLocation := 0;
                for x in 0 to img_width - 1 loop    --WIDTH
                    for c in 1 to 3 loop            --RGB
                    std_buffer := character'val(to_integer(unsigned(bmp_out(x, y)(c))));
                    write(write_file, std_buffer);
                    end loop;
                    
                    pixelLocation := pixelLocation + 1;
                    pixelIndex    := pixelIndex + 1;
                    
                    write(outline,pixelIndex);
                    write(outline,v_SPACE);
                    
                    write(outline,rowIndex);
                    write(outline,v_SPACE);
                    
                    write(outline,pixelLocation);
                    write(outline,v_SPACE);
                    
                    write(outline,(to_integer(unsigned(bmp_out(x, y)(1)))));
                    write(outline,v_SPACE);
                    
                    write(outline,(to_integer(unsigned(bmp_out(x, y)(2)))));
                    write(outline,v_SPACE);
                    
                    write(outline,(to_integer(unsigned(bmp_out(x, y)(3)))));
                    writeline(write1file, outline);
                    
                end loop;
            end loop;
            wait;   
    end process pfile_actions;
    -------------------------------------------------------------------------
end Behavioral;
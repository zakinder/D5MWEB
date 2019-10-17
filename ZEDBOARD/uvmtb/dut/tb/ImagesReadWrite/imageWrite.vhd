library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.constantspackage.all;
use work.vpfrecords.all;
use work.portspackage.all;
entity imageWrite is
generic (
    enImageText   : boolean := false;
    enImageIndex  : boolean := false;
    i_data_width  : integer := 8;
    img_width     : integer := 400;
    img_height    : integer := 300;
    input_file    : string  := "input_image";
    output_file   : string  := "output_image");
port (
    pixclk        : in  std_logic;
    enableWrite   : in  std_logic;
    iRgb          : in channel);
end imageWrite;
architecture Behavioral of imageWrite is
    -------------------------------------------------------------------------
    constant read_fol  : string := "Z:/ZEDBOARD/uvmtb/dut/tb/uvm_images/read";
    constant write_fol  : string := "Z:/ZEDBOARD/uvmtb/dut/tb/uvm_images/write";
    constant bacslash  : string := "\";
    constant readbmp   : string := read_fol&bacslash&input_file&".bmp";
    constant wrBmp     : string := write_fol&bacslash&output_file&".bmp";
    constant wrBmpLog  : string := write_fol&bacslash&output_file&".txt";
    -------------------------------------------------------------------------
    type bitFile is file of bit_vector;
    file readFile       : bitFile open read_mode  is readbmp;
    type stdFile is file of character;
    file wrBmpfile      : stdFile open write_mode is wrBmp;
    file wrBmpLogfile   : text open write_mode is wrBmpLog;
    type imageHeaderTable is array(0 to 60) of integer range 0 to 255;
    constant imageHeader    : imageHeaderTable := (0,66,77,54,192,0,0,0,0,0,0,54,0,0,0,40,0,0,0,128,0,0,0,128,0,0,0,1,0,24,0,0,0,0,0,0,192,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
    type rgbPixel is array(1 to 3) of std_logic_vector(i_data_width-1 downto 0);
    type rgbFrame is array(0 to img_width -1, 0 to img_height -1) of rgbPixel;
    signal rgbData      : rgbFrame  := (others => (others => (others => (others => '0'))));
    signal Xcont        : integer   := 0;
    signal Ycont        : integer   := 0;
    signal wrImageFile  : std_logic := lo;
    signal frameEnable  : std_logic := lo;
    signal rgb          :  channel  := (valid => lo, red => black, green => black, blue => black);
begin
process (pixclk) begin
    if rising_edge(pixclk) then
        if(enImageText = True) then
            rgb.valid   <= iRgb.valid;
            if (iRgb.red /= iRgb.green) and (iRgb.red /= iRgb.blue) and (iRgb.green /= iRgb.blue) and (iRgb.red > x"5A" ) and (iRgb.green > x"28" ) then
                    rgb.red   <= iRgb.red;
                    rgb.green <= iRgb.green;
                    rgb.blue  <= iRgb.blue;
                else
                    rgb.red   <= black;
                    rgb.green <= black;
                    rgb.blue  <= black;
            end if;
        else
            rgb  <= iRgb;
        end if;
    end if;
end process;
frameEnable <= hi when (enableWrite = hi);
readRgbDataP: process(pixclk)begin
    if rising_edge(pixclk) then
        if(frameEnable = hi) then
            if (rgb.valid = hi and wrImageFile = lo) then
                Xcont  <= Xcont + 1;
            end if;
            rgbData(Xcont, Ycont)(3) <= rgb.red;
            rgbData(Xcont, Ycont)(2) <= rgb.green;
            rgbData(Xcont, Ycont)(1) <= rgb.blue;
            if(Xcont = img_width - 1)then
                Ycont  <= Ycont + 1;
                Xcont  <= 0;
            end if;
            if(Xcont = img_width - 1 and Ycont = img_height - 1)then
                Ycont  <= 0;
            end if;
        end if;        
    end if;
end process readRgbDataP;
ImageFrameLoadDoneP: process(Ycont,Xcont)begin
    if (Xcont = img_width - 1 and Ycont = img_height - 1) then
        wrImageFile <= hi;
    end if;
end process ImageFrameLoadDoneP;
ImageFrameP: process
    variable stdBuffer      : character;
    variable outLine        : line;
    variable cnt            : integer := 0;
    variable pixelIndex     : integer := 0;
    variable rowIndex       : integer := 0;
    variable pixelLocation  : integer := 0;
    variable charSpace      : character := ' ';
    variable nBitVale       : bit_vector (0 downto 0);
    variable actual_len     : natural;
    begin
    wait until wrImageFile = hi;
    -- for i in 1 to 54 loop
        -- cnt := cnt + 1;
        -- stdBuffer := character'val(imageHeader(cnt));
        -- write(wrBmpfile, stdBuffer);
    -- end loop;
    for i in 0 to 53 loop
        read(readFile, nBitVale, actual_len);
        stdBuffer := character'val(to_integer(unsigned(conv_std_logic_vector(bit'pos(nBitVale(0)), 8))));
        write(wrBmpfile, stdBuffer);
    end loop;
    for y in 0 to img_height loop
        rowIndex := rowIndex + 1;
        pixelLocation := 0;
        for x in 0 to img_width - 1 loop
            for c in 1 to 3 loop
                if (pixelIndex > 18) and (y < img_height) then
                    stdBuffer := character'val(to_integer(unsigned(rgbData(x, y)(c))));
                    write(wrBmpfile, stdBuffer);
                end if;
                if (y = img_height) and (x < 20)  then
                    stdBuffer := character'val(to_integer(unsigned(rgbData(x, y-1)(c))));
                    write(wrBmpfile, stdBuffer);
                end if;
            end loop;
            pixelLocation := pixelLocation + 1;
            pixelIndex    := pixelIndex + 1;
            if(enImageText = True) then
                if(enImageIndex = True) then
                    write(outLine,pixelIndex);
                    write(outLine,charSpace);
                    write(outLine,rowIndex);
                    write(outLine,charSpace);
                    write(outLine,pixelLocation);
                    write(outLine,charSpace);
                end if;
                write(outLine,(to_integer(unsigned(rgbData(x, y)(3)))));
                write(outLine,charSpace);
                write(outLine,(to_integer(unsigned(rgbData(x, y)(2)))));
                write(outLine,charSpace);
                write(outLine,(to_integer(unsigned(rgbData(x, y)(1)))));
                writeline(wrBmpLogfile, outLine);
            end if;
        end loop;
    end loop;
	wait for 2000 ns;
	--assert false
	--report "simulation ended"
	--severity failure;
end process ImageFrameP;
end Behavioral;
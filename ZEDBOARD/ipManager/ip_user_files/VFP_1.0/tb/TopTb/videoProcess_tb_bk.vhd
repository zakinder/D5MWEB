--01062019 [01-06-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
use work.tbPackage.all;
use work.dutPortsPackage.all;
entity videoProcess_tb is
end videoProcess_tb;
architecture behavioral of videoProcess_tb is
    signal resetn                        : std_logic := lo;
    signal clk                           : std_logic;
    signal kCoeff                        : kernelCoeff;
    signal olm                           : rgbConstraint;
    constant clk_freq                    : real    := 1000.00e6;
    -------------------------------------------------
    constant DUT_VFP_ENABLED             : boolean := false;
    constant DUT_FRAMEPROCESS_ENABLED    : boolean := false;
    constant DUT_IMAGES_TESTENABLED      : boolean := false;
    constant DUT_SOBEL_TEST_ENABLED      : boolean := false;
    constant DUT_EMBOSS_TEST_ENABLED     : boolean := false;
    constant DUT_YCBCR_TEST_ENABLED      : boolean := false;
    constant DUT_HSV_TEST_ENABLED        : boolean := false;
    constant DUT_CC_TEST_ENABLED         : boolean := false;
    constant DUT_FILTERS_TESTENABLED     : boolean := false;
    constant DUT_IMAGEKERNELS_ENABLED    : boolean := false;
    constant DUT_FILTERS_ENABLED         : boolean := false;
    constant DUT_FIFO_ENABLED            : boolean := false;
    constant DUT_RGBASSERTION_ENABLED    : boolean := true;
    -------------------------------------------------
    constant F_CGA_BRIGHT                : boolean := false;
    constant F_CGA_DARK                  : boolean := false;
    constant F_CGA_BALANCE               : boolean := false;
    constant F_CGA_GAIN_RED              : boolean := false;
    constant F_CGA_GAIN_GRE              : boolean := false;
    constant F_CGA_GAIN_BLU              : boolean := false;
    -------------------------------------------------
    constant F_TES                       : boolean := false;
    constant F_LUM                       : boolean := false;
    constant F_TRM                       : boolean := false;
    constant F_RGB                       : boolean := false;
    constant F_SHP                       : boolean := false;
    constant F_BLU                       : boolean := false;
    constant F_EMB                       : boolean := false;
    constant F_YCC                       : boolean := false;
    constant F_SOB                       : boolean := false;
    constant F_CGA                       : boolean := false;
    constant F_HSV                       : boolean := false;
    constant F_HSL                       : boolean := false;
    -------------------------------------------------
    constant F_CGA_TO_CGA                : boolean := false;
    constant F_CGA_TO_HSL                : boolean := false;
    constant F_CGA_TO_HSV                : boolean := false;
    constant F_CGA_TO_YCC                : boolean := false;
    constant F_CGA_TO_SHP                : boolean := false;
    constant F_CGA_TO_BLU                : boolean := false;
    -------------------------------------------------
    constant F_SHP_TO_SHP                : boolean := false;
    constant F_SHP_TO_HSL                : boolean := false;
    constant F_SHP_TO_HSV                : boolean := false;
    constant F_SHP_TO_YCC                : boolean := false;
    constant F_SHP_TO_CGA                : boolean := false;
    constant F_SHP_TO_BLU                : boolean := false;
    -------------------------------------------------
    constant F_BLU_TO_BLU                : boolean := false;
    constant F_BLU_TO_HSL                : boolean := false;
    constant F_BLU_TO_HSV                : boolean := false;
    constant F_BLU_TO_YCC                : boolean := false;
    constant F_BLU_TO_CGA                : boolean := false;
    constant F_BLU_TO_SHP                : boolean := false;
    -------------------------------------------------
begin
    clk_gen(clk,clk_freq);
    process begin
        resetn  <= lo;
    wait for 2 ns;
        resetn  <= hi;
    wait;
    end process;
RGBASSERTION_ENABLED : if (DUT_RGBASSERTION_ENABLED = true) generate
    signal txCord           : coord;
    signal rgbRead          : channel;
    signal rgbLgt           : channel;
    signal rgbDrk           : channel;
    signal rgbLum           : channel;
    signal rgbAg            : channel;
    signal rgb2Ag           : channel;
    signal rgbnew           : channel;
    signal rgbLgtv          : channel;
    signal rgbDrkv          : channel;
    signal rgbLumv          : channel;
    signal rgbAgv           : channel;
    signal rgb2Agv          : channel;
    signal rgbnewv          : channel;
    signal endOfFrame       : std_logic;
    signal enableWrite      : std_logic := hi;
begin
ImageReadInst: imageRead
generic map (
    i_data_width          => i_data_width,
    input_file            => readbmp)
port map (                  
    clk                   => clk,
    reset                 => resetn,
    oRgb                  => rgbRead,
    oCord                 => txCord,
    endOfFrame            => endOfFrame,
    olm                   => olm);
rgbLgtInst: LumValues
generic map(
    F_LGT              => true,
    F_DRK              => false,
    F_LUM              => false,
    i_data_width       => i_data_width)
port map(   
    clk                => clk,
    reset              => resetn,
    iRgb               => rgbRead,
    oRgb               => rgbLgt);
rgbDrkInst: LumValues
generic map(
    F_LGT              => false,
    F_DRK              => true,
    F_LUM              => false,
    i_data_width       => i_data_width)
port map(   
    clk                => clk,
    reset              => resetn,
    iRgb               => rgbRead,
    oRgb               => rgbDrk);
rgbLumInst: LumValues
generic map(
    F_LGT              => false,
    F_DRK              => false,
    F_LUM              => true,
    i_data_width       => i_data_width)
port map(   
    clk                => clk,
    reset              => resetn,
    iRgb               => rgbRead,
    oRgb               => rgbLum);
AvgValuesInst: AvgValues
generic map(
    i_data_width       => i_data_width)
port map(   
    clk                => clk,
    reset              => resetn,
    aRgb               => rgbLum,
    bRgb               => rgbDrk,
    cRgb               => rgbLgt,
    oRgb               => rgbAg);
rgbLgtvInst: LumValues
generic map(
    F_LGT              => true,
    F_DRK              => false,
    F_LUM              => false,
    i_data_width       => i_data_width)
port map(   
    clk                => clk,
    reset              => resetn,
    iRgb               => rgbAg,
    oRgb               => rgbLgtv);
rgbDrkvInst: LumValues
generic map(
    F_LGT              => false,
    F_DRK              => true,
    F_LUM              => false,
    i_data_width       => i_data_width)
port map(   
    clk                => clk,
    reset              => resetn,
    iRgb               => rgbAg,
    oRgb               => rgbDrkv);
rgbLumvInst: LumValues
generic map(
    F_LGT              => false,
    F_DRK              => false,
    F_LUM              => true,
    i_data_width       => i_data_width)
port map(   
    clk                => clk,
    reset              => resetn,
    iRgb               => rgbAg,
    oRgb               => rgbLumv);
AvgValuesvInst: AvgValues
generic map(
    i_data_width       => i_data_width)
port map(   
    clk                => clk,
    reset              => resetn,
    aRgb               => rgbLumv,
    bRgb               => rgbDrkv,
    cRgb               => rgbLgtv,
    oRgb               => rgbAgv);
rgbLumWriteRGBD3XInst: imageWrite
generic map (
    enImageText        => false,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    test               => "images",
    input_file         => readbmp,
    output_file        => "rgbAgv")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => rgbAgv); 
process (clk) begin
    if rising_edge(clk) then
        if (rgbLumv.red > x"50") and (rgbLumv.green > x"50") and (rgbLumv.blue > x"50")  then
            rgbnew       <= rgbLgtv;
        else
            rgbnew       <= rgbDrkv;
        end if;
    end if;
end process;
AvgValuesRGBD3XInst: imageWrite
generic map (
    enImageText        => false,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    test               => "images",
    input_file         => readbmp,
    output_file        => "rgbnew")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => rgbnew);
-- rgbAssertionInst: rgbAssertion
-- port map (                  
    -- clk                   => clk,
    -- reset                 => resetn,
    -- valid                 => rgbLumValues.valid,
    -- iRed                  => rgbLumValues.red,
    -- iGreen                => rgbLumValues.green,
    -- iBlue                 => rgbLumValues.blue);
end generate RGBASSERTION_ENABLED;
F_CGA_BRIGHT_FRAME_ENABLE: if (F_CGA_BRIGHT = true) generate
begin
    kCoeff.k1       <= x"05DC";--  1375  =  1.375
    kCoeff.k2       <= x"FF06";-- -250   = -0.250
    kCoeff.k3       <= x"FF06";-- -500   = -0.500
    kCoeff.k4       <= x"FF06";-- -500   = -0.500
    kCoeff.k5       <= x"05DC";--  1375  =  1.375
    kCoeff.k6       <= x"FF06";-- -250   = -0.250
    kCoeff.k7       <= x"FF06";-- -250   = -0.250
    kCoeff.k8       <= x"FF06";-- -500   = -0.500
    kCoeff.k9       <= x"0578";--  1375  =  1.375
    kCoeff.kSet     <= 5;
end generate F_CGA_BRIGHT_FRAME_ENABLE;
DUT_FIFO_TEST_ENABLED: if (DUT_FIFO_ENABLED = true) generate
    signal hsv               : hsvChannel;
    signal o1Rgb              : channel;
    signal o2Rgb             : channel;
    signal o3Rgb             : channel;
    signal o4Rgb             : channel;
    signal o5Rgb             : channel;
    signal rgbLumValues      : channel;
    constant init_type_Rgb   : type_Rgb := (valid => lo, red => (others => '0'), green => (others => '0'), blue => (others => '0'));
    signal rgbColors         : type_RgbArray(0 to 7) := (others => init_type_Rgb);
    signal enableWrite       : std_logic := hi;
    signal rgbRead           : channel;
    signal txCord            : coord;
    signal endOfFrame        : std_logic := lo;
    signal rgb1Read          : channel;
    signal rgb2Read          : channel;
    signal rgb3Read          : channel;
    signal rgb4Read          : channel;
    signal rgb5Read          : channel;
    signal rgb6Read          : channel;
    signal rgb7Read          : channel;
    signal rgb8Read          : channel;
    signal rgbImageFilters   : frameColors;
begin
        -- rgb1Read.valid <= rgbColors(0).valid;
        -- rgb1Read.red   <= rgbColors(0).red;
        -- rgb1Read.green <= rgbColors(0).green;
        -- rgb1Read.blue  <= rgbColors(0).blue;
        -- rgb2Read.valid <= rgbColors(1).valid;
        -- rgb2Read.red   <= rgbColors(1).red;
        -- rgb2Read.green <= rgbColors(1).green;
        -- rgb2Read.blue  <= rgbColors(1).blue;
        -- rgb3Read.valid <= rgbColors(2).valid;
        -- rgb3Read.red   <= rgbColors(2).red;
        -- rgb3Read.green <= rgbColors(2).green;
        -- rgb3Read.blue  <= rgbColors(2).blue;
        -- rgb4Read.valid <= rgbColors(3).valid;
        -- rgb4Read.red   <= rgbColors(3).red;
        -- rgb4Read.green <= rgbColors(3).green;
        -- rgb4Read.blue  <= rgbColors(3).blue;
        -- rgb5Read.valid <= rgbColors(4).valid;
        -- rgb5Read.red   <= rgbColors(4).red;
        -- rgb5Read.green <= rgbColors(4).green;
        -- rgb5Read.blue  <= rgbColors(4).blue;
        -- rgb6Read.valid <= rgbColors(5).valid;
        -- rgb6Read.red   <= rgbColors(5).red;
        -- rgb6Read.green <= rgbColors(5).green;
        -- rgb6Read.blue  <= rgbColors(5).blue;
        -- rgb7Read.valid <= rgbColors(6).valid;
        -- rgb7Read.red   <= rgbColors(6).red;
        -- rgb7Read.green <= rgbColors(6).green;
        -- rgb7Read.blue  <= rgbColors(6).blue;  
        -- rgb8Read.valid <= rgbColors(7).valid;
        -- rgb8Read.red   <= rgbColors(7).red;
        -- rgb8Read.green <= rgbColors(7).green;
        -- rgb8Read.blue  <= rgbColors(7).blue;  
ImageReadInst: imageRead
generic map (
    i_data_width          => i_data_width,
    input_file            => readbmp)
port map (                  
    clk                   => clk,
    reset                 => resetn,
    oRgb                  => rgbRead,
    oCord                 => txCord,
    endOfFrame            => endOfFrame,
    olm                   => olm);
-- ColorTrim1Inst: ColorTrim
-- generic map(
    -- i_data_width       => i_data_width)
-- port map(   
    -- clk                => clk,
    -- reset              => resetn,
    -- iRgb               => rgbRead,
    -- oRgb               => o1Rgb);
-- FiltersInst: Filters
-- generic map(
    -- F_TES                 =>  F_TES,
    -- F_TRM                 =>  F_TRM,
    -- F_RGB                 =>  F_RGB,
    -- F_SHP                 =>  F_SHP,
    -- F_BLU                 =>  F_BLU,
    -- F_EMB                 =>  F_EMB,
    -- F_YCC                 =>  F_YCC,
    -- F_SOB                 =>  F_SOB,
    -- F_CGA                 =>  F_CGA,
    -- F_HSV                 =>  F_HSV,
    -- F_HSL                 =>  F_HSL,
    -- F_CGA_TO_CGA          =>  F_CGA_TO_CGA,
    -- F_CGA_TO_HSL          =>  F_CGA_TO_HSL,
    -- F_CGA_TO_HSV          =>  F_CGA_TO_HSV,
    -- F_CGA_TO_YCC          =>  F_CGA_TO_YCC,
    -- F_CGA_TO_SHP          =>  F_CGA_TO_SHP,
    -- F_CGA_TO_BLU          =>  F_CGA_TO_BLU,
    -- F_SHP_TO_SHP          =>  F_SHP_TO_SHP,
    -- F_SHP_TO_HSL          =>  F_SHP_TO_HSL,
    -- F_SHP_TO_HSV          =>  F_SHP_TO_HSV,
    -- F_SHP_TO_YCC          =>  F_SHP_TO_YCC,
    -- F_SHP_TO_CGA          =>  F_SHP_TO_CGA,
    -- F_SHP_TO_BLU          =>  F_SHP_TO_BLU,
    -- F_BLU_TO_BLU          =>  F_BLU_TO_BLU,
    -- F_BLU_TO_HSL          =>  F_BLU_TO_HSL,
    -- F_BLU_TO_HSV          =>  F_BLU_TO_HSV,
    -- F_BLU_TO_YCC          =>  F_BLU_TO_YCC,
    -- F_BLU_TO_CGA          =>  F_BLU_TO_CGA,
    -- F_BLU_TO_SHP          =>  F_BLU_TO_SHP,
    -- img_width             =>  img_width,
    -- img_height            =>  img_height,
    -- i_data_width          =>  i_data_width)
-- port map(
    -- clk                   => clk,
    -- rst_l                 => resetn,
    -- txCord                => txCord,
    -- iRgb                  => rgbRead,
    -- iKcoeff               => kCoeff,
    -- oRgb                  => rgbImageFilters);
-- F_CGA_TEST_ENABLED : if (F_CGA = true) generate begin 
-- ImageWritecgaintPatternInst: imageWrite
-- generic map (
    -- enImageText           => false,
    -- enImageIndex          => false,
    -- i_data_width          => i_data_width,
    -- test                  => "images",
    -- input_file            => readbmp,
    -- output_file           => "cgain")
-- port map (                  
    -- pixclk                => clk,
    -- enableWrite           => enableWrite,
    -- iRgb                  => rgbImageFilters.cgain);
-- end generate F_CGA_TEST_ENABLED;
ColorTrim1Inst: ColorTrim
generic map(
    i_data_width       => i_data_width)
port map(   
    clk                => clk,
    reset              => resetn,
    iRgb               => rgbRead,
    oRgb               => o1Rgb);
ColorAvgInst: ColorAvg
generic map(
    i_data_width       => i_data_width)
port map(   
    clk                => clk,
    reset              => resetn,
    iRgb               => o1Rgb,
    oRgb               => o2Rgb);
ColorTrim3Inst: ColorTrim
generic map(
    i_data_width       => i_data_width)
port map(   
    clk                => clk,
    reset              => resetn,
    iRgb               => o2Rgb,
    oRgb               => o3Rgb);
ColorTrim3XXInst: ColorTrim
generic map(
    i_data_width       => i_data_width)
port map(   
    clk                => clk,
    reset              => resetn,
    iRgb               => rgbImageFilters.cgain,
    oRgb               => o4Rgb);  
Image1WriteRGB2XInst: imageWrite
generic map (
    enImageText        => false,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    test               => "images",
    input_file         => readbmp,
    output_file        => "o4Rgb")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => o4Rgb);
ColorTrim3XDInst: ColorTrim
generic map(
    i_data_width       => i_data_width)
port map(   
    clk                => clk,
    reset              => resetn,
    iRgb               => rgbImageFilters.hsv,
    oRgb               => o5Rgb); 
Image1WriteRGBD3XInst: imageWrite
generic map (
    enImageText        => false,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    test               => "images",
    input_file         => readbmp,
    output_file        => "o5Rgb")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => o5Rgb);
FiltersInst: Filters
generic map(
    F_TES                 =>  F_TES,
    F_LUM                 =>  F_LUM,
    F_TRM                 =>  F_TRM,
    F_RGB                 =>  F_RGB,
    F_SHP                 =>  F_SHP,
    F_BLU                 =>  F_BLU,
    F_EMB                 =>  F_EMB,
    F_YCC                 =>  F_YCC,
    F_SOB                 =>  F_SOB,
    F_CGA                 =>  F_CGA,
    F_HSV                 =>  F_HSV,
    F_HSL                 =>  F_HSL,
    F_CGA_TO_CGA          =>  F_CGA_TO_CGA,
    F_CGA_TO_HSL          =>  F_CGA_TO_HSL,
    F_CGA_TO_HSV          =>  F_CGA_TO_HSV,
    F_CGA_TO_YCC          =>  F_CGA_TO_YCC,
    F_CGA_TO_SHP          =>  F_CGA_TO_SHP,
    F_CGA_TO_BLU          =>  F_CGA_TO_BLU,
    F_SHP_TO_SHP          =>  F_SHP_TO_SHP,
    F_SHP_TO_HSL          =>  F_SHP_TO_HSL,
    F_SHP_TO_HSV          =>  F_SHP_TO_HSV,
    F_SHP_TO_YCC          =>  F_SHP_TO_YCC,
    F_SHP_TO_CGA          =>  F_SHP_TO_CGA,
    F_SHP_TO_BLU          =>  F_SHP_TO_BLU,
    F_BLU_TO_BLU          =>  F_BLU_TO_BLU,
    F_BLU_TO_HSL          =>  F_BLU_TO_HSL,
    F_BLU_TO_HSV          =>  F_BLU_TO_HSV,
    F_BLU_TO_YCC          =>  F_BLU_TO_YCC,
    F_BLU_TO_CGA          =>  F_BLU_TO_CGA,
    F_BLU_TO_SHP          =>  F_BLU_TO_SHP,
    img_width             =>  img_width,
    img_height            =>  img_height,
    i_data_width          =>  i_data_width)
port map(
    clk                   => clk,
    rst_l                 => resetn,
    txCord                => txCord,
    iRgb                  => o3Rgb,
    iKcoeff               => kCoeff,
    oRgb                  => rgbImageFilters);
F_HSV_TEST_ENABLED : if (F_HSV = true) generate begin 
ImageWritehsvInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "hsv")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.hsv);
end generate F_HSV_TEST_ENABLED;
F_CGA_TEST_ENABLED : if (F_CGA = true) generate begin 
ImageWritecgaintPatternInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "cgain")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.cgain);
end generate F_CGA_TEST_ENABLED;
F_YCC_TEST_ENABLED : if (F_YCC = true) generate begin 
ImageWriteycbcrtPatternInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "ycbcr")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.ycbcr);
end generate F_YCC_TEST_ENABLED;
-- LumValuesInst: LumValues
-- generic map(
    -- i_data_width       => i_data_width)
-- port map(   
    -- clk                => clk,
    -- reset              => resetn,
    -- iRgb               => o1Rgb,
    -- oRgb               => rgbLumValues);
-- Image1WriteRGB3Inst: imageWrite
-- generic map (
    -- enImageText        => false,
    -- enImageIndex       => false,
    -- i_data_width       => i_data_width,
    -- test               => "images",
    -- input_file         => readbmp,
    -- output_file        => "rgbLumValues")
-- port map (                  
    -- pixclk             => clk,
    -- enableWrite        => enableWrite,
    -- iRgb               => rgbLumValues);
-- ColorSpaceLimitsInst: ColorSpaceLimits
-- generic map(
    -- i_data_width        => i_data_width)
-- port map(   
    -- clk                 => clk,
    -- reset               => resetn,
    -- iRgb                => rgbImageFilters.blur,
    -- rgbColors           => rgbColors);
-- Image1WriteRGBInst: imageWrite
-- generic map (
    -- enImageText        => false,
    -- enImageIndex       => false,
    -- i_data_width       => i_data_width,
    -- test               => "images",
    -- input_file         => readbmp,
    -- output_file        => "edgeO1")
-- port map (                  
    -- pixclk             => clk,
    -- enableWrite        => enableWrite,
    -- iRgb               => rgb1Read);
-- Image2WriteRGBInst: imageWrite
-- generic map (
    -- enImageText        => false,
    -- enImageIndex       => false,
    -- i_data_width       => i_data_width,
    -- test               => "images",
    -- input_file         => readbmp,
    -- output_file        => "edgeO2")
-- port map (                  
    -- pixclk             => clk,
    -- enableWrite        => enableWrite,
    -- iRgb               => rgb2Read);
-- Image3WriteRGBInst: imageWrite
-- generic map (
    -- enImageText        => false,
    -- enImageIndex       => false,
    -- i_data_width       => i_data_width,
    -- test               => "images",
    -- input_file         => readbmp,
    -- output_file        => "edgeO3")
-- port map (                  
    -- pixclk             => clk,
    -- enableWrite        => enableWrite,
    -- iRgb               => rgb3Read);
-- ImageWriteCgainToshpInst: imageWrite
-- generic map (
    -- enImageText           => false,
    -- enImageIndex          => false,
    -- i_data_width          => i_data_width,
    -- test                  => "images",
    -- input_file            => readbmp,
    -- output_file           => "oRgb")
-- port map (                  
    -- pixclk                => clk,
    -- enableWrite           => enableWrite,
    -- iRgb                  => oRgb);
end generate DUT_FIFO_TEST_ENABLED;
------------------------------------------------------------------------------
-- GENERATE FILTERS_ENABLED
------------------------------------------------------------------------------
FILTERS_TEST_ENABLED : if (DUT_FILTERS_ENABLED = true) generate
    signal txCord                  : coord;
    signal rgbRead                 : channel;
    signal rgbImageFilters         : frameColors;
    signal rgbCoord                : region;
    signal reset                   : std_logic;
    signal endOfFrame              : std_logic := lo;
    signal enableWrite             : std_logic := hi;
begin
reset <= not(resetn);
ImageReadInst: imageRead
generic map (
    i_data_width          => i_data_width,
    input_file            => readbmp)
port map (                  
    clk                   => clk,
    reset                 => resetn,
    oRgb                  => rgbRead,
    oCord                 => txCord,
    endOfFrame            => endOfFrame,
    olm                   => olm);
-- rgbAssertionInst: rgbAssertion
-- port map (                  
    -- clk                   => clk,
    -- reset                 => reset,
    -- valid                 => rgbRead.valid,
    -- iRed                  => rgbRead.red,
    -- iGreen                => rgbRead.green,
    -- iBlue                 => rgbRead.blue);
FiltersInst: Filters
generic map(
    F_TES                 =>  F_TES,
    F_LUM                 =>  F_LUM,
    F_TRM                 =>  F_TRM,
    F_RGB                 =>  F_RGB,
    F_SHP                 =>  F_SHP,
    F_BLU                 =>  F_BLU,
    F_EMB                 =>  F_EMB,
    F_YCC                 =>  F_YCC,
    F_SOB                 =>  F_SOB,
    F_CGA                 =>  F_CGA,
    F_HSV                 =>  F_HSV,
    F_HSL                 =>  F_HSL,
    F_CGA_TO_CGA          =>  F_CGA_TO_CGA,
    F_CGA_TO_HSL          =>  F_CGA_TO_HSL,
    F_CGA_TO_HSV          =>  F_CGA_TO_HSV,
    F_CGA_TO_YCC          =>  F_CGA_TO_YCC,
    F_CGA_TO_SHP          =>  F_CGA_TO_SHP,
    F_CGA_TO_BLU          =>  F_CGA_TO_BLU,
    F_SHP_TO_SHP          =>  F_SHP_TO_SHP,
    F_SHP_TO_HSL          =>  F_SHP_TO_HSL,
    F_SHP_TO_HSV          =>  F_SHP_TO_HSV,
    F_SHP_TO_YCC          =>  F_SHP_TO_YCC,
    F_SHP_TO_CGA          =>  F_SHP_TO_CGA,
    F_SHP_TO_BLU          =>  F_SHP_TO_BLU,
    F_BLU_TO_BLU          =>  F_BLU_TO_BLU,
    F_BLU_TO_HSL          =>  F_BLU_TO_HSL,
    F_BLU_TO_HSV          =>  F_BLU_TO_HSV,
    F_BLU_TO_YCC          =>  F_BLU_TO_YCC,
    F_BLU_TO_CGA          =>  F_BLU_TO_CGA,
    F_BLU_TO_SHP          =>  F_BLU_TO_SHP,
    img_width             =>  img_width,
    img_height            =>  img_height,
    i_data_width          =>  i_data_width)
port map(
    clk                   => clk,
    rst_l                 => resetn,
    txCord                => txCord,
    iRgb                  => rgbRead,
    iKcoeff               => kCoeff,
    oRgb                  => rgbImageFilters);
F_CGA_TO_SHP_TEST_ENABLED : if (F_CGA_TO_SHP = true) generate begin  
ImageWriteCgainToshpInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "cgainToShp")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.cgainToShp);
end generate F_CGA_TO_SHP_TEST_ENABLED;
F_CGA_TO_BLU_TEST_ENABLED : if (F_CGA_TO_BLU = true) generate begin  
ImageWritcgainTobluInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "cgainToBlu")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.cgainToBlu);
end generate F_CGA_TO_BLU_TEST_ENABLED;
F_CGA_TO_YCC_TEST_ENABLED : if (F_CGA_TO_YCC = true) generate begin  
ImageWritaetextRGBInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "cgainYcbcr")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.cgainToYcbcr);
end generate F_CGA_TO_YCC_TEST_ENABLED;
F_CGA_TO_HSV_TEST_ENABLED : if (F_CGA_TO_HSV = true) generate begin  
ImageWriteCgainInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "cgainHsv")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.cgainToHsv);
end generate F_CGA_TO_HSV_TEST_ENABLED;
F_CGA_TO_HSL_TEST_ENABLED : if (F_CGA_TO_HSL = true) generate begin  
ImageWriteCgainToHslInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "cgainToHsl")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.cgainToHsl);
end generate F_CGA_TO_HSL_TEST_ENABLED;
F_CGA_TO_CGA_TEST_ENABLED : if (F_CGA_TO_CGA = true) generate begin  
ImageWriteCgainToCgainInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "CgainToCgain")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.cgainToCgain);
end generate F_CGA_TO_CGA_TEST_ENABLED;
F_SOB_TEST_ENABLED : if (F_SOB = true) generate begin  
ImageWriteSobelInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "sobel")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.sobel);
end generate F_SOB_TEST_ENABLED;
F_TES_TEST_ENABLED : if (F_TES = true) generate begin 
ImageWritetPatternInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "tPattern")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.tPattern);
end generate F_TES_TEST_ENABLED;
F_RGB_TEST_ENABLED : if (F_RGB = true) generate begin 
ImageWritesharptPatternInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "inrgb")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.inrgb);
end generate F_RGB_TEST_ENABLED;
F_SHP_TEST_ENABLED : if (F_SHP = true) generate begin 
ImageWritesharptPatternInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "sharp")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.sharp);
end generate F_SHP_TEST_ENABLED;
F_HSV_TEST_ENABLED : if (F_HSV = true) generate begin 
ImageWritehsvInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "hsv")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.hsv);
end generate F_HSV_TEST_ENABLED;
F_HSL_TEST_ENABLED : if (F_HSL = true) generate begin 
ImageWritehsltPatternInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "hsl")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.hsl);
end generate F_HSL_TEST_ENABLED;
F_EMB_TEST_ENABLED : if (F_EMB = true) generate begin 
ImageWriteembostPatternInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "embos")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.embos);
end generate F_EMB_TEST_ENABLED;
F_BLU_TEST_ENABLED : if (F_BLU = true) generate begin 
ImageWriteblurtPatternInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "blur")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.blur);
end generate F_BLU_TEST_ENABLED;
F_CGA_TEST_ENABLED : if (F_CGA = true) generate begin 
ImageWritecgaintPatternInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "cgain")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.cgain);
end generate F_CGA_TEST_ENABLED;
F_YCC_TEST_ENABLED : if (F_YCC = true) generate begin 
ImageWriteycbcrtPatternInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "ycbcr")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.ycbcr);
end generate F_YCC_TEST_ENABLED;
F_SHP_TO_SHP_TEST_ENABLED : if (F_SHP_TO_SHP = true) generate begin  
ImageWriteCgainToCgainInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "shpToShp")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.shpToShp);
end generate F_SHP_TO_SHP_TEST_ENABLED;
F_SHP_TO_HSL_TEST_ENABLED : if (F_SHP_TO_HSL = true) generate begin  
ImageWriteCgainToCgainInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "shpToHsl")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.shpToHsl);
end generate F_SHP_TO_HSL_TEST_ENABLED;
F_SHP_TO_HSV_TEST_ENABLED : if (F_SHP_TO_HSV = true) generate begin  
ImageWriteCgainToCgainInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "shpToHsv")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.shpToHsv);
end generate F_SHP_TO_HSV_TEST_ENABLED;
F_SHP_TO_YCC_TEST_ENABLED : if (F_SHP_TO_YCC = true) generate begin  
ImageWriteCgainToCgainInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "shpToYcbcr")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.shpToYcbcr);
end generate F_SHP_TO_YCC_TEST_ENABLED;
F_SHP_TO_CGA_TEST_ENABLED : if (F_SHP_TO_CGA = true) generate begin  
ImageWriteCgainToCgainInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "shpToCgain")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.shpToCgain);
end generate F_SHP_TO_CGA_TEST_ENABLED;
F_SHP_TO_BLU_TEST_ENABLED : if (F_SHP_TO_BLU = true) generate begin  
ImageWriteCgainToCgainInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "shpToBlu")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.shpToBlu);
end generate F_SHP_TO_BLU_TEST_ENABLED;
F_BLU_TO_BLU_TEST_ENABLED : if (F_BLU_TO_BLU = true) generate begin  
ImageWriteCgainToCgainInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "bluToBlu")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.bluToBlu);
end generate F_BLU_TO_BLU_TEST_ENABLED;
F_BLU_TO_HSL_TEST_ENABLED : if (F_BLU_TO_HSL = true) generate begin  
ImageWriteCgainToCgainInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "bluToHsl")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.bluToHsl);
end generate F_BLU_TO_HSL_TEST_ENABLED;
F_BLU_TO_HSV_TEST_ENABLED : if (F_BLU_TO_HSV = true) generate begin  
ImageWriteCgainToCgainInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "bluToHsv")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.bluToHsv);
end generate F_BLU_TO_HSV_TEST_ENABLED;
F_BLU_TO_YCC_TEST_ENABLED : if (F_BLU_TO_YCC = true) generate begin  
ImageWriteCgainToCgainInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "bluToYcc")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.bluToYcc);
end generate F_BLU_TO_YCC_TEST_ENABLED;
F_BLU_TO_CGA_TEST_ENABLED : if (F_BLU_TO_CGA = true) generate begin  
ImageWriteCgainToCgainInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "bluToCga")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.bluToCga);
end generate F_BLU_TO_CGA_TEST_ENABLED;
F_BLU_TO_SHP_TEST_ENABLED : if (F_BLU_TO_SHP = true) generate begin  
ImageWriteCgainToCgainInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => "images",
    input_file            => readbmp,
    output_file           => "bluToShp")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.bluToShp);
end generate F_BLU_TO_SHP_TEST_ENABLED;
end generate FILTERS_TEST_ENABLED;
------------------------------------------------------------------------------
-- GENERATE FRAMEPROCESS_ENABLED
------------------------------------------------------------------------------
IMAGEKERNELS_TEST_ENABLED : if (DUT_IMAGEKERNELS_ENABLED = true) generate
    signal txCord           : coord;
    signal rgbRead          : channel;
    signal rgbImageKernelv1 : colors;
    signal cgain            : channel;
    signal edgeO            : channel;
    signal sharp            : channel;
    signal rgbCoord         : region;
    signal als              : coefficient;
    signal iKcoeff          : kernelCoeff;
    signal textRGB          : channel;
    signal pixOn            : std_logic;
    signal enableWrite      : std_logic;
    signal endOfFrame       : std_logic;
    signal edgeValid        : std_logic_vector(4 downto 0);
    signal hsv              : hsvChannel;
    signal rgbHsv1          : channel;
    signal rgbHsv           : channel;
    signal kls              : coefficient;
    constant init_type_Rgb: type_Rgb := (valid => lo, red => (others => '0'), green => (others => '0'), blue => (others => '0'));
    signal rgbColors         : type_RgbArray(0 to 7) := (others => init_type_Rgb);
    signal rgb1Read          : channel;
    signal rgb2Read          : channel;
    signal rgb3Read          : channel;
    signal rgb4Read          : channel;
    signal rgb5Read          : channel;
    signal rgb6Read          : channel;
    signal rgb7Read          : channel;
    signal rgb8Read          : channel;
    signal ycbcr             : channel;
begin
        enableWrite    <= hi;
        rgb1Read.valid <= rgbColors(0).valid;
        rgb1Read.red   <= rgbColors(0).red;
        rgb1Read.green <= rgbColors(0).green;
        rgb1Read.blue  <= rgbColors(0).blue;
        rgb2Read.valid <= rgbColors(1).valid;
        rgb2Read.red   <= rgbColors(1).red;
        rgb2Read.green <= rgbColors(1).green;
        rgb2Read.blue  <= rgbColors(1).blue;
        rgb3Read.valid <= rgbColors(2).valid;
        rgb3Read.red   <= rgbColors(2).red;
        rgb3Read.green <= rgbColors(2).green;
        rgb3Read.blue  <= rgbColors(2).blue;
        rgb4Read.valid <= rgbColors(3).valid;
        rgb4Read.red   <= rgbColors(3).red;
        rgb4Read.green <= rgbColors(3).green;
        rgb4Read.blue  <= rgbColors(3).blue;
        rgb5Read.valid <= rgbColors(4).valid;
        rgb5Read.red   <= rgbColors(4).red;
        rgb5Read.green <= rgbColors(4).green;
        rgb5Read.blue  <= rgbColors(4).blue;
        rgb6Read.valid <= rgbColors(5).valid;
        rgb6Read.red   <= rgbColors(5).red;
        rgb6Read.green <= rgbColors(5).green;
        rgb6Read.blue  <= rgbColors(5).blue;
        rgb7Read.valid <= rgbColors(6).valid;
        rgb7Read.red   <= rgbColors(6).red;
        rgb7Read.green <= rgbColors(6).green;
        rgb7Read.blue  <= rgbColors(6).blue;  
        rgb8Read.valid <= rgbColors(7).valid;
        rgb8Read.red   <= rgbColors(7).red;
        rgb8Read.green <= rgbColors(7).green;
        rgb8Read.blue  <= rgbColors(7).blue;  
ImageReadInst: imageRead
generic map (
    i_data_width       => i_data_width,
    input_file         => readbmp)
port map (                  
    clk                => clk,
    reset              => resetn,
    oRgb               => rgbRead,
    oCord              => txCord,
    endOfFrame         => endOfFrame,
    olm                   => olm);
ImageKernelInst: Kernel
generic map(
    INRGB_FRAME         => true,
    SHARP_FRAME         => false,
    BLURE_FRAME         => false,
    EMBOS_FRAME         => false,
    YCBCR_FRAME         => false,
    SOBEL_FRAME         => false,
    CGAIN_FRAME         => false,
    HSV_FRAME           => false,
    HSL_FRAME           => false,
    img_width           => img_width,
    img_height          => img_height,
    i_data_width        => i_data_width)
port map(
    clk                 => clk,
    rst_l               => resetn,
    txCord              => txCord,
    iRgb                => rgbRead,
    iKcoeff             => iKcoeff,
    oEdgeValid          => edgeValid(1),
    oRgb                => rgbImageKernelv1);
ImageWritaetextRGBInst: imageWrite
generic map (
    enImageText        => false,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    test               => "images",
    input_file         => readbmp,
    output_file        => "textRGB")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => rgbImageKernelv1.ycbcr);
ImageWriteCgainInst: imageWrite
generic map (
    enImageText        => false,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    test               => "images",
    input_file         => readbmp,
    output_file        => "cgain")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => rgbImageKernelv1.cgain);
hsvInst: hsv_c
generic map(
    i_data_width       => i_data_width)
port map(   
    clk                => clk,
    reset              => resetn,
    iRgb               => rgbRead,
    oHsv               => hsv);
    ----------------------------
    rgbHsv.red            <= hsv.h;
    rgbHsv.green          <= hsv.s;
    rgbHsv.blue           <= hsv.v;
    rgbHsv.valid          <= hsv.valid;    
ycbcrInst: rgb_ycbcr
generic map(
    i_data_width         => i_data_width,
    i_precision          => 16,
    i_full_range         => TRUE)
port map(
    clk                  => clk,
    rst_l                => resetn,
    iRgb                 => rgbRead,
    y                    => ycbcr.red,
    cb                   => ycbcr.green,
    cr                   => ycbcr.blue,
    oValid               => ycbcr.valid);
ColorSpaceLimitsInst: ColorSpaceLimits
generic map(
    i_data_width        => i_data_width)
port map(   
    clk                 => clk,
    reset               => resetn,
    iRgb                => ycbcr,
    rgbColors           => rgbColors);
ImageKWriteRGBInst: imageWrite
generic map (
    enImageText        => false,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    test               => "images",
    input_file         => readbmp,
    output_file        => "ycbcr")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => ycbcr);
ImageYWriteRGBInst: imageWrite
generic map (
    enImageText        => false,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    test               => "images",
    input_file         => readbmp,
    output_file        => "rgbHsv")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => rgbHsv);
ImageXWriteRGBInst: imageWrite
generic map (
    enImageText        => true,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    test               => "images",
    input_file         => readbmp,
    output_file        => "rgb")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => rgbRead);
Image1WriteRGBInst: imageWrite
generic map (
    enImageText        => false,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    test               => "images",
    input_file         => readbmp,
    output_file        => "edgeO1")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => rgb1Read);
Image2WriteRGBInst: imageWrite
generic map (
    enImageText        => false,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    test               => "images",
    input_file         => readbmp,
    output_file        => "edgeO2")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => rgb2Read);
Image3WriteRGBInst: imageWrite
generic map (
    enImageText        => false,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    test               => "images",
    input_file         => readbmp,
    output_file        => "edgeO3")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => rgb3Read);
Image4WriteRGBInst: imageWrite
generic map (
    enImageText        => false,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    test               => "images",
    input_file         => readbmp,
    output_file        => "edgeO4")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => rgb4Read);
Image5WriteRGBInst: imageWrite
generic map (
    enImageText        => false,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    test               => "images",
    input_file         => readbmp,
    output_file        => "edgeO5")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => rgb5Read);
Image6WriteRGBInst: imageWrite
generic map (
    enImageText        => false,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    test               => "images",
    input_file         => readbmp,
    output_file        => "edgeO6")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => rgb6Read);
Image7WriteRGBInst: imageWrite
generic map (
    enImageText        => false,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    test               => "images",
    input_file         => readbmp,
    output_file        => "edgeO7")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => rgb7Read);
Image8WriteRGBInst: imageWrite
generic map (
    enImageText        => false,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    test               => "images",
    input_file         => readbmp,
    output_file        => "edgeO8")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => rgb8Read);
-- edgeObjectsInst: edgeObjects
-- generic map(
    -- i_data_width        => i_data_width)
-- port map(   
    -- clk                 => clk,
    -- rst_l               => resetn,
    -- iRgb                => rgbRead,
    -- oRgbRemix           => edgeO);
-- ImageKernelInst: Kernel
-- generic map(
    -- INRGB_FRAME         => true,
    -- SHARP_FRAME         => false,
    -- BLURE_FRAME         => false,
    -- EMBOS_FRAME         => false,
    -- YCBCR_FRAME         => false,
    -- SOBEL_FRAME         => false,
    -- CGAIN_FRAME         => true,
    -- img_width           => img_width,
    -- img_height          => img_height,
    -- i_data_width        => i_data_width)
-- port map(
    -- clk                 => clk,
    -- rst_l               => resetn,
    -- txCord              => txCord,
    -- iRgb                => rgbRead,
    -- iKcoeff             => iKcoeff,
    -- oEdgeValid          => edgeValid(1),
    -- oRgb                => rgbImageKernelv1);
-- ImageKernelInst: ImageKernel
-- generic map(
    -- SHARP_FRAME         => false,
    -- BLURE_FRAME         => false,
    -- EMBOS_FRAME         => false,
    -- YCBCR_FRAME         => true,
    -- SOBEL_FRAME         => true,
    -- CGAIN_FRAME         => true,
    -- img_width           => img_width,
    -- i_data_width        => i_data_width)
-- port map(           
    -- clk                 => clk,
    -- rst_l               => resetn,
    -- iRgb                => rgbRead,
    -- als                 => als,
    -- oEdgeValid          => edgeValid(1),
    -- oRgb                => rgbImageKernelv1);
-- ImageWriteSharpInst: imageWrite
-- generic map (
    -- enImageText        => false,
    -- enImageIndex       => false,
    -- i_data_width       => i_data_width,
    -- test               => "images",
    -- input_file         => readbmp,
    -- output_file        => "sharp")
-- port map (                  
    -- pixclk             => clk,
    -- enableWrite        => enableWrite,
    -- iRgb               => rgbImageKernelv1.sharp);
-- ImageWriteBlurInst: imageWrite
-- generic map (
    -- enImageText        => false,
    -- enImageIndex       => false,
    -- i_data_width       => i_data_width,
    -- test               => "images",
    -- input_file         => readbmp,
    -- output_file        => "blur")
-- port map (                  
    -- pixclk             => clk,
    -- enableWrite        => enableWrite,
    -- iRgb               => rgbImageKernelv1.blur);
-- ImageWriteEmbosInst: imageWrite
-- generic map (
    -- enImageText        => false,
    -- enImageIndex       => false,
    -- i_data_width       => i_data_width,
    -- test               => "images",
    -- input_file         => readbmp,
    -- output_file        => "embos")
-- port map (                  
    -- pixclk             => clk,
    -- enableWrite        => enableWrite,
    -- iRgb               => rgbImageKernelv1.embos);
-- ImageWriteSobelInst: imageWrite
-- generic map (
    -- enImageText        => false,
    -- enImageIndex       => false,
    -- i_data_width       => i_data_width,
    -- test               => "images",
    -- input_file         => readbmp,
    -- output_file        => "rgbHsv")
-- port map (                  
    -- pixclk             => clk,
    -- enableWrite        => enableWrite,
    -- iRgb               => rgbHsv);
-- hsvInst: hsv_c
-- generic map(
    -- i_data_width       => i_data_width)
-- port map(   
    -- clk                => clk,
    -- reset              => resetn,
    -- iRgb               => cgain,
    -- oHsv               => hsv);
    ------------------------------
    -- rgbHsv.red            <= hsv.h;
    -- rgbHsv.green          <= hsv.s;
    -- rgbHsv.blue           <= hsv.v;
    -- rgbHsv.valid          <= hsv.valid;
    ------------------------------
-- ImageWriteCgAainInst: imageWrite
-- generic map (
    -- enImageText        => false,
    -- enImageIndex       => false,
    -- i_data_width       => i_data_width,
    -- test               => "images",
    -- input_file         => readbmp,
    -- output_file        => "ycbcr")
-- port map (                  
    -- pixclk             => clk,
    -- enableWrite        => enableWrite,
    -- iRgb               => rgbImageKernelv1.ycbcr);
-- ImageWriteYcbcrInst: imageWrite
-- generic map (
    -- enImageText        => false,
    -- enImageIndex       => false,
    -- i_data_width       => i_data_width,
    -- test               => "images",
    -- input_file         => readbmp,
    -- output_file        => "rgbHsv")
-- port map (                  
    -- pixclk             => clk,
    -- enableWrite        => enableWrite,
    -- iRgb               => rgbHsv);
end generate IMAGEKERNELS_TEST_ENABLED;
------------------------------------------------------------------------------
-- GENERATE IMAGES_FILTERS_ENABLED
------------------------------------------------------------------------------
IMAGES_FILTERS_ENABLED : if (DUT_FILTERS_TESTENABLED = true) generate
    --------------------------------------------------------------------------
    signal txCord           : coord;
    signal endOfFrame       : std_logic;
    signal enableWrite      : std_logic := hi;
    signal rgbCoord         : region;
    signal rgb              : channel;
    signal rgbRed           : channel;
    signal rgbGreen         : channel;
    signal rgbBlue          : channel;
    signal rgbOut           : channel;
    signal als              : coefficient;
    signal enable           : std_logic;
    signal d1en             : std_logic;
    signal d2en             : std_logic;
    signal d3en             : std_logic;
    signal d4en             : std_logic;
    signal d5en             : std_logic;
    signal rCountAddress    : integer;
    signal rAddress         : std_logic_vector(15 downto 0);
    signal rgb1x            : channel;
    signal rgb2x            : channel;
    signal sharp            : channel;
    signal blur             : channel;
    signal d2RGB            : std_logic_vector(23 downto 0) := (others => '0');
    signal kls              : coefficient;
    --------------------------------------------------------------------------
begin
    --------------------------------------------------------------------------
IMAGE1_imageRead: imageRead
generic map (
    i_data_width       => i_data_width,
    input_file         => readbmp)
port map (                  
    clk                => clk,
    reset              => resetn,
    oRgb               => rgb,
    oCord              => txCord,
    endOfFrame         => endOfFrame,
    olm                   => olm);
    --------------------------------------------------------------------------
-- sharpFilterInst: sharpFilter
-- generic map(
    -- i_data_width        => i_data_width,
    -- img_width           => img_width,
    -- adwrWidth           => adwrWidth,
    -- addrWidth           => addrWidth)
-- port map(   
    -- clk                 => clk,
    -- rst_l               => resetn,
    -- iRgb                => rgb,
    -- endOfFrame          => endOfFrame,
    -- kls                 => kls,
    -- oRgb                => sharp);
-- WRITEIMAGEsharp: imageWrite
-- generic map (
    -- enImageText        => false,
    -- enImageIndex       => false,
    -- i_data_width       => i_data_width,
    -- test               => "images",
    -- input_file         => readbmp,
    -- output_file        => "sharp")
-- port map (                  
    -- pixclk             => clk,
    -- enableWrite        => enableWrite,
    -- iRgb               => sharp);
    --------------------------------------------------------------------------
-- blurFilter1xInst: blurFilter
-- generic map(
    -- iMSB                => blurMsb,
    -- iLSB                => blurLsb,
    -- i_data_width        => i_data_width,
    -- img_width           => img_width,
    -- adwrWidth           => adwrWidth,
    -- addrWidth           => addrWidth)
-- port map(
    -- clk                 => clk,
    -- rst_l               => resetn,
    -- iRgb                => rgb,
    -- oRgb                => blur);
-- WRITEIMAGEblur: imageWrite
-- generic map (
    -- enImageText        => false,
    -- enImageIndex       => false,
    -- i_data_width       => i_data_width,
    -- test               => "images",
    -- input_file         => readbmp,
    -- output_file        => "blur")
-- port map (                  
    -- pixclk             => clk,
    -- enableWrite        => enableWrite,
    -- iRgb               => blur);
    --------------------------------------------------------------------------
    -- rgbMac1.red      <= vTapRGB0x(23 downto 16);
    -- rgbMac1.green    <= vTapRGB1x(23 downto 16);
    -- rgbMac1.blue     <= vTapRGB2x(23 downto 16);
    -- rgbMac1.valid    <= enable;
    -- rgbMac2.red      <= vTapRGB0x(15 downto 8);
    -- rgbMac2.green    <= vTapRGB1x(15 downto 8);
    -- rgbMac2.blue     <= vTapRGB2x(15 downto 8);
    -- rgbMac2.valid    <= enable;
    -- rgbMac3.red      <= vTapRGB0x(7 downto 0);
    -- rgbMac3.green    <= vTapRGB1x(7 downto 0);
    -- rgbMac3.blue     <= vTapRGB2x(7 downto 0);
    -- rgbMac3.valid    <= enable;
    --------------------------------------------------------------------------
-- MACrInst: colorCorrection
-- generic map(
    -- i_data_width        => i_data_width)
-- port map(           
    -- clk                 => clk,
    -- rst_l               => resetn,
    -- iRgb                => rgbMac1,
    -- als                 => als,    
    -- oRgb                => rgbRed);
-- MACgInst: colorCorrection
-- generic map(
    -- img_width           => img_width,
    -- i_data_width        => i_data_width)
-- port map(           
    -- clk                 => clk,
    -- rst_l               => resetn,
    -- iRgb                => rgb,
    -- als                 => als,    
    -- oRgb                => rgbOut);
-- MACbInst: colorCorrection
-- generic map(
    -- i_data_width        => i_data_width)
-- port map(           
    -- clk                 => clk,
    -- rst_l               => resetn,
    -- iRgb                => rgbMac3,
    -- als                 => als,    
    -- oRgb                => rgbBlue);
WRITEIMAGE1: imageWrite
generic map (
    enImageText        => false,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    test               => "images",
    input_file         => readbmp,
    output_file        => "rgbOutX")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => rgbOut);
end generate IMAGES_FILTERS_ENABLED;
------------------------------------------------------------------------------
-- END GENERATE
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- GENERATE DUT_CC_TEST_ENABLED
------------------------------------------------------------------------------
CC_TEST_ENABLED : if (DUT_CC_TEST_ENABLED = true) generate
    signal txCord           : coord;
    signal rgbIn            : channel;
    signal rgbCoord         : region;
    signal hsv              : hsvChannel;
    signal rgbCorrect       : channel;
    signal rgbCorrect2      : channel;
    signal enableWrite      : std_logic;
    signal endOfFrame       : std_logic;
    signal als              : coefficient;
    signal alv              : coefficient;
    signal kSet1            : coeffData;
begin
enableWrite             <= hi;
kernel1ReadInst: kernel1Read
generic map (
    s_data_width    => s_data_width,
    input_file      => "kernel1ReadData")
port map (                  
    clk               => clk,
    reset             => resetn,
    kSet1Out          => kSet1);  
ImageReadInst: imageRead
generic map (
    i_data_width       => i_data_width,
    input_file         => readbmp)
port map (                  
    clk                => clk,
    reset              => resetn,
    oRgb               => rgbIn,
    oCord              => txCord,
    endOfFrame         => endOfFrame,
    olm                   => olm);
-- colorCorrection1Inst: colorCorrection
-- generic map(
    -- img_width           => img_width,
    -- i_data_width        => i_data_width)
-- port map(           
    -- clk                 => clk,
    -- rst_l               => resetn,
    -- iRgb                => rgbIn,
    -- als                 => als,    
    -- oRgb                => rgbCorrect);
-- colorCorrection2Inst: colorCorrection
-- generic map(
    -- img_width           => img_width,
    -- i_data_width        => i_data_width)
-- port map(           
    -- clk                 => clk,
    -- rst_l               => resetn,
    -- iRgb                => rgbCorrect,
    -- als                 => alv,    
    -- oRgb                => rgbCorrect2);
    -- alv.k1              <= std_logic_vector(resize(signed(to_slv(to_sfixed(1.375,4,-3))), alv.k1'length));
    -- alv.k2              <= std_logic_vector(resize(signed(to_slv(to_sfixed(-0.125,4,-3))), alv.k2'length));
    -- alv.k3              <= std_logic_vector(resize(signed(to_slv(to_sfixed(-0.500,4,-3))), alv.k3'length));
    -- alv.k4              <= std_logic_vector(resize(signed(to_slv(to_sfixed(-0.250,4,-3))), alv.k4'length));
    -- alv.k5              <= std_logic_vector(resize(signed(to_slv(to_sfixed(1.375,4,-3))), alv.k5'length));
    -- alv.k6              <= std_logic_vector(resize(signed(to_slv(to_sfixed(-0.500,4,-3))), alv.k6'length));
    -- alv.k7              <= std_logic_vector(resize(signed(to_slv(to_sfixed(-0.250,4,-3))), alv.k7'length));
    -- alv.k8              <= std_logic_vector(resize(signed(to_slv(to_sfixed(-0.500,4,-3))), alv.k8'length));
    -- alv.k9              <= std_logic_vector(resize(signed(to_slv(to_sfixed(1.375,4,-3))), alv.k9'length));
    -- alv.config          <= 1;
    -- als.k1              <= std_logic_vector(resize(signed(to_slv(to_sfixed(1.250,4,-3))), als.k1'length));
    -- als.k2              <= std_logic_vector(resize(signed(to_slv(to_sfixed(-0.125,4,-3))), als.k1'length));
    -- als.k3              <= std_logic_vector(resize(signed(to_slv(to_sfixed(-0.125,4,-3))), als.k1'length));
    -- als.k4              <= std_logic_vector(resize(signed(to_slv(to_sfixed(-0.125,4,-3))), als.k1'length));
    -- als.k5              <= std_logic_vector(resize(signed(to_slv(to_sfixed(1.250,4,-3))), als.k1'length));
    -- als.k6              <= std_logic_vector(resize(signed(to_slv(to_sfixed(-0.125,4,-3))), als.k1'length));
    -- als.k7              <= std_logic_vector(resize(signed(to_slv(to_sfixed(-0.125,4,-3))), als.k1'length));
    -- als.k8              <= std_logic_vector(resize(signed(to_slv(to_sfixed(-0.125,4,-3))), als.k1'length));
    -- als.k9              <= std_logic_vector(resize(signed(to_slv(to_sfixed(1.250,4,-3))), als.k1'length));
    -- als.config          <= 1;
    -- alv.k1              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet1.k1,4,-3))), alv.k1'length));
    -- alv.k2              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet1.k2,4,-3))), alv.k2'length));
    -- alv.k3              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet1.k3,4,-3))), alv.k3'length));
    -- alv.k4              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet1.k4,4,-3))), alv.k4'length));
    -- alv.k5              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet1.k5,4,-3))), alv.k5'length));
    -- alv.k6              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet1.k6,4,-3))), alv.k6'length));
    -- alv.k7              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet1.k7,4,-3))), alv.k7'length));
    -- alv.k8              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet1.k8,4,-3))), alv.k8'length));
    -- alv.k9              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet1.k9,4,-3))), alv.k9'length));
    -- alv.config          <= 1;
    -- als.k1              <= std_logic_vector(resize(signed(to_slv(to_sfixed(1.250,4,-3))), als.k1'length));
    -- als.k2              <= std_logic_vector(resize(signed(to_slv(to_sfixed(-0.125,4,-3))), als.k1'length));
    -- als.k3              <= std_logic_vector(resize(signed(to_slv(to_sfixed(-0.125,4,-3))), als.k1'length));
    -- als.k4              <= std_logic_vector(resize(signed(to_slv(to_sfixed(-0.125,4,-3))), als.k1'length));
    -- als.k5              <= std_logic_vector(resize(signed(to_slv(to_sfixed(1.375,4,-3))), als.k1'length));
    -- als.k6              <= std_logic_vector(resize(signed(to_slv(to_sfixed(-0.125,4,-3))), als.k1'length));
    -- als.k7              <= std_logic_vector(resize(signed(to_slv(to_sfixed(-0.125,4,-3))), als.k1'length));
    -- als.k8              <= std_logic_vector(resize(signed(to_slv(to_sfixed(-0.125,4,-3))), als.k1'length));
    -- als.k9              <= std_logic_vector(resize(signed(to_slv(to_sfixed(1.250,4,-3))), als.k1'length));
    -- als.config          <= 1;
ImageWriteInst: imageWrite
generic map (
    enImageText        => true,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    test               => "images",
    input_file         => readbmp,
    output_file        => "rgbCorrect2")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => rgbCorrect2);
end generate CC_TEST_ENABLED;
------------------------------------------------------------------------------
-- END GENERATE
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- GENERATE FRAMEPROCESS_ENABLED
------------------------------------------------------------------------------
HSV_TEST_ENABLED : if (DUT_HSV_TEST_ENABLED = true) generate
    signal txCord           : coord;
    signal rgbIn            : channel;
    signal rgbCoord         : region;
    signal hsv              : hsvChannel;
    signal rgbPoi           : channel;
    signal enableWrite      : std_logic;
    signal endOfFrame       : std_logic;
begin
    enableWrite             <= hi;
ImageReadInst: imageRead
generic map (
    i_data_width       => i_data_width,
    input_file         => readbmp)
port map (                  
    clk                => clk,
    reset              => resetn,
    oRgb               => rgbIn,
    oCord              => txCord,
    endOfFrame         => endOfFrame,
    olm                   => olm);
hsvInst: hsv_c
generic map(
    i_data_width       => i_data_width)
port map(   
    clk                => clk,
    reset              => resetn,
    iRgb               => rgbIn,
    oHsv               => hsv);
    ----------------------------------
    rgbPoi.red            <= hsv.h;
    rgbPoi.green          <= hsv.s;
    rgbPoi.blue           <= hsv.v;
    rgbPoi.valid          <= hsv.valid;
    ----------------------------------
ImageWriteInst: imageWrite
generic map (
    enImageText        => true,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    test               => "images",
    input_file         => readbmp,
    output_file        => "rgbPoi")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => rgbPoi);
end generate HSV_TEST_ENABLED;
------------------------------------------------------------------------------
-- END GENERATE
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- GENERATE YCBCR_TEST_ENABLED
------------------------------------------------------------------------------
YCBCR_TEST_ENABLED : if (DUT_YCBCR_TEST_ENABLED = true) generate
    signal txCord           : coord;
    signal rgbIn            : channel;
    signal endOfFrame       : std_logic;
    signal rgbCoord         : region;
    signal ycbcr            : channel;
    signal hsv              : hsvChannel;
    signal hsvRgb           : channel;
    signal ditRgb           : channel;
    signal enableWrite      : std_logic;
    signal CustRgb          : channel;
    signal enable           : std_logic := lo;
    signal txCordY          : integer;
begin
    enableWrite             <= hi;
ImageReadInst: imageRead
generic map (
    i_data_width       => i_data_width,
    input_file         => readbmp)
port map (                  
    clk                => clk,
    reset              => resetn,
    oRgb               => rgbIn,
    oCord              => txCord,
    endOfFrame         => endOfFrame,
    olm                   => olm);
hsvInst: hsv_c
generic map(
    i_data_width        => i_data_width)
port map(   
    clk                 => clk,
    reset               => resetn,
    iRgb                => rgbIn,
    oHsv                => hsv);
ycbcrInst: rgb_ycbcr
generic map(
    i_data_width         => i_data_width,
    i_precision          => 16,
    i_full_range         => TRUE)
port map(
    clk                  => clk,
    rst_l                => resetn,
    iRgb                 => rgbIn,
    y                    => ycbcr.red,
    cb                   => ycbcr.green,
    cr                   => ycbcr.blue,
    oValid               => ycbcr.valid);
ditherInst: dither
generic map(
    img_width           => img_width,
    img_height          => img_height,
    color_width         => i_data_width,
    reduced_width       => 1)
port map(
    clk                  => clk,
    enable               => enable,
    x                    => txCordY,
    din_r                => rgbIn.red,
    din_g                => rgbIn.green,
    din_b                => rgbIn.blue,
    dout_r               => ditRgb.red,
    dout_g               => ditRgb.green,
    dout_b               => ditRgb.blue);
    txCordY <= (to_integer(unsigned(txCord.y)));
    process(txCordY) begin
    if (txCordY < img_height / 2) then
        enable <= hi;
    else
        enable <= lo;
    end if;
    end process;
    ----------------------------------
    hsvRgb.red            <= hsv.h;
    hsvRgb.green          <= hsv.s;
    hsvRgb.blue           <= hsv.v;
    hsvRgb.valid          <= hsv.valid;
    ----------------------------------
    ----------------------------------
    -- CustRgb.red          <= hsv.s;
    -- CustRgb.green        <= ycbcr.green;
    -- CustRgb.blue         <= ycbcr.blue;
    -- CustRgb.valid        <= hsv.valid;
    ----------------------------------
    CustRgb.red          <= ditRgb.red;
    CustRgb.green        <= ditRgb.green;
    CustRgb.blue         <= ditRgb.blue;
    CustRgb.valid        <= rgbIn.valid;
ImageWriteInst: imageWrite
generic map (
    enImageText        => true,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    test               => "images",
    input_file         => readbmp,
    output_file        => "CustRgb")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => CustRgb);
end generate YCBCR_TEST_ENABLED;
------------------------------------------------------------------------------
-- END GENERATE
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- GENERATE FRAMEPROCESS_ENABLED
------------------------------------------------------------------------------
EMBOSS_TEST_ENABLED : if (DUT_EMBOSS_TEST_ENABLED = true) generate
    signal txCord           : coord;
    signal rgbIn            : channel;
    signal endOfFrame       : std_logic;
    signal rgbCoord         : region;
    signal emb              : coefficient;
    signal emboss           : channel;
    signal sValid           : std_logic;
    signal edgeValid        : std_logic;
    signal enableWrite      : std_logic;
begin
    emb.k1                  <= x"000000FF";-- [-1]
    emb.k2                  <= x"000000FF";-- [-1]
    emb.k3                  <= x"00000000";-- [ 0]
    emb.k4                  <= x"000000FF";-- [-1]
    emb.k5                  <= x"00000000";-- [ 0]
    emb.k6                  <= x"00000001";-- [ 1]
    emb.k7                  <= x"00000000";-- [ 0]
    emb.k8                  <= x"00000001";-- [ 1]
    emb.k9                  <= x"00000001";-- [ 1]
    emb.config              <= 2;
    enableWrite             <= hi;
ImageReadInst: imageRead
generic map (
    i_data_width       => i_data_width,
    input_file         => readbmp)
port map (                  
    clk                => clk,
    reset              => resetn,
    oRgb               => rgbIn,
    oCord              => txCord,
    endOfFrame         => endOfFrame,
    olm                   => olm);
sharpFilterInst: sharpFilter
generic map(
    i_data_width        => i_data_width,
    img_width           => img_width,
    adwrWidth           => adwrWidth,
    addrWidth           => addrWidth)
port map(   
    clk                 => clk,
    rst_l               => resetn,
    iRgb                => rgbIn,
    endOfFrame          => endOfFrame,
    kls                 => emb,
    oRgb                => emboss);
ImageWriteInst: imageWrite
generic map (
    enImageText        => true,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    test               => "images",
    input_file         => readbmp,
    output_file        => "emboss")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => emboss);
end generate EMBOSS_TEST_ENABLED;
------------------------------------------------------------------------------
-- END GENERATE
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- GENERATE FRAMEPROCESS_ENABLED
------------------------------------------------------------------------------
SOBEL_TEST_ENABLED : if (DUT_SOBEL_TEST_ENABLED = true) generate
    signal txCord           : coord;
    signal rgbIn            : channel;
    signal endOfFrame       : std_logic;
    signal rgbCoord         : region;
    signal iEdgeType        : std_logic_vector(b_data_width-1 downto 0);
    signal iThreshold       : std_logic_vector(15 downto 0) :=x"0190";
    signal iKls             : coefficient;
    signal soble            : channel;
    signal sValid           : std_logic;
    signal edgeValid        : std_logic;
    signal enableWrite      : std_logic;
begin
    iKls.k1                  <= x"000001FF";
    iKls.k2                  <= x"00000200";
    iKls.k3                  <= x"00000101";
    iKls.k4                  <= x"000000FE";
    iKls.k5                  <= x"00000000";
    iKls.k6                  <= x"00000002";
    iKls.k7                  <= x"0000FFFF";
    iKls.k8                  <= x"0000FE00";
    iKls.k9                  <= x"0000FF01";
    iKls.config              <= 1;
    enableWrite              <= hi;
ImageReadInst: imageRead
generic map (
    i_data_width       => i_data_width,
    input_file         => readbmp)
port map (                  
    clk                => clk,
    reset              => resetn,
    oRgb               => rgbIn,
    oCord              => txCord,
    endOfFrame         => endOfFrame,
    olm                   => olm);
SobelFilterInst: sobelFilter
generic map(
    i_data_width        => i_data_width,
    img_width           => img_width,
    adwrWidth           => adwrWidth,
    addrWidth           => addrWidth)
port map(   
    clk                 => clk,
    rst_l               => resetn,
    iEdgeType           => iEdgeType,
    endOfFrame          => endOfFrame,
    iRgb                => rgbIn,
    threshold           => iThreshold,
    kls                 => iKls,
    oRgb                => soble,
    sValid              => sValid,
    edgeValid           => edgeValid);
ImageWriteInst: imageWrite
generic map (
    enImageText        => true,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    test               => "images",
    input_file         => readbmp,
    output_file        => "soble")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => soble);
end generate SOBEL_TEST_ENABLED;
------------------------------------------------------------------------------
-- END GENERATE
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- GENERATE IMAGES_TEST_ENABLED
------------------------------------------------------------------------------
IMAGES_TEST_ENABLED : if (DUT_IMAGES_TESTENABLED = true) generate
    --------------------------------------------------------------------------
    signal txCord           : coord;
    signal pRegion          : poi;
    signal oGridLockData    : std_logic_vector(b_data_width-1 downto 0);
    signal oFifoStatus      : std_logic_vector(b_data_width-1 downto 0);
    signal rgbPoiLock       : std_logic;
    signal endOfFrame       : std_logic;
    signal wrAddress        : std_logic_vector (13 downto 0);
    signal wrAddrsGlCtr     : integer := 0;
    signal enableWrite      : std_logic;
    signal rgbCoord         : region;
    signal rgbDetectLock    : std_logic;
    signal hsv              : hsvChannel;
    signal rgbIn            : channel;
    signal rgbPoi           : channel;
    signal oRgbGrid         : channel;
    signal blur1vx          : channel;
    signal blur2vx          : channel;
    signal blur3vx          : channel;
    signal blur4vx          : channel;
    signal blur5vx          : channel;
    signal rgbCorrect1      : channel;
    signal rgbCorrect2      : channel;
    signal sharp            : channel;
    signal als              : coefficient;
    signal als2             : coefficient;
    signal kls              : coefficient;
    signal kSet1            : coeffData;
    signal kSet2            : coeffData;
    signal ycbcr            : channel;
    --------------------------------------------------------------------------
begin
kernel1ReadInst: kernel1Read
generic map (
    s_data_width    => s_data_width,
    input_file      => "kernel1ReadData")
port map (                  
    clk               => clk,
    reset             => resetn,
    kSet1Out          => kSet1); 
kernel2ReadInst: kernel1Read
generic map (
    s_data_width    => s_data_width,
    input_file      => "kernel2ReadData")
port map (                  
    clk               => clk,
    reset             => resetn,
    kSet1Out          => kSet2); 
    ------------------------------------------------------------------------
    -- als.k1              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet1.k1,4,-3))), als.k1'length));
    -- als.k2              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet1.k2,4,-3))), als.k2'length));
    -- als.k3              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet1.k3,4,-3))), als.k3'length));
    -- als.k4              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet1.k4,4,-3))), als.k4'length));
    -- als.k5              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet1.k5,4,-3))), als.k5'length));
    -- als.k6              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet1.k6,4,-3))), als.k6'length));
    -- als.k7              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet1.k7,4,-3))), als.k7'length));
    -- als.k8              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet1.k8,4,-3))), als.k8'length));
    -- als.k9              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet1.k9,4,-3))), als.k9'length));
    -- als.config          <= 1;
    -- als2.k1              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet2.k1,4,-3))), als2.k1'length));
    -- als2.k2              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet2.k2,4,-3))), als2.k2'length));
    -- als2.k3              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet2.k3,4,-3))), als2.k3'length));
    -- als2.k4              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet2.k4,4,-3))), als2.k4'length));
    -- als2.k5              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet2.k5,4,-3))), als2.k5'length));
    -- als2.k6              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet2.k6,4,-3))), als2.k6'length));
    -- als2.k7              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet2.k7,4,-3))), als2.k7'length));
    -- als2.k8              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet2.k8,4,-3))), als2.k8'length));
    -- als2.k9              <= std_logic_vector(resize(signed(to_slv(to_sfixed(kSet2.k9,4,-3))), als2.k9'length));
    -- als2.config          <= 1;
    -- kls.k1                  <= x"00000000";-- [ 0]
    -- kls.k2                  <= x"000000FF";-- [-1]
    -- kls.k3                  <= x"00000000";-- [ 0]
    -- kls.k4                  <= x"000000FF";-- [-1]
    -- kls.k5                  <= x"00000005";-- [ 5]
    -- kls.k6                  <= x"000000FF";-- [-1]
    -- kls.k7                  <= x"00000000";-- [ 0]
    -- kls.k8                  <= x"000000FF";-- [-1]
    -- kls.k9                  <= x"00000000";-- [ 0]
    -- kls.config              <= 0;
    -- enableWrite             <= hi;
    --------------------------------------------------------------------------
IMAGE2_imageRead: imageRead
generic map (
    i_data_width       => i_data_width,
    input_file         => readbmp)
port map (                  
    clk                => clk,
    reset              => resetn,
    oRgb               => rgbIn,
    oCord              => txCord,
    endOfFrame         => endOfFrame,
    olm                   => olm);
-- sharpFilterInst: sharpFilter
-- generic map(
    -- i_data_width        => i_data_width,
    -- img_width           => img_width,
    -- adwrWidth           => adwrWidth,
    -- addrWidth           => addrWidth)
-- port map(   
    -- clk                 => clk,
    -- rst_l               => resetn,
    -- iRgb                => rgbIn,
    -- endOfFrame          => endOfFrame,
    -- kls                 => kls,
    -- oRgb                => sharp);
-- blurFilter1xInst: blurFilter
-- generic map(
    -- iMSB                => blurMsb,
    -- iLSB                => blurLsb,
    -- i_data_width        => i_data_width,
    -- img_width           => img_width,
    -- adwrWidth           => adwrWidth,
    -- addrWidth           => addrWidth)
-- port map(
    -- clk                 => clk,
    -- rst_l               => resetn,
    -- iRgb                => sharp,
    -- oRgb                => blur1vx);
-- blurFilter2xInst: blurFilter
-- generic map(
    -- iMSB                => blurMsb - 1,
    -- iLSB                => blurLsb - 1,
    -- i_data_width        => i_data_width,
    -- img_width           => img_width,
    -- adwrWidth           => adwrWidth,
    -- addrWidth           => addrWidth)
-- port map(
    -- clk                 => clk,
    -- rst_l               => resetn,
    -- iRgb                => blur1vx,
    -- oRgb                => blur2vx);
-- blurFilter3xInst: blurFilter
-- generic map(
    -- iMSB                => blurMsb - 1,
    -- iLSB                => blurLsb - 1,
    -- i_data_width        => i_data_width,
    -- img_width           => img_width,
    -- adwrWidth           => adwrWidth,
    -- addrWidth           => addrWidth)
-- port map(
    -- clk                 => clk,
    -- rst_l               => resetn,
    -- iRgb                => blur2vx,
    -- oRgb                => blur3vx);
-- blurFilter4xInst: blurFilter
-- generic map(
    -- iMSB                => blurMsb - 1,
    -- iLSB                => blurLsb - 1,
    -- i_data_width        => i_data_width,
    -- img_width           => img_width,
    -- adwrWidth           => adwrWidth,
    -- addrWidth           => addrWidth)
-- port map(
    -- clk                 => clk,
    -- rst_l               => resetn,
    -- iRgb                => blur3vx,
    -- oRgb                => blur4vx);
-- colorCorrection1Inst: colorCorrection
-- generic map(
    -- img_width           => img_width,
    -- i_data_width        => i_data_width)
-- port map(           
    -- clk                 => clk,
    -- rst_l               => resetn,
    -- iRgb                => rgbIn,
    -- als                 => als,    
    -- oRgb                => rgbCorrect1);
-- colorCorrection2Inst: colorCorrection
-- generic map(
    -- i_data_width        => i_data_width)
-- port map(           
    -- clk                 => clk,
    -- rst_l               => resetn,
    -- iRgb                => rgbCorrect1,
    -- als                 => als2,    
    -- oRgb                => rgbCorrect2);
ycbcrInst: rgb_ycbcr
generic map(
    i_data_width         => i_data_width,
    i_precision          => 12,
    i_full_range         => TRUE)
port map(
    clk                  => clk,
    rst_l                => resetn,
    iRgb                 => rgbIn,
    y                    => ycbcr.red,
    cb                   => ycbcr.green,
    cr                   => ycbcr.blue,
    oValid               => ycbcr.valid);
    --------------------------------
    -- rgbPoi.red           <= ycbcr.red;
    -- rgbPoi.green         <= ycbcr.green;
    -- rgbPoi.blue          <= ycbcr.blue;
    -- rgbPoi.valid         <= ycbcr.valid;
    ----------------------------------
-- hsvInst: hsv_c
-- generic map(
    -- i_data_width        => i_data_width)
-- port map(   
    -- clk                 => clk,
    -- reset               => resetn,
    -- iRgb                => rgbCorrect2,
    -- oHsv                => hsv);
    ------------------------------
    -- rgbPoi.red            <= hsv.h;
    -- rgbPoi.green          <= hsv.s;
    -- rgbPoi.blue           <= hsv.v;
    -- rgbPoi.valid          <= hsv.valid;
    --------------------------------
-- blurFilter5xInst: blurFilter
-- generic map(
    -- iMSB                => blurMsb,
    -- iLSB                => blurLsb,
    -- i_data_width        => i_data_width,
    -- img_width           => img_width,
    -- adwrWidth           => adwrWidth,
    -- addrWidth           => addrWidth)
-- port map(
    -- clk                 => clk,
    -- rst_l               => resetn,
    -- iRgb                => rgbPoi,
    -- oRgb                => blur5vx); 
-- colorCorrection2Inst: colorCorrection
-- generic map(
    -- i_data_width        => i_data_width)
-- port map(           
    -- clk                 => clk,
    -- rst_l               => resetn,
    -- iRgb                => rgbPoi,
    -- als                 => als2,    
    -- oRgb                => rgbCorrect2);
WRITEIMAGE1: imageWrite
generic map (
    enImageText        => false,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    test               => "images",
    input_file         => readbmp,
    output_file        => "imageFilters")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => rgbCorrect1);
WRITEIMAGE2: imageWrite
generic map (
    enImageText        => false,
    enImageIndex       => false,
    i_data_width       => i_data_width,
    test               => "images",
    input_file         => readbmp,
    output_file        => "ycbcr")
port map (                  
    pixclk             => clk,
    enableWrite        => enableWrite,
    iRgb               => ycbcr);
-- enableWrite <= not(oFifoStatus(1));
-- pointOfInterest_inst: pointOfInterest
-- generic map(
    -- i_data_width       => i_data_width,
    -- s_data_width       => s_data_width,
    -- b_data_width       => b_data_width)
-- port map(
    -- clk                => clk,
    -- rst_l              => resetn,
    -- iRgb               => rgbIn,
    -- iCord              => txCord,
    -- endOfFrame         => endOfFrame,
    -- gridLockDatao      => oGridLockData,
    -- pRegion            => pRegion,
    -- fifoStatus         => oFifoStatus,
    -- oGridLocation      => rgbPoiLock,
    -- oRgb               => rgbPoi);
--enableWrite <= '1' when rgbCoord.rh = x"f0";
-- detectInst: detect
-- generic map(
    -- i_data_width        => 8)
-- port map(
    -- clk                 => clk,
    -- rst_l               => resetn,
    -- iRgb                => rgbIn,
    -- rgbCoord            => rgbCoord,
    -- endOfFrame          => endOfFrame,
    -- iCord               => txCord,
    -- pDetect             => rgbDetectLock,
    -- oRgb                => rgbPoi);
    --------------------------------------------------------------------------
    oRgbGrid.red            <= oGridLockData(23 downto 16);
    oRgbGrid.green          <= oGridLockData(15 downto 8);
    oRgbGrid.blue           <= oGridLockData(7 downto 0);
    oRgbGrid.valid          <= oFifoStatus(2);
    pRegion.pointInterest   <= 10;
    pRegion.deltaConfig     <= 0;
    pRegion.cpuAckoffFrame  <= '0';
    pRegion.fifoReadAddress <= wrAddress;
    pRegion.clearFifoData   <= '0';
    pRegion.cpuAckGoAgain   <= not(oFifoStatus(2)) and endOfFrame;
    GlEnablePointer: process (clk)begin
        if rising_edge(clk) then
            if (oFifoStatus(0) = '1')then
                pRegion.cpuWgridLock    <= '0';
                if(wrAddrsGlCtr < 8192) then
                    wrAddrsGlCtr           <= wrAddrsGlCtr + 1;
                    pRegion.fifoReadEnable <= '1';
                else
                    wrAddrsGlCtr           <= wrAddrsGlCtr;
                    pRegion.fifoReadEnable <= '0';
                end if;
            else
                pRegion.fifoReadEnable <= '0';
                wrAddrsGlCtr           <=  0;
                pRegion.cpuWgridLock   <= endOfFrame;
            end if;
            wrAddress     <= std_logic_vector(to_unsigned(wrAddrsGlCtr,14));
        end if;
    end process GlEnablePointer;
    --------------------------------------------------------------------------
end generate IMAGES_TEST_ENABLED;
------------------------------------------------------------------------------
-- END GENERATE
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- GENERATE FRAMEPROCESS_ENABLED
------------------------------------------------------------------------------
FRAMEPROCESS_ENABLED : if (DUT_FRAMEPROCESS_ENABLED = true) generate
frameProcess_test : dut_frameProcess
port map(
    clk          => clk,
    resetn       => resetn);
end generate FRAMEPROCESS_ENABLED;
------------------------------------------------------------------------------
-- END GENERATE
------------------------------------------------------------------------------
VFP_ENABLED : if (DUT_VFP_ENABLED = true) generate
    -- d5m input
    signal pixclk                : std_logic;
    signal ifval                 : std_logic;
    signal ilval                 : std_logic;
    signal idata                 : std_logic_vector(dataWidth - 1 downto 0);
    --tx channel
    signal rgb_m_axis_aclk       : std_logic;
    signal rgb_m_axis_aresetn    : std_logic :='0';
    signal rgb_m_axis_tvalid     : std_logic;
    signal rgb_m_axis_tlast      : std_logic;
    signal rgb_m_axis_tuser      : std_logic;
    signal rgb_m_axis_tready     : std_logic;
    signal rgb_m_axis_tdata      : std_logic_vector(s_data_width-1 downto 0);
    --rx channel
    signal rgb_s_axis_aclk       : std_logic;
    signal rgb_s_axis_aresetn    : std_logic :='0';
    signal rgb_s_axis_tready     : std_logic;
    signal rgb_s_axis_tvalid     : std_logic;
    signal rgb_s_axis_tuser      : std_logic;
    signal rgb_s_axis_tlast      : std_logic;
    signal rgb_s_axis_tdata      : std_logic_vector(s_data_width-1 downto 0);
    --destination channel
    signal m_axis_mm2s_aclk      : std_logic;
    signal m_axis_mm2s_aresetn   : std_logic :='0';
    signal m_axis_mm2s_tready    : std_logic;
    signal m_axis_mm2s_tvalid    : std_logic;
    signal m_axis_mm2s_tuser     : std_logic;
    signal m_axis_mm2s_tlast     : std_logic;
    signal m_axis_mm2s_tdata     : std_logic_vector(s_data_width-1 downto 0);
    signal m_axis_mm2s_tkeep     : std_logic_vector(2 downto 0);
    signal m_axis_mm2s_tstrb     : std_logic_vector(2 downto 0);
    signal m_axis_mm2s_tid       : std_logic_vector(0 downto 0);
    signal m_axis_mm2s_tdest     : std_logic_vector(0 downto 0);
    signal vfpconfig_aclk        : std_logic;
    signal vfpconfig_aresetn     : std_logic :='0';
    signal vfpconfig_awaddr      : std_logic_vector(C_vfpConfig_ADDR_WIDTH-1 downto 0);
    signal vfpconfig_awprot      : std_logic_vector(2 downto 0);
    signal vfpconfig_awvalid     : std_logic;
    signal vfpconfig_awready     : std_logic;
    signal vfpconfig_wdata       : std_logic_vector(conf_data_width-1 downto 0);
    signal vfpconfig_wstrb       : std_logic_vector((conf_data_width/8)-1 downto 0);
    signal vfpconfig_wvalid      : std_logic;
    signal vfpconfig_wready      : std_logic;
    signal vfpconfig_bresp       : std_logic_vector(1 downto 0);
    signal vfpconfig_bvalid      : std_logic;
    signal vfpconfig_bready      : std_logic;
    signal vfpconfig_araddr      : std_logic_vector(C_vfpConfig_ADDR_WIDTH-1 downto 0);
    signal vfpconfig_arprot      : std_logic_vector(2 downto 0);
    signal vfpconfig_arvalid     : std_logic;
    signal vfpconfig_arready     : std_logic;
    signal vfpconfig_rdata       : std_logic_vector(conf_data_width-1 downto 0);
    signal vfpconfig_rresp       : std_logic_vector(1 downto 0);
    signal vfpconfig_rvalid      : std_logic;
    signal vfpconfig_rready      : std_logic;
begin
    clk_gen(m_axis_mm2s_aclk, 150.00e6);
    clk_gen(rgb_s_axis_aclk, 150.00e6);
    clk_gen(rgb_m_axis_aclk, 150.00e6);
    -------------------------------------------------------------------------
    rgb_s_axis_tvalid    <= rgb_m_axis_tvalid;
    rgb_s_axis_tlast     <= rgb_m_axis_tlast;
    rgb_s_axis_tuser     <= rgb_m_axis_tuser;
    rgb_m_axis_tready    <= rgb_s_axis_tready;
    rgb_s_axis_tdata     <= rgb_m_axis_tdata;
    -------------------------------------------------------------------------
    process begin
        m_axis_mm2s_aresetn  <= '0';
        rgb_s_axis_aresetn   <= '0';
        rgb_m_axis_aresetn   <= '0';
    wait for 10 ns;
        m_axis_mm2s_aresetn  <= '1';
        rgb_s_axis_aresetn   <= '1';
        rgb_m_axis_aresetn   <= '1';   
    wait;
    end process;
dut_d5m_inst: dut_d5m
generic map(
    pixclk_freq                 => pixclk_freq,
    img_width                   => img_width,
    line_hight                  => line_hight,
    dataWidth                   => dataWidth)    
port map(
    pixclk                      => pixclk,
    ifval                       => ifval,
    ilval                       => ilval,
    idata                       => idata);
dut_configAxis_inst : dut_configAxis
generic map(
    aclk_freq                   => aclk_freq,
    C_vfpConfig_DATA_WIDTH      => C_vfpConfig_DATA_WIDTH,
    C_vfpConfig_ADDR_WIDTH      => C_vfpConfig_ADDR_WIDTH)    
port map(
    --video configuration       
    vfpconfig_aclk              => vfpconfig_aclk,
    vfpconfig_aresetn           => vfpconfig_aresetn,
    vfpconfig_awaddr            => vfpconfig_awaddr,
    vfpconfig_awprot            => vfpconfig_awprot,
    vfpconfig_awvalid           => vfpconfig_awvalid,
    vfpconfig_awready           => vfpconfig_awready,
    vfpconfig_wdata             => vfpconfig_wdata,
    vfpconfig_wstrb             => vfpconfig_wstrb,
    vfpconfig_wvalid            => vfpconfig_wvalid,
    vfpconfig_wready            => vfpconfig_wready,
    vfpconfig_bresp             => vfpconfig_bresp,
    vfpconfig_bvalid            => vfpconfig_bvalid,
    vfpconfig_bready            => vfpconfig_bready,
    vfpconfig_araddr            => vfpconfig_araddr,
    vfpconfig_arprot            => vfpconfig_arprot,
    vfpconfig_arvalid           => vfpconfig_arvalid,
    vfpconfig_arready           => vfpconfig_arready,
    vfpconfig_rdata             => vfpconfig_rdata,
    vfpconfig_rresp             => vfpconfig_rresp,
    vfpconfig_rvalid            => vfpconfig_rvalid,
    vfpconfig_rready            => vfpconfig_rready);
d5m_camera_inst: VFP_v1_0
generic map(
    revision_number             => revision_number,
    C_rgb_m_axis_TDATA_WIDTH    => C_rgb_m_axis_TDATA_WIDTH,
    C_rgb_m_axis_START_COUNT    => C_rgb_m_axis_START_COUNT,
    C_rgb_s_axis_TDATA_WIDTH    => C_rgb_s_axis_TDATA_WIDTH,
    C_m_axis_mm2s_TDATA_WIDTH   => C_m_axis_mm2s_TDATA_WIDTH,
    C_m_axis_mm2s_START_COUNT   => C_m_axis_mm2s_START_COUNT,
    C_vfpConfig_DATA_WIDTH      => C_vfpConfig_DATA_WIDTH,
    C_vfpConfig_ADDR_WIDTH      => C_vfpConfig_ADDR_WIDTH,
    i_data_width                => i_data_width,
    s_data_width                => s_data_width,
    b_data_width                => b_data_width,
    i_precision                 => i_precision,
    i_full_range                => i_full_range,
    conf_data_width             => conf_data_width,
    conf_addr_width             => conf_addr_width,
    img_width                   => img_width,
    dataWidth                   => dataWidth)
port map(
    -- d5m input
    pixclk                      => pixclk,
    ifval                       => ifval,
    ilval                       => ilval,
    idata                       => idata,
    --tx channel
    rgb_m_axis_aclk             => rgb_m_axis_aclk,
    rgb_m_axis_aresetn          => rgb_m_axis_aresetn,
    rgb_m_axis_tvalid           => rgb_m_axis_tvalid,
    rgb_m_axis_tlast            => rgb_m_axis_tlast,
    rgb_m_axis_tuser            => rgb_m_axis_tuser,
    rgb_m_axis_tready           => rgb_m_axis_tready,
    rgb_m_axis_tdata            => rgb_m_axis_tdata,
    --rx channel                
    rgb_s_axis_aclk             => rgb_s_axis_aclk,
    rgb_s_axis_aresetn          => rgb_s_axis_aresetn,
    rgb_s_axis_tready           => rgb_s_axis_tready,
    rgb_s_axis_tvalid           => rgb_s_axis_tvalid,
    rgb_s_axis_tuser            => rgb_s_axis_tuser,
    rgb_s_axis_tlast            => rgb_s_axis_tlast,
    rgb_s_axis_tdata            => rgb_s_axis_tdata,
    --destination channel       
    m_axis_mm2s_aclk            => m_axis_mm2s_aclk,
    m_axis_mm2s_aresetn         => m_axis_mm2s_aresetn,
    m_axis_mm2s_tready          => m_axis_mm2s_tready,
    m_axis_mm2s_tvalid          => m_axis_mm2s_tvalid,
    m_axis_mm2s_tuser           => m_axis_mm2s_tuser,
    m_axis_mm2s_tlast           => m_axis_mm2s_tlast,
    m_axis_mm2s_tdata           => m_axis_mm2s_tdata,
    m_axis_mm2s_tkeep           => m_axis_mm2s_tkeep,
    m_axis_mm2s_tstrb           => m_axis_mm2s_tstrb,
    m_axis_mm2s_tid             => m_axis_mm2s_tid,
    m_axis_mm2s_tdest           => m_axis_mm2s_tdest,
    --video configuration       
    vfpconfig_aclk              => vfpconfig_aclk,
    vfpconfig_aresetn           => vfpconfig_aresetn,
    vfpconfig_awaddr            => vfpconfig_awaddr,
    vfpconfig_awprot            => vfpconfig_awprot,
    vfpconfig_awvalid           => vfpconfig_awvalid,
    vfpconfig_awready           => vfpconfig_awready,
    vfpconfig_wdata             => vfpconfig_wdata,
    vfpconfig_wstrb             => vfpconfig_wstrb,
    vfpconfig_wvalid            => vfpconfig_wvalid,
    vfpconfig_wready            => vfpconfig_wready,
    vfpconfig_bresp             => vfpconfig_bresp,
    vfpconfig_bvalid            => vfpconfig_bvalid,
    vfpconfig_bready            => vfpconfig_bready,
    vfpconfig_araddr            => vfpconfig_araddr,
    vfpconfig_arprot            => vfpconfig_arprot,
    vfpconfig_arvalid           => vfpconfig_arvalid,
    vfpconfig_arready           => vfpconfig_arready,
    vfpconfig_rdata             => vfpconfig_rdata,
    vfpconfig_rresp             => vfpconfig_rresp,
    vfpconfig_rvalid            => vfpconfig_rvalid,
    vfpconfig_rready            => vfpconfig_rready);
end generate VFP_ENABLED;
------------------------------------------------------------------------------
-- END GENERATE
------------------------------------------------------------------------------
end behavioral;
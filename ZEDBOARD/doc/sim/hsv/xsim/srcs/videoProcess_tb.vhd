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
    constant testFolder                  : string  := "hsv";--cgain  ycbcr sobel blur emboss
    -------------------------------------------------
    constant DUT_FILTERS_TESTENABLED     : boolean := true;
    constant DUT_VFP_ENABLED             : boolean := false;
    constant DUT_FRAMEPROCESS_ENABLED    : boolean := false;
    constant DUT_IMAGES_TESTENABLED      : boolean := false;
    constant DUT_SOBEL_TEST_ENABLED      : boolean := false;
    constant DUT_EMBOSS_TEST_ENABLED     : boolean := false;
    constant DUT_YCBCR_TEST_ENABLED      : boolean := false;
    constant DUT_HSV_TEST_ENABLED        : boolean := false;
    constant DUT_CC_TEST_ENABLED         : boolean := false;
    constant DUT_IMAGEKERNELS_ENABLED    : boolean := false;
    constant DUT_FILTERS_ENABLED         : boolean := false;
    constant DUT_FIFO_ENABLED            : boolean := false;
    constant DUT_RGBASSERTION_ENABLED    : boolean := false;
    -------------------------------------------------
    constant F_READ_COEFF_DATA           : boolean := true;
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
    constant F_HSV                       : boolean := true;
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
F_CGA_BRIGHT_FRAME_ENABLE: if (F_CGA_BRIGHT = true) generate
begin
kernel1ReadInst: ReadCoeffFile
generic map (
    s_data_width    => s_data_width,
    input_file      => "ReadCoeffData")
port map (                  
    clk               => clk,
    reset             => resetn,
    kSet1Out          => kCoeff);
end generate F_CGA_BRIGHT_FRAME_ENABLE;
READ_COEFF_DATA_ENABLE: if (F_READ_COEFF_DATA = true) generate
begin
kernel1ReadInst: ReadCoeffFile
generic map (
    s_data_width    => s_data_width,
    input_file      => "ReadCoeffData")
port map (                  
    clk               => clk,
    reset             => resetn,
    kSet1Out          => kCoeff);
end generate READ_COEFF_DATA_ENABLE;
FILTERS_TEST_ENABLED: if (DUT_FILTERS_TESTENABLED = true) generate
    constant init_type_Rgb   : type_Rgb := (valid => lo, red => (others => '0'), green => (others => '0'), blue => (others => '0'));
    signal enableWrite       : std_logic := hi;
    signal rgbRead           : channel;
    signal txCord            : coord;
    signal endOfFrame        : std_logic := lo;
    signal rgbImageFilters   : frameColors;
    signal lumThreshold      : std_logic_vector(7 downto 0) := x"50";
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
    lumThreshold          => lumThreshold,
    iRgb                  => rgbRead,
    iKcoeff               => kCoeff,
    oRgb                  => rgbImageFilters);
F_TRM_TEST_ENABLED : if (F_TRM = true) generate begin  
ImageWriteCgainToshpInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => testFolder,
    input_file            => readbmp,
    output_file           => "colorTrm")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.colorTrm);
end generate F_TRM_TEST_ENABLED;    
F_LUM_TEST_ENABLED : if (F_LUM = true) generate begin  
ImageWriteCgainToshpInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => testFolder,
    input_file            => readbmp,
    output_file           => "colorLmp")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.colorLmp);
end generate F_LUM_TEST_ENABLED;
F_CGA_TO_SHP_TEST_ENABLED : if (F_CGA_TO_SHP = true) generate begin  
ImageWriteCgainToshpInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
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
    test                  => testFolder,
    input_file            => readbmp,
    output_file           => "bluToShp")
port map (                  
    pixclk                => clk,
    enableWrite           => enableWrite,
    iRgb                  => rgbImageFilters.bluToShp);
end generate F_BLU_TO_SHP_TEST_ENABLED;
end generate FILTERS_TEST_ENABLED;
FRAMEPROCESS_ENABLED : if (DUT_FRAMEPROCESS_ENABLED = true) generate
frameProcess_test : dut_frameProcess
port map(
    clk          => clk,
    resetn       => resetn);
end generate FRAMEPROCESS_ENABLED;
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
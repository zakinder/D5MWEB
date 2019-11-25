----------------------------------------------------------------
--Last Modfied  : 01062019 [01-06-2019]
--Module        : KernelCore
--This module read camera input control valids and data signals.
----------------------------------------------------------------
--CameraRawData is the first module inside the VFP system which 
--communicate with D5M camera.It receives the data of 12 bits 
--per pixel at each clock cycle from the cmos camera when the 
--frame valid and line valid are asserted high.Pixel clock is 
--used to synchronize 12-bits input idata on the rising edge 
--of the clock.Input valids(ilval and ifval) are used to start 
--loading idata into line data buffer.The d5mLine line buffer 
--operate on two separate clocks pixclk and m_axis_aclk.It is 
--used to store and synchronize pixel data across clock pixclk 
--and m_axis_aclk domain boundaries.When pLine and pFrame are 
--enabled, the line buffer stores the pData at each triggering 
--pixclk clock edge.As long as both valids are active high by 
--the camera, the line buffer stores the pData upto maximum 
--supported image width maxImgWidth of plineRam.
--maxImgWidth maximum image width is configured as fixed constant 
--value of img_width which is 3741.calImgWidth Image width values 
--varies which is adjusted by the camera valid signals upto 
--maximum supported value. 
----------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.fixed_pkg.all;
use work.constantspackage.all;
use work.vpfrecords.all;
use work.portspackage.all;
entity KernelCore is
generic (
    SHARP_FRAME      : boolean := false;
    BLURE_FRAME      : boolean := false;
    EMBOS_FRAME      : boolean := false;
    YCBCR_FRAME      : boolean := false;
    SOBEL_FRAME      : boolean := false;
    CGAIN_FRAME      : boolean := false;
    img_width        : integer := 4096;
    i_data_width     : integer := 8);
port (
    clk              : in std_logic;
    rst_l            : in std_logic;
    iRgb             : in channel;
    kCoeff           : in kernelCoeDWord;
    oRgb             : out channel);
end KernelCore;
architecture Behavioral of KernelCore is
    signal cc               : ccRecord;
    signal rgbSyncValid     : std_logic_vector(15 downto 0)  := x"0000";
    signal rgbToFl_red      : std_logic_vector(31 downto 0);
    signal rgbToFl_gre      : std_logic_vector(31 downto 0);
    signal rgbToFl_blu      : std_logic_vector(31 downto 0);
    signal fractLevel       : std_logic_vector(31 downto 0);
    signal kCoeffDWord      : kernelCoeDWord;
    signal FractLevelProd   : kernelCoeDWord;
    signal kCoeffProd       : kCoeffFloat;
begin
-----------------------------------------------------------------------------------------------
-- STAGE 1
-----------------------------------------------------------------------------------------------
ByteToFloatTopRedinst: ByteToFloatTop
    port map (
      aclk       => clk,
      rst_l      => rst_l,
      iValid     => iRgb.valid,
      iData      => iRgb.red,
      oValid     => open,
      oDataFloat => rgbToFl_red);
ByteToFloatTopGreeninst: ByteToFloatTop
    port map (
      aclk       => clk,
      rst_l      => rst_l,
      iValid     => iRgb.valid,
      iData      => iRgb.green,
      oValid     => open,
      oDataFloat => rgbToFl_gre);
ByteToFloatTopBlueinst: ByteToFloatTop
    port map (
      aclk       => clk,
      rst_l      => rst_l,
      iValid     => iRgb.valid,
      iData      => iRgb.blue,
      oValid     => open,
      oDataFloat => rgbToFl_blu);
-----------------------------------------------------------------------------------------------
-- STAGE 2
-----------------------------------------------------------------------------------------------
FloatMultiplyK1Inst: FloatMultiplyTop
    port map (
      clk        => clk,
      iAdata     => kCoeff.k1,
      iBdata     => cc.tpsd3.vTap2x,
      oRdata     => FractLevelProd.k1);
FloatMultiplyK2Inst: FloatMultiplyTop
    port map (
      clk        => clk,
      iAdata     => kCoeff.k2,
      iBdata     => cc.tpsd2.vTap2x,
      oRdata     => FractLevelProd.k2);
FloatMultiplyK3Inst: FloatMultiplyTop
    port map (
      clk        => clk,
      iAdata     => kCoeff.k3,
      iBdata     => cc.tpsd1.vTap2x,
      oRdata     => FractLevelProd.k3);
FloatMultiplyK4Inst: FloatMultiplyTop
    port map (
      clk        => clk,
      iAdata     => kCoeff.k4,
      iBdata     => cc.tpsd3.vTap1x,
      oRdata     => FractLevelProd.k4);
FloatMultiplyK5Inst: FloatMultiplyTop
    port map (
      clk        => clk,
      iAdata     => kCoeff.k5,
      iBdata     => cc.tpsd2.vTap1x,
      oRdata     => FractLevelProd.k5);
FloatMultiplyK6Inst: FloatMultiplyTop
    port map (
      clk        => clk,
      iAdata     => kCoeff.k6,
      iBdata     => cc.tpsd1.vTap1x,
      oRdata     => FractLevelProd.k6);
FloatMultiplyK7Inst: FloatMultiplyTop
    port map (
      clk        => clk,
      iAdata     => kCoeff.k7,
      iBdata     => cc.tpsd3.vTap0x,
      oRdata     => FractLevelProd.k7);
FloatMultiplyK8Inst: FloatMultiplyTop
    port map (
      clk        => clk,
      iAdata     => kCoeff.k8,
      iBdata     => cc.tpsd2.vTap0x,
      oRdata     => FractLevelProd.k8);
FloatMultiplyK9Inst: FloatMultiplyTop
    port map (
      clk        => clk,
      iAdata     => kCoeff.k9,
      iBdata     => cc.tpsd1.vTap0x,
      oRdata     => FractLevelProd.k9);
-----------------------------------------------------------------------------------------------
-- STAGE 3
-----------------------------------------------------------------------------------------------
FloatToFixedv1TopK1Inst: FloatToFixedv1Top
    port map (
      aclk       => clk,
      iData      => FractLevelProd.k1,
      oData      => kCoeffProd.k1);   
FloatToFixedv1TopK2Inst: FloatToFixedv1Top
    port map (
      aclk       => clk,
      iData      => FractLevelProd.k2,
      oData      => kCoeffProd.k2);  
FloatToFixedv1TopK3Inst: FloatToFixedv1Top
    port map (
      aclk       => clk,
      iData      => FractLevelProd.k3,
      oData      => kCoeffProd.k3);  
FloatToFixedv1TopK4Inst: FloatToFixedv1Top
    port map (
      aclk       => clk,
      iData      => FractLevelProd.k4,
      oData      => kCoeffProd.k4);   
FloatToFixedv1TopK5Inst: FloatToFixedv1Top
    port map (
      aclk       => clk,
      iData      => FractLevelProd.k5,
      oData      => kCoeffProd.k5);  
FloatToFixedv1TopK6Inst: FloatToFixedv1Top
    port map (
      aclk       => clk,
      iData      => FractLevelProd.k6,
      oData      => kCoeffProd.k6); 
FloatToFixedv1TopK7Inst: FloatToFixedv1Top
    port map (
      aclk       => clk,
      iData      => FractLevelProd.k7,
      oData      => kCoeffProd.k7);   
FloatToFixedv1TopK8Inst: FloatToFixedv1Top
    port map (
      aclk       => clk,
      iData      => FractLevelProd.k8,
      oData      => kCoeffProd.k8);  
FloatToFixedv1TopK9Inst: FloatToFixedv1Top
    port map (
      aclk       => clk,
      iData      => FractLevelProd.k9,
      oData      => kCoeffProd.k9);  
-----------------------------------------------------------------------------------------------
-- STAGE 4
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then 
        cc.fxToSnFxProd.k1 <= to_sfixed((kCoeffProd.k1), cc.fxToSnFxProd.k1);
        cc.fxToSnFxProd.k2 <= to_sfixed((kCoeffProd.k2), cc.fxToSnFxProd.k2);
        cc.fxToSnFxProd.k3 <= to_sfixed((kCoeffProd.k3), cc.fxToSnFxProd.k3);
        cc.fxToSnFxProd.k4 <= to_sfixed((kCoeffProd.k4), cc.fxToSnFxProd.k4);
        cc.fxToSnFxProd.k5 <= to_sfixed((kCoeffProd.k5), cc.fxToSnFxProd.k5);
        cc.fxToSnFxProd.k6 <= to_sfixed((kCoeffProd.k6), cc.fxToSnFxProd.k6);
        cc.fxToSnFxProd.k7 <= to_sfixed((kCoeffProd.k7), cc.fxToSnFxProd.k7);
        cc.fxToSnFxProd.k8 <= to_sfixed((kCoeffProd.k8), cc.fxToSnFxProd.k8);
        cc.fxToSnFxProd.k9 <= to_sfixed((kCoeffProd.k9), cc.fxToSnFxProd.k9);
    end if;
end process;
-----------------------------------------------------------------------------------------------
-- STAGE 5
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then 
        cc.snFxToSnProd.k1 <= to_signed(cc.fxToSnFxProd.k1(19 downto 0), 20);
        cc.snFxToSnProd.k2 <= to_signed(cc.fxToSnFxProd.k2(19 downto 0), 20);
        cc.snFxToSnProd.k3 <= to_signed(cc.fxToSnFxProd.k3(19 downto 0), 20);
        cc.snFxToSnProd.k4 <= to_signed(cc.fxToSnFxProd.k4(19 downto 0), 20);
        cc.snFxToSnProd.k5 <= to_signed(cc.fxToSnFxProd.k5(19 downto 0), 20);
        cc.snFxToSnProd.k6 <= to_signed(cc.fxToSnFxProd.k6(19 downto 0), 20);
        cc.snFxToSnProd.k7 <= to_signed(cc.fxToSnFxProd.k7(19 downto 0), 20);
        cc.snFxToSnProd.k8 <= to_signed(cc.fxToSnFxProd.k8(19 downto 0), 20);
        cc.snFxToSnProd.k9 <= to_signed(cc.fxToSnFxProd.k9(19 downto 0), 20);
    end if;
end process;
-----------------------------------------------------------------------------------------------
-- STAGE 6
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then 
        cc.snToTrimProd.k1 <= cc.snFxToSnProd.k1(19 downto 5);
        cc.snToTrimProd.k2 <= cc.snFxToSnProd.k2(19 downto 5);
        cc.snToTrimProd.k3 <= cc.snFxToSnProd.k3(19 downto 5);
        cc.snToTrimProd.k4 <= cc.snFxToSnProd.k4(19 downto 5);
        cc.snToTrimProd.k5 <= cc.snFxToSnProd.k5(19 downto 5);
        cc.snToTrimProd.k6 <= cc.snFxToSnProd.k6(19 downto 5);
        cc.snToTrimProd.k7 <= cc.snFxToSnProd.k7(19 downto 5);
        cc.snToTrimProd.k8 <= cc.snFxToSnProd.k8(19 downto 5);
        cc.snToTrimProd.k9 <= cc.snFxToSnProd.k9(19 downto 5);
    end if;
end process;
-----------------------------------------------------------------------------------------------
-- STAGE 7
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then
        cc.snSum.red   <= resize(cc.snToTrimProd.k1, ADD_RESULT_WIDTH) +
                          resize(cc.snToTrimProd.k2, ADD_RESULT_WIDTH) +
                          resize(cc.snToTrimProd.k3, ADD_RESULT_WIDTH) + ROUND;
        cc.snSum.green <= resize(cc.snToTrimProd.k4, ADD_RESULT_WIDTH) +
                          resize(cc.snToTrimProd.k5, ADD_RESULT_WIDTH) +
                          resize(cc.snToTrimProd.k6, ADD_RESULT_WIDTH) + ROUND;
        cc.snSum.blue  <= resize(cc.snToTrimProd.k7, ADD_RESULT_WIDTH) +
                          resize(cc.snToTrimProd.k8, ADD_RESULT_WIDTH) +
                          resize(cc.snToTrimProd.k9, ADD_RESULT_WIDTH) + ROUND;
    end if;
end process;
-----------------------------------------------------------------------------------------------
-- STAGE 8
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then 
        cc.snToTrimSum.red    <= cc.snSum.red(cc.snSum.red'left downto FRAC_BITS_TO_KEEP);
        cc.snToTrimSum.green  <= cc.snSum.green(cc.snSum.green'left downto FRAC_BITS_TO_KEEP);
        cc.snToTrimSum.blue   <= cc.snSum.blue(cc.snSum.blue'left downto FRAC_BITS_TO_KEEP);
    end if;
end process;
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
--FILTERS: SHARP BLURE EMBOS SOBEL
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
COLOR_DELAYED_ENABLED: if ((SHARP_FRAME = TRUE) or (BLURE_FRAME = TRUE) 
                        or (EMBOS_FRAME = TRUE) or (SOBEL_FRAME = TRUE)) generate
signal cc_rgbSum : std_logic_vector(i_data_width-1 downto 0) := black;
begin
-----------------------------------------------------------------------------------------------
-- STAGE 2
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then
        --Red
        cc.tpsd1.vTap0x <= rgbToFl_red;
        cc.tpsd2.vTap0x <= cc.tpsd1.vTap0x;
        cc.tpsd3.vTap0x <= cc.tpsd2.vTap0x;
        --Green
        cc.tpsd1.vTap1x <= rgbToFl_gre;
        cc.tpsd2.vTap1x <= cc.tpsd1.vTap1x;
        cc.tpsd3.vTap1x <= cc.tpsd2.vTap1x;
        --Blue
        cc.tpsd1.vTap2x <= rgbToFl_blu;
        cc.tpsd2.vTap2x <= cc.tpsd1.vTap2x;
        cc.tpsd3.vTap2x <= cc.tpsd2.vTap2x;
    end if;
end process;
-----------------------------------------------------------------------------------------------
-- STAGE 9
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then 
        cc.rgbSum  <= (cc.snToTrimSum.red + cc.snToTrimSum.green + cc.snToTrimSum.blue);
        if (cc.rgbSum(ROUND_RESULT_WIDTH-1) = hi) then
            cc_rgbSum <= black;
        elsif (unsigned(cc.rgbSum(ROUND_RESULT_WIDTH-2 downto i_data_width)) /= zero) then
            cc_rgbSum <= white;
        else
            cc_rgbSum <= std_logic_vector(cc.rgbSum(i_data_width-1 downto 0));
        end if;
    end if;
end process;
-----------------------------------------------------------------------------------------------
-- STAGE 10
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then
        oRgb.red    <= cc_rgbSum;
        oRgb.green  <= cc_rgbSum;
        oRgb.blue   <= cc_rgbSum;
        oRgb.valid  <= rgbSyncValid(9);
    end if;
end process;
-----------------------------------------------------------------------------------------------
end generate COLOR_DELAYED_ENABLED;
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
--COLOUR SPACE CONVERSION TO YCBCR
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
YCBCR_FRAME_ENABLED: if (YCBCR_FRAME = true) generate
    constant fullRange    : boolean := true;
    signal yCbCrRgb       : uChannel := (valid => lo, red => blackUn, green => blackUn, blue => blackUn);
    signal yCbCr128       : unsigned(i_data_width-1 downto 0);
    signal yCbCr16        : unsigned(i_data_width-1 downto 0);
begin
    yCbCr128        <= shift_left(to_unsigned(one,i_data_width), i_data_width - 1);
    yCbCr16         <= shift_left(to_unsigned(one,i_data_width), i_data_width - 4);
-----------------------------------------------------------------------------------------------
-- STAGE 2
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then
        cc.tpsd1.vTap0x <= rgbToFl_blu;
        cc.tpsd2.vTap0x <= rgbToFl_gre;
        cc.tpsd3.vTap0x <= rgbToFl_red;
        cc.tpsd1.vTap1x <= rgbToFl_blu;
        cc.tpsd2.vTap1x <= rgbToFl_gre;
        cc.tpsd3.vTap1x <= rgbToFl_red;
        cc.tpsd1.vTap2x <= rgbToFl_blu;
        cc.tpsd2.vTap2x <= rgbToFl_gre;
        cc.tpsd3.vTap2x <= rgbToFl_red;
    end if;
end process;
-----------------------------------------------------------------------------------------------
-- STAGE 9
-----------------------------------------------------------------------------------------------
process (clk)
    variable yRound      : unsigned(i_data_width-1 downto 0);
    variable cbRound     : unsigned(i_data_width-1 downto 0);
    variable crRound     : unsigned(i_data_width-1 downto 0);
    begin
    if rising_edge(clk) then
        if (cc.snToTrimSum.red(ROUND_RESULT_WIDTH-1) = hi)  then
            if fullRange then
                yRound := yCbCr16 + 1;
            else
                yRound := to_unsigned(1, i_data_width);
            end if;
        else
            if fullRange then
                yRound := yCbCr16;
            else
                yRound := (others => '0');
            end if;
        end if;
        if (cc.snToTrimSum.green(ROUND_RESULT_WIDTH-1) = hi) then
            cbRound := resize(yCbCr128+1, i_data_width);
        else
            cbRound := yCbCr128;
        end if;
        if (cc.snToTrimSum.blue(ROUND_RESULT_WIDTH-1) = hi) then
            crRound := resize(yCbCr128+1, i_data_width);
        else
            crRound := yCbCr128;
        end if;
        ---------------------------------------------------------------------------------------
        yCbCrRgb.red   <= (unsigned(cc.snToTrimSum.red(i_data_width-1 downto 0))) + yRound;
        yCbCrRgb.green <= (unsigned(cc.snToTrimSum.green(i_data_width-1 downto 0))) + cbRound;
        yCbCrRgb.blue  <= (unsigned(cc.snToTrimSum.blue(i_data_width-1 downto 0))) + crRound;
        ---------------------------------------------------------------------------------------
    end if;
end process;
-----------------------------------------------------------------------------------------------
-- STAGE 10
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then
        oRgb.red     <= std_logic_vector(yCbCrRgb.red);
        oRgb.green   <= std_logic_vector(yCbCrRgb.green);
        oRgb.blue    <= std_logic_vector(yCbCrRgb.blue);
        oRgb.valid   <=  rgbSyncValid(9);
    end if;
end process;
-----------------------------------------------------------------------------------------------
end generate YCBCR_FRAME_ENABLED;
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
--FILTERS: CGAIN
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
CGAIN_FRAME_ENABLED: if (CGAIN_FRAME = true) generate
    signal cGain : channel := (valid => lo, red => black, green => black, blue => black);
begin
-----------------------------------------------------------------------------------------------
-- STAGE 2
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then
        cc.tpsd1.vTap0x <= rgbToFl_blu;
        cc.tpsd2.vTap0x <= rgbToFl_gre;
        cc.tpsd3.vTap0x <= rgbToFl_red;
        cc.tpsd1.vTap1x <= rgbToFl_blu;
        cc.tpsd2.vTap1x <= rgbToFl_gre;
        cc.tpsd3.vTap1x <= rgbToFl_red;
        cc.tpsd1.vTap2x <= rgbToFl_blu;
        cc.tpsd2.vTap2x <= rgbToFl_gre;
        cc.tpsd3.vTap2x <= rgbToFl_red;
    end if;
end process;
-----------------------------------------------------------------------------------------------
-- STAGE 9
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then
        if (cc.snToTrimSum.red(ROUND_RESULT_WIDTH-1) = hi) then	
            cGain.red <= black;
        elsif (unsigned(cc.snToTrimSum.red(ROUND_RESULT_WIDTH-2 downto i_data_width)) /= zero) then	
            cGain.red <= white;
        else
            cGain.red <= std_logic_vector(cc.snToTrimSum.red(i_data_width-1 downto 0));
        end if;
        if (cc.snToTrimSum.green(ROUND_RESULT_WIDTH-1) = hi) then
            cGain.green <= black;
        elsif (unsigned(cc.snToTrimSum.green(ROUND_RESULT_WIDTH-2 downto i_data_width)) /= zero) then
            cGain.green <= white;
        else
            cGain.green <= std_logic_vector(cc.snToTrimSum.green(i_data_width-1 downto 0));
        end if;
        if (cc.snToTrimSum.blue(ROUND_RESULT_WIDTH-1) = hi) then
            cGain.blue <= black;
        elsif (unsigned(cc.snToTrimSum.blue(ROUND_RESULT_WIDTH-2 downto i_data_width)) /= zero) then
            cGain.blue <= white;
        else
            cGain.blue <= std_logic_vector(cc.snToTrimSum.blue(i_data_width-1 downto 0));
        end if;
    end if;
end process;
-----------------------------------------------------------------------------------------------
-- STAGE 10
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then
        oRgb.red    <= cGain.red;
        oRgb.green  <= cGain.green;
        oRgb.blue   <= cGain.blue;
        oRgb.valid  <= rgbSyncValid(9);
    end if;
end process;
-----------------------------------------------------------------------------------------------
end generate CGAIN_FRAME_ENABLED;
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
--VALID DELAYS
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then
        rgbSyncValid(0)  <= iRgb.valid;
        rgbSyncValid(1)  <= rgbSyncValid(0);
        rgbSyncValid(2)  <= rgbSyncValid(1);
        rgbSyncValid(3)  <= rgbSyncValid(2);
        rgbSyncValid(4)  <= rgbSyncValid(3);
        rgbSyncValid(5)  <= rgbSyncValid(4);
        rgbSyncValid(6)  <= rgbSyncValid(5);
        rgbSyncValid(7)  <= rgbSyncValid(6);
        rgbSyncValid(8)  <= rgbSyncValid(7);
        rgbSyncValid(9)  <= rgbSyncValid(8);
        rgbSyncValid(10) <= rgbSyncValid(9);
        rgbSyncValid(11) <= rgbSyncValid(10);
        rgbSyncValid(12) <= rgbSyncValid(11);
        rgbSyncValid(13) <= rgbSyncValid(12);
        rgbSyncValid(14) <= rgbSyncValid(13);
        rgbSyncValid(15) <= rgbSyncValid(14);
    end if; 
end process;
-----------------------------------------------------------------------------------------------
end Behavioral;
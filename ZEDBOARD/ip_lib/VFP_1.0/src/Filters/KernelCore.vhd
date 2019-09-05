library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.fixed_pkg.all;
use work.float_pkg.all;
use work.constantspackage.all;
use work.vpfrecords.all;
use work.portspackage.all;
entity KernelCore is
generic (
    SHARP_FRAME   : boolean := false;
    BLURE_FRAME   : boolean := false;
    EMBOS_FRAME   : boolean := false;
    YCBCR_FRAME   : boolean := false;
    SOBEL_FRAME   : boolean := false;
    CGAIN_FRAME   : boolean := false;
    img_width     : integer := 4096;
    i_data_width  : integer := 8);
port (
    clk              : in std_logic;
    rst_l            : in std_logic;
    iRgb             : in channel;
    kCoeff           : in kernelCoeff;
    oRgb             : out channel);
end KernelCore;
architecture Behavioral of KernelCore is
    signal fract          : float32;
    signal rgbLevel       : float32;
    signal cc             : ccRecord;
    signal levelValue     : sfixed(9 downto 0) := "0100000000";
    signal rgbSyncValid   : std_logic_vector(15 downto 0)  := x"0000";
    signal rgbToFl_red    : std_logic_vector(31 downto 0);
    signal rgbToFl_gre    : std_logic_vector(31 downto 0);
    signal rgbToFl_blu    : std_logic_vector(31 downto 0);
begin




-----------------------------------------------------------------------------------------------
--Coeff To Float
-----------------------------------------------------------------------------------------------
    rgbLevel       <= to_float ((levelValue), rgbLevel);
    fract          <= to_float ((0.001), fract);
    cc.flCoef.k1   <= to_float((signed(kCoeff.k1)),cc.flCoef.k1);
    cc.flCoef.k2   <= to_float((signed(kCoeff.k2)),cc.flCoef.k2);
    cc.flCoef.k3   <= to_float((signed(kCoeff.k3)),cc.flCoef.k3);
    cc.flCoef.k4   <= to_float((signed(kCoeff.k4)),cc.flCoef.k4);
    cc.flCoef.k5   <= to_float((signed(kCoeff.k5)),cc.flCoef.k5);
    cc.flCoef.k6   <= to_float((signed(kCoeff.k6)),cc.flCoef.k6);
    cc.flCoef.k7   <= to_float((signed(kCoeff.k7)),cc.flCoef.k7);
    cc.flCoef.k8   <= to_float((signed(kCoeff.k8)),cc.flCoef.k8);
    cc.flCoef.k9   <= to_float((signed(kCoeff.k9)),cc.flCoef.k9);
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
 process (clk,rst_l) begin
     if (rst_l = lo) then
         cc.rgbToFl.red   <= (others => '0');
         cc.rgbToFl.green <= (others => '0');
         cc.rgbToFl.blue  <= (others => '0');
     elsif rising_edge(clk) then 
         cc.rgbToFl.red   <= to_float(rgbToFl_red, cc.rgbToFl.red);
         cc.rgbToFl.green <= to_float(rgbToFl_gre, cc.rgbToFl.green);
         cc.rgbToFl.blue  <= to_float(rgbToFl_blu, cc.rgbToFl.blue);
     end if;
 end process;
-----------------------------------------------------------------------------------------------
-- STAGE 3
-----------------------------------------------------------------------------------------------
process (clk) begin 
    if rising_edge(clk) then 
        cc.flProd.k1 <= (cc.flCoefFract.k1 * cc.tpd3.vTap2x);
        cc.flProd.k2 <= (cc.flCoefFract.k2 * cc.tpd2.vTap2x);
        cc.flProd.k3 <= (cc.flCoefFract.k3 * cc.tpd1.vTap2x);
        cc.flProd.k4 <= (cc.flCoefFract.k4 * cc.tpd3.vTap1x);
        cc.flProd.k5 <= (cc.flCoefFract.k5 * cc.tpd2.vTap1x);
        cc.flProd.k6 <= (cc.flCoefFract.k6 * cc.tpd1.vTap1x);
        cc.flProd.k7 <= (cc.flCoefFract.k7 * cc.tpd3.vTap0x);
        cc.flProd.k8 <= (cc.flCoefFract.k8 * cc.tpd2.vTap0x);
        cc.flProd.k9 <= (cc.flCoefFract.k9 * cc.tpd1.vTap0x);
    end if;
end process;
-----------------------------------------------------------------------------------------------
-- STAGE 4
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then
        cc.flCoefFract.k1 <= (cc.flCoef.k1 * fract * rgbLevel);
        cc.flCoefFract.k2 <= (cc.flCoef.k2 * fract * rgbLevel);
        cc.flCoefFract.k3 <= (cc.flCoef.k3 * fract * rgbLevel);
        cc.flCoefFract.k4 <= (cc.flCoef.k4 * fract * rgbLevel);
        cc.flCoefFract.k5 <= (cc.flCoef.k5 * fract * rgbLevel);
        cc.flCoefFract.k6 <= (cc.flCoef.k6 * fract * rgbLevel);
        cc.flCoefFract.k7 <= (cc.flCoef.k7 * fract * rgbLevel);
        cc.flCoefFract.k8 <= (cc.flCoef.k8 * fract * rgbLevel);
        cc.flCoefFract.k9 <= (cc.flCoef.k9 * fract * rgbLevel);
    end if;
end process;
-----------------------------------------------------------------------------------------------
-- STAGE 5
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then 
        cc.flToSnFxProd.k1 <= to_sfixed((cc.flProd.k1), cc.flToSnFxProd.k1);
        cc.flToSnFxProd.k2 <= to_sfixed((cc.flProd.k2), cc.flToSnFxProd.k2);
        cc.flToSnFxProd.k3 <= to_sfixed((cc.flProd.k3), cc.flToSnFxProd.k3);
        cc.flToSnFxProd.k4 <= to_sfixed((cc.flProd.k4), cc.flToSnFxProd.k4);
        cc.flToSnFxProd.k5 <= to_sfixed((cc.flProd.k5), cc.flToSnFxProd.k5);
        cc.flToSnFxProd.k6 <= to_sfixed((cc.flProd.k6), cc.flToSnFxProd.k6);
        cc.flToSnFxProd.k7 <= to_sfixed((cc.flProd.k7), cc.flToSnFxProd.k7);
        cc.flToSnFxProd.k8 <= to_sfixed((cc.flProd.k8), cc.flToSnFxProd.k8);
        cc.flToSnFxProd.k9 <= to_sfixed((cc.flProd.k9), cc.flToSnFxProd.k9);
    end if;
end process;
-----------------------------------------------------------------------------------------------
-- STAGE 6
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then 
        cc.snFxToSnProd.k1 <= to_signed(cc.flToSnFxProd.k1(19 downto 0), 20);
        cc.snFxToSnProd.k2 <= to_signed(cc.flToSnFxProd.k2(19 downto 0), 20);
        cc.snFxToSnProd.k3 <= to_signed(cc.flToSnFxProd.k3(19 downto 0), 20);
        cc.snFxToSnProd.k4 <= to_signed(cc.flToSnFxProd.k4(19 downto 0), 20);
        cc.snFxToSnProd.k5 <= to_signed(cc.flToSnFxProd.k5(19 downto 0), 20);
        cc.snFxToSnProd.k6 <= to_signed(cc.flToSnFxProd.k6(19 downto 0), 20);
        cc.snFxToSnProd.k7 <= to_signed(cc.flToSnFxProd.k7(19 downto 0), 20);
        cc.snFxToSnProd.k8 <= to_signed(cc.flToSnFxProd.k8(19 downto 0), 20);
        cc.snFxToSnProd.k9 <= to_signed(cc.flToSnFxProd.k9(19 downto 0), 20);
    end if;
end process;
-----------------------------------------------------------------------------------------------
-- STAGE 7
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
-- STAGE 8
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
-- STAGE 9
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then 
        cc.snToTrimSum.red    <= cc.snSum.red(cc.snSum.red'left downto FRAC_BITS_TO_KEEP);
        cc.snToTrimSum.green  <= cc.snSum.green(cc.snSum.green'left downto FRAC_BITS_TO_KEEP);
        cc.snToTrimSum.blue   <= cc.snSum.blue(cc.snSum.blue'left downto FRAC_BITS_TO_KEEP);
    end if;
end process;
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
        cc.tpd1.vTap0x <= cc.rgbToFl.red;
        cc.tpd2.vTap0x <= cc.tpd1.vTap0x;
        cc.tpd3.vTap0x <= cc.tpd2.vTap0x;
        --Green
        cc.tpd1.vTap1x <= cc.rgbToFl.green;
        cc.tpd2.vTap1x <= cc.tpd1.vTap1x;
        cc.tpd3.vTap1x <= cc.tpd2.vTap1x;
        --Blue
        cc.tpd1.vTap2x <= cc.rgbToFl.blue;
        cc.tpd2.vTap2x <= cc.tpd1.vTap2x;
        cc.tpd3.vTap2x <= cc.tpd2.vTap2x;
    end if;
end process;
-----------------------------------------------------------------------------------------------
-- STAGE 10
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
-- STAGE 11
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
        cc.tpd1.vTap0x <= cc.rgbToFl.blue;
        cc.tpd2.vTap0x <= cc.rgbToFl.green;
        cc.tpd3.vTap0x <= cc.rgbToFl.red;
        cc.tpd1.vTap1x <= cc.rgbToFl.blue;
        cc.tpd2.vTap1x <= cc.rgbToFl.green;
        cc.tpd3.vTap1x <= cc.rgbToFl.red;
        cc.tpd1.vTap2x <= cc.rgbToFl.blue;
        cc.tpd2.vTap2x <= cc.rgbToFl.green;
        cc.tpd3.vTap2x <= cc.rgbToFl.red;
    end if;
end process;
-----------------------------------------------------------------------------------------------
-- STAGE 10
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
-- STAGE 11
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
CGAIN_FRAME_ENABLED: if (CGAIN_FRAME = true) generate
    signal cGain : channel := (valid => lo, red => black, green => black, blue => black);
    signal tpd1  : tapsFl;
    signal tpd2  : tapsFl;
    signal tpd3  : tapsFl;
begin
-----------------------------------------------------------------------------------------------
-- STAGE 2
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then
        cc.tpd1.vTap0x <= cc.rgbToFl.blue;
        cc.tpd2.vTap0x <= cc.rgbToFl.green;
        cc.tpd3.vTap0x <= cc.rgbToFl.red;
        cc.tpd1.vTap1x <= cc.rgbToFl.blue;
        cc.tpd2.vTap1x <= cc.rgbToFl.green;
        cc.tpd3.vTap1x <= cc.rgbToFl.red;
        cc.tpd1.vTap2x <= cc.rgbToFl.blue;
        cc.tpd2.vTap2x <= cc.rgbToFl.green;
        cc.tpd3.vTap2x <= cc.rgbToFl.red;
    end if;
end process;
-----------------------------------------------------------------------------------------------
-- STAGE 10
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
-- STAGE 11
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then
        oRgb.red    <= cGain.red;
        oRgb.green  <= cGain.green;
        oRgb.blue   <= cGain.blue;
        oRgb.valid  <=  rgbSyncValid(9);
    end if;
end process;
-----------------------------------------------------------------------------------------------
end generate CGAIN_FRAME_ENABLED;
-----------------------------------------------------------------------------------------------
-- VALID DELAYS
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
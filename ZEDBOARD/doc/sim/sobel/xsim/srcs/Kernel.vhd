library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfrecords.all;
use work.portspackage.all;
entity Kernel is
generic (
    INRGB_FRAME        : boolean := false;
    RGBLP_FRAME        : boolean := false;
    RGBTR_FRAME        : boolean := false;
    SHARP_FRAME        : boolean := false;
    BLURE_FRAME        : boolean := false;
    EMBOS_FRAME        : boolean := false;
    YCBCR_FRAME        : boolean := false;
    SOBEL_FRAME        : boolean := false;
    CGAIN_FRAME        : boolean := false;
    HSV_FRAME          : boolean := false;
    HSL_FRAME          : boolean := false;
    img_width          : integer := 4096;
    img_height         : integer := 4096;
    i_data_width       : integer := 8);
port (
    clk                : in std_logic;
    rst_l              : in std_logic;
    lumThreshold       : in  std_logic_vector(7 downto 0);
    txCord             : in coord;
    iRgb               : in channel;
    iKcoeff            : in kernelCoeff;
    oEdgeValid         : out std_logic;
    oRgb               : out colors);
end Kernel;
architecture Behavioral of Kernel is
    signal rgbSyncValid  : std_logic_vector(15 downto 0)  := x"0000";
    signal rgbMac1    : channel := (valid => lo, red => black, green => black, blue => black);
    signal rgbMac2    : channel := (valid => lo, red => black, green => black, blue => black);
    signal rgbMac3    : channel := (valid => lo, red => black, green => black, blue => black);
    constant init_channel  : channel := (valid => lo, red => black, green => black, blue => black);
begin
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
TPDATAWIDTH3_ENABLED: if ((SHARP_FRAME = TRUE) or (BLURE_FRAME = TRUE) or (EMBOS_FRAME = TRUE)) generate
    signal tp0        : std_logic_vector(23 downto 0) := (others => '0');
    signal tp1        : std_logic_vector(23 downto 0) := (others => '0');
    signal tp2        : std_logic_vector(23 downto 0) := (others => '0');
    signal tpValid    : std_logic  := lo;
begin
TapsControllerInst: TapsController
generic map(
    img_width    => img_width,
    tpDataWidth  => 24)
port map(
    clk          => clk,
    rst_l        => rst_l,
    iRgb         => iRgb,
    tpValid      => tpValid,
    tp0          => tp0,
    tp1          => tp1,
    tp2          => tp2);
process (clk,rst_l) begin
    if (rst_l = lo) then
        rgbMac1.red   <= (others => '0');
        rgbMac1.green <= (others => '0');
        rgbMac1.blue  <= (others => '0');
        rgbMac1.valid <= lo;
    elsif rising_edge(clk) then 
        rgbMac1.red   <= tp0(23 downto 16);
        rgbMac1.green <= tp1(23 downto 16);
        rgbMac1.blue  <= tp2(23 downto 16);
        rgbMac1.valid <= tpValid;
    end if; 
end process;
process (clk,rst_l) begin
    if (rst_l = lo) then
        rgbMac2.red   <= (others => '0');
        rgbMac2.green <= (others => '0');
        rgbMac2.blue  <= (others => '0');
        rgbMac2.valid <= lo;
    elsif rising_edge(clk) then 
        rgbMac2.red   <= tp0(15 downto 8);
        rgbMac2.green <= tp1(15 downto 8);
        rgbMac2.blue  <= tp2(15 downto 8);
        rgbMac2.valid <= tpValid;
    end if; 
end process;
process (clk,rst_l) begin
    if (rst_l = lo) then
        rgbMac3.red   <= (others => '0');
        rgbMac3.green <= (others => '0');
        rgbMac3.blue  <= (others => '0');
        rgbMac3.valid <= lo;
    elsif rising_edge(clk) then 
        rgbMac3.red   <= tp0(7 downto 0);
        rgbMac3.green <= tp1(7 downto 0);
        rgbMac3.blue  <= tp2(7 downto 0);
        rgbMac3.valid <= tpValid;
    end if; 
end process;
end generate TPDATAWIDTH3_ENABLED;
YCBCR_FRAME_ENABLE: if (YCBCR_FRAME = true) generate
signal ycbcr      : channel;
signal kCoeffYcbcr     : kernelCoeff;
begin
process (clk,rst_l) begin
    if (rst_l = lo) then
        kCoeffYcbcr.k1   <= x"0101";--  0.257
        kCoeffYcbcr.k2   <= x"01F8";--  0.504
        kCoeffYcbcr.k3   <= x"0062";--  0.098
        kCoeffYcbcr.k4   <= x"FF6C";-- -0.148
        kCoeffYcbcr.k5   <= x"FEDD";-- -0.291
        kCoeffYcbcr.k6   <= x"01B7";--  0.439
        kCoeffYcbcr.k7   <= x"01B7";--  0.439
        kCoeffYcbcr.k8   <= x"FE90";-- -0.368
        kCoeffYcbcr.k9   <= x"FFB9";-- -0.071
        kCoeffYcbcr.kSet <= 0;
    elsif rising_edge(clk) then
        if (iKcoeff.kSet = 6) then
            kCoeffYcbcr <= iKcoeff;
        end if;
    end if; 
end process;
Kernel_Ycbcr_Inst: KernelCore
generic map(
    SHARP_FRAME   => false,
    BLURE_FRAME   => false,
    EMBOS_FRAME   => false,
    YCBCR_FRAME   => YCBCR_FRAME,
    SOBEL_FRAME   => false,
    CGAIN_FRAME   => false,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => iRgb,
    kCoeff         => kCoeffYcbcr,
    oRgb           => ycbcr);
    oRgb.ycbcr.red     <=  ycbcr.red;
    oRgb.ycbcr.green   <=  ycbcr.green;
    oRgb.ycbcr.blue    <=  ycbcr.blue;
    oRgb.ycbcr.valid   <=  rgbSyncValid(9);
end generate YCBCR_FRAME_ENABLE;
CGAIN_FRAME_ENABLE: if (CGAIN_FRAME = true) generate
signal kCoeffCgain    : kernelCoeff;
signal cgain          : channel;
begin
process (clk,rst_l) begin
    if (rst_l = lo) then
     kCoeffCgain.k1   <= x"05DC";--  1375  =  1.375
     kCoeffCgain.k2   <= x"FF06";-- -250   = -0.250
     kCoeffCgain.k3   <= x"FF06";-- -500   = -0.500
     kCoeffCgain.k4   <= x"FF06";-- -500   = -0.500
     kCoeffCgain.k5   <= x"05DC";--  1375  =  1.375
     kCoeffCgain.k6   <= x"FF06";-- -250   = -0.250
     kCoeffCgain.k7   <= x"FF06";-- -250   = -0.250
     kCoeffCgain.k8   <= x"FF06";-- -500   = -0.500
     kCoeffCgain.k9   <= x"05DC";--  1375  =  1.375
     kCoeffCgain.kSet <= 0;
    elsif rising_edge(clk) then
        if (iKcoeff.kSet = 5) then
            kCoeffCgain <= iKcoeff;
        end if;
    end if;
end process;
Kernel_CGAIN_Inst: KernelCore
generic map(
    SHARP_FRAME   => false,
    BLURE_FRAME   => false,
    EMBOS_FRAME   => false,
    YCBCR_FRAME   => false,
    SOBEL_FRAME   => false,
    CGAIN_FRAME   => CGAIN_FRAME,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => iRgb,
    kCoeff         => kCoeffCgain,
    oRgb           => cgain);
    oRgb.cgain.red     <=  cgain.red;
    oRgb.cgain.blue    <=  cgain.blue;
    oRgb.cgain.green   <=  cgain.green;
    oRgb.cgain.valid   <=  rgbSyncValid(9);
end generate CGAIN_FRAME_ENABLE;
SHARP_FRAME_ENABLE: if (SHARP_FRAME = true) generate
signal oRed           : channel;
signal oGreen         : channel;
signal oBlue          : channel;
signal kCoeffSharp    : kernelCoeff;
begin
process (clk,rst_l) begin
    if (rst_l = lo) then
        kCoeffSharp.k1   <= x"0000";--  0
        kCoeffSharp.k2   <= x"FE0C";-- -0.5
        kCoeffSharp.k3   <= x"0000";--  0
        kCoeffSharp.k4   <= x"FE0C";-- -0.5
        kCoeffSharp.k5   <= x"0BB8";--  3
        kCoeffSharp.k6   <= x"FE0C";-- -0.5
        kCoeffSharp.k7   <= x"0000";--  0
        kCoeffSharp.k8   <= x"FE0C";-- -0.5
        kCoeffSharp.k9   <= x"0000";--  0
        kCoeffSharp.kSet <= 0;
    elsif rising_edge(clk) then
        if (iKcoeff.kSet = 4) then
            kCoeffSharp <= iKcoeff;
        end if;
    end if; 
end process;
Kernel_Sharp_Red_Inst: KernelCore
generic map(
    SHARP_FRAME   => SHARP_FRAME,
    BLURE_FRAME   => false,
    EMBOS_FRAME   => false,
    YCBCR_FRAME   => false,
    SOBEL_FRAME   => false,
    CGAIN_FRAME   => false,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => rgbMac1,
    kCoeff         => kCoeffSharp,
    oRgb           => oRed);
Kernel_Sharp_Green_Inst: KernelCore
generic map(
    SHARP_FRAME   => SHARP_FRAME,
    BLURE_FRAME   => false,
    EMBOS_FRAME   => false,
    YCBCR_FRAME   => false,
    SOBEL_FRAME   => false,
    CGAIN_FRAME   => false,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => rgbMac2,
    kCoeff         => kCoeffSharp,
    oRgb           => oGreen);
Kernel_Sharp_Blue_Inst: KernelCore
generic map(
    SHARP_FRAME   => SHARP_FRAME,
    BLURE_FRAME   => false,
    EMBOS_FRAME   => false,
    YCBCR_FRAME   => false,
    SOBEL_FRAME   => false,
    CGAIN_FRAME   => false,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => rgbMac3,
    kCoeff         => kCoeffSharp,
    oRgb           => oBlue);
    oRgb.sharp.red    <=  oRed.red;
    oRgb.sharp.green  <=  oGreen.red;
    oRgb.sharp.blue   <=  oBlue.red;
    oRgb.sharp.valid  <=  rgbSyncValid(9);
end generate SHARP_FRAME_ENABLE;
BLURE_FRAME_ENABLE: if (BLURE_FRAME = true) generate
signal oRed           : channel;
signal oGreen         : channel;
signal oBlue          : channel;
signal kCoeffBlur     : kernelCoeff;
begin
process (clk,rst_l) begin
    if (rst_l = lo) then
        kCoeffBlur.k1   <= x"006F";-- 0.111
        kCoeffBlur.k2   <= x"006F";-- 0.111
        kCoeffBlur.k3   <= x"006F";-- 0.111
        kCoeffBlur.k4   <= x"006F";-- 0.111
        kCoeffBlur.k5   <= x"006F";-- 0.111
        kCoeffBlur.k6   <= x"006F";-- 0.111
        kCoeffBlur.k7   <= x"006F";-- 0.111
        kCoeffBlur.k8   <= x"006F";-- 0.111
        kCoeffBlur.k9   <= x"006F";-- 0.111
        kCoeffBlur.kSet <= 0;
    elsif rising_edge(clk) then
        if (iKcoeff.kSet = 3) then
            kCoeffBlur <= iKcoeff;
        end if;
    end if; 
end process;
Kernel_Blur_Red_Inst: KernelCore
generic map(
    SHARP_FRAME   => false,
    BLURE_FRAME   => BLURE_FRAME,
    EMBOS_FRAME   => false,
    YCBCR_FRAME   => false,
    SOBEL_FRAME   => false,
    CGAIN_FRAME   => false,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => rgbMac1,
    kCoeff         => kCoeffBlur,
    oRgb           => oRed);
Kernel_Blur_Green_Inst: KernelCore
generic map(
    SHARP_FRAME   => false,
    BLURE_FRAME   => BLURE_FRAME,
    EMBOS_FRAME   => false,
    YCBCR_FRAME   => false,
    SOBEL_FRAME   => false,
    CGAIN_FRAME   => false,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => rgbMac2,
    kCoeff         => kCoeffBlur,
    oRgb           => oGreen);
Kernel_Blur_Blue_Inst: KernelCore
generic map(
    SHARP_FRAME   => false,
    BLURE_FRAME   => BLURE_FRAME,
    EMBOS_FRAME   => false,
    YCBCR_FRAME   => false,
    SOBEL_FRAME   => false,
    CGAIN_FRAME   => false,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => rgbMac3,
    kCoeff         => kCoeffBlur,
    oRgb           => oBlue);
    oRgb.blur.red    <=  oRed.red;
    oRgb.blur.green  <=  oGreen.red;
    oRgb.blur.blue   <=  oBlue.red;
    oRgb.blur.valid  <=  rgbSyncValid(14);
end generate BLURE_FRAME_ENABLE;
EMBOS_FRAME_ENABLE: if (EMBOS_FRAME = true) generate
signal oRed           : channel;
signal oGreen         : channel;
signal oBlue          : channel;
signal kCoeffEmbos    : kernelCoeff;
begin
process (clk,rst_l) begin
    if (rst_l = lo) then
        kCoeffEmbos.k1   <= x"FC18";-- -1
        kCoeffEmbos.k2   <= x"FC18";-- -1
        kCoeffEmbos.k3   <= x"0000";--  0
        kCoeffEmbos.k4   <= x"FC18";-- -1
        kCoeffEmbos.k5   <= x"0000";--  0
        kCoeffEmbos.k6   <= x"03E8";--  1
        kCoeffEmbos.k7   <= x"0000";--  0
        kCoeffEmbos.k8   <= x"03E8";--  1
        kCoeffEmbos.k9   <= x"03E8";--  1
        kCoeffEmbos.kSet <= 0;
    elsif rising_edge(clk) then
        if (iKcoeff.kSet = 2) then
            kCoeffEmbos <= iKcoeff;
        end if;
    end if; 
end process;
Kernel_Blur_Red_Inst: KernelCore
generic map(
    SHARP_FRAME   => false,
    BLURE_FRAME   => false,
    EMBOS_FRAME   => EMBOS_FRAME,
    YCBCR_FRAME   => false,
    SOBEL_FRAME   => false,
    CGAIN_FRAME   => false,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => rgbMac1,
    kCoeff         => kCoeffEmbos,
    oRgb           => oRed);
Kernel_Blur_Green_Inst: KernelCore
generic map(
    SHARP_FRAME   => false,
    BLURE_FRAME   => false,
    EMBOS_FRAME   => EMBOS_FRAME,
    YCBCR_FRAME   => false,
    SOBEL_FRAME   => false,
    CGAIN_FRAME   => false,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => rgbMac2,
    kCoeff         => kCoeffEmbos,
    oRgb           => oGreen);
Kernel_Blur_Blue_Inst: KernelCore
generic map(
    SHARP_FRAME   => false,
    BLURE_FRAME   => false,
    EMBOS_FRAME   => EMBOS_FRAME,
    YCBCR_FRAME   => false,
    SOBEL_FRAME   => false,
    CGAIN_FRAME   => false,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => rgbMac3,
    kCoeff         => kCoeffEmbos,
    oRgb           => oBlue);
    oRgb.embos.red    <=  oRed.red;
    oRgb.embos.green  <=  oGreen.red;
    oRgb.embos.blue   <=  oBlue.red;
    oRgb.embos.valid  <=  rgbSyncValid(11);
end generate EMBOS_FRAME_ENABLE;
SOBEL_FRAME_ENABLE: if (SOBEL_FRAME = true) generate
-----------------------------------------------------------------------------------------------
signal osobelX        : channel;
signal osobelY        : channel;
signal sobel          : channel;
signal kCoeffX        : kernelCoeff;
signal kCoeffY        : kernelCoeff;
signal mx             : unsigned(15 downto 0)         := (others => '0');
signal my             : unsigned(15 downto 0)         := (others => '0');
signal sxy            : unsigned(15 downto 0)         := (others => '0');
signal sqr            : std_logic_vector(31 downto 0) := (others => '0');
signal sbof           : std_logic_vector(31 downto 0) := (others => '0');
signal sobelThreshold : std_logic_vector(15 downto 0) :=x"006E"; --006E
signal tp0            : std_logic_vector(7 downto 0)  := (others => '0');
signal tp1            : std_logic_vector(7 downto 0)  := (others => '0');
signal tp2            : std_logic_vector(7 downto 0)  := (others => '0');
signal tpValid        : std_logic := lo;
signal edgeValid      : std_logic := lo;
signal ovalid         : std_logic := lo;
begin
-----------------------------------------------------------------------------------------------
-- TapsController
-----------------------------------------------------------------------------------------------
TapsControllerInst: TapsController
generic map(
    img_width    => img_width,
    tpDataWidth  => 8)
port map(
    clk          => clk,
    rst_l        => rst_l,
    iRgb         => iRgb,
    tpValid      => tpValid,
    tp0          => tp0,
    tp1          => tp1,
    tp2          => tp2);
-----------------------------------------------------------------------------------------------
-- Taps To Rgb
-----------------------------------------------------------------------------------------------
    sobel.red   <= tp0;
    sobel.green <= tp1;
    sobel.blue  <= tp2;
    sobel.valid <= tpValid;
-----------------------------------------------------------------------------------------------
-- Coeff Init Updates
-----------------------------------------------------------------------------------------------
process (clk,rst_l) begin
    if (rst_l = lo) then
        kCoeffX.k1   <= x"FC18";--  [-1]
        kCoeffX.k2   <= x"0000";--  [+0]
        kCoeffX.k3   <= x"03E8";--  [+1]
        kCoeffX.k4   <= x"F830";--  [-2]
        kCoeffX.k5   <= x"0000";--  [+0]
        kCoeffX.k6   <= x"07D0";--  [+2]
        kCoeffX.k7   <= x"FC18";--  [-1]
        kCoeffX.k8   <= x"0000";--  [+0]
        kCoeffX.k9   <= x"03E8";--  [+1]
        kCoeffX.kSet <= zero;
        kCoeffY.k1   <= x"03E8";--  [+1]
        kCoeffY.k2   <= x"07D0";--  [+2]
        kCoeffY.k3   <= x"03E8";--  [+1]
        kCoeffY.k4   <= x"0000";--  [-2]
        kCoeffY.k5   <= x"0000";--  [+0]
        kCoeffY.k6   <= x"0000";--  [+2]
        kCoeffY.k7   <= x"FC18";--  [-1]
        kCoeffY.k8   <= x"F830";--  [-2]
        kCoeffY.k9   <= x"FC18";--  [-1]
        kCoeffY.kSet <= zero;
    elsif rising_edge(clk) then
        if (iKcoeff.kSet = 8) then
            kCoeffX <= iKcoeff;
        end if;
        if (iKcoeff.kSet = 9) then
            kCoeffY <= iKcoeff;
        end if;
    end if; 
end process;
-----------------------------------------------------------------------------------------------
-- Sobel KernelCore For X Domain
-----------------------------------------------------------------------------------------------
KernelSobelXInst: KernelCore
generic map(
    SHARP_FRAME   => false,
    BLURE_FRAME   => false,
    EMBOS_FRAME   => false,
    YCBCR_FRAME   => false,
    SOBEL_FRAME   => SOBEL_FRAME,
    CGAIN_FRAME   => false,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => sobel,
    kCoeff         => kCoeffX,
    oRgb           => osobelX);
-----------------------------------------------------------------------------------------------
-- Sobel KernelCore For Y Domain
-----------------------------------------------------------------------------------------------
KernelSobelYInst: KernelCore
generic map(
    SHARP_FRAME   => false,
    BLURE_FRAME   => false,
    EMBOS_FRAME   => false,
    YCBCR_FRAME   => false,
    SOBEL_FRAME   => SOBEL_FRAME,
    CGAIN_FRAME   => false,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => sobel,
    kCoeff         => kCoeffY,
    oRgb           => osobelY);
-----------------------------------------------------------------------------------------------
-- Domains XY
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then
        mx  <= (unsigned(osobelX.red) * unsigned(osobelX.red));
        my  <= (unsigned(osobelY.red) * unsigned(osobelY.red));
    end if;
end process;
-----------------------------------------------------------------------------------------------
-- Domains XY
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then
        sxy <= (mx + my);
    end if;
end process;
-----------------------------------------------------------------------------------------------
-- Domains XY
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then
        sqr <= std_logic_vector(resize(unsigned(sxy), sqr'length));
    end if;
end process;
-----------------------------------------------------------------------------------------------
-- Square Root
-----------------------------------------------------------------------------------------------
squareRootTopInst: squareRootTop
port map(
    clk        => clk,
    ivalid     => rgbSyncValid(14),
    idata      => sqr,
    ovalid     => ovalid,
    odata      => sbof);
edgeValid  <= hi when (unsigned(sbof(15 downto 0)) > unsigned(sobelThreshold)) else lo;
oEdgeValid <= edgeValid;
-----------------------------------------------------------------------------------------------
-- Sobel oRgb
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then
        if (edgeValid = hi) then
            oRgb.sobel.red   <= black;
            oRgb.sobel.green <= black;
            oRgb.sobel.blue  <= black;
        else
            oRgb.sobel.red   <= white;
            oRgb.sobel.green <= white;
            oRgb.sobel.blue  <= white;
        end if;
            oRgb.sobel.valid <= rgbSyncValid(15);
    end if;
end process;
-----------------------------------------------------------------------------------------------
end generate SOBEL_FRAME_ENABLE;
INRGB_FRAME_ENABLE: if (INRGB_FRAME = true) generate
begin
    oRgb.inrgb <= iRgb;
end generate INRGB_FRAME_ENABLE;
HSV_FRAME_ENABLE: if (HSV_FRAME = true) generate
    signal hsvColor    : hsvChannel;
begin
hsvInst: hsv_c
generic map(
    i_data_width       => i_data_width)
port map(   
    clk                => clk,
    reset              => rst_l,
    iRgb               => iRgb,
    oHsv               => hsvColor);
    oRgb.hsv.red       <= hsvColor.h;
    oRgb.hsv.green     <= hsvColor.s;
    oRgb.hsv.blue      <= hsvColor.v;
    oRgb.hsv.valid     <= hsvColor.valid;
end generate HSV_FRAME_ENABLE;
HSL_FRAME_ENABLE: if (HSL_FRAME = true) generate
signal hslColor    : hslChannel;
begin
hslInst: hsl_c
generic map(
    i_data_width       => i_data_width)
port map(   
    clk                => clk,
    reset              => rst_l,
    iRgb               => iRgb,
    oHsl               => hslColor);
    oRgb.hsl.red       <= hslColor.h;
    oRgb.hsl.green     <= hslColor.s;
    oRgb.hsl.blue      <= hslColor.l;
    oRgb.hsl.valid     <= hslColor.valid;
end generate HSL_FRAME_ENABLE;
RGBTRIM_FRAME_ENABLE: if (RGBTR_FRAME = true) generate
begin
ColorTrimInst: ColorTrim
generic map(
    i_data_width       => i_data_width)
port map(   
    clk                => clk,
    reset              => rst_l,
    iRgb               => iRgb,
    oRgb               => oRgb.colorTrm);
end generate RGBTRIM_FRAME_ENABLE;
RGBLUMP_FRAME_ENABLE: if (RGBLP_FRAME = true) generate
begin
SegmentColorsInst: SegmentColors
port map(   
    clk                => clk,
    reset              => rst_l,
    lumThreshold       => lumThreshold,
    iRgb               => iRgb,
    oRgb               => oRgb.colorLmp);
end generate RGBLUMP_FRAME_ENABLE;
RGBLUMP_FRAME_DISABLED: if (RGBLP_FRAME = false) generate
    oRgb.colorLmp   <= init_channel;
end generate RGBLUMP_FRAME_DISABLED;
RGBTRIM_FRAME_DISABLED: if (RGBTR_FRAME = false) generate
    oRgb.colorTrm   <= init_channel;
end generate RGBTRIM_FRAME_DISABLED;
INRGB_FRAME_DISABLED: if (INRGB_FRAME = false) generate
    oRgb.inrgb   <= init_channel;
end generate INRGB_FRAME_DISABLED;
YCBCR_FRAME_DISABLED: if (YCBCR_FRAME = false) generate
    oRgb.ycbcr   <= init_channel;
end generate YCBCR_FRAME_DISABLED;
SHARP_FRAME_DISABLED: if (SHARP_FRAME = false) generate
    oRgb.sharp   <= init_channel;
end generate SHARP_FRAME_DISABLED;
BLURE_FRAME_DISABLED: if (BLURE_FRAME = false) generate
    oRgb.blur  <= init_channel;
end generate BLURE_FRAME_DISABLED;
EMBOS_FRAME_DISABLED: if (EMBOS_FRAME = false) generate
    oRgb.embos   <= init_channel;
end generate EMBOS_FRAME_DISABLED;
SOBEL_FRAME_DISABLED: if (SOBEL_FRAME = false) generate
    oRgb.sobel   <= init_channel;
end generate SOBEL_FRAME_DISABLED;
CGAIN_FRAME_DISABLED: if (CGAIN_FRAME = false) generate
    oRgb.cgain   <= init_channel;
end generate CGAIN_FRAME_DISABLED;
HSL_FRAME_DISABLED: if (HSL_FRAME = false) generate
    oRgb.hsl     <= init_channel;
end generate HSL_FRAME_DISABLED;
HSV_FRAME_DISABLED: if (HSV_FRAME = false) generate
    oRgb.hsv     <= init_channel;
end generate HSV_FRAME_DISABLED;
end Behavioral;
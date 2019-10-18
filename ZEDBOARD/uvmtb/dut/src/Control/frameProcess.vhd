library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity frameProcess is
generic (
    i_data_width            : integer := 8;
    s_data_width            : integer := 16;
    b_data_width            : integer := 32;
    img_width               : integer := 2751;
    adwrWidth               : integer := 16;
    addrWidth               : integer := 12);
port (
    clk                     : in std_logic;
    rst_l                   : in std_logic;
    iRgbSet                 : in rRgb;
    --cpu side in
    iRgbCoord               : in region;
    iPoiRegion              : in poi;
    iKls                    : in coefficient;
    iAls                    : in coefficient;
    iLumTh                  : in integer;
    iHsvPerCh               : in integer;
    iYccPerCh               : in integer;
    iEdgeType               : in std_logic_vector(b_data_width-1 downto 0);
    iThreshold              : in std_logic_vector(s_data_width-1 downto 0); 
    --out
    oFrameData              : out fcolors;
    --to cpu
    oFifoStatus             : out std_logic_vector(b_data_width-1 downto 0);
    oGridLockData           : out std_logic_vector(b_data_width-1 downto 0));
end entity;
architecture arch of frameProcess is
    signal txCord           : coord;
    signal rgbV1Correct     : channel;
    signal rgbV2Correct     : channel;
    signal rgbIn            : channel;
    signal rgbRemix         : channel;
    signal rgbPoi           : channel;
    signal rgbDetect        : channel;
    signal hsv              : hsvChannel;
    signal hsl              : hslChannel;
    signal hsvCcBlur4vx     : hsvChannel;
    signal cord             : coord;
    signal syncxy           : coord;
    signal cordIn           : coord;
    signal rgbSum           : tpRgb;
    signal rgbImageKernelv1 : colors;
    signal rgbImageKernelv2 : colors;
    signal rgbImageKernelv3 : colors;
    signal rgbImageKernelv4 : colors;
    signal rgbImageKernelv5 : colors;
    signal iKcoeff          : kernelCoeff;
    signal rgbImageFilters  : frameColors;
    signal lumThreshold     : std_logic_vector(7 downto 0);
    signal cHsv             : std_logic_vector(2 downto 0);
    signal cYcc             : std_logic_vector(2 downto 0);
    signal edgeValid        : std_logic;
    signal rgbDetectLock    : std_logic;
    signal rgbPoiLock       : std_logic;
    signal sValid           : std_logic;
    -------------------------------------------------
    constant F_TES          : boolean := false;
    constant F_LUM          : boolean := false;
    constant F_TRM          : boolean := false;
    constant F_RGB          : boolean := true;
    constant F_SHP          : boolean := false;
    constant F_BLU          : boolean := false;
    constant F_EMB          : boolean := false;
    constant F_YCC          : boolean := false;
    constant F_SOB          : boolean := false;
    constant F_CGA          : boolean := false;
    constant F_HSV          : boolean := true;
    constant F_HSL          : boolean := true;
    -------------------------------------------------
    constant F_CGA_TO_CGA   : boolean := false;
    constant F_CGA_TO_HSL   : boolean := false;
    constant F_CGA_TO_HSV   : boolean := false;
    constant F_CGA_TO_YCC   : boolean := false;
    constant F_CGA_TO_SHP   : boolean := false;
    constant F_CGA_TO_BLU   : boolean := false;
    -------------------------------------------------
    constant F_SHP_TO_SHP   : boolean := false;
    constant F_SHP_TO_HSL   : boolean := false;
    constant F_SHP_TO_HSV   : boolean := false;
    constant F_SHP_TO_YCC   : boolean := false;
    constant F_SHP_TO_CGA   : boolean := false;
    constant F_SHP_TO_BLU   : boolean := false;
    -------------------------------------------------
    constant F_BLU_TO_BLU   : boolean := false;
    constant F_BLU_TO_HSL   : boolean := false;
    constant F_BLU_TO_HSV   : boolean := false;
    constant F_BLU_TO_YCC   : boolean := false;
    constant F_BLU_TO_CGA   : boolean := false;
    constant F_BLU_TO_SHP   : boolean := false;
    -------------------------------------------------
    constant MASK_TRUE      : boolean := true;
    constant MASK_FLSE      : boolean := false;
    constant M_SOB_LUM      : boolean := SelFrame(F_SOB,F_LUM,MASK_FLSE);
    constant M_SOB_TRM      : boolean := SelFrame(F_SOB,F_TRM,MASK_FLSE);
    constant M_SOB_RGB      : boolean := SelFrame(F_SOB,F_RGB,MASK_TRUE);
    constant M_SOB_SHP      : boolean := SelFrame(F_SOB,F_SHP,MASK_TRUE);
    constant M_SOB_BLU      : boolean := SelFrame(F_SOB,F_BLU,MASK_FLSE);
    constant M_SOB_YCC      : boolean := SelFrame(F_SOB,F_YCC,MASK_FLSE);
    constant M_SOB_CGA      : boolean := SelFrame(F_SOB,F_CGA,MASK_TRUE);
    constant M_SOB_HSV      : boolean := SelFrame(F_SOB,F_HSV,MASK_TRUE);
    constant M_SOB_HSL      : boolean := SelFrame(F_SOB,F_HSL,MASK_TRUE);
begin
    lumThreshold                 <= std_logic_vector(to_unsigned(iLumTh,8));
    cHsv                         <= std_logic_vector(to_unsigned(iHsvPerCh,3));--[0-cHsv,1-cHsvH,2-cHsvS,3-cHsvV]
    cYcc                         <= std_logic_vector(to_unsigned(iYccPerCh,3));--[0-cYcc,1-cYccY,2-cYccB,3-cYccR]
    -------------------------------------------------
    oFrameData.sobel             <= rgbImageFilters.sobel;
    oFrameData.embos             <= rgbImageFilters.embos;
    oFrameData.blur              <= rgbImageFilters.blur;
    oFrameData.sharp             <= rgbImageFilters.sharp;
    oFrameData.cgain             <= rgbImageFilters.cgain;
    oFrameData.ycbcr             <= rgbImageFilters.ycbcr;
    oFrameData.hsl               <= rgbImageFilters.hsl;
    oFrameData.hsv               <= rgbImageFilters.hsv;
    oFrameData.inrgb             <= rgbImageFilters.inrgb;
    oFrameData.maskSobelLum      <= rgbImageFilters.maskSobelLum;
    oFrameData.maskSobelTrm      <= rgbImageFilters.maskSobelTrm;
    oFrameData.maskSobelRgb      <= rgbImageFilters.maskSobelRgb;
    oFrameData.maskSobelShp      <= rgbImageFilters.maskSobelShp;
    oFrameData.maskSobelBlu      <= rgbImageFilters.maskSobelBlu;
    oFrameData.maskSobelYcc      <= rgbImageFilters.maskSobelYcc;
    oFrameData.maskSobelHsv      <= rgbImageFilters.maskSobelHsv;
    oFrameData.maskSobelHsl      <= rgbImageFilters.maskSobelHsl;
    oFrameData.maskSobelCga      <= rgbImageFilters.maskSobelCga;
    oFrameData.colorTrm          <= rgbImageFilters.colorTrm;
    oFrameData.colorLmp          <= rgbImageFilters.colorLmp;
    oFrameData.tPattern          <= rgbImageFilters.tPattern;
    oFrameData.cgainToCgain      <= rgbImageFilters.cgainToCgain;
    oFrameData.cgainToHsl        <= rgbImageFilters.cgainToHsl;
    oFrameData.cgainToHsv        <= rgbImageFilters.cgainToHsv;
    oFrameData.cgainToYcbcr      <= rgbImageFilters.cgainToYcbcr;
    oFrameData.cgainToShp        <= rgbImageFilters.cgainToShp;
    oFrameData.cgainToBlu        <= rgbImageFilters.cgainToBlu;
    oFrameData.shpToCgain        <= rgbImageFilters.shpToCgain;
    oFrameData.shpToHsl          <= rgbImageFilters.shpToHsl;
    oFrameData.shpToHsv          <= rgbImageFilters.shpToHsv;
    oFrameData.shpToYcbcr        <= rgbImageFilters.shpToYcbcr;
    oFrameData.shpToShp          <= rgbImageFilters.shpToShp;
    oFrameData.shpToBlu          <= rgbImageFilters.shpToBlu;
    oFrameData.bluToBlu          <= rgbImageFilters.bluToBlu;
    oFrameData.bluToCga          <= rgbImageFilters.bluToCga;
    oFrameData.bluToShp          <= rgbImageFilters.bluToShp;
    oFrameData.bluToYcc          <= rgbImageFilters.bluToYcc;
    oFrameData.bluToHsv          <= rgbImageFilters.bluToHsv;
    oFrameData.bluToHsl          <= rgbImageFilters.bluToHsl;
    oFrameData.bluToCgaShp       <= rgbImageFilters.bluToCgaShp;
    oFrameData.bluToCgaShpYcc    <= rgbImageFilters.bluToCgaShpYcc;
    oFrameData.bluToCgaShpHsv    <= rgbImageFilters.bluToCgaShpHsv;
    oFrameData.bluToShpCga       <= rgbImageFilters.bluToShpCga;
    oFrameData.bluToShpCgaYcc    <= rgbImageFilters.bluToShpCgaYcc;
    oFrameData.bluToShpCgaHsv    <= rgbImageFilters.bluToShpCgaHsv;
    oFrameData.rgbRemix          <= rgbRemix;
    oFrameData.rgbDetect         <= rgbDetect;
    oFrameData.rgbPoi            <= rgbPoi;
    oFrameData.rgbSum            <= rgbSum;
    oFrameData.rgbDetectLock     <= rgbDetectLock;
    oFrameData.rgbPoiLock        <= rgbPoiLock;
    oFrameData.cod               <= syncxy;
    oFrameData.pEof              <= iRgbSet.pEof;
    oFrameData.pSof              <= iRgbSet.pSof;
    rgbIn.red                    <= iRgbSet.red;
    rgbIn.green                  <= iRgbSet.green;
    rgbIn.blue                   <= iRgbSet.blue;
    rgbIn.valid                  <= iRgbSet.valid;
    cordIn.x                     <= iRgbSet.cord.x;
    cordIn.y                     <= iRgbSet.cord.y;
    -------------------------------------------------
pipCoordP: process (clk) begin
    if rising_edge(clk) then
        syncxy          <= cordIn;
        cord            <= syncxy;
    end if;
end process pipCoordP;
    -------------------------------------------------
    iKcoeff.k1   <= iKls.k1(15 downto 0);
    iKcoeff.k2   <= iKls.k2(15 downto 0); 
    iKcoeff.k3   <= iKls.k3(15 downto 0); 
    iKcoeff.k4   <= iKls.k4(15 downto 0); 
    iKcoeff.k5   <= iKls.k5(15 downto 0); 
    iKcoeff.k6   <= iKls.k6(15 downto 0); 
    iKcoeff.k7   <= iKls.k7(15 downto 0); 
    iKcoeff.k8   <= iKls.k8(15 downto 0); 
    iKcoeff.k9   <= iKls.k9(15 downto 0); 
    iKcoeff.kSet <= iKls.config;
    -------------------------------------------------
FiltersInst: Filters
generic map(
    F_TES               =>  F_TES,
    F_LUM               =>  F_LUM,
    F_TRM               =>  F_TRM,
    F_RGB               =>  F_RGB,
    F_SHP               =>  F_SHP,
    F_BLU               =>  F_BLU,
    F_EMB               =>  F_EMB,
    F_YCC               =>  F_YCC,
    F_SOB               =>  F_SOB,
    F_CGA               =>  F_CGA,
    F_HSV               =>  F_HSV,
    F_HSL               =>  F_HSL,
    M_SOB_LUM           =>  M_SOB_LUM,
    M_SOB_TRM           =>  M_SOB_TRM,
    M_SOB_RGB           =>  M_SOB_RGB,
    M_SOB_SHP           =>  M_SOB_SHP,
    M_SOB_BLU           =>  M_SOB_BLU,
    M_SOB_YCC           =>  M_SOB_YCC,
    M_SOB_CGA           =>  M_SOB_CGA,
    M_SOB_HSV           =>  M_SOB_HSV,
    M_SOB_HSL           =>  M_SOB_HSL,
    F_CGA_TO_CGA        =>  F_CGA_TO_CGA,
    F_CGA_TO_HSL        =>  F_CGA_TO_HSL,
    F_CGA_TO_HSV        =>  F_CGA_TO_HSV,
    F_CGA_TO_YCC        =>  F_CGA_TO_YCC,
    F_CGA_TO_SHP        =>  F_CGA_TO_SHP,
    F_CGA_TO_BLU        =>  F_CGA_TO_BLU,
    F_SHP_TO_SHP        =>  F_SHP_TO_SHP,
    F_SHP_TO_HSL        =>  F_SHP_TO_HSL,
    F_SHP_TO_HSV        =>  F_SHP_TO_HSV,
    F_SHP_TO_YCC        =>  F_SHP_TO_YCC,
    F_SHP_TO_CGA        =>  F_SHP_TO_CGA,
    F_SHP_TO_BLU        =>  F_SHP_TO_BLU,
    F_BLU_TO_BLU        =>  F_BLU_TO_BLU,
    F_BLU_TO_HSL        =>  F_BLU_TO_HSL,
    F_BLU_TO_HSV        =>  F_BLU_TO_HSV,
    F_BLU_TO_YCC        =>  F_BLU_TO_YCC,
    F_BLU_TO_CGA        =>  F_BLU_TO_CGA,
    F_BLU_TO_SHP        =>  F_BLU_TO_SHP,
    img_width           =>  img_width,
    img_height          =>  img_width + 100,
    s_data_width        =>  s_data_width,
    i_data_width        =>  i_data_width)
port map(
    clk                 => clk,
    rst_l               => rst_l,
    txCord              => cord,
    lumThreshold        => lumThreshold,
    iThreshold          => iThreshold,
    iRgb                => rgbIn,
    cHsv                => cHsv,
    cYcc                => cYcc,
    iKcoeff             => iKcoeff,
    edgeValid           => edgeValid,
    oRgb                => rgbImageFilters);
detectInst: detect
generic map(
    i_data_width        => i_data_width)
port map(
    clk                 => clk,
    rst_l               => rst_l,
    iRgb                => rgbIn,
    rgbCoord            => iRgbCoord,
    endOfFrame          => iRgbSet.pEof,
    iCord               => cord,
    pDetect             => rgbDetectLock,
    oRgb                => rgbDetect);
pointOfInterestInst: pointOfInterest
generic map(
    i_data_width        => i_data_width,
    s_data_width        => s_data_width,
    b_data_width        => b_data_width)
port map(
    clk                 => clk,
    rst_l               => rst_l,
    iRgb                => rgbIn,
    iCord               => cord,
    endOfFrame          => iRgbSet.pEof,
    gridLockDatao       => oGridLockData,
    pRegion             => iPoiRegion,
    fifoStatus          => oFifoStatus,
    oGridLocation       => rgbPoiLock,
    oRgb                => rgbPoi);
frameTestPatternInst: frameTestPattern
generic map(
    s_data_width        => s_data_width)
port map(   
    clk                 => clk,
    iValid              => rgbIn.valid,
    iCord               => cord,
    oRgb                => rgbSum);
end architecture;
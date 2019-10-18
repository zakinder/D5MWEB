--05062019 [05-06-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity CoefMult is
port (
    clk            : in std_logic;
    rst_l          : in std_logic;
    iKcoeff        : in kernelCoeff;
    oCoeffProd     : out kCoefFiltFloat);
end CoefMult;
architecture behavioral of CoefMult is
    constant fractValue     : std_logic_vector(31 downto 0):= x"3a83126f";--0.001
    constant rgbLevelValue  : std_logic_vector(31 downto 0):= x"43800000";--256
    constant FloatMaxLat    : integer   := 20;
    type kCoefSt is (kCoefCgainState,kCoefSharpState,kCoefBlureState,kCoefYcbcrState,kCoefXSobeState,kCoefYSobeState,kCoefEmbosState,kCoefUpdaterState);
    signal kCoefStates      : kCoefSt; 
    signal kCoefVals        : kCoefFilters;
    signal kCoeffDWord      : kernelCoeDWord;
    signal kCofFrtProd      : kernelCoeDWord;
    signal upCtr            : integer   :=zero;
    signal kCoeffValid      : std_logic := hi;
    signal fractLevel       : std_logic_vector(31 downto 0):= (others => lo);
    signal kCof             : kernelCoeff;
begin
        kCoefVals.kCoeffYcbcr.k1   <= x"0101";--  0.257
        kCoefVals.kCoeffYcbcr.k2   <= x"01F8";--  0.504
        kCoefVals.kCoeffYcbcr.k3   <= x"0062";--  0.098
        kCoefVals.kCoeffYcbcr.k4   <= x"FF6C";-- -0.148
        kCoefVals.kCoeffYcbcr.k5   <= x"FEDD";-- -0.291
        kCoefVals.kCoeffYcbcr.k6   <= x"01B7";--  0.439
        kCoefVals.kCoeffYcbcr.k7   <= x"01B7";--  0.439
        kCoefVals.kCoeffYcbcr.k8   <= x"FE90";-- -0.368
        kCoefVals.kCoeffYcbcr.k9   <= x"FFB9";-- -0.071
        kCoefVals.kCoeffYcbcr.kSet <= kCoefYcbcrIndex;
        kCoefVals.kCoeffCgain.k1   <= x"05DC";--  1375  =  1.375
        kCoefVals.kCoeffCgain.k2   <= x"FF06";-- -250   = -0.250
        kCoefVals.kCoeffCgain.k3   <= x"FF06";-- -500   = -0.500
        kCoefVals.kCoeffCgain.k4   <= x"FF06";-- -500   = -0.500
        kCoefVals.kCoeffCgain.k5   <= x"05DC";--  1375  =  1.375
        kCoefVals.kCoeffCgain.k6   <= x"FF06";-- -250   = -0.250
        kCoefVals.kCoeffCgain.k7   <= x"FF06";-- -250   = -0.250
        kCoefVals.kCoeffCgain.k8   <= x"FF06";-- -500   = -0.500
        kCoefVals.kCoeffCgain.k9   <= x"05DC";--  1375  =  1.375
        kCoefVals.kCoeffCgain.kSet <= kCoefCgainIndex;
        kCoefVals.kCoeffSharp.k1   <= x"0000";--  0
        kCoefVals.kCoeffSharp.k2   <= x"FE0C";-- -0.5
        kCoefVals.kCoeffSharp.k3   <= x"0000";--  0
        kCoefVals.kCoeffSharp.k4   <= x"FE0C";-- -0.5
        kCoefVals.kCoeffSharp.k5   <= x"0BB8";--  3
        kCoefVals.kCoeffSharp.k6   <= x"FE0C";-- -0.5
        kCoefVals.kCoeffSharp.k7   <= x"0000";--  0
        kCoefVals.kCoeffSharp.k8   <= x"FE0C";-- -0.5
        kCoefVals.kCoeffSharp.k9   <= x"0000";--  0
        kCoefVals.kCoeffSharp.kSet <= kCoefSharpIndex;
        kCoefVals.kCoeffBlure.k1   <= x"006F";-- 0.111
        kCoefVals.kCoeffBlure.k2   <= x"006F";-- 0.111
        kCoefVals.kCoeffBlure.k3   <= x"006F";-- 0.111
        kCoefVals.kCoeffBlure.k4   <= x"006F";-- 0.111
        kCoefVals.kCoeffBlure.k5   <= x"006F";-- 0.111
        kCoefVals.kCoeffBlure.k6   <= x"006F";-- 0.111
        kCoefVals.kCoeffBlure.k7   <= x"006F";-- 0.111
        kCoefVals.kCoeffBlure.k8   <= x"006F";-- 0.111
        kCoefVals.kCoeffBlure.k9   <= x"006F";-- 0.111
        kCoefVals.kCoeffBlure.kSet <= kCoefBlureIndex;
        kCoefVals.kCoefXSobel.k1   <= x"FC18";--  [-1]
        kCoefVals.kCoefXSobel.k2   <= x"0000";--  [+0]
        kCoefVals.kCoefXSobel.k3   <= x"03E8";--  [+1]
        kCoefVals.kCoefXSobel.k4   <= x"F830";--  [-2]
        kCoefVals.kCoefXSobel.k5   <= x"0000";--  [+0]
        kCoefVals.kCoefXSobel.k6   <= x"07D0";--  [+2]
        kCoefVals.kCoefXSobel.k7   <= x"FC18";--  [-1]
        kCoefVals.kCoefXSobel.k8   <= x"0000";--  [+0]
        kCoefVals.kCoefXSobel.k9   <= x"03E8";--  [+1]
        kCoefVals.kCoefXSobel.kSet <= kCoefSobeXIndex;
        kCoefVals.kCoefYSobel.k1   <= x"03E8";--  [+1]
        kCoefVals.kCoefYSobel.k2   <= x"07D0";--  [+2]
        kCoefVals.kCoefYSobel.k3   <= x"03E8";--  [+1]
        kCoefVals.kCoefYSobel.k4   <= x"F830";--  [-2]
        kCoefVals.kCoefYSobel.k5   <= x"0000";--  [+0]
        kCoefVals.kCoefYSobel.k6   <= x"07D0";--  [+2]
        kCoefVals.kCoefYSobel.k7   <= x"FC18";--  [-1]
        kCoefVals.kCoefYSobel.k8   <= x"F830";--  [-2]
        kCoefVals.kCoefYSobel.k9   <= x"FC18";--  [-1]
        kCoefVals.kCoefYSobel.kSet <= kCoefSobeYIndex;
        kCoefVals.kCoeffEmbos.k1   <= x"FC18";-- -1
        kCoefVals.kCoeffEmbos.k2   <= x"FC18";-- -1
        kCoefVals.kCoeffEmbos.k3   <= x"0000";--  0
        kCoefVals.kCoeffEmbos.k4   <= x"FC18";-- -1
        kCoefVals.kCoeffEmbos.k5   <= x"0000";--  0
        kCoefVals.kCoeffEmbos.k6   <= x"03E8";--  1
        kCoefVals.kCoeffEmbos.k7   <= x"0000";--  0
        kCoefVals.kCoeffEmbos.k8   <= x"03E8";--  1
        kCoefVals.kCoeffEmbos.k9   <= x"03E8";--  1
        kCoefVals.kCoeffEmbos.kSet <= kCoefEmbosIndex;
        kCoefVals.kCoef1Cgain.k1   <= x"055F";--  1375  =  1.375
        kCoefVals.kCoef1Cgain.k2   <= x"FF83";-- -125   = -0.125
        kCoefVals.kCoef1Cgain.k3   <= x"FF06";-- -250   = -0.250
        kCoefVals.kCoef1Cgain.k4   <= x"FF06";-- -250   = -0.250
        kCoefVals.kCoef1Cgain.k5   <= x"055F";--  1375  =  1.375
        kCoefVals.kCoef1Cgain.k6   <= x"FF83";-- -125   = -0.125
        kCoefVals.kCoef1Cgain.k7   <= x"FF83";-- -125   = -0.125
        kCoefVals.kCoef1Cgain.k8   <= x"FF06";-- -250   = -0.250
        kCoefVals.kCoef1Cgain.k9   <= x"055F";--  1375  =  1.375
        kCoefVals.kCoef1Cgain.kSet <= kCoefCgai1Index;
        
FloatMaxLatP: process(clk) begin
    if (rising_edge (clk)) then
        if (rst_l = lo) then
            upCtr <= zero;
        else
            if (upCtr < (FloatMaxLat + one)) then
                upCtr  <= upCtr + one;
            --else
           --     upCtr <= zero;
            end if;
        end if;
    end if;
end process FloatMaxLatP;
kCoefStP: process (clk) begin
    if (rising_edge (clk)) then
        if (rst_l = lo) then
            kCoefStates <= kCoefYcbcrState;
        else
        case (kCoefStates) is
        when kCoefYcbcrState =>	
                kCof <= kCoefVals.kCoeffYcbcr;
            if (upCtr = FloatMaxLat) then
                oCoeffProd.kCoeffYcbcr <= kCofFrtProd;
                oCoeffProd.kCoeffYcbcr.kSet <= kCoefVals.kCoeffYcbcr.kSet;
                kCoefStates <= kCoefCgainState;
            end if;
        when kCoefCgainState =>
            kCof <= kCoefVals.kCoeffCgain;
            if (upCtr = FloatMaxLat) then
                oCoeffProd.kCoeffCgain <= kCofFrtProd;
                oCoeffProd.kCoeffCgain.kSet <= kCoefVals.kCoeffCgain.kSet;
                kCoefStates <= kCoefSharpState;
            end if;
        when kCoefSharpState =>
            kCof <= kCoefVals.kCoeffSharp;
            if (upCtr = FloatMaxLat) then
                oCoeffProd.kCoeffSharp <= kCofFrtProd;
                oCoeffProd.kCoeffSharp.kSet <= kCoefVals.kCoeffSharp.kSet;
                kCoefStates <= kCoefBlureState;
            end if;
        when kCoefBlureState =>
            kCof <= kCoefVals.kCoeffBlure;
            if (upCtr = FloatMaxLat) then
                oCoeffProd.kCoeffBlure <= kCofFrtProd;
                oCoeffProd.kCoeffBlure.kSet <= kCoefVals.kCoeffBlure.kSet;
                kCoefStates <= kCoefXSobeState;
            end if;
        when kCoefXSobeState =>	
            kCof <= kCoefVals.kCoefXSobel;
            if (upCtr = FloatMaxLat) then
                oCoeffProd.kCoefXSobel <= kCofFrtProd;
                oCoeffProd.kCoefXSobel.kSet <= kCoefVals.kCoefXSobel.kSet;
                kCoefStates <= kCoefYSobeState;
            end if;
        when kCoefYSobeState =>	
            kCof <= kCoefVals.kCoefYSobel;
            if (upCtr = FloatMaxLat) then
                oCoeffProd.kCoefYSobel <= kCofFrtProd;
                oCoeffProd.kCoefYSobel.kSet <= kCoefVals.kCoefYSobel.kSet;
                kCoefStates <= kCoefEmbosState;
            end if;
        when kCoefEmbosState =>	
            kCof <= kCoefVals.kCoeffEmbos;
            if (upCtr = FloatMaxLat) then
                oCoeffProd.kCoeffEmbos <= kCofFrtProd;
                oCoeffProd.kCoeffEmbos.kSet <= kCoefVals.kCoeffEmbos.kSet;
                kCoefStates <= kCoefEmbosState;
            end if;
        when kCoefUpdaterState =>
                kCoefStates <= kCoefUpdaterState;
            if (iKcoeff.kSet = kCoefVals.kCoeffYcbcr.kSet) then
                kCof                        <= iKcoeff;
                oCoeffProd.kCoeffYcbcr      <= kCofFrtProd;
                oCoeffProd.kCoeffYcbcr.kSet <= kCoefYcbcrIndex;
            elsif(iKcoeff.kSet = kCoefVals.kCoeffCgain.kSet)then
                kCof                        <= iKcoeff;
                oCoeffProd.kCoeffCgain      <= kCofFrtProd;
                oCoeffProd.kCoeffCgain.kSet <= kCoefCgainIndex;
            elsif(iKcoeff.kSet = kCoefVals.kCoeffSharp.kSet)then
                kCof                        <= iKcoeff;
                oCoeffProd.kCoeffSharp      <= kCofFrtProd;
                oCoeffProd.kCoeffSharp.kSet <= kCoefSharpIndex;
            elsif(iKcoeff.kSet = kCoefVals.kCoeffBlure.kSet)then
                kCof                        <= iKcoeff;
                oCoeffProd.kCoeffBlure      <= kCofFrtProd;
                oCoeffProd.kCoeffBlure.kSet <= kCoefBlureIndex;
            elsif(iKcoeff.kSet = kCoefVals.kCoefXSobel.kSet)then
                kCof                        <= iKcoeff;
                oCoeffProd.kCoefXSobel      <= kCofFrtProd;
                oCoeffProd.kCoefXSobel.kSet <= kCoefSobeXIndex;
            elsif(iKcoeff.kSet = kCoefVals.kCoefYSobel.kSet)then
                kCof                        <= iKcoeff;
                oCoeffProd.kCoefYSobel      <= kCofFrtProd;
                oCoeffProd.kCoefYSobel.kSet <= kCoefSobeYIndex;
            elsif(iKcoeff.kSet = kCoefVals.kCoeffEmbos.kSet)then
                kCof                        <= iKcoeff;
                oCoeffProd.kCoeffEmbos      <= kCofFrtProd;
                oCoeffProd.kCoeffEmbos.kSet <= kCoefEmbosIndex;
            elsif(iKcoeff.kSet = kCoefVals.kCoef1Cgain.kSet)then
                kCof                        <= iKcoeff;
                oCoeffProd.kCoef1Cgain      <= kCofFrtProd;
                oCoeffProd.kCoef1Cgain.kSet <= kCoefCgai1Index;
            else
                kCof                        <= iKcoeff;
              --oCoeffProd.kCoeffYcbcr      <= kCofFrtProd;
              --oCoeffProd.kCoeffYcbcr.kSet <= zero;
              --oCoeffProd.kCoeffCgain      <= kCofFrtProd;
              --oCoeffProd.kCoeffCgain.kSet <= zero;
              --oCoeffProd.kCoeffSharp      <= kCofFrtProd;
              --oCoeffProd.kCoeffSharp.kSet <= zero;
              --oCoeffProd.kCoeffBlure      <= kCofFrtProd;
              --oCoeffProd.kCoeffBlure.kSet <= zero;
              --oCoeffProd.kCoefXSobel      <= kCofFrtProd;
              --oCoeffProd.kCoefXSobel.kSet <= zero;
              --oCoeffProd.kCoefYSobel      <= kCofFrtProd;
              --oCoeffProd.kCoefYSobel.kSet <= zero;
              --oCoeffProd.kCoeffEmbos      <= kCofFrtProd;
              --oCoeffProd.kCoeffEmbos.kSet <= zero;
            end if;
        when others =>
            kCoefStates <= kCoefUpdaterState;
        end case;
        end if;
    end if;
end process kCoefStP;
-----------------------------------------------------------------------------------------------
--Coeff To Float
-----------------------------------------------------------------------------------------------
FloatMultiplyTopFractLevelInst: FloatMultiplyTop
    port map (
      clk        => clk,
      iAdata     => fractValue,
      iBdata     => rgbLevelValue,
      oRdata     => fractLevel);
-----------------------------------------------------------------------------------------------
WordToFloatTopK1inst: WordToFloatTop
    port map (
      aclk       => clk,
      rst_l      => rst_l,
      iValid     => kCoeffValid,
      iData      => kCof.k1,
      oValid     => open,
      oDataFloat => kCoeffDWord.k1);
WordToFloatTopK2inst: WordToFloatTop
    port map (
      aclk       => clk,
      rst_l      => rst_l,
      iValid     => kCoeffValid,
      iData      => kCof.k2,
      oValid     => open,
      oDataFloat => kCoeffDWord.k2);
WordToFloatTopK3inst: WordToFloatTop
    port map (
      aclk       => clk,
      rst_l      => rst_l,
      iValid     => kCoeffValid,
      iData      => kCof.k3,
      oValid     => open,
      oDataFloat => kCoeffDWord.k3);
WordToFloatTopK4inst: WordToFloatTop
    port map (
      aclk       => clk,
      rst_l      => rst_l,
      iValid     => kCoeffValid,
      iData      => kCof.k4,
      oValid     => open,
      oDataFloat => kCoeffDWord.k4);
WordToFloatTopK5inst: WordToFloatTop
    port map (
      aclk       => clk,
      rst_l      => rst_l,
      iValid     => kCoeffValid,
      iData      => kCof.k5,
      oValid     => open,
      oDataFloat => kCoeffDWord.k5);
WordToFloatTopK6inst: WordToFloatTop
    port map (
      aclk       => clk,
      rst_l      => rst_l,
      iValid     => kCoeffValid,
      iData      => kCof.k6,
      oValid     => open,
      oDataFloat => kCoeffDWord.k6);
WordToFloatTopK7inst: WordToFloatTop
    port map (
      aclk       => clk,
      rst_l      => rst_l,
      iValid     => kCoeffValid,
      iData      => kCof.k7,
      oValid     => open,
      oDataFloat => kCoeffDWord.k7);
WordToFloatTopK8inst: WordToFloatTop
    port map (
      aclk       => clk,
      rst_l      => rst_l,
      iValid     => kCoeffValid,
      iData      => kCof.k8,
      oValid     => open,
      oDataFloat => kCoeffDWord.k8);
WordToFloatTopK9inst: WordToFloatTop
    port map (
      aclk       => clk,
      rst_l      => rst_l,
      iValid     => kCoeffValid,
      iData      => kCof.k9,
      oValid     => open,
      oDataFloat => kCoeffDWord.k9);
FloatMultiplyTopK1Inst: FloatMultiplyTop
    port map (
      clk        => clk,
      iAdata     => kCoeffDWord.k1,
      iBdata     => fractLevel,
      oRdata     => kCofFrtProd.k1);
FloatMultiplyTopK2Inst: FloatMultiplyTop
    port map (
      clk        => clk,
      iAdata     => kCoeffDWord.k2,
      iBdata     => fractLevel,
      oRdata     => kCofFrtProd.k2);
FloatMultiplyTopK3Inst: FloatMultiplyTop
    port map (
      clk        => clk,
      iAdata     => kCoeffDWord.k3,
      iBdata     => fractLevel,
      oRdata     => kCofFrtProd.k3);
FloatMultiplyTopK4Inst: FloatMultiplyTop
    port map (
      clk        => clk,
      iAdata     => kCoeffDWord.k4,
      iBdata     => fractLevel,
      oRdata     => kCofFrtProd.k4);
FloatMultiplyTopK5Inst: FloatMultiplyTop
    port map (
      clk        => clk,
      iAdata     => kCoeffDWord.k5,
      iBdata     => fractLevel,
      oRdata     => kCofFrtProd.k5);
FloatMultiplyTopK6Inst: FloatMultiplyTop
    port map (
      clk        => clk,
      iAdata     => kCoeffDWord.k6,
      iBdata     => fractLevel,
      oRdata     => kCofFrtProd.k6);
FloatMultiplyTopK7Inst: FloatMultiplyTop
    port map (
      clk        => clk,
      iAdata     => kCoeffDWord.k7,
      iBdata     => fractLevel,
      oRdata     => kCofFrtProd.k7);
FloatMultiplyTopK8Inst: FloatMultiplyTop
    port map (
      clk        => clk,
      iAdata     => kCoeffDWord.k8,
      iBdata     => fractLevel,
      oRdata     => kCofFrtProd.k8);
FloatMultiplyTopK9Inst: FloatMultiplyTop
    port map (
      clk        => clk,
      iAdata     => kCoeffDWord.k9,
      iBdata     => fractLevel,
      oRdata     => kCofFrtProd.k9); 
end behavioral;
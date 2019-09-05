--09032019 [09-03-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity sobelFilter is
generic (
    pixelDelay     : integer := 8;
    i_data_width   : integer := 8;
    img_width      : integer := 256;
    adwrWidth      : integer := 16;
    addrWidth      : integer := 12);
port (
    clk            : in std_logic;
    rst_l          : in std_logic;
    iRgb           : in channel;
    iEdgeType      : in std_logic_vector(31 downto 0);
    endOfFrame     : in std_logic;
    threshold      : in std_logic_vector(15 downto 0);
    kls            : in coefficient;
    oRgb           : out channel;
    sValid         : out std_logic;
    edgeValid      : out std_logic);
end entity;
architecture arch of sobelFilter is
---------------------------------------------------------------------------------
    --GX
    --[-1 +0 +1]
    --[-2 +0 +2]
    --[-1 +0 +1]
    --ROW-1[-1 0 1]
    signal Kernel_1_X       : signed(i_data_width-1 downto 0) :=x"FF";
    signal Kernel_2_X       : signed(i_data_width-1 downto 0) :=x"00";
    signal Kernel_3_X       : signed(i_data_width-1 downto 0) :=x"01";
    --ROW-2[-2 0 2]
    signal Kernel_4_X       : signed(i_data_width-1 downto 0) :=x"FE";
    signal Kernel_5_X       : signed(i_data_width-1 downto 0) :=x"00";
    signal Kernel_6_X       : signed(i_data_width-1 downto 0) :=x"02";
    --ROW-3[-1 0 1]
    signal Kernel_7_X       : signed(i_data_width-1 downto 0) :=x"FF";
    signal Kernel_8_X       : signed(i_data_width-1 downto 0) :=x"00";
    signal Kernel_9_X       : signed(i_data_width-1 downto 0) :=x"01";
    --GY
    --[+1 +2 +1]
    --[+0 +0 +0]
    --[-1 -2 -1]
    --ROW-1[+1 +2 +1]
    signal Kernel_1_Y       : signed(i_data_width-1 downto 0) :=x"01";
    signal Kernel_2_Y       : signed(i_data_width-1 downto 0) :=x"02";
    signal Kernel_3_Y       : signed(i_data_width-1 downto 0) :=x"01";
    --ROW-2[+0 +0 +0]
    signal Kernel_4_Y       : signed(i_data_width-1 downto 0) :=x"00";
    signal Kernel_5_Y       : signed(i_data_width-1 downto 0) :=x"00";
    signal Kernel_6_Y       : signed(i_data_width-1 downto 0) :=x"00";
    --ROW-3[-1 -2 -1]
    signal Kernel_7_Y       : signed(i_data_width-1 downto 0) :=x"FF";
    signal Kernel_8_Y       : signed(i_data_width-1 downto 0) :=x"FE";
    signal Kernel_9_Y       : signed(i_data_width-1 downto 0) :=x"FF";
    signal vTap0x           : std_logic_vector(i_data_width-1 downto 0);
    signal vTap1x           : std_logic_vector(i_data_width-1 downto 0);
    signal vTap2x           : std_logic_vector(i_data_width-1 downto 0);
    signal d1R              : std_logic_vector(i_data_width-1 downto 0);
    signal d2R              : std_logic_vector(i_data_width-1 downto 0);
    signal d3R              : std_logic_vector(i_data_width-1 downto 0);
    signal d1Rgb             : channel;
    signal d2Rgb             : channel;
    signal mac1X            : s_pixel;
    signal mac2X            : s_pixel;
    signal mac3X            : s_pixel;
    signal mac1Y            : s_pixel;
    signal mac2Y            : s_pixel;
    signal mac3Y            : s_pixel;
    signal sobel            : presults;
    signal tpd1             : detap;
    signal tpd2             : detap;
    signal tpd3             : detap;
    signal en_datao         : std_logic;
    signal d1en             : std_logic;
    signal d2en             : std_logic;
    signal d3en             : std_logic;
    signal d4en             : std_logic;
    signal d5en             : std_logic;
    signal valid1R          : std_logic;
    signal valid2R          : std_logic;
    signal validO           : std_logic;
    signal configReg        : integer;
    signal rCountAddress    : integer := 0;
    signal rAddress         : std_logic_vector(15 downto 0);
    signal sobelThreshold   : unsigned(15 downto 0) :=x"0000";
begin
configReg <= to_integer(unsigned(iEdgeType));
kUpdateP : process (clk) begin
   if rising_edge(clk) then
       if (endOfFrame = '1' and kls.config = 1) then
           Kernel_1_X    <= signed(kls.k1(i_data_width-1 downto 0));
           Kernel_2_X    <= signed(kls.k2(i_data_width-1 downto 0));
           Kernel_3_X    <= signed(kls.k3(i_data_width-1 downto 0));
           Kernel_4_X    <= signed(kls.k4(i_data_width-1 downto 0));
           Kernel_5_X    <= signed(kls.k5(i_data_width-1 downto 0));
           Kernel_6_X    <= signed(kls.k6(i_data_width-1 downto 0));
           Kernel_7_X    <= signed(kls.k7(i_data_width-1 downto 0));
           Kernel_8_X    <= signed(kls.k8(i_data_width-1 downto 0));
           Kernel_9_X    <= signed(kls.k9(i_data_width-1 downto 0));
           Kernel_1_Y    <= signed(kls.k1(15 downto 8));
           Kernel_2_Y    <= signed(kls.k2(15 downto 8));
           Kernel_3_Y    <= signed(kls.k3(15 downto 8));
           Kernel_4_Y    <= signed(kls.k4(15 downto 8));
           Kernel_5_Y    <= signed(kls.k5(15 downto 8));
           Kernel_6_Y    <= signed(kls.k6(15 downto 8));
           Kernel_7_Y    <= signed(kls.k7(15 downto 8));
           Kernel_8_Y    <= signed(kls.k8(15 downto 8));
           Kernel_9_Y    <= signed(kls.k9(15 downto 8));
       end if;
   end if;
end process kUpdateP;
tapValidAdressP:process(clk)begin
        if rising_edge(clk) then
            if (iRgb.valid = '1') then
                rCountAddress  <= rCountAddress + 1;
            else
                rCountAddress  <= 0;
            end if;
        end if;
end process tapValidAdressP;
rAddress  <= std_logic_vector(to_unsigned(rCountAddress, 16));
bufferControllerInst: buffer_controller
    generic map(
    img_width        => img_width,
    adwrWidth        => adwrWidth,
    dataWidth        => 8,
    addrWidth        => addrWidth)
    port map(
    aclk             => clk,
    i_enable         => valid2R,
    i_data           => d3R,
    i_wadd           => rAddress,
    i_radd           => rAddress,
    en_datao         => en_datao,
    taps0x           => vTap0x,
    taps1x           => vTap1x,
    taps2x           => vTap2x);
piplEnabledP : process (clk) begin
    if rising_edge(clk) then
      d1en           <= en_datao;
      d2en           <= d1en;
      d3en           <= d2en;
      d4en           <= d3en;
      d5en           <= d4en;
    end if;
end process piplEnabledP;
piplValidP : process (clk) begin
    if rising_edge(clk) then
      valid1R        <= iRgb.valid;
      valid2R        <= valid1R;
    end if;
end process piplValidP;
piplTapDataP : process (clk) begin
    if rising_edge(clk) then
      d1R            <= iRgb.green;
      d2R            <= d1R;
      d3R            <= d2R;
    end if;
end process piplTapDataP;
tapDelayP : process (clk) begin
    if rising_edge(clk) then
        if (rst_l = lo) then
            tpd1.vTap0x    <= (others => '0');
            tpd1.vTap1x    <= (others => '0');
            tpd1.vTap2x    <= (others => '0');
            tpd2.vTap0x    <= (others => '0');
            tpd2.vTap1x    <= (others => '0');
            tpd2.vTap2x    <= (others => '0'); 
            tpd3.vTap0x    <= (others => '0');
            tpd3.vTap1x    <= (others => '0');
            tpd3.vTap2x    <= (others => '0');
          else
            tpd1.vTap0x    <= signed(lo & vTap0x);
            tpd1.vTap1x    <= signed(lo & vTap1x);
            tpd1.vTap2x    <= signed(lo & vTap2x);
            tpd2.vTap0x    <= tpd1.vTap0x;
            tpd2.vTap1x    <= tpd1.vTap1x;
            tpd2.vTap2x    <= tpd1.vTap2x;
            tpd3.vTap0x    <= tpd2.vTap0x;
            tpd3.vTap1x    <= tpd2.vTap1x;
            tpd3.vTap2x    <= tpd2.vTap2x;
        end if;
    end if;
end process tapDelayP;
-----------------------------------------------------------------------------------------------
-- STAGE 1
-----------------------------------------------------------------------------------------------
MAC_X_A : process (clk) begin
    if rising_edge(clk) then
        mac1X.m1    <= lo & (tpd1.vTap0x * Kernel_9_X);
        mac1X.m2    <= lo & (tpd2.vTap0x * Kernel_8_X);
        mac1X.m3    <= lo & (tpd3.vTap0x * Kernel_7_X);
        mac1X.mac   <= mac1X.m1(16 downto 0) + mac1X.m2(16 downto 0) + mac1X.m3(16 downto 0);
  end if;
end process MAC_X_A;
-----------------------------------------------------------------------------------------------
-- STAGE 2
-----------------------------------------------------------------------------------------------
MAC_X_B : process (clk) begin
    if rising_edge(clk) then
        mac2X.m1    <= lo & (tpd1.vTap1x * Kernel_6_X);
        mac2X.m2    <= lo & (tpd2.vTap1x * Kernel_5_X);
        mac2X.m3    <= lo & (tpd3.vTap1x * Kernel_4_X);
        mac2X.mac   <= mac2X.m1(16 downto 0) + mac2X.m2(16 downto 0) + mac2X.m3(16 downto 0);
    end if;
end process MAC_X_B;
-----------------------------------------------------------------------------------------------
-- STAGE 3
-----------------------------------------------------------------------------------------------
MAC_X_C : process (clk) begin
    if rising_edge(clk) then
        mac3X.m1    <= lo & (tpd1.vTap2x * Kernel_3_X);
        mac3X.m2    <= lo & (tpd2.vTap2x * Kernel_2_X);
        mac3X.m3    <= lo & (tpd3.vTap2x * Kernel_1_X);
        mac3X.mac   <= mac3X.m1(16 downto 0) + mac3X.m2(16 downto 0) + mac3X.m3(16 downto 0);
    end if;
end process MAC_X_C;
MAC_Y_A : process (clk) begin
    if rising_edge(clk) then
        mac1Y.m1    <= lo & (tpd1.vTap0x * Kernel_9_Y);
        mac1Y.m2    <= lo & (tpd1.vTap0x * Kernel_8_Y);
        mac1Y.m3    <= lo & (tpd1.vTap0x * Kernel_7_Y);
        mac1Y.mac   <= mac1Y.m1(16 downto 0) + mac1Y.m2(16 downto 0) + mac1Y.m3(16 downto 0);
    end if;
end process MAC_Y_A;
MAC_Y_B : process (clk) begin
    if rising_edge(clk) then
        mac2Y.m1    <= lo & (tpd1.vTap1x * Kernel_6_Y);
        mac2Y.m2    <= lo & (tpd1.vTap1x * Kernel_5_Y);
        mac2Y.m3    <= lo & (tpd1.vTap1x * Kernel_4_Y);
        mac2Y.mac   <= mac2Y.m1(16 downto 0) + mac2Y.m2(16 downto 0) + mac2Y.m3(16 downto 0);
    end if;
end process MAC_Y_B;
-----------------------------------------------------------------------------------------------
-- STAGE 3
-----------------------------------------------------------------------------------------------
MAC_Y_C : process (clk) begin
    if rising_edge(clk) then
        mac3Y.m1    <= lo & (tpd1.vTap2x * Kernel_3_Y);
        mac3Y.m2    <= lo & (tpd1.vTap2x * Kernel_2_Y);
        mac3Y.m3    <= lo & (tpd1.vTap2x * Kernel_1_Y);
        mac3Y.mac   <= mac3Y.m1(16 downto 0) + mac3Y.m2(16 downto 0) + mac3Y.m3(16 downto 0);
    end if;
end process MAC_Y_C;
-----------------------------------------------------------------------------------------------
-- STAGE 4
-----------------------------------------------------------------------------------------------
PA_X : process (clk, rst_l) begin
    if rst_l = lo then
        sobel.pax <= (others => '0');
    elsif rising_edge(clk) then
        sobel.pax <= mac1X.mac + mac2X.mac + mac3X.mac;
    end if;
end process PA_X;
-----------------------------------------------------------------------------------------------
-- STAGE 4
-----------------------------------------------------------------------------------------------
PA_Y : process (clk, rst_l) begin
    if rst_l = lo then
        sobel.pay <= (others => '0');
    elsif rising_edge(clk) then
        sobel.pay <= mac1Y.mac + mac2Y.mac + mac3Y.mac;
    end if;
end process PA_Y;
-----------------------------------------------------------------------------------------------
-- STAGE 5
-----------------------------------------------------------------------------------------------
GX : process (clk, rst_l) begin
    if rst_l = lo then
        sobel.mx <= (others => '0');
    elsif rising_edge(clk) then
        sobel.mx <= lo & (sobel.pax * sobel.pax);
    end if;
end process GX;
-----------------------------------------------------------------------------------------------
-- STAGE 5
-----------------------------------------------------------------------------------------------
GY : process (clk, rst_l) begin
    if rst_l = lo then
        sobel.my <= (others => '0');
    elsif rising_edge(clk) then
        sobel.my <= lo & (sobel.pay * sobel.pay);
    end if;
end process GY;
-----------------------------------------------------------------------------------------------
-- STAGE 6
-----------------------------------------------------------------------------------------------
GS : process (clk, rst_l) begin
    if rst_l = lo then
        sobel.sxy <= (others => '0');
    elsif rising_edge(clk) then
        sobel.sxy <= (sobel.mx + sobel.my);
    end if;
end process GS;
SQROOT : process (clk, rst_l) begin
    if rst_l = lo then
        sobel.sqr <=(others => '0');
    elsif rising_edge(clk) then
        sobel.sqr    <= std_logic_vector(sobel.sxy(31 downto 0));
    end if;
end process SQROOT;
------------------------------------------------------------------------------------------------
squareRootTopInst: squareRootTop --LATENCY 32
port map(
    aclk              => clk,
    sFXtFoTvalid      => d5en,
    sFXtFoTdata       => sobel.sqr,
    mFOtFxRtvalid     => validO,
    mFOtFxRtdata      => sobel.sbof);
------------------------------------------------------------------------------------------------
    sobelThreshold    <= unsigned(std_logic_vector(sobel.sbof(15 downto 0)));
    oRgb.valid        <= validO;
    sValid            <= validO;
------------------------------------------------------------------------------------------------
SyncFrames32Inst: SyncFrames
generic map(
    pixelDelay => 31) --LATENCY 32
port map(
    clk        => clk,
    reset      => rst_l,
    iRgb       => iRgb,
    oRgb       => d1Rgb);
SyncFrames12Inst: SyncFrames
generic map(
    pixelDelay => pixelDelay) --LATENCY 12
port map(
    clk        => clk,
    reset      => rst_l,
    iRgb       => d1Rgb,
    oRgb       => d2Rgb);
edgeValuesP : process (clk) begin
    if rising_edge(clk) then
    if (rst_l = lo) then
        oRgb.red   <= black;
        oRgb.green <= black;
        oRgb.blue  <= black;
        edgeValid  <= lo;
    else
        if (sobelThreshold > unsigned(threshold)) then
            edgeValid  <= hi;
            oRgb.red   <= black;
            oRgb.green <= black;
            oRgb.blue  <= black;
        else
            edgeValid  <= lo;
            if (configReg = 1) then
                oRgb.red   <= d2Rgb.red;
                oRgb.green <= d2Rgb.green;
                oRgb.blue  <= d2Rgb.blue;
            else
                oRgb.red   <= white;
                oRgb.green <= white;
                oRgb.blue  <= white;
            end if;
        end if;
    end if;
    end if;
end process edgeValuesP;
end architecture;
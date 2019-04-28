--01222019 [01-22-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.fixed_pkg.all;
use work.float_pkg.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity sobel is
generic (
    i_data_width   : integer := 8;
    img_width      : integer := 256;
    adwr_width     : integer := 16;
    addr_width     : integer := 11);
port (
    clk            : in std_logic;
    rst_l          : in std_logic;
    iRgb           : in channel;
    bRgb           : in channel;
    sRgb           : in channel;
    oRgb           : out channel;
    oRgbRemix      : out channel;
    videoChannel   : in std_logic_vector(31 downto 0);
    endOfFrame     : in std_logic;
    threshold      : in std_logic_vector(15 downto 0);
    kls            : in coefficient);
end entity;
architecture arch of sobel is
---------------------------------------------------------------------------------
    --GX
    --[-1 +0 +1]
    --[-2 +0 +2]
    --[-1 +0 +1]
    --ROW-1[-1 0 1]
    signal Kernel_1_X : signed(i_data_width-1 downto 0) :=x"FF";
    signal Kernel_2_X : signed(i_data_width-1 downto 0) :=x"00";
    signal Kernel_3_X : signed(i_data_width-1 downto 0) :=x"01";
    --ROW-2[-2 0 2]
    signal Kernel_4_X : signed(i_data_width-1 downto 0) :=x"FE";
    signal Kernel_5_X : signed(i_data_width-1 downto 0) :=x"00";
    signal Kernel_6_X : signed(i_data_width-1 downto 0) :=x"02";
    --ROW-3[-1 0 1]
    signal Kernel_7_X : signed(i_data_width-1 downto 0) :=x"FF";
    signal Kernel_8_X : signed(i_data_width-1 downto 0) :=x"00";
    signal Kernel_9_X : signed(i_data_width-1 downto 0) :=x"01";
    --GY
    --[+1 +2 +1]
    --[+0 +0 +0]
    --[-1 -2 -1]
    --ROW-1[+1 +2 +1]
    signal Kernel_1_Y : signed(i_data_width-1 downto 0) :=x"01";
    signal Kernel_2_Y : signed(i_data_width-1 downto 0) :=x"02";
    signal Kernel_3_Y : signed(i_data_width-1 downto 0) :=x"01";
    --ROW-2[+0 +0 +0]
    signal Kernel_4_Y : signed(i_data_width-1 downto 0) :=x"00";
    signal Kernel_5_Y : signed(i_data_width-1 downto 0) :=x"00";
    signal Kernel_6_Y : signed(i_data_width-1 downto 0) :=x"00";
    --ROW-3[-1 -2 -1]
    signal Kernel_7_Y : signed(i_data_width-1 downto 0) :=x"FF";
    signal Kernel_8_Y : signed(i_data_width-1 downto 0) :=x"FE";
    signal Kernel_9_Y : signed(i_data_width-1 downto 0) :=x"FF";
---------------------------------------------------------------------------------
    type detap is record
        vTap0x     : signed(i_data_width downto 0);
        vTap1x     : signed(i_data_width downto 0);
        vTap2x     : signed(i_data_width downto 0);
    end record;
    type s_pixel is record
        m1         : signed (17 downto 0);
        m2         : signed (17 downto 0);
        m3         : signed (17 downto 0);
        mac        : signed (16 downto 0);
    end record;
    type presults is record
        pax        : signed (16 downto 0);
        pay        : signed (16 downto 0);
        mx         : signed (34 downto 0);
        my         : signed (34 downto 0);
        sxy        : signed (34 downto 0);
        sqr        : std_logic_vector (31 downto 0);
        sbo        : unsigned (15 downto 0);
        sbof       : std_logic_vector (31 downto 0);
    end record;
---------------------------------------------------------------------------------
    signal vTap0x           : std_logic_vector(i_data_width-1 downto 0);
    signal vTap1x           : std_logic_vector(i_data_width-1 downto 0);
    signal vTap2x           : std_logic_vector(i_data_width-1 downto 0);
    signal d1R              : std_logic_vector(i_data_width-1 downto 0);
    signal d2R              : std_logic_vector(i_data_width-1 downto 0);
    signal d3R              : std_logic_vector(i_data_width-1 downto 0);
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
    signal rMax             : std_logic_vector(i_data_width-1 downto 0);
    signal rMin             : std_logic_vector(i_data_width-1 downto 0);
    signal gMax             : std_logic_vector(i_data_width-1 downto 0);
    signal gMin             : std_logic_vector(i_data_width-1 downto 0);
    signal bMax             : std_logic_vector(i_data_width-1 downto 0);
    signal bMin             : std_logic_vector(i_data_width-1 downto 0);
    signal dGrid            : std_logic;
    signal rgb1Int          : intChannel;
    signal rgb2Int          : intChannel;
    signal rgb3Int          : intChannel;
    signal rgb4Int          : intChannel;
    signal rgb1b            : channel;
    signal rgb2b            : channel;
    signal rgb3b            : channel;
    signal rgb4b            : channel;
    signal rgb1s            : channel;
    signal rgb2s            : channel;
    signal configReg        : integer;
    signal rCountAddress    : integer := 0;
    signal rAddress         : std_logic_vector(15 downto 0);
    -- signal n1 : ufixed(4 downto -3);
    -- signal n2 : ufixed(2 downto -4);
    -- signal n3 : ufixed(8 downto -6);     -- see how range of n3 is declared here. 
    -- signal s1 : sfixed(4 downto -3);
    -- signal s2 : sfixed(2 downto -4);
    -- signal s3 : sfixed(9 downto -5);     -- see how range of s3 is declared here. 
    -- signal A_fp32 : float32;    
---------------------------------------------------------------------------------
begin
-- A_fp32 <= "01000000110100000000000000000000" ; -- 6.5
-- n1 <=  to_ufixed (6.75,n1);          -- n1 = "00110 110" = 6.75 
-- n2 <=  to_ufixed (1.5,n2);           -- n2 = "001 1000" = 1.5 
-- n3 <= n1 / n2;                       -- n3 = "0000001 00100000" = 1.5
-- s1 <=  "11011001";--  -4.875  -- 11011010 = -4.75
--s1 <=  to_sfixed (-5.75,s1);         -- s1 = "11001 010" = -6.75 , 11000 010 = -7.75, 11010010 = -5.75 
-- s2 <=  to_sfixed (1.5,s2);           -- s2 = "0011000" = 1.5 
-- s3 <= s1 / s2;
    process(clk)begin
        if rising_edge(clk) then
            if (iRgb.valid = '1') then
                rCountAddress  <= rCountAddress + 1;
            else
                rCountAddress  <= 0;
            end if;
        end if;
    end process;
    rAddress  <= std_logic_vector(to_unsigned(rCountAddress, 16));
configReg <= to_integer(unsigned(videoChannel));
KUPDATE : process (clk) begin
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
end process KUPDATE;
mod6_1_1_inst: buffer_controller
    generic map(
    img_width            => img_width,
    adwr_width           => 15,
    p_data_width         => 7,
    addr_width           => 11)
    port map(
    aclk                 => clk,
    i_enable             => valid2R,
    i_data               => d3R,
    i_wadd               => rAddress,
    i_radd               => rAddress,
    en_datao             => en_datao,
    taps0x               => vTap0x,
    taps1x               => vTap1x,
    taps2x               => vTap2x);
  -------------------------------------------------------------------------
  -- data should be at 4 cycle after pValid
  -------------------------------------------------------------------------
  TAP_SIGNED : process (clk)
  begin
    if rising_edge(clk) then
      rgb1s          <= sRgb;
      rgb2s          <= rgb1s;
      rgb1Int.red    <= to_integer(unsigned(bRgb.red));
      rgb1Int.green  <= to_integer(unsigned(bRgb.green));
      rgb1Int.blue   <= to_integer(unsigned(bRgb.blue));
      rgb1Int.valid  <= bRgb.valid;
      rgb2Int        <= rgb1Int;
      rgb3Int        <= rgb2Int;
      rgb4Int        <= rgb3Int;
      rgb1b          <= bRgb;
      rgb2b          <= rgb1b;
      rgb3b          <= rgb2b;
      rgb4b          <= rgb3b;
      d1R            <= iRgb.red;
      d2R            <= d1R;
      d3R            <= d2R;
      valid1R        <= iRgb.valid;
      valid2R        <= valid1R;
      d1en           <= en_datao;
      d2en           <= d1en;
      d3en           <= d2en;
      d4en           <= d3en;
      d5en           <= d4en;
    end if;
  end process TAP_SIGNED;
  TAP_DELAY : process (clk) begin
    if rising_edge(clk) then
    if rst_l = '0' then
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
      tpd1.vTap0x    <= signed('0' & vTap0x);
      tpd1.vTap1x    <= signed('0' & vTap1x);
      tpd1.vTap2x    <= signed('0' & vTap2x);
      tpd2.vTap0x    <= tpd1.vTap0x;
      tpd2.vTap1x    <= tpd1.vTap1x;
      tpd2.vTap2x    <= tpd1.vTap2x;
      tpd3.vTap0x    <= tpd2.vTap0x;
      tpd3.vTap1x    <= tpd2.vTap1x;
      tpd3.vTap2x    <= tpd2.vTap2x;
    end if;
    end if;
  end process TAP_DELAY;
  MAC_X_A : process (clk) begin
    if rising_edge(clk) then
        mac1X.m1    <= '0' & (tpd1.vTap0x * Kernel_9_X);
        mac1X.m2    <= '0' & (tpd2.vTap0x * Kernel_8_X);
        mac1X.m3    <= '0' & (tpd3.vTap0x * Kernel_7_X);
        mac1X.mac   <= mac1X.m1(16 downto 0) + mac1X.m2(16 downto 0) + mac1X.m3(16 downto 0);
    end if;
  end process MAC_X_A;
  MAC_X_B : process (clk) begin
    if rising_edge(clk) then
        mac2X.m1    <= '0' & (tpd1.vTap1x * Kernel_6_X);
        mac2X.m2    <= '0' & (tpd2.vTap1x * Kernel_5_X);
        mac2X.m3    <= '0' & (tpd3.vTap1x * Kernel_4_X);
        mac2X.mac   <= mac2X.m1(16 downto 0) + mac2X.m2(16 downto 0) + mac2X.m3(16 downto 0);
    end if;
  end process MAC_X_B;
  MAC_X_C : process (clk) begin
    if rising_edge(clk) then
        mac3X.m1    <= '0' & (tpd1.vTap2x * Kernel_3_X);
        mac3X.m2    <= '0' & (tpd2.vTap2x * Kernel_2_X);
        mac3X.m3    <= '0' & (tpd3.vTap2x * Kernel_1_X);
        mac3X.mac   <= mac3X.m1(16 downto 0) + mac3X.m2(16 downto 0) + mac3X.m3(16 downto 0);
    end if;
  end process MAC_X_C;
  MAC_Y_A : process (clk) begin
    if rising_edge(clk) then
        mac1Y.m1    <= '0' & (tpd1.vTap0x * Kernel_9_Y);
        mac1Y.m2    <= '0' & (tpd1.vTap0x * Kernel_8_Y);
        mac1Y.m3    <= '0' & (tpd1.vTap0x * Kernel_7_Y);
        mac1Y.mac   <= mac1Y.m1(16 downto 0) + mac1Y.m2(16 downto 0) + mac1Y.m3(16 downto 0);
    end if;
  end process MAC_Y_A;
  MAC_Y_B : process (clk) begin
    if rising_edge(clk) then
        mac2Y.m1    <= '0' & (tpd1.vTap1x * Kernel_6_Y);
        mac2Y.m2    <= '0' & (tpd1.vTap1x * Kernel_5_Y);
        mac2Y.m3    <= '0' & (tpd1.vTap1x * Kernel_4_Y);
        mac2Y.mac   <= mac2Y.m1(16 downto 0) + mac2Y.m2(16 downto 0) + mac2Y.m3(16 downto 0);
    end if;
  end process MAC_Y_B;
  MAC_Y_C : process (clk) begin
    if rising_edge(clk) then
        mac3Y.m1    <= '0' & (tpd1.vTap2x * Kernel_3_Y);
        mac3Y.m2    <= '0' & (tpd1.vTap2x * Kernel_2_Y);
        mac3Y.m3    <= '0' & (tpd1.vTap2x * Kernel_1_Y);
        mac3Y.mac   <= mac3Y.m1(16 downto 0) + mac3Y.m2(16 downto 0) + mac3Y.m3(16 downto 0);
    end if;
  end process MAC_Y_C;
  PA_X : process (clk, rst_l) begin
    if rst_l = '0' then
        sobel.pax <= (others => '0');
    elsif rising_edge(clk) then
        sobel.pax <= mac1X.mac + mac2X.mac + mac3X.mac;
    end if;
  end process PA_X;
  PA_Y : process (clk, rst_l) begin
    if rst_l = '0' then
        sobel.pay <= (others => '0');
    elsif rising_edge(clk) then
        sobel.pay <= mac1Y.mac + mac2Y.mac + mac3Y.mac;
    end if;
  end process PA_Y;
  GX : process (clk, rst_l) begin
    if rst_l = '0' then
        sobel.mx <= (others => '0');
    elsif rising_edge(clk) then
        sobel.mx <= '0' & (sobel.pax * sobel.pax);
    end if;
  end process GX;
  GY : process (clk, rst_l) begin
    if rst_l = '0' then
        sobel.my <= (others => '0');
    elsif rising_edge(clk) then
        sobel.my <= '0' & (sobel.pay * sobel.pay);
    end if;
  end process GY;
  GS : process (clk, rst_l) begin
    if rst_l = '0' then
        sobel.sxy <= (others => '0');
    elsif rising_edge(clk) then
        sobel.sxy <= (sobel.mx + sobel.my);
    end if;
  end process GS;
  SQROOT : process (clk, rst_l) begin
    if rst_l = '0' then
        sobel.sqr <=(others => '0');
    elsif rising_edge(clk) then
        sobel.sqr    <= std_logic_vector(sobel.sxy(31 downto 0));
    end if;
  end process SQROOT;
mod6_1_2_inst: squareRootTop
port map(
    clk        => clk,
    ivalid     => d5en,
    idata      => sobel.sqr,
    ovalid     => validO,
    odata      => sobel.sbof);
    sobel.sbo       <= unsigned(sobel.sbof(15 downto 0));
    oRgbRemix.valid <= validO;
    oRgb.valid      <= validO;
------------------------------------------------------------------------------------------------
RT : process (clk) begin
    if rising_edge(clk) then
    if rst_l = '0' then
        oRgb.red   <= (others => '0');
        oRgb.green <= (others => '0');
        oRgb.blue  <= (others => '0');
    else
        if (sobel.sbo > unsigned(threshold)) then
            oRgb.red   <= x"FF";--White
            oRgb.green <= x"FF";--White
            oRgb.blue  <= x"FF";--White
        else
            oRgb.red   <= x"00";--BLACK
            oRgb.green <= x"00";--BLACK
            oRgb.blue  <= x"00";--BLACK
        end if;
    end if;
    end if;
end process RT;
rgbRemix : process (clk) begin
    if rising_edge(clk) then
    if rst_l = '0' then
        oRgbRemix.red   <= (others => '0');
        oRgbRemix.green <= (others => '0');
        oRgbRemix.blue  <= (others => '0');
        rMax            <= (others => '0');
        rMin            <= (others => '1');
        gMax            <= (others => '0');
        gMin            <= (others => '1');
        bMax            <= (others => '0');
        bMin            <= (others => '1');
        dGrid           <= '0';
    else
        if (sobel.sbo > unsigned(threshold)) then
            oRgbRemix.red   <= x"FF";--BLACK
            oRgbRemix.green <= x"FF";--BLACK
            oRgbRemix.blue  <= x"FF";--BLACK
        else
        if((rgb2Int.red > 40 and rgb2Int.red < 150) and (rgb2Int.green > 40 and rgb2Int.green < 150) and (rgb2Int.blue > 40 and rgb2Int.blue< 150)) then
        --if(rgb2Int.red < 72 and rgb2Int.green < 100) and (rgb2Int.green < rgb2Int.blue) then -- blue is red and vice versa
            if(rgb2Int.green < rgb2Int.blue) then -- blue is red and vice versa
                    ---------------------------------------
                    oRgbRemix.red   <= rgb2b.red;
                    oRgbRemix.green <= rgb2b.green;
                    oRgbRemix.blue  <= rgb2b.blue;
                    ---------------------------------------
                    dGrid      <='1';
                    if(rgb2b.red > rMax) then
                        rMax   <= rgb2b.red;
                    end if;
                    if(rgb2b.red < rMin) then
                        rMin   <= rgb2b.red;
                    end if;
                    if(rgb2b.green > gMax) then
                        gMax   <= rgb2b.green;
                    end if;
                    if(rgb2b.green < gMin) then
                        gMin   <= rgb2b.green;
                    end if;
                    if(rgb2b.red > bMax) then
                        bMax   <= rgb2b.red;
                    end if;
                    if(rgb2b.blue < bMin) then
                        bMin   <= rgb2b.blue;
                    end if;
                    ---------------------------------------
                else
                    oRgbRemix.red   <= x"FF";
                    oRgbRemix.green <= x"FF";
                    oRgbRemix.blue  <= x"FF";
                    dGrid           <='0';
                end if;
        end if;
        end if;
    end if;
    end if;
end process rgbRemix;
------------------------------------------------------------------------------------------------
end architecture;
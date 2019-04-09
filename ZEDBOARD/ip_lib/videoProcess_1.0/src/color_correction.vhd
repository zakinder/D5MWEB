library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.fixed_pkg.all;
use work.float_pkg.all;
use work.portspackage.all;
entity color_correction is
  generic (
    i_data_width  : integer := 8;
    C_WHOLE_WIDTH : integer := 3;
    C_FRAC_WIDTH  : integer := 8);
  port (
    clk       : in std_logic;
    rst       : in std_logic;
    iRgb      : in channel;
    iXcont    : in std_logic_vector(15 downto 0);
    iYcont    : in std_logic_vector(15 downto 0);
    als       : in coefficient;
    oXcont    : out std_logic_vector(15 downto 0);
    oYcont    : out std_logic_vector(15 downto 0);
    Xcont     : out std_logic_vector(15 downto 0);
    Ycont     : out std_logic_vector(15 downto 0);
    oRed      : out std_logic_vector(i_data_width-1 downto 0);
    oGreen    : out std_logic_vector(i_data_width-1 downto 0);
    oBlue     : out std_logic_vector(i_data_width-1 downto 0);
    oValid    : out std_logic);
end color_correction;
architecture Behavioral of color_correction is
  constant DATA_EXT_WIDTH     : natural := i_data_width + 1;
  constant FRAC_BITS_TO_KEEP  : natural := 3;  
  constant MULT_RESULT_WIDTH  : natural := DATA_EXT_WIDTH + C_WHOLE_WIDTH + FRAC_BITS_TO_KEEP;
  constant ADD_RESULT_WIDTH   : natural := MULT_RESULT_WIDTH + 1;
  constant ROUND_RESULT_WIDTH : natural := ADD_RESULT_WIDTH - FRAC_BITS_TO_KEEP;
  constant ROUND              : signed(ADD_RESULT_WIDTH-1 downto 0) := to_signed(0, ADD_RESULT_WIDTH-FRAC_BITS_TO_KEEP)&'1' & to_signed(0, FRAC_BITS_TO_KEEP-1);  
  signal r_2, g_2, b_2        : signed(12 downto 0);
  signal r_3, g_3, b_3        : signed(7 downto 0);
  signal en_0                 : std_logic;
  signal en_1                 : std_logic;
  signal en_2                 : std_logic;
  signal en_3                 : std_logic;
  signal en_4                 : std_logic;
  signal en_5                 : std_logic;
  signal s1pXcont             : std_logic_vector(15 downto 0);
  signal s1pYcont             : std_logic_vector(15 downto 0);
  signal dataA11Fl            : sfixed(4 downto -3);
  signal dataA12Fl            : sfixed(4 downto -3);
  signal dataA13Fl            : sfixed(4 downto -3);
  signal dataA21Fl            : sfixed(4 downto -3);
  signal dataA22Fl            : sfixed(4 downto -3);
  signal dataA23Fl            : sfixed(4 downto -3);
  signal dataA31Fl            : sfixed(4 downto -3);
  signal dataA32Fl            : sfixed(4 downto -3);
  signal dataA33Fl            : sfixed(4 downto -3);
  signal dataA11Real          : sfixed(24 downto -3);
  signal dataA12Real          : sfixed(24 downto -3);
  signal dataA13Real          : sfixed(24 downto -3);
  signal dataA21Real          : sfixed(24 downto -3);
  signal dataA22Real          : sfixed(24 downto -3);
  signal dataA23Real          : sfixed(24 downto -3);
  signal dataA31Real          : sfixed(24 downto -3);
  signal dataA32Real          : sfixed(24 downto -3);
  signal dataA33Real          : sfixed(24 downto -3);
  signal r_r_A11Fl            : signed(19 downto 0);
  signal r_g_A12Fl            : signed(19 downto 0);
  signal r_b_A13Fl            : signed(19 downto 0);
  signal g_r_A21Fl            : signed(19 downto 0);
  signal g_g_A22Fl            : signed(19 downto 0);
  signal g_b_A23Fl            : signed(19 downto 0);
  signal b_r_A31Fl            : signed(19 downto 0);
  signal b_g_A32Fl            : signed(19 downto 0);
  signal b_b_A33Fl            : signed(19 downto 0);
  signal rr_A11Fl             : signed(14 downto 0);
  signal rg_A12Fl             : signed(14 downto 0);
  signal rb_A13Fl             : signed(14 downto 0);
  signal gr_A21Fl             : signed(14 downto 0);
  signal gg_A22Fl             : signed(14 downto 0);
  signal gb_A23Fl             : signed(14 downto 0);
  signal br_A31Fl             : signed(14 downto 0);
  signal bg_A32Fl             : signed(14 downto 0);
  signal bb_A33Fl             : signed(14 downto 0);
  signal sum_rA1              : signed(ADD_RESULT_WIDTH-1 downto 0);
  signal sum_gA2              : signed(ADD_RESULT_WIDTH-1 downto 0);
  signal sum_bA3              : signed(ADD_RESULT_WIDTH-1 downto 0);
  signal reduF                : sfixed(9 downto 0);
  signal greenuF              : sfixed(9 downto 0);
  signal blueuF               : sfixed(9 downto 0);
  signal threshold            : sfixed(9 downto 0) := "0100000000";
begin
    --S1.3
dataACoef: process (clk,rst)begin
    if rst = '0' then
            dataA11Fl     <=  x"0B";
            dataA12Fl     <=  x"FE";
            dataA13Fl     <=  x"FF";
            dataA21Fl     <=  x"FF";
            dataA22Fl     <=  x"0B";
            dataA23Fl     <=  x"FE";
            dataA31Fl     <=  x"FE";
            dataA32Fl     <=  x"FF";
            dataA33Fl     <=  x"0B";
            reduF         <= (others => '0');
            greenuF       <= (others => '0');
            blueuF        <= (others => '0');
            
    elsif rising_edge(clk) then 
        if(als.config /= 0) then
            dataA11Fl     <=  to_sfixed(als.k1(7 downto 0),dataA11Fl);
            dataA12Fl     <=  to_sfixed(als.k2(7 downto 0),dataA12Fl);
            dataA13Fl     <=  to_sfixed(als.k3(7 downto 0),dataA13Fl);
            dataA21Fl     <=  to_sfixed(als.k4(7 downto 0),dataA21Fl);
            dataA22Fl     <=  to_sfixed(als.k5(7 downto 0),dataA22Fl);
            dataA23Fl     <=  to_sfixed(als.k6(7 downto 0),dataA23Fl);
            dataA31Fl     <=  to_sfixed(als.k7(7 downto 0),dataA31Fl);
            dataA32Fl     <=  to_sfixed(als.k8(7 downto 0),dataA32Fl);
            dataA33Fl     <=  to_sfixed(als.k9(7 downto 0),dataA33Fl);
        end if;
    --U8.0
        reduF         <= to_sfixed("00" & iRgb.red,reduF);
        greenuF       <= to_sfixed("00" & iRgb.green,greenuF);
        blueuF        <= to_sfixed("00" & iRgb.blue,blueuF);
    end if; 
end process dataACoef;

    --REAL
    dataA11Real   <=  dataA11Fl * threshold * reduF;
    dataA12Real   <=  dataA12Fl * threshold * greenuF;
    dataA13Real   <=  dataA13Fl * threshold * blueuF;
    dataA21Real   <=  dataA21Fl * threshold * reduF;
    dataA22Real   <=  dataA22Fl * threshold * greenuF;
    dataA23Real   <=  dataA23Fl * threshold * blueuF;
    dataA31Real   <=  dataA31Fl * threshold * reduF;
    dataA32Real   <=  dataA32Fl * threshold * greenuF;
    dataA33Real   <=  dataA33Fl * threshold * blueuF;
    --SIGNED
    r_r_A11Fl     <= to_signed(dataA11Real(19 downto 0), 20);
    r_g_A12Fl     <= to_signed(dataA12Real(19 downto 0), 20);
    r_b_A13Fl     <= to_signed(dataA13Real(19 downto 0), 20);
    g_r_A21Fl     <= to_signed(dataA21Real(19 downto 0), 20);
    g_g_A22Fl     <= to_signed(dataA22Real(19 downto 0), 20);
    g_b_A23Fl     <= to_signed(dataA23Real(19 downto 0), 20);
    b_r_A31Fl     <= to_signed(dataA31Real(19 downto 0), 20);
    b_g_A32Fl     <= to_signed(dataA32Real(19 downto 0), 20);
    b_b_A33Fl     <= to_signed(dataA33Real(19 downto 0), 20);
pixelCoef: process (clk,rst)begin
    if rst = '0' then
      rr_A11Fl        <= (others => '0');
      rg_A12Fl        <= (others => '0');
      rb_A13Fl        <= (others => '0');
      gr_A21Fl        <= (others => '0');
      gg_A22Fl        <= (others => '0');
      gb_A23Fl        <= (others => '0');
      br_A31Fl        <= (others => '0');
      bg_A32Fl        <= (others => '0');
      bb_A33Fl        <= (others => '0');
      sum_rA1         <= (others => '0');
      sum_gA2         <= (others => '0');
      sum_bA3         <= (others => '0');
      r_2             <= (others => '0');
      g_2             <= (others => '0');
      b_2             <= (others => '0');
      en_1            <= '0';
      en_2            <= '0';
      en_3            <= '0';
      en_4            <= '0';
      en_5            <= '0';
    elsif rising_edge(clk) then 
      rr_A11Fl        <= r_r_A11Fl(19 downto 5);
      rg_A12Fl        <= r_g_A12Fl(19 downto 5);
      rb_A13Fl        <= r_b_A13Fl(19 downto 5);
      gr_A21Fl        <= g_r_A21Fl(19 downto 5);
      gg_A22Fl        <= g_g_A22Fl(19 downto 5);
      gb_A23Fl        <= g_b_A23Fl(19 downto 5);
      br_A31Fl        <= b_r_A31Fl(19 downto 5);
      bg_A32Fl        <= b_g_A32Fl(19 downto 5);
      bb_A33Fl        <= b_b_A33Fl(19 downto 5);
      sum_rA1         <= resize(rr_A11Fl, ADD_RESULT_WIDTH) +
                         resize(rg_A12Fl, ADD_RESULT_WIDTH) +
                         resize(rb_A13Fl, ADD_RESULT_WIDTH) + ROUND;
      sum_gA2         <= resize(gr_A21Fl, ADD_RESULT_WIDTH) +
                         resize(gg_A22Fl, ADD_RESULT_WIDTH) +
                         resize(gb_A23Fl, ADD_RESULT_WIDTH) + ROUND;
      sum_bA3         <= resize(br_A31Fl, ADD_RESULT_WIDTH) +
                         resize(bg_A32Fl, ADD_RESULT_WIDTH) +
                         resize(bb_A33Fl, ADD_RESULT_WIDTH) + ROUND;
      r_2             <= sum_rA1(sum_rA1'left downto FRAC_BITS_TO_KEEP);
      g_2             <= sum_gA2(sum_gA2'left downto FRAC_BITS_TO_KEEP);
      b_2             <= sum_bA3(sum_bA3'left downto FRAC_BITS_TO_KEEP);
      en_1            <= iRgb.valid;
      en_2            <= en_1;
      en_3            <= en_2;
      en_4            <= en_3;
      en_5            <= en_4;
      oValid          <= en_5;
      s1pXcont        <= iXcont;
      s1pYcont        <= iYcont; 
      oXcont          <= s1pXcont;
      oYcont          <= s1pYcont;  
      Xcont           <= s1pXcont;
      Ycont           <= s1pYcont;
    end if;
end process pixelCoef;
  STAGE_3_PROC : process (clk, rst)
  begin
    if rst = '0' then
      oRed    <= (others => '0');
      oGreen  <= (others => '0');
      oBlue   <= (others => '0');
    elsif clk'event and clk = '1' then
      if r_2(ROUND_RESULT_WIDTH-1) = '1' then	
        oRed <= (others => '0');
      elsif unsigned(r_2(ROUND_RESULT_WIDTH-2 downto i_data_width)) /= 0 then	
        oRed <= (others => '1');
      else
        oRed <= std_logic_vector(r_2(i_data_width-1 downto 0));
      end if;
      if g_2(ROUND_RESULT_WIDTH-1) = '1' then
        oGreen <= (others => '0');
      elsif unsigned(g_2(ROUND_RESULT_WIDTH-2 downto i_data_width)) /= 0 then
        oGreen <= (others => '1');
      else
        oGreen <= std_logic_vector(g_2(i_data_width-1 downto 0));
      end if;
      if b_2(ROUND_RESULT_WIDTH-1) = '1' then
        oBlue <= (others => '0');
      elsif unsigned(b_2(ROUND_RESULT_WIDTH-2 downto i_data_width)) /= 0 then
        oBlue <= (others => '1');
      else
        oBlue <= std_logic_vector(b_2(i_data_width-1 downto 0));
      end if;
    end if;
  end process;
end Behavioral;
--01062019 [01-06-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity hsv_c is
generic (
    i_data_width   : integer := 8);
port (
    pixclk        : in  std_logic;
    reset         : in  std_logic;
    iRed          : in  std_logic_vector(i_data_width-1 downto 0);
    iGreen        : in  std_logic_vector(i_data_width-1 downto 0);
    iBlue         : in  std_logic_vector(i_data_width-1 downto 0);
    oH            : out std_logic_vector(i_data_width-1 downto 0);
    oS            : out std_logic_vector(i_data_width-1 downto 0);
    oV            : out std_logic_vector(i_data_width-1 downto 0));
end hsv_c;
architecture behavioral of hsv_c is
    component divider
    port (
        clk         : in std_logic;
        dividend    : in std_logic_vector(15 downto 0);
        divisor     : in std_logic_vector(15 downto 0);
        quotient    : out std_logic_vector(15 downto 0);
        remainder   : out std_logic_vector(15 downto 0));
    end component;
    signal uRed                 : unsigned(i_data_width-1 downto 0);
    signal uGreen               : unsigned(i_data_width-1 downto 0);
    signal uBlue                : unsigned(i_data_width-1 downto 0);
    signal redDelay1            : unsigned(i_data_width-1 downto 0):= (others => '0'); 
    signal greenDelay1          : unsigned(i_data_width-1 downto 0):= (others => '0'); 
    signal blueDelay1           : unsigned(i_data_width-1 downto 0):= (others => '0'); 
    signal redDelay2            : unsigned(i_data_width-1 downto 0):= (others => '0'); 
    signal greenDelay2          : unsigned(i_data_width-1 downto 0):= (others => '0'); 
    signal blueDelay2           : unsigned(i_data_width-1 downto 0):= (others => '0'); 
    signal min                  : unsigned(i_data_width-1 downto 0):= (others => '0'); 
    signal max                  : unsigned(i_data_width-1 downto 0):= (others => '0'); 
    signal delta                : unsigned(i_data_width-1 downto 0):= (others => '0'); 
    signal s_top                : unsigned(15 downto 0):= (others => '0'); 
    signal s_bottom             : unsigned(15 downto 0):= (others => '0'); 
    signal h_top                : unsigned(15 downto 0):= (others => '0');  
    signal h_bottom             : unsigned(15 downto 0):= (others => '0'); 
    signal s_quotient           : std_logic_vector(15 downto 0):= (others => '0'); 
    signal s_remainder          : std_logic_vector(15 downto 0):= (others => '0'); 
    signal uh_quotient          : std_logic_vector(15 downto 0):= (others => '0'); 
    signal uh_remainder         : std_logic_vector(15 downto 0):= (others => '0'); 
    signal h_quotient           : unsigned(15 downto 0):= (others => '0'); 
    signal h_remainder          : unsigned(15 downto 0):= (others => '0'); 
    signal oHv                  : unsigned(15 downto 0):= (others => '0'); 
    signal oSv                  : std_logic_vector(i_data_width-1 downto 0):= (others => '0'); 
    signal oVv                  : std_logic_vector(i_data_width-1 downto 0):= (others => '0'); 
    signal h_negative_delay     : unsigned(18 downto 0):= (others => '0'); 
    signal hHnegative_delay     : unsigned(18 downto 0):= (others => '0'); 
    type ram_v_delay is array (0 to 19) of unsigned (i_data_width-1 downto 0);
    signal v_delay : ram_v_delay := (others => (others => '0')); 
    type ram_h_add is array (0 to 18) of unsigned (15 downto 0);
    signal h_add : ram_h_add := (others => (others => '0'));
begin
hue_div1: divider
port map(
    clk           => pixclk,
    dividend      => std_logic_vector(s_top),
    divisor       => std_logic_vector(s_bottom),
    quotient      => s_quotient,
    remainder     => s_remainder);
hue_div2: divider
port map(
    clk           => pixclk,
    dividend      => std_logic_vector(h_top),
    divisor       => std_logic_vector(h_bottom),
    quotient      => uh_quotient,
    remainder     => uh_remainder); 
    h_quotient  <= unsigned(uh_quotient);
    h_remainder <= unsigned(uh_remainder);
rgbDelay: process (pixclk) begin
    if rising_edge(pixclk) then 
        if reset = '0' then
            uRed    <= (others => '0');
            uGreen  <= (others => '0');
            uBlue   <= (others => '0');
        else
            uRed        <= unsigned(iRed);
            uGreen      <= unsigned(iGreen);
            uBlue       <= unsigned(iBlue);
            redDelay1   <= uRed;
            greenDelay1 <= uGreen;
            blueDelay1  <= uBlue;
            redDelay2   <= redDelay1;
            greenDelay2 <= greenDelay1;
            blueDelay2  <= blueDelay1;
    end if;
  end if;
end process rgbDelay;
hslMax: process (pixclk) begin
  if rising_edge(pixclk) then 
    if ((uRed >= uGreen) and (uRed >= uBlue)) then
        max <= uRed;
    elsif((uGreen >= uRed) and (uGreen >= uBlue))then
        max <= uGreen;
    else
        max <= uBlue;
    end if;
  end if;
end process hslMax;
hslMin: process (pixclk) begin
  if rising_edge(pixclk) then 
    if ((uRed <= uGreen) and (uRed <= uBlue)) then
        min <= uRed;
    elsif((uGreen <= uRed) and (uGreen <= uBlue)) then
        min <= uGreen;
    else
        min <= uBlue;
    end if;
  end if;
end process hslMin;
hslDelta: process (pixclk) begin
    if rising_edge(pixclk) then 
        delta      <= max - min;
    end if;
end process hslDelta;
satNumniator: process (pixclk) begin
    if rising_edge(pixclk) then 
        s_top      <= x"FF" * delta;
    end if;
end process satNumniator;
p_delay: process (pixclk) begin
  if rising_edge(pixclk) then 
    v_delay(0)  <= max;--DELAY BY 19 STORAGE
    v_delay(1)  <= v_delay(0);--DELAY BY 19 by manual assignement since init is unknown
    v_delay(2)  <= v_delay(1);
    v_delay(3)  <= v_delay(2);
    v_delay(4)  <= v_delay(3);
    v_delay(5)  <= v_delay(4);
    v_delay(6)  <= v_delay(5);
    v_delay(7)  <= v_delay(6);
    v_delay(8)  <= v_delay(7);
    v_delay(9)  <= v_delay(8);
    v_delay(10) <= v_delay(9);
    v_delay(11) <= v_delay(10);
    v_delay(12) <= v_delay(11);
    v_delay(13) <= v_delay(12);
    v_delay(14) <= v_delay(13);
    v_delay(15) <= v_delay(14);
    v_delay(16) <= v_delay(15);
    v_delay(17) <= v_delay(16);
    v_delay(18) <= v_delay(17);
    v_delay(19) <= v_delay(18);
  end if;
end process p_delay;
p_pr: process (pixclk) begin
  if rising_edge(pixclk) then 
    if (redDelay2 = v_delay(0)) then
        ---------------------------------------------------
        if (greenDelay2 >= blueDelay2) then
            h_top <= (greenDelay2 - blueDelay2) * x"FF";
        else
            h_top <= (blueDelay2 - greenDelay2) * x"FF";
        end if;
        ---------------------------------------------------
        if (greenDelay2 >= blueDelay2) then
            h_negative_delay(0) <= '0';
        else
            h_negative_delay(0) <= '1';
        end if;
        ---------------------------------------------------
        h_add(0) <= (others => '0');
        ---------------------------------------------------
    elsif(greenDelay2 = v_delay(0))  then
        ---------------------------------------------------
        if (blueDelay2 >= redDelay2) then
            h_top <= (blueDelay2 - redDelay2) * x"FF";
        else
            h_top <= (redDelay2 - blueDelay2) * x"FF";
        end if;
        ---------------------------------------------------
        if (blueDelay2 >= redDelay2) then
            h_negative_delay(0) <= '0';
        else
            h_negative_delay(0) <= '1';
        end if;
        ---------------------------------------------------
        h_add(0) <= x"0055";
        ---------------------------------------------------
    elsif(blueDelay2 = v_delay(0))  then
        ---------------------------------------------------
        if (redDelay2 >= greenDelay2) then
            h_top <= (redDelay2 - greenDelay2) * x"FF";
        else
            h_top <= (greenDelay2 - redDelay2) * x"FF";
        end if;
        ---------------------------------------------------
        if (redDelay2 >= greenDelay2) then
            h_negative_delay(0) <= '0';
        else
            h_negative_delay(0) <= '1';
        end if;
        ---------------------------------------------------
        h_add(0) <= x"00AA";
        ---------------------------------------------------
    end if;
    ---------------------------------------------------
    hHnegative_delay <= hHnegative_delay(17 downto 0) & h_negative_delay(0);
    ---------------------------------------------------
    h_add(1)  <= h_add(0);
    h_add(2)  <= h_add(1);
    h_add(3)  <= h_add(2);
    h_add(4)  <= h_add(3);
    h_add(5)  <= h_add(4);
    h_add(6)  <= h_add(5);
    h_add(7)  <= h_add(6);
    h_add(8)  <= h_add(7);
    h_add(9)  <= h_add(8);
    h_add(10) <= h_add(9);
    h_add(11) <= h_add(10);
    h_add(12) <= h_add(11);
    h_add(13) <= h_add(12);
    h_add(14) <= h_add(13);
    h_add(15) <= h_add(14);
    h_add(16) <= h_add(15);
    h_add(17) <= h_add(16);
    h_add(18) <= h_add(17);
    ---------------------------------------------------
  end if;
end process p_pr;
satDominaCal: process (pixclk) begin
    if rising_edge(pixclk) then 
        if (v_delay(0) > x"00") then
            s_bottom <= x"00" & v_delay(0);
        else
            s_bottom <= (others => '1');
        end if;
    end if;
end process satDominaCal;
hueDominaCal: process (pixclk) begin
    if rising_edge(pixclk) then 
        if (delta > x"00") then
            h_bottom <= delta  * x"06";
        else
            h_bottom <= x"0006";
        end if;
    end if;
end process hueDominaCal;  
hueCal: process (pixclk) begin
    if rising_edge(pixclk) then 
        if ((hHnegative_delay(18) = '1') and (h_quotient > h_add(18))) then
            oHv <= x"FF" - h_quotient(i_data_width-1 downto 0) + h_add(18);
        elsif(hHnegative_delay(18) = '1') then
            oHv <= h_add(18) - h_quotient(i_data_width-1 downto 0);
        else
            oHv <= h_quotient(i_data_width-1 downto 0) + h_add(18);
        end if;
    end if;
end process hueCal;
satValCal: process (pixclk) begin
    if rising_edge(pixclk) then 
        oSv <= s_quotient(i_data_width-1 downto 0);
        oVv <= std_logic_vector(v_delay(19)(i_data_width-1 downto 0));
    end if;
end process satValCal;
hsvOut: process (pixclk) begin
    if rising_edge(pixclk) then 
        oH <= std_logic_vector(oHv(i_data_width-1 downto 0));    
        oS <= oSv;
        oV <= oVv;
    end if;
end process hsvOut;
end behavioral;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use ieee.std_logic_unsigned.all;
use work.modulator_pkg.all;
entity Sine_v2_0 is
    generic (
    revision_number             : std_logic_vector(31 downto 0) := x"04272017";
    cntampl_value_g             : integer := 255;
    depth_g                     : integer range 1 to 99 := 8;
    width_g                     : integer range 1 to 99 := 12;
    C_ctrl_saxi_DATA_WIDTH      : integer    := 32;
    C_ctrl_saxi_ADDR_WIDTH      : integer    := 7);
    port (

    ctrl_saxi_aclk              : in std_logic;
    ctrl_saxi_aresetn           : in std_logic;
    ctrl_saxi_awaddr            : in std_logic_vector(C_ctrl_saxi_ADDR_WIDTH-1 downto 0);
    ctrl_saxi_awprot            : in std_logic_vector(2 downto 0);
    ctrl_saxi_awvalid           : in std_logic;
    ctrl_saxi_awready           : out std_logic;
    ctrl_saxi_wdata             : in std_logic_vector(C_ctrl_saxi_DATA_WIDTH-1 downto 0);
    ctrl_saxi_wstrb             : in std_logic_vector((C_ctrl_saxi_DATA_WIDTH/8)-1 downto 0);
    ctrl_saxi_wvalid            : in std_logic;
    ctrl_saxi_wready            : out std_logic;
    ctrl_saxi_bresp             : out std_logic_vector(1 downto 0);
    ctrl_saxi_bvalid            : out std_logic;
    ctrl_saxi_bready            : in std_logic;
    ctrl_saxi_araddr            : in std_logic_vector(C_ctrl_saxi_ADDR_WIDTH-1 downto 0);
    ctrl_saxi_arprot            : in std_logic_vector(2 downto 0);
    ctrl_saxi_arvalid           : in std_logic;
    ctrl_saxi_arready           : out std_logic;
    ctrl_saxi_rdata             : out std_logic_vector(C_ctrl_saxi_DATA_WIDTH-1 downto 0);
    ctrl_saxi_rresp             : out std_logic_vector(1 downto 0);
    ctrl_saxi_rvalid            : out std_logic;
    ctrl_saxi_rready            : in std_logic);
end Sine_v2_0;
architecture arch_imp of Sine_v2_0 is
    component Sine_v2_0_ctrl_saxi is
    generic (
    C_S_AXI_DATA_WIDTH      : integer    := 32;
    C_S_AXI_ADDR_WIDTH      : integer    := 7);
    port (
    sw0                     : out std_logic;
    div_factor_freqhigh     : out std_logic_vector(31 downto 0);
    div_factor_freqlow      : out std_logic_vector(31 downto 0);
    analog_ch0          : in std_logic_vector(31 downto 0);
    analog_ch1          : in std_logic_vector(31 downto 0);
    analog_ch2          : in std_logic_vector(31 downto 0);
    analog_ch3          : in std_logic_vector(31 downto 0);
    analog_ch4          : in std_logic_vector(31 downto 0);
    analog_ch5          : in std_logic_vector(31 downto 0);
    analog_ch6          : in std_logic_vector(31 downto 0);
    analog_ch7          : in std_logic_vector(31 downto 0);
    analog_ch8          : in std_logic_vector(31 downto 0);
    analog_ch9          : in std_logic_vector(31 downto 0);
    analog_ch10          : in std_logic_vector(31 downto 0);
    analog_ch11          : in std_logic_vector(31 downto 0);
    analog_ch12          : in std_logic_vector(31 downto 0);
    analog_ch13          : in std_logic_vector(31 downto 0);
    analog_ch14          : in std_logic_vector(31 downto 0);
    analog_ch15          : in std_logic_vector(31 downto 0);
    analog_ch16          : in std_logic_vector(31 downto 0);
    analog_ch17          : in std_logic_vector(31 downto 0);
    analog_ch18          : in std_logic_vector(31 downto 0);
    analog_ch19          : in std_logic_vector(31 downto 0);
    analog_ch20          : in std_logic_vector(31 downto 0);    
    analog_ch21          : in std_logic_vector(31 downto 0);
    analog_ch22          : in std_logic_vector(31 downto 0);
    analog_ch23          : in std_logic_vector(31 downto 0);
    analog_ch24          : in std_logic_vector(31 downto 0);
    analog_ch25          : in std_logic_vector(31 downto 0);
    analog_ch26          : in std_logic_vector(31 downto 0);
    analog_ch27          : in std_logic_vector(31 downto 0);
    analog_ch28          : in std_logic_vector(31 downto 0);
    analog_ch29          : in std_logic_vector(31 downto 0);
    analog_ch30          : in std_logic_vector(31 downto 0);        
    analog_ch31          : in std_logic_vector(31 downto 0);
    pwm                     : in std_logic;
    dir                    : out std_logic;
    freq_trig               : in std_logic;
    amplitude_counter       : in std_logic_vector(7 downto 0);
    S_AXI_ACLK              : in std_logic;
    S_AXI_ARESETN           : in std_logic;
    S_AXI_AWADDR            : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_AWPROT            : in std_logic_vector(2 downto 0);
    S_AXI_AWVALID           : in std_logic;
    S_AXI_AWREADY           : out std_logic;
    S_AXI_WDATA             : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_WSTRB             : in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
    S_AXI_WVALID            : in std_logic;
    S_AXI_WREADY            : out std_logic;
    S_AXI_BRESP             : out std_logic_vector(1 downto 0);
    S_AXI_BVALID            : out std_logic;
    S_AXI_BREADY            : in std_logic;
    S_AXI_ARADDR            : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_ARPROT            : in std_logic_vector(2 downto 0);
    S_AXI_ARVALID           : in std_logic;
    S_AXI_ARREADY           : out std_logic;
    S_AXI_RDATA             : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_RRESP             : out std_logic_vector(1 downto 0);
    S_AXI_RVALID            : out std_logic;
    S_AXI_RREADY            : in std_logic);
    end component Sine_v2_0_ctrl_saxi;
    component frequency_trigger is
    port (
        clk_in                  : in std_logic;
        sw0                     : in std_logic;
        div_factor_freqhigh     : in std_logic_vector(31 downto 0);
        div_factor_freqlow      : in std_logic_vector(31 downto 0);
        freq_trig               : out std_logic);
    end component frequency_trigger;
    component sine is
    generic (
        depth_g                 : integer range 1 to 99 := 8;
        width_g                 : integer range 1 to 99 := 12);
    port (
        clk_in                  : in std_logic;
        ampl_cnt                : in std_logic_vector(depth_g - 1 downto 0);
        sine_outo               : out std_logic_vector(width_g - 1 downto 0);
        sine_out                : out std_logic_vector(width_g - 1 downto 0));
    end component sine;
    component counter is
    generic (
        cnt_value_g             : integer;
        depth_g                 : integer);
    port (
        clk_in                  : in std_logic;
        cnt_en                  : in std_logic;
        cnt_out                 : out std_logic_vector (depth_g - 1 downto 0));
    end component counter;  
    component pwm is
    generic (
        width_g             : integer);
    port (
        clk_in              : in std_logic;                       
        sw0                 : in std_logic;                       
        sine_ampl           : in std_logic_vector(width_g-1 downto 0); 
        div_factor_freqhigh : in std_logic_vector(31 downto 0);   
        div_factor_freqlow  : in std_logic_vector(31 downto 0);   
        pwm_out             : out std_logic );                      
    end component pwm;      
    constant sw                 :  std_logic := '1'; 
    constant freqhigh           :  std_logic_vector(31 downto 0):= X"000000FF"; 
    constant freqlow            :  std_logic_vector(31 downto 0):= X"0000000F"; 
    signal board_name_g         :  string := "zedboard";
    signal design_setting_g     :  design_setting_t_rec := design_setting_c;
    signal ampl_cnt_s           :  std_logic_vector(depth_g-1 downto 0) := (others=>'0'); 
    signal freq_trig_s          :  std_logic := '0';
    signal pwm_s                :  std_logic := '0';    
    signal sw0                  :  std_logic := '0';         
    signal div_factor_freqhigh  :  std_logic_vector(31 downto 0):= X"000000FF"; 
    signal div_factor_freqlow   :  std_logic_vector(31 downto 0):= X"0000000F"; 
    signal sine_in              :  std_logic_vector(31 downto 0);    
    signal sine_outo            :  std_logic_vector(width_g-1 downto 0);  
    signal GNDs                 :  std_logic_vector(19 downto 0) := (others=>'0'); 
    signal  analog_ch0          :  std_logic_vector(31 downto 0);
    signal  analog_ch1          :  std_logic_vector(31 downto 0);
    signal  analog_ch2          :  std_logic_vector(31 downto 0);
    signal  analog_ch3          :  std_logic_vector(31 downto 0);
    signal  analog_ch4          :  std_logic_vector(31 downto 0);
    signal  analog_ch5          :  std_logic_vector(31 downto 0);
    signal  analog_ch6          :  std_logic_vector(31 downto 0);
    signal  analog_ch7          :  std_logic_vector(31 downto 0);
    signal  analog_ch8          :  std_logic_vector(31 downto 0);
    signal  analog_ch9          :  std_logic_vector(31 downto 0);
    signal  analog_ch10          :  std_logic_vector(31 downto 0);
    signal  analog_ch11          :  std_logic_vector(31 downto 0);
    signal  analog_ch12          :  std_logic_vector(31 downto 0);
    signal  analog_ch13          :  std_logic_vector(31 downto 0);
    signal  analog_ch14          :  std_logic_vector(31 downto 0);
    signal  analog_ch15          :  std_logic_vector(31 downto 0);
    signal  analog_ch16          :  std_logic_vector(31 downto 0);
    signal  analog_ch17          :  std_logic_vector(31 downto 0);
    signal  analog_ch18          :  std_logic_vector(31 downto 0);
    signal  analog_ch19          :  std_logic_vector(31 downto 0);
    signal  analog_ch20          :  std_logic_vector(31 downto 0);    
    signal  analog_ch21          :  std_logic_vector(31 downto 0);
    signal  analog_ch22          :  std_logic_vector(31 downto 0);
    signal  analog_ch23          :  std_logic_vector(31 downto 0);
    signal  analog_ch24          :  std_logic_vector(31 downto 0);
    signal  analog_ch25          :  std_logic_vector(31 downto 0);
    signal  analog_ch26          :  std_logic_vector(31 downto 0);
    signal  analog_ch27          :  std_logic_vector(31 downto 0);
    signal  analog_ch28          :  std_logic_vector(31 downto 0);
    signal  analog_ch29          :  std_logic_vector(31 downto 0);
    signal  analog_ch30          :  std_logic_vector(31 downto 0);        
    signal  analog_ch31          :  std_logic_vector(31 downto 0);
    signal  pwm_o                :  std_logic;
    signal  sine_out             :  std_logic_vector(width_g-1 downto 0); 
    signal  freq_trig_so         :  std_logic;
    signal  dir                  :  std_logic;
begin

u1_Sine: Sine_v2_0_ctrl_saxi
    generic map (
    C_S_AXI_DATA_WIDTH    => C_ctrl_saxi_DATA_WIDTH,
    C_S_AXI_ADDR_WIDTH    => C_ctrl_saxi_ADDR_WIDTH)
    port map (
    sw0                 => sw0,
    div_factor_freqhigh => div_factor_freqhigh,
    div_factor_freqlow  => div_factor_freqlow,
    analog_ch0  => analog_ch0,
    analog_ch1  => analog_ch1,
    analog_ch2  => analog_ch2,
    analog_ch3  => analog_ch3,
    analog_ch4  => analog_ch4,
    analog_ch5  => analog_ch5,
    analog_ch6  => analog_ch6,
    analog_ch7  => analog_ch7,
    analog_ch8  => analog_ch8,
    analog_ch9  => analog_ch9,
    analog_ch10 => analog_ch10,
    analog_ch11 => analog_ch11,
    analog_ch12 => analog_ch12,
    analog_ch13 => analog_ch13,
    analog_ch14 => analog_ch14,
    analog_ch15 => analog_ch15,
    analog_ch16 => analog_ch16,
    analog_ch17 => analog_ch17,
    analog_ch18 => analog_ch18,
    analog_ch19 => analog_ch19,
    analog_ch20 => analog_ch20,
    analog_ch21 => analog_ch21,
    analog_ch22 => analog_ch22,
    analog_ch23 => analog_ch23,
    analog_ch24 => analog_ch24,
    analog_ch25 => analog_ch25,
    analog_ch26 => analog_ch26,
    analog_ch27 => analog_ch27,
    analog_ch28 => analog_ch28,
    analog_ch29 => analog_ch29,
    analog_ch30 => analog_ch30,
    analog_ch31 => analog_ch31,
    pwm                 => pwm_s,
    freq_trig           => freq_trig_s,
    amplitude_counter   => ampl_cnt_s,
    dir                 => dir,
    S_AXI_ACLK          => ctrl_saxi_aclk,
    S_AXI_ARESETN       => ctrl_saxi_aresetn,
    S_AXI_AWADDR        => ctrl_saxi_awaddr,
    S_AXI_AWPROT        => ctrl_saxi_awprot,
    S_AXI_AWVALID       => ctrl_saxi_awvalid,
    S_AXI_AWREADY       => ctrl_saxi_awready,
    S_AXI_WDATA         => ctrl_saxi_wdata,
    S_AXI_WSTRB         => ctrl_saxi_wstrb,
    S_AXI_WVALID        => ctrl_saxi_wvalid,
    S_AXI_WREADY        => ctrl_saxi_wready,
    S_AXI_BRESP         => ctrl_saxi_bresp,
    S_AXI_BVALID        => ctrl_saxi_bvalid,
    S_AXI_BREADY        => ctrl_saxi_bready,
    S_AXI_ARADDR        => ctrl_saxi_araddr,
    S_AXI_ARPROT        => ctrl_saxi_arprot,
    S_AXI_ARVALID       => ctrl_saxi_arvalid,
    S_AXI_ARREADY       => ctrl_saxi_arready,
    S_AXI_RDATA         => ctrl_saxi_rdata,
    S_AXI_RRESP         => ctrl_saxi_rresp,
    S_AXI_RVALID        => ctrl_saxi_rvalid,
    S_AXI_RREADY        => ctrl_saxi_rready);
u2_freq_ce: frequency_trigger
    port map(
    clk_in              => ctrl_saxi_aclk,
    sw0                 => sw0,
    div_factor_freqhigh => div_factor_freqhigh,
    div_factor_freqlow  => div_factor_freqlow,
    freq_trig           => freq_trig_s);
u3_counterampl: counter 
    generic map(
    cnt_value_g  => cntampl_value_g,
    depth_g      => depth_g)
    port map(
    clk_in       => ctrl_saxi_aclk,
    cnt_en       => freq_trig_s,
    cnt_out      => ampl_cnt_s);
u4_sine: sine
    generic map(
    depth_g   => depth_g, 
    width_g   => width_g) 
    port map(
    clk_in    => ctrl_saxi_aclk,  
    ampl_cnt  => ampl_cnt_s,      
    sine_out  => sine_out,        
    sine_outo => sine_outo);      
dut2:pwm
    generic map(
    width_g             => width_g)
    port map(
    clk_in              => ctrl_saxi_aclk,
    sw0                 => sw0,
    sine_ampl           => sine_outo,
    div_factor_freqhigh => div_factor_freqhigh,
    div_factor_freqlow  => div_factor_freqlow,
    pwm_out             => pwm_s);

    freq_trig_so  <= freq_trig_s;
    pwm_o         <= pwm_s;

shifter: process(ctrl_saxi_aclk)
begin
    if rising_edge(ctrl_saxi_aclk) then
    if dir='0' then
        analog_ch0    <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),0));
        analog_ch1    <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),1));
        analog_ch2    <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),2));
        analog_ch3    <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),3));
        analog_ch4    <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),4));
        analog_ch5    <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),5));
        analog_ch6    <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),6));
        analog_ch7    <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),7));
        analog_ch8    <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),8));
        analog_ch9    <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),9));
        analog_ch10   <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),10));
        analog_ch11   <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),11));
        analog_ch12   <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),12));
        analog_ch13   <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),13));
        analog_ch14   <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),14));
        analog_ch15   <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),15));
        analog_ch16   <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),16));
        analog_ch17   <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),17));
        analog_ch18   <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),18));
        analog_ch19   <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),19));
        analog_ch20   <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),20));
        analog_ch21   <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),21));
        analog_ch22   <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),22));
        analog_ch23   <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),23));
        analog_ch24   <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),24));
        analog_ch25   <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),25));
        analog_ch26   <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),26));
        analog_ch27   <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),27));
        analog_ch28   <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),28));
        analog_ch29   <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),29));
        analog_ch30   <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),30));
        analog_ch31   <= std_logic_vector(rotate_left(unsigned("00000000000000000000" & sine_outo),31)); 
    else -- left
        analog_ch0    <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),0));
        analog_ch1    <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),1));
        analog_ch2    <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),2));
        analog_ch3    <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),3));
        analog_ch4    <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),4));
        analog_ch5    <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),5));
        analog_ch6    <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),6));
        analog_ch7    <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),7));
        analog_ch8    <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),8));
        analog_ch9    <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),9));
        analog_ch10   <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),10));
        analog_ch11   <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),11));
        analog_ch12   <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),12));
        analog_ch13   <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),13));
        analog_ch14   <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),14));
        analog_ch15   <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),15));
        analog_ch16   <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),16));
        analog_ch17   <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),17));
        analog_ch18   <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),18));
        analog_ch19   <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),19));
        analog_ch20   <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),20));
        analog_ch21   <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),21));
        analog_ch22   <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),22));
        analog_ch23   <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),23));
        analog_ch24   <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),24));
        analog_ch25   <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),25));
        analog_ch26   <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),26));
        analog_ch27   <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),27));
        analog_ch28   <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),28));
        analog_ch29   <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),29));
        analog_ch30   <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),30));
        analog_ch31   <= std_logic_vector(rotate_right(unsigned("00000000000000000000" & sine_outo),31));
    end if;
    end if;
 end process shifter;

end arch_imp;
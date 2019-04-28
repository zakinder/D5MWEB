-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
-- Date        : Sat Apr 27 19:17:24 2019
-- Host        : BLACKHOLE running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ zynq_soc_Sine_0_0_sim_netlist.vhdl
-- Design      : zynq_soc_Sine_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Sine_v2_0_ctrl_saxi is
  port (
    S_AXI_ARREADY : out STD_LOGIC;
    ctrl_saxi_rvalid : out STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 2 downto 0 );
    freq_trig_reg : out STD_LOGIC_VECTOR ( 30 downto 0 );
    freq_trig_reg_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    freq_trig_reg_1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    freq_trig_reg_2 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    freq_trig_reg_3 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    freq_trig_reg_4 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    freq_trig_reg_5 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    freq_trig_reg_6 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    freq_trig_reg_7 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    freq_trig_reg_8 : out STD_LOGIC_VECTOR ( 30 downto 0 );
    freq_trig_reg_9 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    freq_trig_reg_10 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    freq_trig_reg_11 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    freq_trig_reg_12 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    freq_trig_reg_13 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    freq_trig_reg_14 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    freq_trig_reg_15 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \analog_ch21_reg[22]\ : out STD_LOGIC;
    dir : out STD_LOGIC;
    \analog_ch1_reg[31]\ : out STD_LOGIC;
    \analog_ch21_reg[21]\ : out STD_LOGIC;
    \analog_ch31_reg[10]\ : out STD_LOGIC;
    \analog_ch31_reg[9]\ : out STD_LOGIC;
    \analog_ch30_reg[9]\ : out STD_LOGIC;
    \analog_ch30_reg[8]\ : out STD_LOGIC;
    \analog_ch31_reg[6]\ : out STD_LOGIC;
    \analog_ch31_reg[5]\ : out STD_LOGIC;
    \analog_ch31_reg[4]\ : out STD_LOGIC;
    \analog_ch31_reg[3]\ : out STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    sw0 : out STD_LOGIC;
    ctrl_saxi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ctrl_saxi_bvalid : out STD_LOGIC;
    analog_ch10 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    analog_ch11 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    analog_ch12 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    analog_ch29 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    analog_ch30 : in STD_LOGIC_VECTOR ( 8 downto 0 );
    analog_ch31 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    ctrl_saxi_arvalid : in STD_LOGIC;
    DOADO : in STD_LOGIC_VECTOR ( 9 downto 0 );
    ctrl_saxi_aclk : in STD_LOGIC;
    ctrl_saxi_awaddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    ctrl_saxi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ctrl_saxi_araddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    analog_ch4 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    analog_ch3 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    analog_ch2 : in STD_LOGIC_VECTOR ( 8 downto 0 );
    analog_ch16 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    analog_ch5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    analog_ch1 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    analog_ch28 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    analog_ch27 : in STD_LOGIC_VECTOR ( 0 to 0 );
    analog_ch26 : in STD_LOGIC_VECTOR ( 0 to 0 );
    analog_ch6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    analog_ch25 : in STD_LOGIC_VECTOR ( 0 to 0 );
    analog_ch24 : in STD_LOGIC_VECTOR ( 0 to 0 );
    analog_ch21 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    analog_ch7 : in STD_LOGIC_VECTOR ( 0 to 0 );
    analog_ch23 : in STD_LOGIC_VECTOR ( 0 to 0 );
    analog_ch9 : in STD_LOGIC_VECTOR ( 0 to 0 );
    analog_ch8 : in STD_LOGIC_VECTOR ( 0 to 0 );
    analog_ch17 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 9 downto 0 );
    \analog_ch14_reg[25]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \analog_ch18_reg[25]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    analog_ch22 : in STD_LOGIC_VECTOR ( 0 to 0 );
    \analog_ch13_reg[24]\ : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \analog_ch19_reg[24]\ : in STD_LOGIC_VECTOR ( 5 downto 0 );
    analog_ch20 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    ctrl_saxi_wvalid : in STD_LOGIC;
    ctrl_saxi_awvalid : in STD_LOGIC;
    ctrl_saxi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    ctrl_saxi_aresetn : in STD_LOGIC;
    ctrl_saxi_bready : in STD_LOGIC;
    ctrl_saxi_rready : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Sine_v2_0_ctrl_saxi;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Sine_v2_0_ctrl_saxi is
  signal \^s_axi_arready\ : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  signal \^s_axi_wready\ : STD_LOGIC;
  signal axi_arready_i_1_n_0 : STD_LOGIC;
  signal axi_awready0 : STD_LOGIC;
  signal axi_awready_i_1_n_0 : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal \axi_rdata[0]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[10]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[10]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[10]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[10]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[12]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[12]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[12]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[13]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[13]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[13]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[13]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[14]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[14]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[16]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[16]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[16]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[17]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[17]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[17]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[17]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[17]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[17]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[18]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[18]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[18]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[18]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[18]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[18]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[19]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[19]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[19]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[19]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[19]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[20]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[20]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[20]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[20]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[21]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[21]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[21]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[21]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[22]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[22]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[22]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[22]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[23]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[23]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[23]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[23]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[24]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[24]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[24]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[24]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[24]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[25]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[25]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[25]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[25]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[25]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[25]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[26]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[26]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[26]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[26]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[26]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[26]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[27]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[27]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[27]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[28]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[28]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[28]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[28]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[28]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[28]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[28]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[28]_i_9_n_0\ : STD_LOGIC;
  signal \axi_rdata[29]_i_10_n_0\ : STD_LOGIC;
  signal \axi_rdata[29]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[29]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[29]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[29]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[29]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[29]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[29]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[29]_i_9_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[30]_i_10_n_0\ : STD_LOGIC;
  signal \axi_rdata[30]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[30]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[30]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[30]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[30]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[30]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[30]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[30]_i_9_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_10_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_9_n_0\ : STD_LOGIC;
  signal \axi_rdata[3]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[3]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[3]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[4]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[4]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[4]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[5]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[5]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[5]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[6]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[6]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[6]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[7]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[7]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[7]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[8]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[8]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[8]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[20]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[21]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[22]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[23]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[4]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[5]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[6]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[7]_i_3_n_0\ : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal axi_wready0 : STD_LOGIC;
  signal \^ctrl_saxi_bvalid\ : STD_LOGIC;
  signal \^ctrl_saxi_rvalid\ : STD_LOGIC;
  signal \^dir\ : STD_LOGIC;
  signal div_factor_freqhigh : STD_LOGIC_VECTOR ( 31 to 31 );
  signal div_factor_freqlow : STD_LOGIC_VECTOR ( 31 to 31 );
  signal \^freq_trig_reg\ : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal \^freq_trig_reg_8\ : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \reg_data_out__0\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal sel0 : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \slv_reg0[0]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg0[0]_i_2_n_0\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[0]\ : STD_LOGIC;
  signal slv_reg1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg1[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[31]_i_2_n_0\ : STD_LOGIC;
  signal \slv_reg1[7]_i_1_n_0\ : STD_LOGIC;
  signal slv_reg2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg2[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[31]_i_2_n_0\ : STD_LOGIC;
  signal \slv_reg2[7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg4[0]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg4[0]_i_2_n_0\ : STD_LOGIC;
  signal \slv_reg4_reg_n_0_[0]\ : STD_LOGIC;
  signal slv_reg_wren : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \analog_ch11[31]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \analog_ch1[10]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \analog_ch1[2]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \analog_ch1[3]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \analog_ch1[4]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \analog_ch1[5]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \analog_ch1[6]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \analog_ch1[7]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \analog_ch1[8]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \analog_ch1[9]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \axi_rdata[0]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \axi_rdata[11]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \axi_rdata[13]_i_4\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \axi_rdata[13]_i_5\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \axi_rdata[14]_i_3\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \axi_rdata[15]_i_3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \axi_rdata[16]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \axi_rdata[18]_i_5\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \axi_rdata[18]_i_6\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \axi_rdata[19]_i_5\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \axi_rdata[21]_i_3\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \axi_rdata[22]_i_3\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \axi_rdata[24]_i_5\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \axi_rdata[25]_i_5\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \axi_rdata[27]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \axi_rdata[27]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \axi_rdata[28]_i_6\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \axi_rdata[29]_i_4\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \axi_rdata[29]_i_5\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \axi_rdata[29]_i_8\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \axi_rdata[30]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \axi_rdata[30]_i_6\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \axi_rdata[31]_i_3\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \axi_rdata[31]_i_8\ : label is "soft_lutpair4";
begin
  S_AXI_ARREADY <= \^s_axi_arready\;
  S_AXI_AWREADY <= \^s_axi_awready\;
  S_AXI_WREADY <= \^s_axi_wready\;
  ctrl_saxi_bvalid <= \^ctrl_saxi_bvalid\;
  ctrl_saxi_rvalid <= \^ctrl_saxi_rvalid\;
  dir <= \^dir\;
  freq_trig_reg(30 downto 0) <= \^freq_trig_reg\(30 downto 0);
  freq_trig_reg_8(30 downto 0) <= \^freq_trig_reg_8\(30 downto 0);
\analog_ch11[31]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^dir\,
      O => \analog_ch1_reg[31]\
    );
\analog_ch1[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^dir\,
      I1 => DOADO(9),
      O => \analog_ch21_reg[22]\
    );
\analog_ch1[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^dir\,
      I1 => DOADO(0),
      O => \analog_ch31_reg[3]\
    );
\analog_ch1[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^dir\,
      I1 => DOADO(1),
      O => \analog_ch31_reg[4]\
    );
\analog_ch1[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^dir\,
      I1 => DOADO(2),
      O => \analog_ch31_reg[5]\
    );
\analog_ch1[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^dir\,
      I1 => DOADO(3),
      O => \analog_ch31_reg[6]\
    );
\analog_ch1[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^dir\,
      I1 => DOADO(4),
      O => \analog_ch30_reg[8]\
    );
\analog_ch1[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^dir\,
      I1 => DOADO(5),
      O => \analog_ch30_reg[9]\
    );
\analog_ch1[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^dir\,
      I1 => DOADO(6),
      O => \analog_ch31_reg[9]\
    );
\analog_ch1[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^dir\,
      I1 => DOADO(7),
      O => \analog_ch31_reg[10]\
    );
\analog_ch1[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^dir\,
      I1 => DOADO(8),
      O => \analog_ch21_reg[21]\
    );
\axi_araddr_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => axi_arready_i_1_n_0,
      D => ctrl_saxi_araddr(0),
      Q => sel0(0),
      S => axi_awready_i_1_n_0
    );
\axi_araddr_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => axi_arready_i_1_n_0,
      D => ctrl_saxi_araddr(1),
      Q => sel0(1),
      S => axi_awready_i_1_n_0
    );
\axi_araddr_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => axi_arready_i_1_n_0,
      D => ctrl_saxi_araddr(2),
      Q => sel0(2),
      S => axi_awready_i_1_n_0
    );
\axi_araddr_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => axi_arready_i_1_n_0,
      D => ctrl_saxi_araddr(3),
      Q => sel0(3),
      S => axi_awready_i_1_n_0
    );
\axi_araddr_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => axi_arready_i_1_n_0,
      D => ctrl_saxi_araddr(4),
      Q => sel0(4),
      S => axi_awready_i_1_n_0
    );
axi_arready_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ctrl_saxi_arvalid,
      I1 => \^s_axi_arready\,
      O => axi_arready_i_1_n_0
    );
axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => axi_arready_i_1_n_0,
      Q => \^s_axi_arready\,
      R => axi_awready_i_1_n_0
    );
\axi_awaddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => axi_awready0,
      D => ctrl_saxi_awaddr(0),
      Q => p_0_in(0),
      R => axi_awready_i_1_n_0
    );
\axi_awaddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => axi_awready0,
      D => ctrl_saxi_awaddr(1),
      Q => p_0_in(1),
      R => axi_awready_i_1_n_0
    );
\axi_awaddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => axi_awready0,
      D => ctrl_saxi_awaddr(2),
      Q => p_0_in(2),
      R => axi_awready_i_1_n_0
    );
\axi_awaddr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => axi_awready0,
      D => ctrl_saxi_awaddr(3),
      Q => p_0_in(3),
      R => axi_awready_i_1_n_0
    );
\axi_awaddr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => axi_awready0,
      D => ctrl_saxi_awaddr(4),
      Q => p_0_in(4),
      R => axi_awready_i_1_n_0
    );
axi_awready_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ctrl_saxi_aresetn,
      O => axi_awready_i_1_n_0
    );
axi_awready_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => ctrl_saxi_wvalid,
      I1 => ctrl_saxi_awvalid,
      I2 => \^s_axi_awready\,
      O => axi_awready0
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => axi_awready0,
      Q => \^s_axi_awready\,
      R => axi_awready_i_1_n_0
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7444444444444444"
    )
        port map (
      I0 => ctrl_saxi_bready,
      I1 => \^ctrl_saxi_bvalid\,
      I2 => \^s_axi_awready\,
      I3 => \^s_axi_wready\,
      I4 => ctrl_saxi_wvalid,
      I5 => ctrl_saxi_awvalid,
      O => axi_bvalid_i_1_n_0
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => axi_bvalid_i_1_n_0,
      Q => \^ctrl_saxi_bvalid\,
      R => axi_awready_i_1_n_0
    );
\axi_rdata[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata[16]_i_3_n_0\,
      I1 => sel0(4),
      I2 => \axi_rdata[0]_i_2_n_0\,
      O => \reg_data_out__0\(0)
    );
\axi_rdata[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \axi_rdata[28]_i_4_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata[28]_i_5_n_0\,
      I3 => sel0(2),
      I4 => \axi_rdata[0]_i_3_n_0\,
      O => \axi_rdata[0]_i_2_n_0\
    );
\axi_rdata[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch4(4),
      I1 => analog_ch3(6),
      I2 => sel0(1),
      I3 => analog_ch2(8),
      I4 => sel0(0),
      I5 => analog_ch16(0),
      O => \axi_rdata[0]_i_3_n_0\
    );
\axi_rdata[10]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \axi_rdata[26]_i_6_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata[30]_i_7_n_0\,
      I3 => sel0(2),
      I4 => \axi_rdata[10]_i_4_n_0\,
      O => \axi_rdata[10]_i_2_n_0\
    );
\axi_rdata[10]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \axi_rdata[10]_i_5_n_0\,
      I1 => sel0(2),
      I2 => \axi_rdata[30]_i_10_n_0\,
      I3 => sel0(3),
      I4 => \axi_rdata[26]_i_5_n_0\,
      O => \axi_rdata[10]_i_3_n_0\
    );
\axi_rdata[10]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch24(0),
      I1 => analog_ch23(0),
      I2 => sel0(1),
      I3 => analog_ch1(9),
      I4 => sel0(0),
      I5 => analog_ch16(10),
      O => \axi_rdata[10]_i_4_n_0\
    );
\axi_rdata[10]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch31(9),
      I1 => analog_ch9(0),
      I2 => sel0(1),
      I3 => analog_ch8(0),
      I4 => sel0(0),
      I5 => analog_ch7(0),
      O => \axi_rdata[10]_i_5_n_0\
    );
\axi_rdata[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata[27]_i_3_n_0\,
      I1 => sel0(4),
      I2 => \axi_rdata[27]_i_2_n_0\,
      O => \reg_data_out__0\(11)
    );
\axi_rdata[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \axi_rdata[28]_i_6_n_0\,
      I1 => \axi_rdata[28]_i_7_n_0\,
      I2 => sel0(3),
      I3 => \axi_rdata[28]_i_8_n_0\,
      I4 => sel0(2),
      I5 => \axi_rdata[20]_i_3_n_0\,
      O => \axi_rdata[12]_i_2_n_0\
    );
\axi_rdata[12]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFC0A0C0"
    )
        port map (
      I0 => \axi_rdata[28]_i_4_n_0\,
      I1 => \axi_rdata[28]_i_5_n_0\,
      I2 => sel0(3),
      I3 => sel0(2),
      I4 => \axi_rdata[12]_i_4_n_0\,
      O => \axi_rdata[12]_i_3_n_0\
    );
\axi_rdata[12]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch4(4),
      I1 => analog_ch3(6),
      I2 => sel0(1),
      I3 => analog_ch2(8),
      I4 => sel0(0),
      I5 => analog_ch17(0),
      O => \axi_rdata[12]_i_4_n_0\
    );
\axi_rdata[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \axi_rdata[29]_i_4_n_0\,
      I1 => \axi_rdata[13]_i_2_n_0\,
      I2 => sel0(4),
      I3 => \axi_rdata[29]_i_2_n_0\,
      I4 => sel0(3),
      I5 => \axi_rdata[13]_i_3_n_0\,
      O => \reg_data_out__0\(13)
    );
\axi_rdata[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFC0A0C0A0C0A0C0"
    )
        port map (
      I0 => \axi_rdata[13]_i_4_n_0\,
      I1 => \axi_rdata[13]_i_5_n_0\,
      I2 => sel0(2),
      I3 => sel0(1),
      I4 => analog_ch17(0),
      I5 => sel0(0),
      O => \axi_rdata[13]_i_2_n_0\
    );
\axi_rdata[13]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \axi_rdata[29]_i_7_n_0\,
      I1 => sel0(2),
      I2 => sel0(1),
      I3 => analog_ch10(0),
      I4 => sel0(0),
      I5 => analog_ch21(2),
      O => \axi_rdata[13]_i_3_n_0\
    );
\axi_rdata[13]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => analog_ch5(0),
      I1 => sel0(0),
      I2 => analog_ch4(4),
      O => \axi_rdata[13]_i_4_n_0\
    );
\axi_rdata[13]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => analog_ch3(6),
      I1 => sel0(0),
      I2 => analog_ch17(1),
      O => \axi_rdata[13]_i_5_n_0\
    );
\axi_rdata[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \axi_rdata[30]_i_4_n_0\,
      I1 => \axi_rdata[14]_i_2_n_0\,
      I2 => sel0(4),
      I3 => \axi_rdata[30]_i_2_n_0\,
      I4 => sel0(3),
      I5 => \axi_rdata[14]_i_3_n_0\,
      O => \reg_data_out__0\(14)
    );
\axi_rdata[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \axi_rdata[30]_i_10_n_0\,
      I1 => sel0(2),
      I2 => sel0(1),
      I3 => analog_ch17(0),
      I4 => sel0(0),
      I5 => analog_ch17(1),
      O => \axi_rdata[14]_i_2_n_0\
    );
\axi_rdata[14]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8888888"
    )
        port map (
      I0 => \axi_rdata[30]_i_8_n_0\,
      I1 => sel0(2),
      I2 => sel0(1),
      I3 => analog_ch10(0),
      I4 => sel0(0),
      O => \axi_rdata[14]_i_3_n_0\
    );
\axi_rdata[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8BBB888B888B888"
    )
        port map (
      I0 => \axi_rdata[15]_i_2_n_0\,
      I1 => sel0(4),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => sel0(3),
      I4 => sel0(2),
      I5 => \axi_rdata[19]_i_3_n_0\,
      O => \reg_data_out__0\(15)
    );
\axi_rdata[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \axi_rdata[31]_i_8_n_0\,
      I1 => \axi_rdata[31]_i_9_n_0\,
      I2 => sel0(3),
      I3 => \axi_rdata[31]_i_10_n_0\,
      I4 => sel0(2),
      I5 => \axi_rdata[15]_i_3_n_0\,
      O => \axi_rdata[15]_i_2_n_0\
    );
\axi_rdata[15]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFC0A0C0"
    )
        port map (
      I0 => analog_ch3(6),
      I1 => analog_ch17(1),
      I2 => sel0(1),
      I3 => sel0(0),
      I4 => analog_ch17(0),
      O => \axi_rdata[15]_i_3_n_0\
    );
\axi_rdata[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata[16]_i_2_n_0\,
      I1 => sel0(4),
      I2 => \axi_rdata[16]_i_3_n_0\,
      O => \reg_data_out__0\(16)
    );
\axi_rdata[16]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \axi_rdata[28]_i_4_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata[28]_i_5_n_0\,
      I3 => sel0(2),
      I4 => \axi_rdata[16]_i_4_n_0\,
      O => \axi_rdata[16]_i_2_n_0\
    );
\axi_rdata[16]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFC0A0C0"
    )
        port map (
      I0 => \axi_rdata[28]_i_7_n_0\,
      I1 => \axi_rdata[28]_i_8_n_0\,
      I2 => sel0(3),
      I3 => sel0(2),
      I4 => \axi_rdata[20]_i_3_n_0\,
      O => \axi_rdata[16]_i_3_n_0\
    );
\axi_rdata[16]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch4(4),
      I1 => analog_ch3(6),
      I2 => sel0(1),
      I3 => analog_ch17(1),
      I4 => sel0(0),
      I5 => analog_ch16(0),
      O => \axi_rdata[16]_i_4_n_0\
    );
\axi_rdata[17]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \axi_rdata[17]_i_4_n_0\,
      I1 => sel0(2),
      I2 => \axi_rdata[29]_i_7_n_0\,
      I3 => sel0(3),
      I4 => \axi_rdata[17]_i_5_n_0\,
      O => \axi_rdata[17]_i_2_n_0\
    );
\axi_rdata[17]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \axi_rdata[17]_i_6_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata[29]_i_9_n_0\,
      I3 => sel0(2),
      I4 => \axi_rdata[17]_i_7_n_0\,
      O => \axi_rdata[17]_i_3_n_0\
    );
\axi_rdata[17]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Q(0),
      I1 => analog_ch28(4),
      I2 => sel0(1),
      I3 => analog_ch27(0),
      I4 => sel0(0),
      I5 => analog_ch26(0),
      O => \axi_rdata[17]_i_4_n_0\
    );
\axi_rdata[17]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8A800000"
    )
        port map (
      I0 => sel0(2),
      I1 => analog_ch21(2),
      I2 => sel0(0),
      I3 => analog_ch10(0),
      I4 => sel0(1),
      O => \axi_rdata[17]_i_5_n_0\
    );
\axi_rdata[17]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000033E200E2"
    )
        port map (
      I0 => analog_ch10(1),
      I1 => sel0(0),
      I2 => analog_ch11(2),
      I3 => sel0(1),
      I4 => analog_ch12(4),
      I5 => sel0(2),
      O => \axi_rdata[17]_i_6_n_0\
    );
\axi_rdata[17]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch5(0),
      I1 => analog_ch4(4),
      I2 => sel0(1),
      I3 => analog_ch17(2),
      I4 => sel0(0),
      I5 => analog_ch16(1),
      O => \axi_rdata[17]_i_7_n_0\
    );
\axi_rdata[18]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \axi_rdata[18]_i_4_n_0\,
      I1 => sel0(2),
      I2 => \axi_rdata[30]_i_8_n_0\,
      I3 => sel0(3),
      I4 => \axi_rdata[18]_i_5_n_0\,
      O => \axi_rdata[18]_i_2_n_0\
    );
\axi_rdata[18]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F004F4F0F004040"
    )
        port map (
      I0 => sel0(1),
      I1 => \axi_rdata[18]_i_6_n_0\,
      I2 => sel0(3),
      I3 => \axi_rdata[30]_i_9_n_0\,
      I4 => sel0(2),
      I5 => \axi_rdata[18]_i_7_n_0\,
      O => \axi_rdata[18]_i_3_n_0\
    );
\axi_rdata[18]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Q(1),
      I1 => \analog_ch14_reg[25]\(0),
      I2 => sel0(1),
      I3 => analog_ch26(0),
      I4 => sel0(0),
      I5 => analog_ch25(0),
      O => \axi_rdata[18]_i_4_n_0\
    );
\axi_rdata[18]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(0),
      I2 => analog_ch10(0),
      I3 => sel0(1),
      O => \axi_rdata[18]_i_5_n_0\
    );
\axi_rdata[18]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => analog_ch12(4),
      I1 => sel0(0),
      I2 => analog_ch11(2),
      O => \axi_rdata[18]_i_6_n_0\
    );
\axi_rdata[18]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch6(0),
      I1 => \analog_ch18_reg[25]\(0),
      I2 => sel0(1),
      I3 => analog_ch17(3),
      I4 => sel0(0),
      I5 => analog_ch16(2),
      O => \axi_rdata[18]_i_7_n_0\
    );
\axi_rdata[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \axi_rdata[19]_i_2_n_0\,
      I1 => sel0(4),
      I2 => sel0(3),
      I3 => \axi_rdata[19]_i_3_n_0\,
      I4 => sel0(2),
      I5 => \axi_rdata[19]_i_4_n_0\,
      O => \reg_data_out__0\(19)
    );
\axi_rdata[19]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F004F4F0F004040"
    )
        port map (
      I0 => sel0(1),
      I1 => \axi_rdata[19]_i_5_n_0\,
      I2 => sel0(3),
      I3 => \axi_rdata[31]_i_9_n_0\,
      I4 => sel0(2),
      I5 => \axi_rdata[19]_i_6_n_0\,
      O => \axi_rdata[19]_i_2_n_0\
    );
\axi_rdata[19]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch23(0),
      I1 => analog_ch22(0),
      I2 => sel0(1),
      I3 => analog_ch21(2),
      I4 => sel0(0),
      I5 => analog_ch10(0),
      O => \axi_rdata[19]_i_3_n_0\
    );
\axi_rdata[19]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Q(2),
      I1 => \analog_ch14_reg[25]\(1),
      I2 => sel0(1),
      I3 => \analog_ch13_reg[24]\(0),
      I4 => sel0(0),
      I5 => analog_ch24(0),
      O => \axi_rdata[19]_i_4_n_0\
    );
\axi_rdata[19]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => analog_ch12(4),
      I1 => sel0(0),
      O => \axi_rdata[19]_i_5_n_0\
    );
\axi_rdata[19]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \analog_ch19_reg[24]\(0),
      I1 => \analog_ch18_reg[25]\(1),
      I2 => sel0(1),
      I3 => analog_ch17(4),
      I4 => sel0(0),
      I5 => analog_ch16(3),
      O => \axi_rdata[19]_i_6_n_0\
    );
\axi_rdata[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \axi_rdata[17]_i_6_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata[29]_i_9_n_0\,
      I3 => sel0(2),
      I4 => \axi_rdata[1]_i_4_n_0\,
      O => \axi_rdata[1]_i_2_n_0\
    );
\axi_rdata[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \axi_rdata[1]_i_5_n_0\,
      I1 => sel0(2),
      I2 => \axi_rdata[29]_i_7_n_0\,
      I3 => sel0(3),
      I4 => \axi_rdata[17]_i_5_n_0\,
      O => \axi_rdata[1]_i_3_n_0\
    );
\axi_rdata[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch5(0),
      I1 => analog_ch4(4),
      I2 => sel0(1),
      I3 => analog_ch1(0),
      I4 => sel0(0),
      I5 => analog_ch16(1),
      O => \axi_rdata[1]_i_4_n_0\
    );
\axi_rdata[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch31(0),
      I1 => analog_ch28(4),
      I2 => sel0(1),
      I3 => analog_ch27(0),
      I4 => sel0(0),
      I5 => analog_ch26(0),
      O => \axi_rdata[1]_i_5_n_0\
    );
\axi_rdata[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3838380808083808"
    )
        port map (
      I0 => \axi_rdata_reg[20]_i_2_n_0\,
      I1 => sel0(4),
      I2 => sel0(3),
      I3 => \axi_rdata[20]_i_3_n_0\,
      I4 => sel0(2),
      I5 => \axi_rdata[20]_i_4_n_0\,
      O => \reg_data_out__0\(20)
    );
\axi_rdata[20]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFC0A0C0"
    )
        port map (
      I0 => analog_ch22(0),
      I1 => analog_ch21(2),
      I2 => sel0(1),
      I3 => sel0(0),
      I4 => analog_ch10(0),
      O => \axi_rdata[20]_i_3_n_0\
    );
\axi_rdata[20]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Q(3),
      I1 => \analog_ch14_reg[25]\(2),
      I2 => sel0(1),
      I3 => \analog_ch13_reg[24]\(1),
      I4 => sel0(0),
      I5 => analog_ch12(0),
      O => \axi_rdata[20]_i_4_n_0\
    );
\axi_rdata[20]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \analog_ch19_reg[24]\(1),
      I1 => \analog_ch18_reg[25]\(2),
      I2 => sel0(1),
      I3 => analog_ch17(5),
      I4 => sel0(0),
      I5 => analog_ch16(4),
      O => \axi_rdata[20]_i_5_n_0\
    );
\axi_rdata[20]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch12(4),
      I1 => analog_ch11(2),
      I2 => sel0(1),
      I3 => analog_ch10(1),
      I4 => sel0(0),
      I5 => analog_ch20(0),
      O => \axi_rdata[20]_i_6_n_0\
    );
\axi_rdata[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3838380808083808"
    )
        port map (
      I0 => \axi_rdata_reg[21]_i_2_n_0\,
      I1 => sel0(4),
      I2 => sel0(3),
      I3 => \axi_rdata[21]_i_3_n_0\,
      I4 => sel0(2),
      I5 => \axi_rdata[21]_i_4_n_0\,
      O => \reg_data_out__0\(21)
    );
\axi_rdata[21]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => sel0(1),
      I1 => analog_ch10(0),
      I2 => sel0(0),
      I3 => analog_ch11(0),
      O => \axi_rdata[21]_i_3_n_0\
    );
\axi_rdata[21]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Q(4),
      I1 => \analog_ch14_reg[25]\(3),
      I2 => sel0(1),
      I3 => \analog_ch13_reg[24]\(2),
      I4 => sel0(0),
      I5 => analog_ch12(1),
      O => \axi_rdata[21]_i_4_n_0\
    );
\axi_rdata[21]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \analog_ch19_reg[24]\(2),
      I1 => \analog_ch18_reg[25]\(3),
      I2 => sel0(1),
      I3 => analog_ch17(6),
      I4 => sel0(0),
      I5 => analog_ch16(5),
      O => \axi_rdata[21]_i_5_n_0\
    );
\axi_rdata[21]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => analog_ch12(4),
      I1 => sel0(1),
      I2 => analog_ch21(0),
      I3 => sel0(0),
      I4 => analog_ch20(1),
      O => \axi_rdata[21]_i_6_n_0\
    );
\axi_rdata[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3838380808083808"
    )
        port map (
      I0 => \axi_rdata_reg[22]_i_2_n_0\,
      I1 => sel0(4),
      I2 => sel0(3),
      I3 => \axi_rdata[22]_i_3_n_0\,
      I4 => sel0(2),
      I5 => \axi_rdata[22]_i_4_n_0\,
      O => \reg_data_out__0\(22)
    );
\axi_rdata[22]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => sel0(1),
      I1 => analog_ch1(10),
      I2 => sel0(0),
      I3 => analog_ch11(1),
      O => \axi_rdata[22]_i_3_n_0\
    );
\axi_rdata[22]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Q(5),
      I1 => \analog_ch14_reg[25]\(4),
      I2 => sel0(1),
      I3 => \analog_ch13_reg[24]\(3),
      I4 => sel0(0),
      I5 => analog_ch12(2),
      O => \axi_rdata[22]_i_4_n_0\
    );
\axi_rdata[22]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \analog_ch19_reg[24]\(3),
      I1 => \analog_ch18_reg[25]\(4),
      I2 => sel0(1),
      I3 => analog_ch17(7),
      I4 => sel0(0),
      I5 => analog_ch16(6),
      O => \axi_rdata[22]_i_5_n_0\
    );
\axi_rdata[22]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => analog_ch31(10),
      I1 => sel0(1),
      I2 => analog_ch21(1),
      I3 => sel0(0),
      I4 => analog_ch20(2),
      O => \axi_rdata[22]_i_6_n_0\
    );
\axi_rdata[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3838380808083808"
    )
        port map (
      I0 => \axi_rdata_reg[23]_i_2_n_0\,
      I1 => sel0(4),
      I2 => sel0(3),
      I3 => \axi_rdata[23]_i_3_n_0\,
      I4 => sel0(2),
      I5 => \axi_rdata[23]_i_4_n_0\,
      O => \reg_data_out__0\(23)
    );
\axi_rdata[23]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFC0A0C0"
    )
        port map (
      I0 => analog_ch3(6),
      I1 => analog_ch2(8),
      I2 => sel0(1),
      I3 => sel0(0),
      I4 => analog_ch1(10),
      O => \axi_rdata[23]_i_3_n_0\
    );
\axi_rdata[23]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Q(6),
      I1 => \analog_ch14_reg[25]\(5),
      I2 => sel0(1),
      I3 => \analog_ch13_reg[24]\(4),
      I4 => sel0(0),
      I5 => analog_ch12(3),
      O => \axi_rdata[23]_i_4_n_0\
    );
\axi_rdata[23]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \analog_ch19_reg[24]\(4),
      I1 => \analog_ch18_reg[25]\(5),
      I2 => sel0(1),
      I3 => analog_ch17(8),
      I4 => sel0(0),
      I5 => analog_ch16(7),
      O => \axi_rdata[23]_i_5_n_0\
    );
\axi_rdata[23]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch31(10),
      I1 => analog_ch30(8),
      I2 => sel0(1),
      I3 => analog_ch29(6),
      I4 => sel0(0),
      I5 => analog_ch20(3),
      O => \axi_rdata[23]_i_6_n_0\
    );
\axi_rdata[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \axi_rdata[24]_i_2_n_0\,
      I1 => sel0(4),
      I2 => sel0(3),
      I3 => \axi_rdata[24]_i_3_n_0\,
      I4 => sel0(2),
      I5 => \axi_rdata[24]_i_4_n_0\,
      O => \reg_data_out__0\(24)
    );
\axi_rdata[24]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F004F4F0F004040"
    )
        port map (
      I0 => sel0(1),
      I1 => \axi_rdata[24]_i_5_n_0\,
      I2 => sel0(3),
      I3 => \axi_rdata[28]_i_7_n_0\,
      I4 => sel0(2),
      I5 => \axi_rdata[24]_i_6_n_0\,
      O => \axi_rdata[24]_i_2_n_0\
    );
\axi_rdata[24]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch4(4),
      I1 => analog_ch3(6),
      I2 => sel0(1),
      I3 => analog_ch2(8),
      I4 => sel0(0),
      I5 => analog_ch1(10),
      O => \axi_rdata[24]_i_3_n_0\
    );
\axi_rdata[24]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Q(7),
      I1 => \analog_ch14_reg[25]\(6),
      I2 => sel0(1),
      I3 => \analog_ch13_reg[24]\(5),
      I4 => sel0(0),
      I5 => analog_ch5(0),
      O => \axi_rdata[24]_i_4_n_0\
    );
\axi_rdata[24]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => analog_ch31(10),
      I1 => sel0(0),
      O => \axi_rdata[24]_i_5_n_0\
    );
\axi_rdata[24]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \analog_ch19_reg[24]\(5),
      I1 => \analog_ch18_reg[25]\(6),
      I2 => sel0(1),
      I3 => analog_ch17(9),
      I4 => sel0(0),
      I5 => analog_ch16(8),
      O => \axi_rdata[24]_i_6_n_0\
    );
\axi_rdata[25]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \axi_rdata[25]_i_4_n_0\,
      I1 => sel0(2),
      I2 => \axi_rdata[29]_i_10_n_0\,
      I3 => sel0(3),
      I4 => \axi_rdata[25]_i_5_n_0\,
      O => \axi_rdata[25]_i_2_n_0\
    );
\axi_rdata[25]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F004F4F0F004040"
    )
        port map (
      I0 => sel0(1),
      I1 => \axi_rdata[25]_i_6_n_0\,
      I2 => sel0(3),
      I3 => \axi_rdata[29]_i_6_n_0\,
      I4 => sel0(2),
      I5 => \axi_rdata[25]_i_7_n_0\,
      O => \axi_rdata[25]_i_3_n_0\
    );
\axi_rdata[25]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Q(8),
      I1 => \analog_ch14_reg[25]\(7),
      I2 => sel0(1),
      I3 => analog_ch7(0),
      I4 => sel0(0),
      I5 => analog_ch6(0),
      O => \axi_rdata[25]_i_4_n_0\
    );
\axi_rdata[25]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(0),
      I2 => analog_ch1(10),
      I3 => sel0(1),
      O => \axi_rdata[25]_i_5_n_0\
    );
\axi_rdata[25]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => analog_ch31(10),
      I1 => sel0(0),
      I2 => analog_ch30(8),
      O => \axi_rdata[25]_i_6_n_0\
    );
\axi_rdata[25]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch25(0),
      I1 => \analog_ch18_reg[25]\(7),
      I2 => sel0(1),
      I3 => analog_ch17(10),
      I4 => sel0(0),
      I5 => analog_ch16(9),
      O => \axi_rdata[25]_i_7_n_0\
    );
\axi_rdata[26]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \axi_rdata[26]_i_4_n_0\,
      I1 => sel0(2),
      I2 => \axi_rdata[30]_i_10_n_0\,
      I3 => sel0(3),
      I4 => \axi_rdata[26]_i_5_n_0\,
      O => \axi_rdata[26]_i_2_n_0\
    );
\axi_rdata[26]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \axi_rdata[26]_i_6_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata[30]_i_7_n_0\,
      I3 => sel0(2),
      I4 => \axi_rdata[26]_i_7_n_0\,
      O => \axi_rdata[26]_i_3_n_0\
    );
\axi_rdata[26]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Q(9),
      I1 => analog_ch9(0),
      I2 => sel0(1),
      I3 => analog_ch8(0),
      I4 => sel0(0),
      I5 => analog_ch7(0),
      O => \axi_rdata[26]_i_4_n_0\
    );
\axi_rdata[26]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8A800000"
    )
        port map (
      I0 => sel0(2),
      I1 => analog_ch2(8),
      I2 => sel0(0),
      I3 => analog_ch1(10),
      I4 => sel0(1),
      O => \axi_rdata[26]_i_5_n_0\
    );
\axi_rdata[26]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000033E200E2"
    )
        port map (
      I0 => analog_ch29(6),
      I1 => sel0(0),
      I2 => analog_ch30(8),
      I3 => sel0(1),
      I4 => analog_ch31(10),
      I5 => sel0(2),
      O => \axi_rdata[26]_i_6_n_0\
    );
\axi_rdata[26]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch24(0),
      I1 => analog_ch23(0),
      I2 => sel0(1),
      I3 => analog_ch17(11),
      I4 => sel0(0),
      I5 => analog_ch16(10),
      O => \axi_rdata[26]_i_7_n_0\
    );
\axi_rdata[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata[27]_i_2_n_0\,
      I1 => sel0(4),
      I2 => \axi_rdata[27]_i_3_n_0\,
      O => \reg_data_out__0\(27)
    );
\axi_rdata[27]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \axi_rdata[31]_i_6_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata[31]_i_7_n_0\,
      I3 => sel0(2),
      I4 => \axi_rdata[27]_i_4_n_0\,
      O => \axi_rdata[27]_i_2_n_0\
    );
\axi_rdata[27]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFC0A0C0"
    )
        port map (
      I0 => \axi_rdata[31]_i_9_n_0\,
      I1 => \axi_rdata[31]_i_10_n_0\,
      I2 => sel0(3),
      I3 => sel0(2),
      I4 => \axi_rdata[23]_i_3_n_0\,
      O => \axi_rdata[27]_i_3_n_0\
    );
\axi_rdata[27]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch23(0),
      I1 => analog_ch22(0),
      I2 => sel0(1),
      I3 => analog_ch21(2),
      I4 => sel0(0),
      I5 => analog_ch16(11),
      O => \axi_rdata[27]_i_4_n_0\
    );
\axi_rdata[28]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFC0A0C0"
    )
        port map (
      I0 => \axi_rdata[28]_i_4_n_0\,
      I1 => \axi_rdata[28]_i_5_n_0\,
      I2 => sel0(3),
      I3 => sel0(2),
      I4 => \axi_rdata[24]_i_3_n_0\,
      O => \axi_rdata[28]_i_2_n_0\
    );
\axi_rdata[28]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \axi_rdata[28]_i_6_n_0\,
      I1 => \axi_rdata[28]_i_7_n_0\,
      I2 => sel0(3),
      I3 => \axi_rdata[28]_i_8_n_0\,
      I4 => sel0(2),
      I5 => \axi_rdata[28]_i_9_n_0\,
      O => \axi_rdata[28]_i_3_n_0\
    );
\axi_rdata[28]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch12(4),
      I1 => analog_ch11(2),
      I2 => sel0(1),
      I3 => analog_ch10(1),
      I4 => sel0(0),
      I5 => analog_ch9(0),
      O => \axi_rdata[28]_i_4_n_0\
    );
\axi_rdata[28]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch8(0),
      I1 => analog_ch7(0),
      I2 => sel0(1),
      I3 => analog_ch6(0),
      I4 => sel0(0),
      I5 => analog_ch5(0),
      O => \axi_rdata[28]_i_5_n_0\
    );
\axi_rdata[28]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => sel0(0),
      I1 => analog_ch31(10),
      I2 => sel0(1),
      O => \axi_rdata[28]_i_6_n_0\
    );
\axi_rdata[28]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch30(8),
      I1 => analog_ch29(6),
      I2 => sel0(1),
      I3 => analog_ch28(4),
      I4 => sel0(0),
      I5 => analog_ch27(0),
      O => \axi_rdata[28]_i_7_n_0\
    );
\axi_rdata[28]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch26(0),
      I1 => analog_ch25(0),
      I2 => sel0(1),
      I3 => analog_ch24(0),
      I4 => sel0(0),
      I5 => analog_ch23(0),
      O => \axi_rdata[28]_i_8_n_0\
    );
\axi_rdata[28]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFC0A0C0"
    )
        port map (
      I0 => analog_ch22(0),
      I1 => analog_ch21(2),
      I2 => sel0(1),
      I3 => sel0(0),
      I4 => analog_ch20(4),
      O => \axi_rdata[28]_i_9_n_0\
    );
\axi_rdata[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \axi_rdata[29]_i_2_n_0\,
      I1 => \axi_rdata[29]_i_3_n_0\,
      I2 => sel0(4),
      I3 => \axi_rdata[29]_i_4_n_0\,
      I4 => sel0(3),
      I5 => \axi_rdata[29]_i_5_n_0\,
      O => \reg_data_out__0\(29)
    );
\axi_rdata[29]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch5(0),
      I1 => analog_ch4(4),
      I2 => sel0(1),
      I3 => analog_ch3(6),
      I4 => sel0(0),
      I5 => analog_ch2(8),
      O => \axi_rdata[29]_i_10_n_0\
    );
\axi_rdata[29]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => analog_ch30(8),
      I1 => sel0(0),
      I2 => analog_ch31(10),
      I3 => sel0(1),
      I4 => sel0(2),
      I5 => \axi_rdata[29]_i_6_n_0\,
      O => \axi_rdata[29]_i_2_n_0\
    );
\axi_rdata[29]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \axi_rdata[29]_i_7_n_0\,
      I1 => sel0(2),
      I2 => sel0(1),
      I3 => analog_ch20(4),
      I4 => sel0(0),
      I5 => analog_ch21(2),
      O => \axi_rdata[29]_i_3_n_0\
    );
\axi_rdata[29]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata[29]_i_8_n_0\,
      I1 => sel0(2),
      I2 => \axi_rdata[29]_i_9_n_0\,
      O => \axi_rdata[29]_i_4_n_0\
    );
\axi_rdata[29]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8888888"
    )
        port map (
      I0 => \axi_rdata[29]_i_10_n_0\,
      I1 => sel0(2),
      I2 => sel0(1),
      I3 => analog_ch1(10),
      I4 => sel0(0),
      O => \axi_rdata[29]_i_5_n_0\
    );
\axi_rdata[29]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch29(6),
      I1 => analog_ch28(4),
      I2 => sel0(1),
      I3 => analog_ch27(0),
      I4 => sel0(0),
      I5 => analog_ch26(0),
      O => \axi_rdata[29]_i_6_n_0\
    );
\axi_rdata[29]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch25(0),
      I1 => analog_ch24(0),
      I2 => sel0(1),
      I3 => analog_ch23(0),
      I4 => sel0(0),
      I5 => analog_ch22(0),
      O => \axi_rdata[29]_i_7_n_0\
    );
\axi_rdata[29]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => analog_ch12(4),
      I1 => sel0(1),
      I2 => analog_ch11(2),
      I3 => sel0(0),
      I4 => analog_ch10(1),
      O => \axi_rdata[29]_i_8_n_0\
    );
\axi_rdata[29]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch9(0),
      I1 => analog_ch8(0),
      I2 => sel0(1),
      I3 => analog_ch7(0),
      I4 => sel0(0),
      I5 => analog_ch6(0),
      O => \axi_rdata[29]_i_9_n_0\
    );
\axi_rdata[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F004F4F0F004040"
    )
        port map (
      I0 => sel0(1),
      I1 => \axi_rdata[18]_i_6_n_0\,
      I2 => sel0(3),
      I3 => \axi_rdata[30]_i_9_n_0\,
      I4 => sel0(2),
      I5 => \axi_rdata[2]_i_4_n_0\,
      O => \axi_rdata[2]_i_2_n_0\
    );
\axi_rdata[2]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \axi_rdata[2]_i_5_n_0\,
      I1 => sel0(2),
      I2 => \axi_rdata[30]_i_8_n_0\,
      I3 => sel0(3),
      I4 => \axi_rdata[18]_i_5_n_0\,
      O => \axi_rdata[2]_i_3_n_0\
    );
\axi_rdata[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch6(0),
      I1 => analog_ch2(0),
      I2 => sel0(1),
      I3 => analog_ch1(1),
      I4 => sel0(0),
      I5 => analog_ch16(2),
      O => \axi_rdata[2]_i_4_n_0\
    );
\axi_rdata[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch31(1),
      I1 => analog_ch30(0),
      I2 => sel0(1),
      I3 => analog_ch26(0),
      I4 => sel0(0),
      I5 => analog_ch25(0),
      O => \axi_rdata[2]_i_5_n_0\
    );
\axi_rdata[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \axi_rdata[30]_i_2_n_0\,
      I1 => \axi_rdata[30]_i_3_n_0\,
      I2 => sel0(4),
      I3 => \axi_rdata[30]_i_4_n_0\,
      I4 => sel0(3),
      I5 => \axi_rdata[30]_i_5_n_0\,
      O => \reg_data_out__0\(30)
    );
\axi_rdata[30]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch6(0),
      I1 => analog_ch5(0),
      I2 => sel0(1),
      I3 => analog_ch4(4),
      I4 => sel0(0),
      I5 => analog_ch3(6),
      O => \axi_rdata[30]_i_10_n_0\
    );
\axi_rdata[30]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata[30]_i_6_n_0\,
      I1 => sel0(2),
      I2 => \axi_rdata[30]_i_7_n_0\,
      O => \axi_rdata[30]_i_2_n_0\
    );
\axi_rdata[30]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8888888"
    )
        port map (
      I0 => \axi_rdata[30]_i_8_n_0\,
      I1 => sel0(2),
      I2 => sel0(1),
      I3 => analog_ch20(4),
      I4 => sel0(0),
      O => \axi_rdata[30]_i_3_n_0\
    );
\axi_rdata[30]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => analog_ch11(2),
      I1 => sel0(0),
      I2 => analog_ch12(4),
      I3 => sel0(1),
      I4 => sel0(2),
      I5 => \axi_rdata[30]_i_9_n_0\,
      O => \axi_rdata[30]_i_4_n_0\
    );
\axi_rdata[30]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8888888B888"
    )
        port map (
      I0 => \axi_rdata[30]_i_10_n_0\,
      I1 => sel0(2),
      I2 => sel0(1),
      I3 => analog_ch1(10),
      I4 => sel0(0),
      I5 => analog_ch2(8),
      O => \axi_rdata[30]_i_5_n_0\
    );
\axi_rdata[30]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => analog_ch31(10),
      I1 => sel0(1),
      I2 => analog_ch30(8),
      I3 => sel0(0),
      I4 => analog_ch29(6),
      O => \axi_rdata[30]_i_6_n_0\
    );
\axi_rdata[30]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch28(4),
      I1 => analog_ch27(0),
      I2 => sel0(1),
      I3 => analog_ch26(0),
      I4 => sel0(0),
      I5 => analog_ch25(0),
      O => \axi_rdata[30]_i_7_n_0\
    );
\axi_rdata[30]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch24(0),
      I1 => analog_ch23(0),
      I2 => sel0(1),
      I3 => analog_ch22(0),
      I4 => sel0(0),
      I5 => analog_ch21(2),
      O => \axi_rdata[30]_i_8_n_0\
    );
\axi_rdata[30]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch10(1),
      I1 => analog_ch9(0),
      I2 => sel0(1),
      I3 => analog_ch8(0),
      I4 => sel0(0),
      I5 => analog_ch7(0),
      O => \axi_rdata[30]_i_9_n_0\
    );
\axi_rdata[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \^s_axi_arready\,
      I1 => ctrl_saxi_arvalid,
      I2 => \^ctrl_saxi_rvalid\,
      O => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata[31]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch7(0),
      I1 => analog_ch6(0),
      I2 => sel0(1),
      I3 => analog_ch5(0),
      I4 => sel0(0),
      I5 => analog_ch4(4),
      O => \axi_rdata[31]_i_10_n_0\
    );
\axi_rdata[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B888FFFFB8880000"
    )
        port map (
      I0 => \axi_rdata[31]_i_3_n_0\,
      I1 => sel0(3),
      I2 => sel0(2),
      I3 => \axi_rdata[31]_i_4_n_0\,
      I4 => sel0(4),
      I5 => \axi_rdata[31]_i_5_n_0\,
      O => \reg_data_out__0\(31)
    );
\axi_rdata[31]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata[31]_i_6_n_0\,
      I1 => sel0(2),
      I2 => \axi_rdata[31]_i_7_n_0\,
      O => \axi_rdata[31]_i_3_n_0\
    );
\axi_rdata[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch23(0),
      I1 => analog_ch22(0),
      I2 => sel0(1),
      I3 => analog_ch21(2),
      I4 => sel0(0),
      I5 => analog_ch20(4),
      O => \axi_rdata[31]_i_4_n_0\
    );
\axi_rdata[31]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \axi_rdata[31]_i_8_n_0\,
      I1 => \axi_rdata[31]_i_9_n_0\,
      I2 => sel0(3),
      I3 => \axi_rdata[31]_i_10_n_0\,
      I4 => sel0(2),
      I5 => \axi_rdata[23]_i_3_n_0\,
      O => \axi_rdata[31]_i_5_n_0\
    );
\axi_rdata[31]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch31(10),
      I1 => analog_ch30(8),
      I2 => sel0(1),
      I3 => analog_ch29(6),
      I4 => sel0(0),
      I5 => analog_ch28(4),
      O => \axi_rdata[31]_i_6_n_0\
    );
\axi_rdata[31]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch27(0),
      I1 => analog_ch26(0),
      I2 => sel0(1),
      I3 => analog_ch25(0),
      I4 => sel0(0),
      I5 => analog_ch24(0),
      O => \axi_rdata[31]_i_7_n_0\
    );
\axi_rdata[31]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => sel0(0),
      I1 => analog_ch12(4),
      I2 => sel0(1),
      O => \axi_rdata[31]_i_8_n_0\
    );
\axi_rdata[31]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch11(2),
      I1 => analog_ch10(1),
      I2 => sel0(1),
      I3 => analog_ch9(0),
      I4 => sel0(0),
      I5 => analog_ch8(0),
      O => \axi_rdata[31]_i_9_n_0\
    );
\axi_rdata[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A808FFFFA8080000"
    )
        port map (
      I0 => sel0(3),
      I1 => \axi_rdata[19]_i_3_n_0\,
      I2 => sel0(2),
      I3 => \axi_rdata[3]_i_2_n_0\,
      I4 => sel0(4),
      I5 => \axi_rdata[3]_i_3_n_0\,
      O => \reg_data_out__0\(3)
    );
\axi_rdata[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch31(2),
      I1 => analog_ch30(1),
      I2 => sel0(1),
      I3 => analog_ch29(0),
      I4 => sel0(0),
      I5 => analog_ch24(0),
      O => \axi_rdata[3]_i_2_n_0\
    );
\axi_rdata[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F004F4F0F004040"
    )
        port map (
      I0 => sel0(1),
      I1 => \axi_rdata[19]_i_5_n_0\,
      I2 => sel0(3),
      I3 => \axi_rdata[31]_i_9_n_0\,
      I4 => sel0(2),
      I5 => \axi_rdata[3]_i_4_n_0\,
      O => \axi_rdata[3]_i_3_n_0\
    );
\axi_rdata[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch3(0),
      I1 => analog_ch2(1),
      I2 => sel0(1),
      I3 => analog_ch1(2),
      I4 => sel0(0),
      I5 => analog_ch16(3),
      O => \axi_rdata[3]_i_4_n_0\
    );
\axi_rdata[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E20000FF0000"
    )
        port map (
      I0 => \axi_rdata[20]_i_3_n_0\,
      I1 => sel0(2),
      I2 => \axi_rdata[4]_i_2_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata_reg[4]_i_3_n_0\,
      I5 => sel0(3),
      O => \reg_data_out__0\(4)
    );
\axi_rdata[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch31(3),
      I1 => analog_ch30(2),
      I2 => sel0(1),
      I3 => analog_ch29(1),
      I4 => sel0(0),
      I5 => analog_ch28(0),
      O => \axi_rdata[4]_i_2_n_0\
    );
\axi_rdata[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch3(1),
      I1 => analog_ch2(2),
      I2 => sel0(1),
      I3 => analog_ch1(3),
      I4 => sel0(0),
      I5 => analog_ch16(4),
      O => \axi_rdata[4]_i_4_n_0\
    );
\axi_rdata[4]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch12(4),
      I1 => analog_ch11(2),
      I2 => sel0(1),
      I3 => analog_ch10(1),
      I4 => sel0(0),
      I5 => analog_ch4(0),
      O => \axi_rdata[4]_i_5_n_0\
    );
\axi_rdata[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E20000FF0000"
    )
        port map (
      I0 => \axi_rdata[21]_i_3_n_0\,
      I1 => sel0(2),
      I2 => \axi_rdata[5]_i_2_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata_reg[5]_i_3_n_0\,
      I5 => sel0(3),
      O => \reg_data_out__0\(5)
    );
\axi_rdata[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch31(4),
      I1 => analog_ch30(3),
      I2 => sel0(1),
      I3 => analog_ch29(2),
      I4 => sel0(0),
      I5 => analog_ch28(1),
      O => \axi_rdata[5]_i_2_n_0\
    );
\axi_rdata[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch3(2),
      I1 => analog_ch2(3),
      I2 => sel0(1),
      I3 => analog_ch1(4),
      I4 => sel0(0),
      I5 => analog_ch16(5),
      O => \axi_rdata[5]_i_4_n_0\
    );
\axi_rdata[5]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => analog_ch12(4),
      I1 => sel0(1),
      I2 => analog_ch21(0),
      I3 => sel0(0),
      I4 => analog_ch4(1),
      O => \axi_rdata[5]_i_5_n_0\
    );
\axi_rdata[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E20000FF0000"
    )
        port map (
      I0 => \axi_rdata[22]_i_3_n_0\,
      I1 => sel0(2),
      I2 => \axi_rdata[6]_i_2_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata_reg[6]_i_3_n_0\,
      I5 => sel0(3),
      O => \reg_data_out__0\(6)
    );
\axi_rdata[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch31(5),
      I1 => analog_ch30(4),
      I2 => sel0(1),
      I3 => analog_ch29(3),
      I4 => sel0(0),
      I5 => analog_ch28(2),
      O => \axi_rdata[6]_i_2_n_0\
    );
\axi_rdata[6]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch3(3),
      I1 => analog_ch2(4),
      I2 => sel0(1),
      I3 => analog_ch1(5),
      I4 => sel0(0),
      I5 => analog_ch16(6),
      O => \axi_rdata[6]_i_4_n_0\
    );
\axi_rdata[6]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => analog_ch31(10),
      I1 => sel0(1),
      I2 => analog_ch21(1),
      I3 => sel0(0),
      I4 => analog_ch4(2),
      O => \axi_rdata[6]_i_5_n_0\
    );
\axi_rdata[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E20000FF0000"
    )
        port map (
      I0 => \axi_rdata[23]_i_3_n_0\,
      I1 => sel0(2),
      I2 => \axi_rdata[7]_i_2_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata_reg[7]_i_3_n_0\,
      I5 => sel0(3),
      O => \reg_data_out__0\(7)
    );
\axi_rdata[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch31(6),
      I1 => analog_ch30(5),
      I2 => sel0(1),
      I3 => analog_ch29(4),
      I4 => sel0(0),
      I5 => analog_ch28(3),
      O => \axi_rdata[7]_i_2_n_0\
    );
\axi_rdata[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch3(4),
      I1 => analog_ch2(5),
      I2 => sel0(1),
      I3 => analog_ch1(6),
      I4 => sel0(0),
      I5 => analog_ch16(7),
      O => \axi_rdata[7]_i_4_n_0\
    );
\axi_rdata[7]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch31(10),
      I1 => analog_ch30(8),
      I2 => sel0(1),
      I3 => analog_ch29(6),
      I4 => sel0(0),
      I5 => analog_ch4(3),
      O => \axi_rdata[7]_i_5_n_0\
    );
\axi_rdata[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A808FFFFA8080000"
    )
        port map (
      I0 => sel0(3),
      I1 => \axi_rdata[24]_i_3_n_0\,
      I2 => sel0(2),
      I3 => \axi_rdata[8]_i_2_n_0\,
      I4 => sel0(4),
      I5 => \axi_rdata[8]_i_3_n_0\,
      O => \reg_data_out__0\(8)
    );
\axi_rdata[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch31(7),
      I1 => analog_ch30(6),
      I2 => sel0(1),
      I3 => analog_ch29(5),
      I4 => sel0(0),
      I5 => analog_ch5(0),
      O => \axi_rdata[8]_i_2_n_0\
    );
\axi_rdata[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F004F4F0F004040"
    )
        port map (
      I0 => sel0(1),
      I1 => \axi_rdata[24]_i_5_n_0\,
      I2 => sel0(3),
      I3 => \axi_rdata[28]_i_7_n_0\,
      I4 => sel0(2),
      I5 => \axi_rdata[8]_i_4_n_0\,
      O => \axi_rdata[8]_i_3_n_0\
    );
\axi_rdata[8]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch3(5),
      I1 => analog_ch2(6),
      I2 => sel0(1),
      I3 => analog_ch1(7),
      I4 => sel0(0),
      I5 => analog_ch16(8),
      O => \axi_rdata[8]_i_4_n_0\
    );
\axi_rdata[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F004F4F0F004040"
    )
        port map (
      I0 => sel0(1),
      I1 => \axi_rdata[25]_i_6_n_0\,
      I2 => sel0(3),
      I3 => \axi_rdata[29]_i_6_n_0\,
      I4 => sel0(2),
      I5 => \axi_rdata[9]_i_4_n_0\,
      O => \axi_rdata[9]_i_2_n_0\
    );
\axi_rdata[9]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \axi_rdata[9]_i_5_n_0\,
      I1 => sel0(2),
      I2 => \axi_rdata[29]_i_10_n_0\,
      I3 => sel0(3),
      I4 => \axi_rdata[25]_i_5_n_0\,
      O => \axi_rdata[9]_i_3_n_0\
    );
\axi_rdata[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch25(0),
      I1 => analog_ch2(7),
      I2 => sel0(1),
      I3 => analog_ch1(8),
      I4 => sel0(0),
      I5 => analog_ch16(9),
      O => \axi_rdata[9]_i_4_n_0\
    );
\axi_rdata[9]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => analog_ch31(8),
      I1 => analog_ch30(7),
      I2 => sel0(1),
      I3 => analog_ch7(0),
      I4 => sel0(0),
      I5 => analog_ch6(0),
      O => \axi_rdata[9]_i_5_n_0\
    );
\axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(0),
      Q => ctrl_saxi_rdata(0),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(10),
      Q => ctrl_saxi_rdata(10),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[10]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[10]_i_2_n_0\,
      I1 => \axi_rdata[10]_i_3_n_0\,
      O => \reg_data_out__0\(10),
      S => sel0(4)
    );
\axi_rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(11),
      Q => ctrl_saxi_rdata(11),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(12),
      Q => ctrl_saxi_rdata(12),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[12]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[12]_i_2_n_0\,
      I1 => \axi_rdata[12]_i_3_n_0\,
      O => \reg_data_out__0\(12),
      S => sel0(4)
    );
\axi_rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(13),
      Q => ctrl_saxi_rdata(13),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(14),
      Q => ctrl_saxi_rdata(14),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(15),
      Q => ctrl_saxi_rdata(15),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(16),
      Q => ctrl_saxi_rdata(16),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(17),
      Q => ctrl_saxi_rdata(17),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[17]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[17]_i_2_n_0\,
      I1 => \axi_rdata[17]_i_3_n_0\,
      O => \reg_data_out__0\(17),
      S => sel0(4)
    );
\axi_rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(18),
      Q => ctrl_saxi_rdata(18),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[18]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[18]_i_2_n_0\,
      I1 => \axi_rdata[18]_i_3_n_0\,
      O => \reg_data_out__0\(18),
      S => sel0(4)
    );
\axi_rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(19),
      Q => ctrl_saxi_rdata(19),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(1),
      Q => ctrl_saxi_rdata(1),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[1]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[1]_i_2_n_0\,
      I1 => \axi_rdata[1]_i_3_n_0\,
      O => \reg_data_out__0\(1),
      S => sel0(4)
    );
\axi_rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(20),
      Q => ctrl_saxi_rdata(20),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[20]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[20]_i_5_n_0\,
      I1 => \axi_rdata[20]_i_6_n_0\,
      O => \axi_rdata_reg[20]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(21),
      Q => ctrl_saxi_rdata(21),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[21]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[21]_i_5_n_0\,
      I1 => \axi_rdata[21]_i_6_n_0\,
      O => \axi_rdata_reg[21]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(22),
      Q => ctrl_saxi_rdata(22),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[22]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[22]_i_5_n_0\,
      I1 => \axi_rdata[22]_i_6_n_0\,
      O => \axi_rdata_reg[22]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(23),
      Q => ctrl_saxi_rdata(23),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[23]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[23]_i_5_n_0\,
      I1 => \axi_rdata[23]_i_6_n_0\,
      O => \axi_rdata_reg[23]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(24),
      Q => ctrl_saxi_rdata(24),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(25),
      Q => ctrl_saxi_rdata(25),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[25]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[25]_i_2_n_0\,
      I1 => \axi_rdata[25]_i_3_n_0\,
      O => \reg_data_out__0\(25),
      S => sel0(4)
    );
\axi_rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(26),
      Q => ctrl_saxi_rdata(26),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[26]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[26]_i_2_n_0\,
      I1 => \axi_rdata[26]_i_3_n_0\,
      O => \reg_data_out__0\(26),
      S => sel0(4)
    );
\axi_rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(27),
      Q => ctrl_saxi_rdata(27),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(28),
      Q => ctrl_saxi_rdata(28),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[28]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[28]_i_2_n_0\,
      I1 => \axi_rdata[28]_i_3_n_0\,
      O => \reg_data_out__0\(28),
      S => sel0(4)
    );
\axi_rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(29),
      Q => ctrl_saxi_rdata(29),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(2),
      Q => ctrl_saxi_rdata(2),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[2]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[2]_i_2_n_0\,
      I1 => \axi_rdata[2]_i_3_n_0\,
      O => \reg_data_out__0\(2),
      S => sel0(4)
    );
\axi_rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(30),
      Q => ctrl_saxi_rdata(30),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(31),
      Q => ctrl_saxi_rdata(31),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(3),
      Q => ctrl_saxi_rdata(3),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(4),
      Q => ctrl_saxi_rdata(4),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[4]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[4]_i_4_n_0\,
      I1 => \axi_rdata[4]_i_5_n_0\,
      O => \axi_rdata_reg[4]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(5),
      Q => ctrl_saxi_rdata(5),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[5]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[5]_i_4_n_0\,
      I1 => \axi_rdata[5]_i_5_n_0\,
      O => \axi_rdata_reg[5]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(6),
      Q => ctrl_saxi_rdata(6),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[6]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[6]_i_4_n_0\,
      I1 => \axi_rdata[6]_i_5_n_0\,
      O => \axi_rdata_reg[6]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(7),
      Q => ctrl_saxi_rdata(7),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[7]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[7]_i_4_n_0\,
      I1 => \axi_rdata[7]_i_5_n_0\,
      O => \axi_rdata_reg[7]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(8),
      Q => ctrl_saxi_rdata(8),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => \reg_data_out__0\(9),
      Q => ctrl_saxi_rdata(9),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[9]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[9]_i_2_n_0\,
      I1 => \axi_rdata[9]_i_3_n_0\,
      O => \reg_data_out__0\(9),
      S => sel0(4)
    );
axi_rvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08F8"
    )
        port map (
      I0 => ctrl_saxi_arvalid,
      I1 => \^s_axi_arready\,
      I2 => \^ctrl_saxi_rvalid\,
      I3 => ctrl_saxi_rready,
      O => axi_rvalid_i_1_n_0
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => axi_rvalid_i_1_n_0,
      Q => \^ctrl_saxi_rvalid\,
      R => axi_awready_i_1_n_0
    );
axi_wready_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => ctrl_saxi_wvalid,
      I1 => ctrl_saxi_awvalid,
      I2 => \^s_axi_wready\,
      O => axi_wready0
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => axi_wready0,
      Q => \^s_axi_wready\,
      R => axi_awready_i_1_n_0
    );
dir_reg: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => \slv_reg4_reg_n_0_[0]\,
      Q => \^dir\,
      R => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(0),
      Q => \^freq_trig_reg_8\(0),
      S => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(10),
      Q => \^freq_trig_reg_8\(10),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(11),
      Q => \^freq_trig_reg_8\(11),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(12),
      Q => \^freq_trig_reg_8\(12),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(13),
      Q => \^freq_trig_reg_8\(13),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(14),
      Q => \^freq_trig_reg_8\(14),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(15),
      Q => \^freq_trig_reg_8\(15),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(16),
      Q => \^freq_trig_reg_8\(16),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(17),
      Q => \^freq_trig_reg_8\(17),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(18),
      Q => \^freq_trig_reg_8\(18),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(19),
      Q => \^freq_trig_reg_8\(19),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(1),
      Q => \^freq_trig_reg_8\(1),
      S => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(20),
      Q => \^freq_trig_reg_8\(20),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(21),
      Q => \^freq_trig_reg_8\(21),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(22),
      Q => \^freq_trig_reg_8\(22),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(23),
      Q => \^freq_trig_reg_8\(23),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(24),
      Q => \^freq_trig_reg_8\(24),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(25),
      Q => \^freq_trig_reg_8\(25),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(26),
      Q => \^freq_trig_reg_8\(26),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(27),
      Q => \^freq_trig_reg_8\(27),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(28),
      Q => \^freq_trig_reg_8\(28),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(29),
      Q => \^freq_trig_reg_8\(29),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(2),
      Q => \^freq_trig_reg_8\(2),
      S => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(30),
      Q => \^freq_trig_reg_8\(30),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(31),
      Q => div_factor_freqhigh(31),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(3),
      Q => \^freq_trig_reg_8\(3),
      S => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(4),
      Q => \^freq_trig_reg_8\(4),
      S => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(5),
      Q => \^freq_trig_reg_8\(5),
      S => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(6),
      Q => \^freq_trig_reg_8\(6),
      S => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(7),
      Q => \^freq_trig_reg_8\(7),
      S => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(8),
      Q => \^freq_trig_reg_8\(8),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqhigh_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg1(9),
      Q => \^freq_trig_reg_8\(9),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(0),
      Q => \^freq_trig_reg\(0),
      S => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(10),
      Q => \^freq_trig_reg\(10),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(11),
      Q => \^freq_trig_reg\(11),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(12),
      Q => \^freq_trig_reg\(12),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(13),
      Q => \^freq_trig_reg\(13),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(14),
      Q => \^freq_trig_reg\(14),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(15),
      Q => \^freq_trig_reg\(15),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(16),
      Q => \^freq_trig_reg\(16),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(17),
      Q => \^freq_trig_reg\(17),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(18),
      Q => \^freq_trig_reg\(18),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(19),
      Q => \^freq_trig_reg\(19),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(1),
      Q => \^freq_trig_reg\(1),
      S => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(20),
      Q => \^freq_trig_reg\(20),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(21),
      Q => \^freq_trig_reg\(21),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(22),
      Q => \^freq_trig_reg\(22),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(23),
      Q => \^freq_trig_reg\(23),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(24),
      Q => \^freq_trig_reg\(24),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(25),
      Q => \^freq_trig_reg\(25),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(26),
      Q => \^freq_trig_reg\(26),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(27),
      Q => \^freq_trig_reg\(27),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(28),
      Q => \^freq_trig_reg\(28),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(29),
      Q => \^freq_trig_reg\(29),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(2),
      Q => \^freq_trig_reg\(2),
      S => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(30),
      Q => \^freq_trig_reg\(30),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(31),
      Q => div_factor_freqlow(31),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(3),
      Q => \^freq_trig_reg\(3),
      S => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(4),
      Q => \^freq_trig_reg\(4),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(5),
      Q => \^freq_trig_reg\(5),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(6),
      Q => \^freq_trig_reg\(6),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(7),
      Q => \^freq_trig_reg\(7),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(8),
      Q => \^freq_trig_reg\(8),
      R => axi_awready_i_1_n_0
    );
\div_factor_freqlow_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => slv_reg2(9),
      Q => \^freq_trig_reg\(9),
      R => axi_awready_i_1_n_0
    );
\i__carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(8),
      O => freq_trig_reg_14(3)
    );
\i__carry__0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(7),
      O => freq_trig_reg_14(2)
    );
\i__carry__0_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(6),
      O => freq_trig_reg_14(1)
    );
\i__carry__0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(5),
      O => freq_trig_reg_14(0)
    );
\i__carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(12),
      O => freq_trig_reg_13(3)
    );
\i__carry__1_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(11),
      O => freq_trig_reg_13(2)
    );
\i__carry__1_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(10),
      O => freq_trig_reg_13(1)
    );
\i__carry__1_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(9),
      O => freq_trig_reg_13(0)
    );
\i__carry__2_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(16),
      O => freq_trig_reg_12(3)
    );
\i__carry__2_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(15),
      O => freq_trig_reg_12(2)
    );
\i__carry__2_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(14),
      O => freq_trig_reg_12(1)
    );
\i__carry__2_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(13),
      O => freq_trig_reg_12(0)
    );
\i__carry__3_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(20),
      O => freq_trig_reg_11(3)
    );
\i__carry__3_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(19),
      O => freq_trig_reg_11(2)
    );
\i__carry__3_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(18),
      O => freq_trig_reg_11(1)
    );
\i__carry__3_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(17),
      O => freq_trig_reg_11(0)
    );
\i__carry__4_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(24),
      O => freq_trig_reg_10(3)
    );
\i__carry__4_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(23),
      O => freq_trig_reg_10(2)
    );
\i__carry__4_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(22),
      O => freq_trig_reg_10(1)
    );
\i__carry__4_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(21),
      O => freq_trig_reg_10(0)
    );
\i__carry__5_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(28),
      O => freq_trig_reg_9(3)
    );
\i__carry__5_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(27),
      O => freq_trig_reg_9(2)
    );
\i__carry__5_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(26),
      O => freq_trig_reg_9(1)
    );
\i__carry__5_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(25),
      O => freq_trig_reg_9(0)
    );
\i__carry__6_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => div_factor_freqhigh(31),
      O => freq_trig_reg_7(2)
    );
\i__carry__6_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(30),
      O => freq_trig_reg_7(1)
    );
\i__carry__6_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(29),
      O => freq_trig_reg_7(0)
    );
\i__carry_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(4),
      O => freq_trig_reg_15(3)
    );
\i__carry_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(3),
      O => freq_trig_reg_15(2)
    );
\i__carry_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(2),
      O => freq_trig_reg_15(1)
    );
\i__carry_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg_8\(1),
      O => freq_trig_reg_15(0)
    );
\minusOp_carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(8),
      O => freq_trig_reg_5(3)
    );
\minusOp_carry__0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(7),
      O => freq_trig_reg_5(2)
    );
\minusOp_carry__0_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(6),
      O => freq_trig_reg_5(1)
    );
\minusOp_carry__0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(5),
      O => freq_trig_reg_5(0)
    );
\minusOp_carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(12),
      O => freq_trig_reg_4(3)
    );
\minusOp_carry__1_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(11),
      O => freq_trig_reg_4(2)
    );
\minusOp_carry__1_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(10),
      O => freq_trig_reg_4(1)
    );
\minusOp_carry__1_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(9),
      O => freq_trig_reg_4(0)
    );
\minusOp_carry__2_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(16),
      O => freq_trig_reg_3(3)
    );
\minusOp_carry__2_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(15),
      O => freq_trig_reg_3(2)
    );
\minusOp_carry__2_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(14),
      O => freq_trig_reg_3(1)
    );
\minusOp_carry__2_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(13),
      O => freq_trig_reg_3(0)
    );
\minusOp_carry__3_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(20),
      O => freq_trig_reg_2(3)
    );
\minusOp_carry__3_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(19),
      O => freq_trig_reg_2(2)
    );
\minusOp_carry__3_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(18),
      O => freq_trig_reg_2(1)
    );
\minusOp_carry__3_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(17),
      O => freq_trig_reg_2(0)
    );
\minusOp_carry__4_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(24),
      O => freq_trig_reg_1(3)
    );
\minusOp_carry__4_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(23),
      O => freq_trig_reg_1(2)
    );
\minusOp_carry__4_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(22),
      O => freq_trig_reg_1(1)
    );
\minusOp_carry__4_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(21),
      O => freq_trig_reg_1(0)
    );
\minusOp_carry__5_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(28),
      O => freq_trig_reg_0(3)
    );
\minusOp_carry__5_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(27),
      O => freq_trig_reg_0(2)
    );
\minusOp_carry__5_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(26),
      O => freq_trig_reg_0(1)
    );
\minusOp_carry__5_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(25),
      O => freq_trig_reg_0(0)
    );
\minusOp_carry__6_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => div_factor_freqlow(31),
      O => S(2)
    );
\minusOp_carry__6_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(30),
      O => S(1)
    );
\minusOp_carry__6_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(29),
      O => S(0)
    );
minusOp_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(4),
      O => freq_trig_reg_6(3)
    );
minusOp_carry_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(3),
      O => freq_trig_reg_6(2)
    );
minusOp_carry_i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(2),
      O => freq_trig_reg_6(1)
    );
minusOp_carry_i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^freq_trig_reg\(1),
      O => freq_trig_reg_6(0)
    );
\slv_reg0[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => ctrl_saxi_wdata(0),
      I1 => p_0_in(1),
      I2 => ctrl_saxi_wstrb(0),
      I3 => \slv_reg0[0]_i_2_n_0\,
      I4 => \slv_reg0_reg_n_0_[0]\,
      O => \slv_reg0[0]_i_1_n_0\
    );
\slv_reg0[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => p_0_in(2),
      I1 => p_0_in(4),
      I2 => p_0_in(3),
      I3 => slv_reg_wren,
      I4 => p_0_in(0),
      O => \slv_reg0[0]_i_2_n_0\
    );
\slv_reg0_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \slv_reg0[0]_i_1_n_0\,
      Q => \slv_reg0_reg_n_0_[0]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slv_reg1[31]_i_2_n_0\,
      I1 => ctrl_saxi_wstrb(1),
      O => \slv_reg1[15]_i_1_n_0\
    );
\slv_reg1[23]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slv_reg1[31]_i_2_n_0\,
      I1 => ctrl_saxi_wstrb(2),
      O => \slv_reg1[23]_i_1_n_0\
    );
\slv_reg1[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slv_reg1[31]_i_2_n_0\,
      I1 => ctrl_saxi_wstrb(3),
      O => \slv_reg1[31]_i_1_n_0\
    );
\slv_reg1[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000400000000"
    )
        port map (
      I0 => p_0_in(1),
      I1 => p_0_in(0),
      I2 => p_0_in(2),
      I3 => p_0_in(4),
      I4 => p_0_in(3),
      I5 => slv_reg_wren,
      O => \slv_reg1[31]_i_2_n_0\
    );
\slv_reg1[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slv_reg1[31]_i_2_n_0\,
      I1 => ctrl_saxi_wstrb(0),
      O => \slv_reg1[7]_i_1_n_0\
    );
\slv_reg1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => ctrl_saxi_wdata(0),
      Q => slv_reg1(0),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => ctrl_saxi_wdata(10),
      Q => slv_reg1(10),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => ctrl_saxi_wdata(11),
      Q => slv_reg1(11),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => ctrl_saxi_wdata(12),
      Q => slv_reg1(12),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => ctrl_saxi_wdata(13),
      Q => slv_reg1(13),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => ctrl_saxi_wdata(14),
      Q => slv_reg1(14),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => ctrl_saxi_wdata(15),
      Q => slv_reg1(15),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => ctrl_saxi_wdata(16),
      Q => slv_reg1(16),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => ctrl_saxi_wdata(17),
      Q => slv_reg1(17),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => ctrl_saxi_wdata(18),
      Q => slv_reg1(18),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => ctrl_saxi_wdata(19),
      Q => slv_reg1(19),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => ctrl_saxi_wdata(1),
      Q => slv_reg1(1),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => ctrl_saxi_wdata(20),
      Q => slv_reg1(20),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => ctrl_saxi_wdata(21),
      Q => slv_reg1(21),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => ctrl_saxi_wdata(22),
      Q => slv_reg1(22),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => ctrl_saxi_wdata(23),
      Q => slv_reg1(23),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => ctrl_saxi_wdata(24),
      Q => slv_reg1(24),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => ctrl_saxi_wdata(25),
      Q => slv_reg1(25),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => ctrl_saxi_wdata(26),
      Q => slv_reg1(26),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => ctrl_saxi_wdata(27),
      Q => slv_reg1(27),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => ctrl_saxi_wdata(28),
      Q => slv_reg1(28),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => ctrl_saxi_wdata(29),
      Q => slv_reg1(29),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => ctrl_saxi_wdata(2),
      Q => slv_reg1(2),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => ctrl_saxi_wdata(30),
      Q => slv_reg1(30),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => ctrl_saxi_wdata(31),
      Q => slv_reg1(31),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => ctrl_saxi_wdata(3),
      Q => slv_reg1(3),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => ctrl_saxi_wdata(4),
      Q => slv_reg1(4),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => ctrl_saxi_wdata(5),
      Q => slv_reg1(5),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => ctrl_saxi_wdata(6),
      Q => slv_reg1(6),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => ctrl_saxi_wdata(7),
      Q => slv_reg1(7),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => ctrl_saxi_wdata(8),
      Q => slv_reg1(8),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => ctrl_saxi_wdata(9),
      Q => slv_reg1(9),
      R => axi_awready_i_1_n_0
    );
\slv_reg2[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slv_reg2[31]_i_2_n_0\,
      I1 => ctrl_saxi_wstrb(1),
      O => \slv_reg2[15]_i_1_n_0\
    );
\slv_reg2[23]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slv_reg2[31]_i_2_n_0\,
      I1 => ctrl_saxi_wstrb(2),
      O => \slv_reg2[23]_i_1_n_0\
    );
\slv_reg2[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slv_reg2[31]_i_2_n_0\,
      I1 => ctrl_saxi_wstrb(3),
      O => \slv_reg2[31]_i_1_n_0\
    );
\slv_reg2[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000400000000"
    )
        port map (
      I0 => p_0_in(0),
      I1 => slv_reg_wren,
      I2 => p_0_in(3),
      I3 => p_0_in(4),
      I4 => p_0_in(2),
      I5 => p_0_in(1),
      O => \slv_reg2[31]_i_2_n_0\
    );
\slv_reg2[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slv_reg2[31]_i_2_n_0\,
      I1 => ctrl_saxi_wstrb(0),
      O => \slv_reg2[7]_i_1_n_0\
    );
\slv_reg2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => ctrl_saxi_wdata(0),
      Q => slv_reg2(0),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => ctrl_saxi_wdata(10),
      Q => slv_reg2(10),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => ctrl_saxi_wdata(11),
      Q => slv_reg2(11),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => ctrl_saxi_wdata(12),
      Q => slv_reg2(12),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => ctrl_saxi_wdata(13),
      Q => slv_reg2(13),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => ctrl_saxi_wdata(14),
      Q => slv_reg2(14),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => ctrl_saxi_wdata(15),
      Q => slv_reg2(15),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => ctrl_saxi_wdata(16),
      Q => slv_reg2(16),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => ctrl_saxi_wdata(17),
      Q => slv_reg2(17),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => ctrl_saxi_wdata(18),
      Q => slv_reg2(18),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => ctrl_saxi_wdata(19),
      Q => slv_reg2(19),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => ctrl_saxi_wdata(1),
      Q => slv_reg2(1),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => ctrl_saxi_wdata(20),
      Q => slv_reg2(20),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => ctrl_saxi_wdata(21),
      Q => slv_reg2(21),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => ctrl_saxi_wdata(22),
      Q => slv_reg2(22),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => ctrl_saxi_wdata(23),
      Q => slv_reg2(23),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => ctrl_saxi_wdata(24),
      Q => slv_reg2(24),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => ctrl_saxi_wdata(25),
      Q => slv_reg2(25),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => ctrl_saxi_wdata(26),
      Q => slv_reg2(26),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => ctrl_saxi_wdata(27),
      Q => slv_reg2(27),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => ctrl_saxi_wdata(28),
      Q => slv_reg2(28),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => ctrl_saxi_wdata(29),
      Q => slv_reg2(29),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => ctrl_saxi_wdata(2),
      Q => slv_reg2(2),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => ctrl_saxi_wdata(30),
      Q => slv_reg2(30),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => ctrl_saxi_wdata(31),
      Q => slv_reg2(31),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => ctrl_saxi_wdata(3),
      Q => slv_reg2(3),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => ctrl_saxi_wdata(4),
      Q => slv_reg2(4),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => ctrl_saxi_wdata(5),
      Q => slv_reg2(5),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => ctrl_saxi_wdata(6),
      Q => slv_reg2(6),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => ctrl_saxi_wdata(7),
      Q => slv_reg2(7),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => ctrl_saxi_wdata(8),
      Q => slv_reg2(8),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => ctrl_saxi_wdata(9),
      Q => slv_reg2(9),
      R => axi_awready_i_1_n_0
    );
\slv_reg4[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFBF00000080"
    )
        port map (
      I0 => ctrl_saxi_wdata(0),
      I1 => \slv_reg4[0]_i_2_n_0\,
      I2 => slv_reg_wren,
      I3 => p_0_in(3),
      I4 => p_0_in(4),
      I5 => \slv_reg4_reg_n_0_[0]\,
      O => \slv_reg4[0]_i_1_n_0\
    );
\slv_reg4[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => p_0_in(0),
      I1 => ctrl_saxi_wstrb(0),
      I2 => p_0_in(1),
      I3 => p_0_in(2),
      O => \slv_reg4[0]_i_2_n_0\
    );
\slv_reg4_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \slv_reg4[0]_i_1_n_0\,
      Q => \slv_reg4_reg_n_0_[0]\,
      R => axi_awready_i_1_n_0
    );
sw0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^s_axi_awready\,
      I1 => \^s_axi_wready\,
      I2 => ctrl_saxi_wvalid,
      I3 => ctrl_saxi_awvalid,
      O => slv_reg_wren
    );
sw0_reg: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => slv_reg_wren,
      D => \slv_reg0_reg_n_0_[0]\,
      Q => sw0,
      R => axi_awready_i_1_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_counter is
  port (
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    ctrl_saxi_aclk : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_counter;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_counter is
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal cnt_out_s : STD_LOGIC;
  signal \cnt_out_s[7]_i_3_n_0\ : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \cnt_out_s[1]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \cnt_out_s[2]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \cnt_out_s[3]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \cnt_out_s[4]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \cnt_out_s[6]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \cnt_out_s[7]_i_2\ : label is "soft_lutpair19";
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
\cnt_out_s[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => plusOp(0)
    );
\cnt_out_s[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => plusOp(1)
    );
\cnt_out_s[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      O => plusOp(2)
    );
\cnt_out_s[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      O => plusOp(3)
    );
\cnt_out_s[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(2),
      I4 => \^q\(4),
      O => plusOp(4)
    );
\cnt_out_s[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \^q\(3),
      I5 => \^q\(5),
      O => plusOp(5)
    );
\cnt_out_s[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \cnt_out_s[7]_i_3_n_0\,
      I1 => \^q\(6),
      O => plusOp(6)
    );
\cnt_out_s[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \^q\(7),
      I1 => E(0),
      I2 => \^q\(6),
      I3 => \cnt_out_s[7]_i_3_n_0\,
      O => cnt_out_s
    );
\cnt_out_s[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D2"
    )
        port map (
      I0 => \^q\(6),
      I1 => \cnt_out_s[7]_i_3_n_0\,
      I2 => \^q\(7),
      O => plusOp(7)
    );
\cnt_out_s[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \^q\(3),
      I5 => \^q\(5),
      O => \cnt_out_s[7]_i_3_n_0\
    );
\cnt_out_s_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => E(0),
      D => plusOp(0),
      Q => \^q\(0),
      R => cnt_out_s
    );
\cnt_out_s_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => E(0),
      D => plusOp(1),
      Q => \^q\(1),
      R => cnt_out_s
    );
\cnt_out_s_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => E(0),
      D => plusOp(2),
      Q => \^q\(2),
      R => cnt_out_s
    );
\cnt_out_s_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => E(0),
      D => plusOp(3),
      Q => \^q\(3),
      R => cnt_out_s
    );
\cnt_out_s_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => E(0),
      D => plusOp(4),
      Q => \^q\(4),
      R => cnt_out_s
    );
\cnt_out_s_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => E(0),
      D => plusOp(5),
      Q => \^q\(5),
      R => cnt_out_s
    );
\cnt_out_s_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => E(0),
      D => plusOp(6),
      Q => \^q\(6),
      R => cnt_out_s
    );
\cnt_out_s_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => E(0),
      D => plusOp(7),
      Q => \^q\(7),
      R => cnt_out_s
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_frequency_trigger is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    ctrl_saxi_aclk : in STD_LOGIC;
    \div_factor_freqlow_reg[30]\ : in STD_LOGIC_VECTOR ( 30 downto 0 );
    \div_factor_freqlow_reg[4]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \div_factor_freqlow_reg[8]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \div_factor_freqlow_reg[12]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \div_factor_freqlow_reg[16]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \div_factor_freqlow_reg[20]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \div_factor_freqlow_reg[24]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \div_factor_freqlow_reg[28]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \div_factor_freqhigh_reg[30]\ : in STD_LOGIC_VECTOR ( 30 downto 0 );
    \div_factor_freqhigh_reg[4]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \div_factor_freqhigh_reg[8]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \div_factor_freqhigh_reg[12]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \div_factor_freqhigh_reg[16]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \div_factor_freqhigh_reg[20]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \div_factor_freqhigh_reg[24]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \div_factor_freqhigh_reg[28]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \div_factor_freqhigh_reg[31]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    sw0 : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_frequency_trigger;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_frequency_trigger is
  signal \freq_cnt_s[0]_i_2_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[0]_i_3_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[0]_i_4_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[0]_i_5_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[12]_i_2_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[12]_i_3_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[12]_i_4_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[12]_i_5_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[16]_i_2_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[16]_i_3_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[16]_i_4_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[16]_i_5_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[20]_i_2_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[20]_i_3_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[20]_i_4_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[20]_i_5_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[24]_i_2_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[24]_i_3_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[24]_i_4_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[24]_i_5_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[28]_i_2_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[28]_i_3_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[28]_i_4_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[28]_i_5_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[4]_i_2_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[4]_i_3_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[4]_i_4_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[4]_i_5_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[8]_i_2_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[8]_i_3_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[8]_i_4_n_0\ : STD_LOGIC;
  signal \freq_cnt_s[8]_i_5_n_0\ : STD_LOGIC;
  signal freq_cnt_s_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \freq_cnt_s_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \freq_cnt_s_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \freq_cnt_s_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \freq_cnt_s_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \freq_cnt_s_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \freq_cnt_s_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \freq_cnt_s_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \freq_cnt_s_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \freq_cnt_s_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \freq_cnt_s_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \freq_cnt_s_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \freq_cnt_s_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \freq_cnt_s_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \freq_cnt_s_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \freq_cnt_s_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \freq_cnt_s_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \freq_cnt_s_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \freq_cnt_s_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \freq_cnt_s_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \freq_cnt_s_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \freq_cnt_s_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \freq_cnt_s_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \freq_cnt_s_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \freq_cnt_s_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \freq_cnt_s_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \freq_cnt_s_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \freq_cnt_s_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \freq_cnt_s_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \freq_cnt_s_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \freq_cnt_s_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \freq_cnt_s_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \freq_cnt_s_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \freq_cnt_s_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \freq_cnt_s_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \freq_cnt_s_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \freq_cnt_s_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \freq_cnt_s_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \freq_cnt_s_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \freq_cnt_s_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \freq_cnt_s_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \freq_cnt_s_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \freq_cnt_s_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \freq_cnt_s_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \freq_cnt_s_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \freq_cnt_s_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \freq_cnt_s_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \freq_cnt_s_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \freq_cnt_s_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \freq_cnt_s_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \freq_cnt_s_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \freq_cnt_s_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \freq_cnt_s_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \freq_cnt_s_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \freq_cnt_s_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \freq_cnt_s_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \freq_cnt_s_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \freq_cnt_s_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \freq_cnt_s_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \freq_cnt_s_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \freq_cnt_s_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \freq_cnt_s_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \freq_cnt_s_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \freq_cnt_s_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal freq_trig_i_1_n_0 : STD_LOGIC;
  signal geqOp : STD_LOGIC;
  signal \geqOp_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \geqOp_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \geqOp_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \geqOp_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \geqOp_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \geqOp_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \geqOp_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \geqOp_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \geqOp_carry__0_n_0\ : STD_LOGIC;
  signal \geqOp_carry__0_n_1\ : STD_LOGIC;
  signal \geqOp_carry__0_n_2\ : STD_LOGIC;
  signal \geqOp_carry__0_n_3\ : STD_LOGIC;
  signal \geqOp_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \geqOp_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \geqOp_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \geqOp_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \geqOp_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \geqOp_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \geqOp_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \geqOp_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \geqOp_carry__1_n_0\ : STD_LOGIC;
  signal \geqOp_carry__1_n_1\ : STD_LOGIC;
  signal \geqOp_carry__1_n_2\ : STD_LOGIC;
  signal \geqOp_carry__1_n_3\ : STD_LOGIC;
  signal \geqOp_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \geqOp_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \geqOp_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \geqOp_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \geqOp_carry__2_i_5_n_0\ : STD_LOGIC;
  signal \geqOp_carry__2_i_6_n_0\ : STD_LOGIC;
  signal \geqOp_carry__2_i_7_n_0\ : STD_LOGIC;
  signal \geqOp_carry__2_i_8_n_0\ : STD_LOGIC;
  signal \geqOp_carry__2_n_0\ : STD_LOGIC;
  signal \geqOp_carry__2_n_1\ : STD_LOGIC;
  signal \geqOp_carry__2_n_2\ : STD_LOGIC;
  signal \geqOp_carry__2_n_3\ : STD_LOGIC;
  signal \geqOp_carry__3_i_1_n_0\ : STD_LOGIC;
  signal geqOp_carry_i_1_n_0 : STD_LOGIC;
  signal geqOp_carry_i_2_n_0 : STD_LOGIC;
  signal geqOp_carry_i_3_n_0 : STD_LOGIC;
  signal geqOp_carry_i_4_n_0 : STD_LOGIC;
  signal geqOp_carry_i_5_n_0 : STD_LOGIC;
  signal geqOp_carry_i_6_n_0 : STD_LOGIC;
  signal geqOp_carry_i_7_n_0 : STD_LOGIC;
  signal geqOp_carry_i_8_n_0 : STD_LOGIC;
  signal geqOp_carry_n_0 : STD_LOGIC;
  signal geqOp_carry_n_1 : STD_LOGIC;
  signal geqOp_carry_n_2 : STD_LOGIC;
  signal geqOp_carry_n_3 : STD_LOGIC;
  signal \geqOp_inferred__0/i__carry__0_n_0\ : STD_LOGIC;
  signal \geqOp_inferred__0/i__carry__0_n_1\ : STD_LOGIC;
  signal \geqOp_inferred__0/i__carry__0_n_2\ : STD_LOGIC;
  signal \geqOp_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \geqOp_inferred__0/i__carry__1_n_0\ : STD_LOGIC;
  signal \geqOp_inferred__0/i__carry__1_n_1\ : STD_LOGIC;
  signal \geqOp_inferred__0/i__carry__1_n_2\ : STD_LOGIC;
  signal \geqOp_inferred__0/i__carry__1_n_3\ : STD_LOGIC;
  signal \geqOp_inferred__0/i__carry__2_n_0\ : STD_LOGIC;
  signal \geqOp_inferred__0/i__carry__2_n_1\ : STD_LOGIC;
  signal \geqOp_inferred__0/i__carry__2_n_2\ : STD_LOGIC;
  signal \geqOp_inferred__0/i__carry__2_n_3\ : STD_LOGIC;
  signal \geqOp_inferred__0/i__carry__3_n_3\ : STD_LOGIC;
  signal \geqOp_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \geqOp_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \geqOp_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \geqOp_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \i__carry__0_i_1__0_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_2__0_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_3__0_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_4__0_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_5_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_6_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_7_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_8_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_1__0_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_2__0_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_3__0_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_4__0_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_5_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_6_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_7_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_8_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_1__0_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_2__0_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_3__0_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_4__0_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_5_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_6_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_7_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_8_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_1__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_1__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_2__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_3__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_4__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_5_n_0\ : STD_LOGIC;
  signal \i__carry_i_6_n_0\ : STD_LOGIC;
  signal \i__carry_i_7_n_0\ : STD_LOGIC;
  signal \i__carry_i_8_n_0\ : STD_LOGIC;
  signal minusOp : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal \minusOp_carry__0_n_0\ : STD_LOGIC;
  signal \minusOp_carry__0_n_1\ : STD_LOGIC;
  signal \minusOp_carry__0_n_2\ : STD_LOGIC;
  signal \minusOp_carry__0_n_3\ : STD_LOGIC;
  signal \minusOp_carry__1_n_0\ : STD_LOGIC;
  signal \minusOp_carry__1_n_1\ : STD_LOGIC;
  signal \minusOp_carry__1_n_2\ : STD_LOGIC;
  signal \minusOp_carry__1_n_3\ : STD_LOGIC;
  signal \minusOp_carry__2_n_0\ : STD_LOGIC;
  signal \minusOp_carry__2_n_1\ : STD_LOGIC;
  signal \minusOp_carry__2_n_2\ : STD_LOGIC;
  signal \minusOp_carry__2_n_3\ : STD_LOGIC;
  signal \minusOp_carry__3_n_0\ : STD_LOGIC;
  signal \minusOp_carry__3_n_1\ : STD_LOGIC;
  signal \minusOp_carry__3_n_2\ : STD_LOGIC;
  signal \minusOp_carry__3_n_3\ : STD_LOGIC;
  signal \minusOp_carry__4_n_0\ : STD_LOGIC;
  signal \minusOp_carry__4_n_1\ : STD_LOGIC;
  signal \minusOp_carry__4_n_2\ : STD_LOGIC;
  signal \minusOp_carry__4_n_3\ : STD_LOGIC;
  signal \minusOp_carry__5_n_0\ : STD_LOGIC;
  signal \minusOp_carry__5_n_1\ : STD_LOGIC;
  signal \minusOp_carry__5_n_2\ : STD_LOGIC;
  signal \minusOp_carry__5_n_3\ : STD_LOGIC;
  signal \minusOp_carry__6_n_2\ : STD_LOGIC;
  signal \minusOp_carry__6_n_3\ : STD_LOGIC;
  signal minusOp_carry_n_0 : STD_LOGIC;
  signal minusOp_carry_n_1 : STD_LOGIC;
  signal minusOp_carry_n_2 : STD_LOGIC;
  signal minusOp_carry_n_3 : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__0_n_0\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__0_n_1\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__0_n_2\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__0_n_4\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__0_n_5\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__0_n_6\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__0_n_7\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__1_n_0\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__1_n_1\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__1_n_2\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__1_n_3\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__1_n_4\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__1_n_5\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__1_n_6\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__1_n_7\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__2_n_0\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__2_n_1\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__2_n_2\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__2_n_3\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__2_n_4\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__2_n_5\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__2_n_6\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__2_n_7\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__3_n_0\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__3_n_1\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__3_n_2\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__3_n_3\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__3_n_4\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__3_n_5\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__3_n_6\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__3_n_7\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__4_n_0\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__4_n_1\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__4_n_2\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__4_n_3\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__4_n_4\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__4_n_5\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__4_n_6\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__4_n_7\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__5_n_0\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__5_n_1\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__5_n_2\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__5_n_3\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__5_n_4\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__5_n_5\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__5_n_6\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__5_n_7\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__6_n_2\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__6_n_3\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__6_n_5\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__6_n_6\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__6_n_7\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry_n_4\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry_n_5\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry_n_6\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry_n_7\ : STD_LOGIC;
  signal \NLW_freq_cnt_s_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_geqOp_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_geqOp_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_geqOp_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_geqOp_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_geqOp_carry__3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_geqOp_carry__3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_geqOp_inferred__0/i__carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_geqOp_inferred__0/i__carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_geqOp_inferred__0/i__carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_geqOp_inferred__0/i__carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_geqOp_inferred__0/i__carry__3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_geqOp_inferred__0/i__carry__3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_minusOp_carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_minusOp_carry__6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_minusOp_inferred__0/i__carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_minusOp_inferred__0/i__carry__6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
begin
\freq_cnt_s[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(3),
      O => \freq_cnt_s[0]_i_2_n_0\
    );
\freq_cnt_s[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(2),
      O => \freq_cnt_s[0]_i_3_n_0\
    );
\freq_cnt_s[0]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(1),
      O => \freq_cnt_s[0]_i_4_n_0\
    );
\freq_cnt_s[0]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => freq_cnt_s_reg(0),
      O => \freq_cnt_s[0]_i_5_n_0\
    );
\freq_cnt_s[12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(15),
      O => \freq_cnt_s[12]_i_2_n_0\
    );
\freq_cnt_s[12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(14),
      O => \freq_cnt_s[12]_i_3_n_0\
    );
\freq_cnt_s[12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(13),
      O => \freq_cnt_s[12]_i_4_n_0\
    );
\freq_cnt_s[12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(12),
      O => \freq_cnt_s[12]_i_5_n_0\
    );
\freq_cnt_s[16]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(19),
      O => \freq_cnt_s[16]_i_2_n_0\
    );
\freq_cnt_s[16]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(18),
      O => \freq_cnt_s[16]_i_3_n_0\
    );
\freq_cnt_s[16]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(17),
      O => \freq_cnt_s[16]_i_4_n_0\
    );
\freq_cnt_s[16]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(16),
      O => \freq_cnt_s[16]_i_5_n_0\
    );
\freq_cnt_s[20]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(23),
      O => \freq_cnt_s[20]_i_2_n_0\
    );
\freq_cnt_s[20]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(22),
      O => \freq_cnt_s[20]_i_3_n_0\
    );
\freq_cnt_s[20]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(21),
      O => \freq_cnt_s[20]_i_4_n_0\
    );
\freq_cnt_s[20]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(20),
      O => \freq_cnt_s[20]_i_5_n_0\
    );
\freq_cnt_s[24]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(27),
      O => \freq_cnt_s[24]_i_2_n_0\
    );
\freq_cnt_s[24]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(26),
      O => \freq_cnt_s[24]_i_3_n_0\
    );
\freq_cnt_s[24]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(25),
      O => \freq_cnt_s[24]_i_4_n_0\
    );
\freq_cnt_s[24]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(24),
      O => \freq_cnt_s[24]_i_5_n_0\
    );
\freq_cnt_s[28]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(31),
      O => \freq_cnt_s[28]_i_2_n_0\
    );
\freq_cnt_s[28]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(30),
      O => \freq_cnt_s[28]_i_3_n_0\
    );
\freq_cnt_s[28]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(29),
      O => \freq_cnt_s[28]_i_4_n_0\
    );
\freq_cnt_s[28]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(28),
      O => \freq_cnt_s[28]_i_5_n_0\
    );
\freq_cnt_s[4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(7),
      O => \freq_cnt_s[4]_i_2_n_0\
    );
\freq_cnt_s[4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(6),
      O => \freq_cnt_s[4]_i_3_n_0\
    );
\freq_cnt_s[4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(5),
      O => \freq_cnt_s[4]_i_4_n_0\
    );
\freq_cnt_s[4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(4),
      O => \freq_cnt_s[4]_i_5_n_0\
    );
\freq_cnt_s[8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(11),
      O => \freq_cnt_s[8]_i_2_n_0\
    );
\freq_cnt_s[8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(10),
      O => \freq_cnt_s[8]_i_3_n_0\
    );
\freq_cnt_s[8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(9),
      O => \freq_cnt_s[8]_i_4_n_0\
    );
\freq_cnt_s[8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => freq_cnt_s_reg(8),
      O => \freq_cnt_s[8]_i_5_n_0\
    );
\freq_cnt_s_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[0]_i_1_n_7\,
      Q => freq_cnt_s_reg(0),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \freq_cnt_s_reg[0]_i_1_n_0\,
      CO(2) => \freq_cnt_s_reg[0]_i_1_n_1\,
      CO(1) => \freq_cnt_s_reg[0]_i_1_n_2\,
      CO(0) => \freq_cnt_s_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \freq_cnt_s_reg[0]_i_1_n_4\,
      O(2) => \freq_cnt_s_reg[0]_i_1_n_5\,
      O(1) => \freq_cnt_s_reg[0]_i_1_n_6\,
      O(0) => \freq_cnt_s_reg[0]_i_1_n_7\,
      S(3) => \freq_cnt_s[0]_i_2_n_0\,
      S(2) => \freq_cnt_s[0]_i_3_n_0\,
      S(1) => \freq_cnt_s[0]_i_4_n_0\,
      S(0) => \freq_cnt_s[0]_i_5_n_0\
    );
\freq_cnt_s_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[8]_i_1_n_5\,
      Q => freq_cnt_s_reg(10),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[8]_i_1_n_4\,
      Q => freq_cnt_s_reg(11),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[12]_i_1_n_7\,
      Q => freq_cnt_s_reg(12),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \freq_cnt_s_reg[8]_i_1_n_0\,
      CO(3) => \freq_cnt_s_reg[12]_i_1_n_0\,
      CO(2) => \freq_cnt_s_reg[12]_i_1_n_1\,
      CO(1) => \freq_cnt_s_reg[12]_i_1_n_2\,
      CO(0) => \freq_cnt_s_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \freq_cnt_s_reg[12]_i_1_n_4\,
      O(2) => \freq_cnt_s_reg[12]_i_1_n_5\,
      O(1) => \freq_cnt_s_reg[12]_i_1_n_6\,
      O(0) => \freq_cnt_s_reg[12]_i_1_n_7\,
      S(3) => \freq_cnt_s[12]_i_2_n_0\,
      S(2) => \freq_cnt_s[12]_i_3_n_0\,
      S(1) => \freq_cnt_s[12]_i_4_n_0\,
      S(0) => \freq_cnt_s[12]_i_5_n_0\
    );
\freq_cnt_s_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[12]_i_1_n_6\,
      Q => freq_cnt_s_reg(13),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[12]_i_1_n_5\,
      Q => freq_cnt_s_reg(14),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[12]_i_1_n_4\,
      Q => freq_cnt_s_reg(15),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[16]_i_1_n_7\,
      Q => freq_cnt_s_reg(16),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \freq_cnt_s_reg[12]_i_1_n_0\,
      CO(3) => \freq_cnt_s_reg[16]_i_1_n_0\,
      CO(2) => \freq_cnt_s_reg[16]_i_1_n_1\,
      CO(1) => \freq_cnt_s_reg[16]_i_1_n_2\,
      CO(0) => \freq_cnt_s_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \freq_cnt_s_reg[16]_i_1_n_4\,
      O(2) => \freq_cnt_s_reg[16]_i_1_n_5\,
      O(1) => \freq_cnt_s_reg[16]_i_1_n_6\,
      O(0) => \freq_cnt_s_reg[16]_i_1_n_7\,
      S(3) => \freq_cnt_s[16]_i_2_n_0\,
      S(2) => \freq_cnt_s[16]_i_3_n_0\,
      S(1) => \freq_cnt_s[16]_i_4_n_0\,
      S(0) => \freq_cnt_s[16]_i_5_n_0\
    );
\freq_cnt_s_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[16]_i_1_n_6\,
      Q => freq_cnt_s_reg(17),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[16]_i_1_n_5\,
      Q => freq_cnt_s_reg(18),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[16]_i_1_n_4\,
      Q => freq_cnt_s_reg(19),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[0]_i_1_n_6\,
      Q => freq_cnt_s_reg(1),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[20]_i_1_n_7\,
      Q => freq_cnt_s_reg(20),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \freq_cnt_s_reg[16]_i_1_n_0\,
      CO(3) => \freq_cnt_s_reg[20]_i_1_n_0\,
      CO(2) => \freq_cnt_s_reg[20]_i_1_n_1\,
      CO(1) => \freq_cnt_s_reg[20]_i_1_n_2\,
      CO(0) => \freq_cnt_s_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \freq_cnt_s_reg[20]_i_1_n_4\,
      O(2) => \freq_cnt_s_reg[20]_i_1_n_5\,
      O(1) => \freq_cnt_s_reg[20]_i_1_n_6\,
      O(0) => \freq_cnt_s_reg[20]_i_1_n_7\,
      S(3) => \freq_cnt_s[20]_i_2_n_0\,
      S(2) => \freq_cnt_s[20]_i_3_n_0\,
      S(1) => \freq_cnt_s[20]_i_4_n_0\,
      S(0) => \freq_cnt_s[20]_i_5_n_0\
    );
\freq_cnt_s_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[20]_i_1_n_6\,
      Q => freq_cnt_s_reg(21),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[20]_i_1_n_5\,
      Q => freq_cnt_s_reg(22),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[20]_i_1_n_4\,
      Q => freq_cnt_s_reg(23),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[24]_i_1_n_7\,
      Q => freq_cnt_s_reg(24),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \freq_cnt_s_reg[20]_i_1_n_0\,
      CO(3) => \freq_cnt_s_reg[24]_i_1_n_0\,
      CO(2) => \freq_cnt_s_reg[24]_i_1_n_1\,
      CO(1) => \freq_cnt_s_reg[24]_i_1_n_2\,
      CO(0) => \freq_cnt_s_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \freq_cnt_s_reg[24]_i_1_n_4\,
      O(2) => \freq_cnt_s_reg[24]_i_1_n_5\,
      O(1) => \freq_cnt_s_reg[24]_i_1_n_6\,
      O(0) => \freq_cnt_s_reg[24]_i_1_n_7\,
      S(3) => \freq_cnt_s[24]_i_2_n_0\,
      S(2) => \freq_cnt_s[24]_i_3_n_0\,
      S(1) => \freq_cnt_s[24]_i_4_n_0\,
      S(0) => \freq_cnt_s[24]_i_5_n_0\
    );
\freq_cnt_s_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[24]_i_1_n_6\,
      Q => freq_cnt_s_reg(25),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[24]_i_1_n_5\,
      Q => freq_cnt_s_reg(26),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[24]_i_1_n_4\,
      Q => freq_cnt_s_reg(27),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[28]_i_1_n_7\,
      Q => freq_cnt_s_reg(28),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \freq_cnt_s_reg[24]_i_1_n_0\,
      CO(3) => \NLW_freq_cnt_s_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \freq_cnt_s_reg[28]_i_1_n_1\,
      CO(1) => \freq_cnt_s_reg[28]_i_1_n_2\,
      CO(0) => \freq_cnt_s_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \freq_cnt_s_reg[28]_i_1_n_4\,
      O(2) => \freq_cnt_s_reg[28]_i_1_n_5\,
      O(1) => \freq_cnt_s_reg[28]_i_1_n_6\,
      O(0) => \freq_cnt_s_reg[28]_i_1_n_7\,
      S(3) => \freq_cnt_s[28]_i_2_n_0\,
      S(2) => \freq_cnt_s[28]_i_3_n_0\,
      S(1) => \freq_cnt_s[28]_i_4_n_0\,
      S(0) => \freq_cnt_s[28]_i_5_n_0\
    );
\freq_cnt_s_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[28]_i_1_n_6\,
      Q => freq_cnt_s_reg(29),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[0]_i_1_n_5\,
      Q => freq_cnt_s_reg(2),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[28]_i_1_n_5\,
      Q => freq_cnt_s_reg(30),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[28]_i_1_n_4\,
      Q => freq_cnt_s_reg(31),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[0]_i_1_n_4\,
      Q => freq_cnt_s_reg(3),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[4]_i_1_n_7\,
      Q => freq_cnt_s_reg(4),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \freq_cnt_s_reg[0]_i_1_n_0\,
      CO(3) => \freq_cnt_s_reg[4]_i_1_n_0\,
      CO(2) => \freq_cnt_s_reg[4]_i_1_n_1\,
      CO(1) => \freq_cnt_s_reg[4]_i_1_n_2\,
      CO(0) => \freq_cnt_s_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \freq_cnt_s_reg[4]_i_1_n_4\,
      O(2) => \freq_cnt_s_reg[4]_i_1_n_5\,
      O(1) => \freq_cnt_s_reg[4]_i_1_n_6\,
      O(0) => \freq_cnt_s_reg[4]_i_1_n_7\,
      S(3) => \freq_cnt_s[4]_i_2_n_0\,
      S(2) => \freq_cnt_s[4]_i_3_n_0\,
      S(1) => \freq_cnt_s[4]_i_4_n_0\,
      S(0) => \freq_cnt_s[4]_i_5_n_0\
    );
\freq_cnt_s_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[4]_i_1_n_6\,
      Q => freq_cnt_s_reg(5),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[4]_i_1_n_5\,
      Q => freq_cnt_s_reg(6),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[4]_i_1_n_4\,
      Q => freq_cnt_s_reg(7),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[8]_i_1_n_7\,
      Q => freq_cnt_s_reg(8),
      R => freq_trig_i_1_n_0
    );
\freq_cnt_s_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \freq_cnt_s_reg[4]_i_1_n_0\,
      CO(3) => \freq_cnt_s_reg[8]_i_1_n_0\,
      CO(2) => \freq_cnt_s_reg[8]_i_1_n_1\,
      CO(1) => \freq_cnt_s_reg[8]_i_1_n_2\,
      CO(0) => \freq_cnt_s_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \freq_cnt_s_reg[8]_i_1_n_4\,
      O(2) => \freq_cnt_s_reg[8]_i_1_n_5\,
      O(1) => \freq_cnt_s_reg[8]_i_1_n_6\,
      O(0) => \freq_cnt_s_reg[8]_i_1_n_7\,
      S(3) => \freq_cnt_s[8]_i_2_n_0\,
      S(2) => \freq_cnt_s[8]_i_3_n_0\,
      S(1) => \freq_cnt_s[8]_i_4_n_0\,
      S(0) => \freq_cnt_s[8]_i_5_n_0\
    );
\freq_cnt_s_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => \freq_cnt_s_reg[8]_i_1_n_6\,
      Q => freq_cnt_s_reg(9),
      R => freq_trig_i_1_n_0
    );
freq_trig_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \geqOp_inferred__0/i__carry__3_n_3\,
      I1 => sw0,
      I2 => geqOp,
      O => freq_trig_i_1_n_0
    );
freq_trig_reg: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => freq_trig_i_1_n_0,
      Q => E(0),
      R => '0'
    );
geqOp_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => geqOp_carry_n_0,
      CO(2) => geqOp_carry_n_1,
      CO(1) => geqOp_carry_n_2,
      CO(0) => geqOp_carry_n_3,
      CYINIT => '1',
      DI(3) => geqOp_carry_i_1_n_0,
      DI(2) => geqOp_carry_i_2_n_0,
      DI(1) => geqOp_carry_i_3_n_0,
      DI(0) => geqOp_carry_i_4_n_0,
      O(3 downto 0) => NLW_geqOp_carry_O_UNCONNECTED(3 downto 0),
      S(3) => geqOp_carry_i_5_n_0,
      S(2) => geqOp_carry_i_6_n_0,
      S(1) => geqOp_carry_i_7_n_0,
      S(0) => geqOp_carry_i_8_n_0
    );
\geqOp_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => geqOp_carry_n_0,
      CO(3) => \geqOp_carry__0_n_0\,
      CO(2) => \geqOp_carry__0_n_1\,
      CO(1) => \geqOp_carry__0_n_2\,
      CO(0) => \geqOp_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \geqOp_carry__0_i_1_n_0\,
      DI(2) => \geqOp_carry__0_i_2_n_0\,
      DI(1) => \geqOp_carry__0_i_3_n_0\,
      DI(0) => \geqOp_carry__0_i_4_n_0\,
      O(3 downto 0) => \NLW_geqOp_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \geqOp_carry__0_i_5_n_0\,
      S(2) => \geqOp_carry__0_i_6_n_0\,
      S(1) => \geqOp_carry__0_i_7_n_0\,
      S(0) => \geqOp_carry__0_i_8_n_0\
    );
\geqOp_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(15),
      I1 => minusOp(15),
      I2 => freq_cnt_s_reg(14),
      I3 => minusOp(14),
      O => \geqOp_carry__0_i_1_n_0\
    );
\geqOp_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(13),
      I1 => minusOp(13),
      I2 => freq_cnt_s_reg(12),
      I3 => minusOp(12),
      O => \geqOp_carry__0_i_2_n_0\
    );
\geqOp_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(11),
      I1 => minusOp(11),
      I2 => freq_cnt_s_reg(10),
      I3 => minusOp(10),
      O => \geqOp_carry__0_i_3_n_0\
    );
\geqOp_carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(9),
      I1 => minusOp(9),
      I2 => freq_cnt_s_reg(8),
      I3 => minusOp(8),
      O => \geqOp_carry__0_i_4_n_0\
    );
\geqOp_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => minusOp(15),
      I1 => freq_cnt_s_reg(15),
      I2 => minusOp(14),
      I3 => freq_cnt_s_reg(14),
      O => \geqOp_carry__0_i_5_n_0\
    );
\geqOp_carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => minusOp(13),
      I1 => freq_cnt_s_reg(13),
      I2 => minusOp(12),
      I3 => freq_cnt_s_reg(12),
      O => \geqOp_carry__0_i_6_n_0\
    );
\geqOp_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => minusOp(11),
      I1 => freq_cnt_s_reg(11),
      I2 => minusOp(10),
      I3 => freq_cnt_s_reg(10),
      O => \geqOp_carry__0_i_7_n_0\
    );
\geqOp_carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => minusOp(9),
      I1 => freq_cnt_s_reg(9),
      I2 => minusOp(8),
      I3 => freq_cnt_s_reg(8),
      O => \geqOp_carry__0_i_8_n_0\
    );
\geqOp_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \geqOp_carry__0_n_0\,
      CO(3) => \geqOp_carry__1_n_0\,
      CO(2) => \geqOp_carry__1_n_1\,
      CO(1) => \geqOp_carry__1_n_2\,
      CO(0) => \geqOp_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \geqOp_carry__1_i_1_n_0\,
      DI(2) => \geqOp_carry__1_i_2_n_0\,
      DI(1) => \geqOp_carry__1_i_3_n_0\,
      DI(0) => \geqOp_carry__1_i_4_n_0\,
      O(3 downto 0) => \NLW_geqOp_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \geqOp_carry__1_i_5_n_0\,
      S(2) => \geqOp_carry__1_i_6_n_0\,
      S(1) => \geqOp_carry__1_i_7_n_0\,
      S(0) => \geqOp_carry__1_i_8_n_0\
    );
\geqOp_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(23),
      I1 => minusOp(23),
      I2 => freq_cnt_s_reg(22),
      I3 => minusOp(22),
      O => \geqOp_carry__1_i_1_n_0\
    );
\geqOp_carry__1_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(21),
      I1 => minusOp(21),
      I2 => freq_cnt_s_reg(20),
      I3 => minusOp(20),
      O => \geqOp_carry__1_i_2_n_0\
    );
\geqOp_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(19),
      I1 => minusOp(19),
      I2 => freq_cnt_s_reg(18),
      I3 => minusOp(18),
      O => \geqOp_carry__1_i_3_n_0\
    );
\geqOp_carry__1_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(17),
      I1 => minusOp(17),
      I2 => freq_cnt_s_reg(16),
      I3 => minusOp(16),
      O => \geqOp_carry__1_i_4_n_0\
    );
\geqOp_carry__1_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => minusOp(23),
      I1 => freq_cnt_s_reg(23),
      I2 => minusOp(22),
      I3 => freq_cnt_s_reg(22),
      O => \geqOp_carry__1_i_5_n_0\
    );
\geqOp_carry__1_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => minusOp(21),
      I1 => freq_cnt_s_reg(21),
      I2 => minusOp(20),
      I3 => freq_cnt_s_reg(20),
      O => \geqOp_carry__1_i_6_n_0\
    );
\geqOp_carry__1_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => minusOp(19),
      I1 => freq_cnt_s_reg(19),
      I2 => minusOp(18),
      I3 => freq_cnt_s_reg(18),
      O => \geqOp_carry__1_i_7_n_0\
    );
\geqOp_carry__1_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => minusOp(17),
      I1 => freq_cnt_s_reg(17),
      I2 => minusOp(16),
      I3 => freq_cnt_s_reg(16),
      O => \geqOp_carry__1_i_8_n_0\
    );
\geqOp_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \geqOp_carry__1_n_0\,
      CO(3) => \geqOp_carry__2_n_0\,
      CO(2) => \geqOp_carry__2_n_1\,
      CO(1) => \geqOp_carry__2_n_2\,
      CO(0) => \geqOp_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \geqOp_carry__2_i_1_n_0\,
      DI(2) => \geqOp_carry__2_i_2_n_0\,
      DI(1) => \geqOp_carry__2_i_3_n_0\,
      DI(0) => \geqOp_carry__2_i_4_n_0\,
      O(3 downto 0) => \NLW_geqOp_carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \geqOp_carry__2_i_5_n_0\,
      S(2) => \geqOp_carry__2_i_6_n_0\,
      S(1) => \geqOp_carry__2_i_7_n_0\,
      S(0) => \geqOp_carry__2_i_8_n_0\
    );
\geqOp_carry__2_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(31),
      I1 => minusOp(31),
      I2 => freq_cnt_s_reg(30),
      I3 => minusOp(30),
      O => \geqOp_carry__2_i_1_n_0\
    );
\geqOp_carry__2_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(29),
      I1 => minusOp(29),
      I2 => freq_cnt_s_reg(28),
      I3 => minusOp(28),
      O => \geqOp_carry__2_i_2_n_0\
    );
\geqOp_carry__2_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(27),
      I1 => minusOp(27),
      I2 => freq_cnt_s_reg(26),
      I3 => minusOp(26),
      O => \geqOp_carry__2_i_3_n_0\
    );
\geqOp_carry__2_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(25),
      I1 => minusOp(25),
      I2 => freq_cnt_s_reg(24),
      I3 => minusOp(24),
      O => \geqOp_carry__2_i_4_n_0\
    );
\geqOp_carry__2_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => minusOp(31),
      I1 => freq_cnt_s_reg(31),
      I2 => minusOp(30),
      I3 => freq_cnt_s_reg(30),
      O => \geqOp_carry__2_i_5_n_0\
    );
\geqOp_carry__2_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => minusOp(29),
      I1 => freq_cnt_s_reg(29),
      I2 => minusOp(28),
      I3 => freq_cnt_s_reg(28),
      O => \geqOp_carry__2_i_6_n_0\
    );
\geqOp_carry__2_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => minusOp(27),
      I1 => freq_cnt_s_reg(27),
      I2 => minusOp(26),
      I3 => freq_cnt_s_reg(26),
      O => \geqOp_carry__2_i_7_n_0\
    );
\geqOp_carry__2_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => minusOp(25),
      I1 => freq_cnt_s_reg(25),
      I2 => minusOp(24),
      I3 => freq_cnt_s_reg(24),
      O => \geqOp_carry__2_i_8_n_0\
    );
\geqOp_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \geqOp_carry__2_n_0\,
      CO(3 downto 1) => \NLW_geqOp_carry__3_CO_UNCONNECTED\(3 downto 1),
      CO(0) => geqOp,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_geqOp_carry__3_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => B"000",
      S(0) => \geqOp_carry__3_i_1_n_0\
    );
\geqOp_carry__3_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => freq_cnt_s_reg(31),
      O => \geqOp_carry__3_i_1_n_0\
    );
geqOp_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(7),
      I1 => minusOp(7),
      I2 => freq_cnt_s_reg(6),
      I3 => minusOp(6),
      O => geqOp_carry_i_1_n_0
    );
geqOp_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(5),
      I1 => minusOp(5),
      I2 => freq_cnt_s_reg(4),
      I3 => minusOp(4),
      O => geqOp_carry_i_2_n_0
    );
geqOp_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(3),
      I1 => minusOp(3),
      I2 => freq_cnt_s_reg(2),
      I3 => minusOp(2),
      O => geqOp_carry_i_3_n_0
    );
geqOp_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B222"
    )
        port map (
      I0 => freq_cnt_s_reg(1),
      I1 => minusOp(1),
      I2 => \div_factor_freqlow_reg[30]\(0),
      I3 => freq_cnt_s_reg(0),
      O => geqOp_carry_i_4_n_0
    );
geqOp_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => minusOp(7),
      I1 => freq_cnt_s_reg(7),
      I2 => minusOp(6),
      I3 => freq_cnt_s_reg(6),
      O => geqOp_carry_i_5_n_0
    );
geqOp_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => minusOp(5),
      I1 => freq_cnt_s_reg(5),
      I2 => minusOp(4),
      I3 => freq_cnt_s_reg(4),
      O => geqOp_carry_i_6_n_0
    );
geqOp_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => minusOp(3),
      I1 => freq_cnt_s_reg(3),
      I2 => minusOp(2),
      I3 => freq_cnt_s_reg(2),
      O => geqOp_carry_i_7_n_0
    );
geqOp_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0990"
    )
        port map (
      I0 => minusOp(1),
      I1 => freq_cnt_s_reg(1),
      I2 => \div_factor_freqlow_reg[30]\(0),
      I3 => freq_cnt_s_reg(0),
      O => geqOp_carry_i_8_n_0
    );
\geqOp_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \geqOp_inferred__0/i__carry_n_0\,
      CO(2) => \geqOp_inferred__0/i__carry_n_1\,
      CO(1) => \geqOp_inferred__0/i__carry_n_2\,
      CO(0) => \geqOp_inferred__0/i__carry_n_3\,
      CYINIT => '1',
      DI(3) => \i__carry_i_1__0_n_0\,
      DI(2) => \i__carry_i_2__0_n_0\,
      DI(1) => \i__carry_i_3__0_n_0\,
      DI(0) => \i__carry_i_4__0_n_0\,
      O(3 downto 0) => \NLW_geqOp_inferred__0/i__carry_O_UNCONNECTED\(3 downto 0),
      S(3) => \i__carry_i_5_n_0\,
      S(2) => \i__carry_i_6_n_0\,
      S(1) => \i__carry_i_7_n_0\,
      S(0) => \i__carry_i_8_n_0\
    );
\geqOp_inferred__0/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \geqOp_inferred__0/i__carry_n_0\,
      CO(3) => \geqOp_inferred__0/i__carry__0_n_0\,
      CO(2) => \geqOp_inferred__0/i__carry__0_n_1\,
      CO(1) => \geqOp_inferred__0/i__carry__0_n_2\,
      CO(0) => \geqOp_inferred__0/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \i__carry__0_i_1__0_n_0\,
      DI(2) => \i__carry__0_i_2__0_n_0\,
      DI(1) => \i__carry__0_i_3__0_n_0\,
      DI(0) => \i__carry__0_i_4__0_n_0\,
      O(3 downto 0) => \NLW_geqOp_inferred__0/i__carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \i__carry__0_i_5_n_0\,
      S(2) => \i__carry__0_i_6_n_0\,
      S(1) => \i__carry__0_i_7_n_0\,
      S(0) => \i__carry__0_i_8_n_0\
    );
\geqOp_inferred__0/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \geqOp_inferred__0/i__carry__0_n_0\,
      CO(3) => \geqOp_inferred__0/i__carry__1_n_0\,
      CO(2) => \geqOp_inferred__0/i__carry__1_n_1\,
      CO(1) => \geqOp_inferred__0/i__carry__1_n_2\,
      CO(0) => \geqOp_inferred__0/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \i__carry__1_i_1__0_n_0\,
      DI(2) => \i__carry__1_i_2__0_n_0\,
      DI(1) => \i__carry__1_i_3__0_n_0\,
      DI(0) => \i__carry__1_i_4__0_n_0\,
      O(3 downto 0) => \NLW_geqOp_inferred__0/i__carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \i__carry__1_i_5_n_0\,
      S(2) => \i__carry__1_i_6_n_0\,
      S(1) => \i__carry__1_i_7_n_0\,
      S(0) => \i__carry__1_i_8_n_0\
    );
\geqOp_inferred__0/i__carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \geqOp_inferred__0/i__carry__1_n_0\,
      CO(3) => \geqOp_inferred__0/i__carry__2_n_0\,
      CO(2) => \geqOp_inferred__0/i__carry__2_n_1\,
      CO(1) => \geqOp_inferred__0/i__carry__2_n_2\,
      CO(0) => \geqOp_inferred__0/i__carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \i__carry__2_i_1__0_n_0\,
      DI(2) => \i__carry__2_i_2__0_n_0\,
      DI(1) => \i__carry__2_i_3__0_n_0\,
      DI(0) => \i__carry__2_i_4__0_n_0\,
      O(3 downto 0) => \NLW_geqOp_inferred__0/i__carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \i__carry__2_i_5_n_0\,
      S(2) => \i__carry__2_i_6_n_0\,
      S(1) => \i__carry__2_i_7_n_0\,
      S(0) => \i__carry__2_i_8_n_0\
    );
\geqOp_inferred__0/i__carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \geqOp_inferred__0/i__carry__2_n_0\,
      CO(3 downto 1) => \NLW_geqOp_inferred__0/i__carry__3_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \geqOp_inferred__0/i__carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_geqOp_inferred__0/i__carry__3_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => B"000",
      S(0) => \i__carry__3_i_1__0_n_0\
    );
\i__carry__0_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(15),
      I1 => \minusOp_inferred__0/i__carry__2_n_5\,
      I2 => freq_cnt_s_reg(14),
      I3 => \minusOp_inferred__0/i__carry__2_n_6\,
      O => \i__carry__0_i_1__0_n_0\
    );
\i__carry__0_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(13),
      I1 => \minusOp_inferred__0/i__carry__2_n_7\,
      I2 => freq_cnt_s_reg(12),
      I3 => \minusOp_inferred__0/i__carry__1_n_4\,
      O => \i__carry__0_i_2__0_n_0\
    );
\i__carry__0_i_3__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(11),
      I1 => \minusOp_inferred__0/i__carry__1_n_5\,
      I2 => freq_cnt_s_reg(10),
      I3 => \minusOp_inferred__0/i__carry__1_n_6\,
      O => \i__carry__0_i_3__0_n_0\
    );
\i__carry__0_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(9),
      I1 => \minusOp_inferred__0/i__carry__1_n_7\,
      I2 => freq_cnt_s_reg(8),
      I3 => \minusOp_inferred__0/i__carry__0_n_4\,
      O => \i__carry__0_i_4__0_n_0\
    );
\i__carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__2_n_5\,
      I1 => freq_cnt_s_reg(15),
      I2 => \minusOp_inferred__0/i__carry__2_n_6\,
      I3 => freq_cnt_s_reg(14),
      O => \i__carry__0_i_5_n_0\
    );
\i__carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__2_n_7\,
      I1 => freq_cnt_s_reg(13),
      I2 => \minusOp_inferred__0/i__carry__1_n_4\,
      I3 => freq_cnt_s_reg(12),
      O => \i__carry__0_i_6_n_0\
    );
\i__carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__1_n_5\,
      I1 => freq_cnt_s_reg(11),
      I2 => \minusOp_inferred__0/i__carry__1_n_6\,
      I3 => freq_cnt_s_reg(10),
      O => \i__carry__0_i_7_n_0\
    );
\i__carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__1_n_7\,
      I1 => freq_cnt_s_reg(9),
      I2 => \minusOp_inferred__0/i__carry__0_n_4\,
      I3 => freq_cnt_s_reg(8),
      O => \i__carry__0_i_8_n_0\
    );
\i__carry__1_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(23),
      I1 => \minusOp_inferred__0/i__carry__4_n_5\,
      I2 => freq_cnt_s_reg(22),
      I3 => \minusOp_inferred__0/i__carry__4_n_6\,
      O => \i__carry__1_i_1__0_n_0\
    );
\i__carry__1_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(21),
      I1 => \minusOp_inferred__0/i__carry__4_n_7\,
      I2 => freq_cnt_s_reg(20),
      I3 => \minusOp_inferred__0/i__carry__3_n_4\,
      O => \i__carry__1_i_2__0_n_0\
    );
\i__carry__1_i_3__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(19),
      I1 => \minusOp_inferred__0/i__carry__3_n_5\,
      I2 => freq_cnt_s_reg(18),
      I3 => \minusOp_inferred__0/i__carry__3_n_6\,
      O => \i__carry__1_i_3__0_n_0\
    );
\i__carry__1_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(17),
      I1 => \minusOp_inferred__0/i__carry__3_n_7\,
      I2 => freq_cnt_s_reg(16),
      I3 => \minusOp_inferred__0/i__carry__2_n_4\,
      O => \i__carry__1_i_4__0_n_0\
    );
\i__carry__1_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__4_n_5\,
      I1 => freq_cnt_s_reg(23),
      I2 => \minusOp_inferred__0/i__carry__4_n_6\,
      I3 => freq_cnt_s_reg(22),
      O => \i__carry__1_i_5_n_0\
    );
\i__carry__1_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__4_n_7\,
      I1 => freq_cnt_s_reg(21),
      I2 => \minusOp_inferred__0/i__carry__3_n_4\,
      I3 => freq_cnt_s_reg(20),
      O => \i__carry__1_i_6_n_0\
    );
\i__carry__1_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__3_n_5\,
      I1 => freq_cnt_s_reg(19),
      I2 => \minusOp_inferred__0/i__carry__3_n_6\,
      I3 => freq_cnt_s_reg(18),
      O => \i__carry__1_i_7_n_0\
    );
\i__carry__1_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__3_n_7\,
      I1 => freq_cnt_s_reg(17),
      I2 => \minusOp_inferred__0/i__carry__2_n_4\,
      I3 => freq_cnt_s_reg(16),
      O => \i__carry__1_i_8_n_0\
    );
\i__carry__2_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(31),
      I1 => \minusOp_inferred__0/i__carry__6_n_5\,
      I2 => freq_cnt_s_reg(30),
      I3 => \minusOp_inferred__0/i__carry__6_n_6\,
      O => \i__carry__2_i_1__0_n_0\
    );
\i__carry__2_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(29),
      I1 => \minusOp_inferred__0/i__carry__6_n_7\,
      I2 => freq_cnt_s_reg(28),
      I3 => \minusOp_inferred__0/i__carry__5_n_4\,
      O => \i__carry__2_i_2__0_n_0\
    );
\i__carry__2_i_3__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(27),
      I1 => \minusOp_inferred__0/i__carry__5_n_5\,
      I2 => freq_cnt_s_reg(26),
      I3 => \minusOp_inferred__0/i__carry__5_n_6\,
      O => \i__carry__2_i_3__0_n_0\
    );
\i__carry__2_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(25),
      I1 => \minusOp_inferred__0/i__carry__5_n_7\,
      I2 => freq_cnt_s_reg(24),
      I3 => \minusOp_inferred__0/i__carry__4_n_4\,
      O => \i__carry__2_i_4__0_n_0\
    );
\i__carry__2_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__6_n_5\,
      I1 => freq_cnt_s_reg(31),
      I2 => \minusOp_inferred__0/i__carry__6_n_6\,
      I3 => freq_cnt_s_reg(30),
      O => \i__carry__2_i_5_n_0\
    );
\i__carry__2_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__6_n_7\,
      I1 => freq_cnt_s_reg(29),
      I2 => \minusOp_inferred__0/i__carry__5_n_4\,
      I3 => freq_cnt_s_reg(28),
      O => \i__carry__2_i_6_n_0\
    );
\i__carry__2_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__5_n_5\,
      I1 => freq_cnt_s_reg(27),
      I2 => \minusOp_inferred__0/i__carry__5_n_6\,
      I3 => freq_cnt_s_reg(26),
      O => \i__carry__2_i_7_n_0\
    );
\i__carry__2_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__5_n_7\,
      I1 => freq_cnt_s_reg(25),
      I2 => \minusOp_inferred__0/i__carry__4_n_4\,
      I3 => freq_cnt_s_reg(24),
      O => \i__carry__2_i_8_n_0\
    );
\i__carry__3_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => freq_cnt_s_reg(31),
      O => \i__carry__3_i_1__0_n_0\
    );
\i__carry_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(7),
      I1 => \minusOp_inferred__0/i__carry__0_n_5\,
      I2 => freq_cnt_s_reg(6),
      I3 => \minusOp_inferred__0/i__carry__0_n_6\,
      O => \i__carry_i_1__0_n_0\
    );
\i__carry_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(5),
      I1 => \minusOp_inferred__0/i__carry__0_n_7\,
      I2 => freq_cnt_s_reg(4),
      I3 => \minusOp_inferred__0/i__carry_n_4\,
      O => \i__carry_i_2__0_n_0\
    );
\i__carry_i_3__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => freq_cnt_s_reg(3),
      I1 => \minusOp_inferred__0/i__carry_n_5\,
      I2 => freq_cnt_s_reg(2),
      I3 => \minusOp_inferred__0/i__carry_n_6\,
      O => \i__carry_i_3__0_n_0\
    );
\i__carry_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B222"
    )
        port map (
      I0 => freq_cnt_s_reg(1),
      I1 => \minusOp_inferred__0/i__carry_n_7\,
      I2 => \div_factor_freqhigh_reg[30]\(0),
      I3 => freq_cnt_s_reg(0),
      O => \i__carry_i_4__0_n_0\
    );
\i__carry_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__0_n_5\,
      I1 => freq_cnt_s_reg(7),
      I2 => \minusOp_inferred__0/i__carry__0_n_6\,
      I3 => freq_cnt_s_reg(6),
      O => \i__carry_i_5_n_0\
    );
\i__carry_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__0_n_7\,
      I1 => freq_cnt_s_reg(5),
      I2 => \minusOp_inferred__0/i__carry_n_4\,
      I3 => freq_cnt_s_reg(4),
      O => \i__carry_i_6_n_0\
    );
\i__carry_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry_n_5\,
      I1 => freq_cnt_s_reg(3),
      I2 => \minusOp_inferred__0/i__carry_n_6\,
      I3 => freq_cnt_s_reg(2),
      O => \i__carry_i_7_n_0\
    );
\i__carry_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0990"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry_n_7\,
      I1 => freq_cnt_s_reg(1),
      I2 => \div_factor_freqhigh_reg[30]\(0),
      I3 => freq_cnt_s_reg(0),
      O => \i__carry_i_8_n_0\
    );
minusOp_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => minusOp_carry_n_0,
      CO(2) => minusOp_carry_n_1,
      CO(1) => minusOp_carry_n_2,
      CO(0) => minusOp_carry_n_3,
      CYINIT => \div_factor_freqlow_reg[30]\(0),
      DI(3 downto 0) => \div_factor_freqlow_reg[30]\(4 downto 1),
      O(3 downto 0) => minusOp(4 downto 1),
      S(3 downto 0) => \div_factor_freqlow_reg[4]\(3 downto 0)
    );
\minusOp_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => minusOp_carry_n_0,
      CO(3) => \minusOp_carry__0_n_0\,
      CO(2) => \minusOp_carry__0_n_1\,
      CO(1) => \minusOp_carry__0_n_2\,
      CO(0) => \minusOp_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \div_factor_freqlow_reg[30]\(8 downto 5),
      O(3 downto 0) => minusOp(8 downto 5),
      S(3 downto 0) => \div_factor_freqlow_reg[8]\(3 downto 0)
    );
\minusOp_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_carry__0_n_0\,
      CO(3) => \minusOp_carry__1_n_0\,
      CO(2) => \minusOp_carry__1_n_1\,
      CO(1) => \minusOp_carry__1_n_2\,
      CO(0) => \minusOp_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \div_factor_freqlow_reg[30]\(12 downto 9),
      O(3 downto 0) => minusOp(12 downto 9),
      S(3 downto 0) => \div_factor_freqlow_reg[12]\(3 downto 0)
    );
\minusOp_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_carry__1_n_0\,
      CO(3) => \minusOp_carry__2_n_0\,
      CO(2) => \minusOp_carry__2_n_1\,
      CO(1) => \minusOp_carry__2_n_2\,
      CO(0) => \minusOp_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \div_factor_freqlow_reg[30]\(16 downto 13),
      O(3 downto 0) => minusOp(16 downto 13),
      S(3 downto 0) => \div_factor_freqlow_reg[16]\(3 downto 0)
    );
\minusOp_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_carry__2_n_0\,
      CO(3) => \minusOp_carry__3_n_0\,
      CO(2) => \minusOp_carry__3_n_1\,
      CO(1) => \minusOp_carry__3_n_2\,
      CO(0) => \minusOp_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \div_factor_freqlow_reg[30]\(20 downto 17),
      O(3 downto 0) => minusOp(20 downto 17),
      S(3 downto 0) => \div_factor_freqlow_reg[20]\(3 downto 0)
    );
\minusOp_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_carry__3_n_0\,
      CO(3) => \minusOp_carry__4_n_0\,
      CO(2) => \minusOp_carry__4_n_1\,
      CO(1) => \minusOp_carry__4_n_2\,
      CO(0) => \minusOp_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \div_factor_freqlow_reg[30]\(24 downto 21),
      O(3 downto 0) => minusOp(24 downto 21),
      S(3 downto 0) => \div_factor_freqlow_reg[24]\(3 downto 0)
    );
\minusOp_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_carry__4_n_0\,
      CO(3) => \minusOp_carry__5_n_0\,
      CO(2) => \minusOp_carry__5_n_1\,
      CO(1) => \minusOp_carry__5_n_2\,
      CO(0) => \minusOp_carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \div_factor_freqlow_reg[30]\(28 downto 25),
      O(3 downto 0) => minusOp(28 downto 25),
      S(3 downto 0) => \div_factor_freqlow_reg[28]\(3 downto 0)
    );
\minusOp_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_carry__5_n_0\,
      CO(3 downto 2) => \NLW_minusOp_carry__6_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \minusOp_carry__6_n_2\,
      CO(0) => \minusOp_carry__6_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1 downto 0) => \div_factor_freqlow_reg[30]\(30 downto 29),
      O(3) => \NLW_minusOp_carry__6_O_UNCONNECTED\(3),
      O(2 downto 0) => minusOp(31 downto 29),
      S(3) => '0',
      S(2 downto 0) => S(2 downto 0)
    );
\minusOp_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \minusOp_inferred__0/i__carry_n_0\,
      CO(2) => \minusOp_inferred__0/i__carry_n_1\,
      CO(1) => \minusOp_inferred__0/i__carry_n_2\,
      CO(0) => \minusOp_inferred__0/i__carry_n_3\,
      CYINIT => \div_factor_freqhigh_reg[30]\(0),
      DI(3 downto 0) => \div_factor_freqhigh_reg[30]\(4 downto 1),
      O(3) => \minusOp_inferred__0/i__carry_n_4\,
      O(2) => \minusOp_inferred__0/i__carry_n_5\,
      O(1) => \minusOp_inferred__0/i__carry_n_6\,
      O(0) => \minusOp_inferred__0/i__carry_n_7\,
      S(3 downto 0) => \div_factor_freqhigh_reg[4]\(3 downto 0)
    );
\minusOp_inferred__0/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_inferred__0/i__carry_n_0\,
      CO(3) => \minusOp_inferred__0/i__carry__0_n_0\,
      CO(2) => \minusOp_inferred__0/i__carry__0_n_1\,
      CO(1) => \minusOp_inferred__0/i__carry__0_n_2\,
      CO(0) => \minusOp_inferred__0/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \div_factor_freqhigh_reg[30]\(8 downto 5),
      O(3) => \minusOp_inferred__0/i__carry__0_n_4\,
      O(2) => \minusOp_inferred__0/i__carry__0_n_5\,
      O(1) => \minusOp_inferred__0/i__carry__0_n_6\,
      O(0) => \minusOp_inferred__0/i__carry__0_n_7\,
      S(3 downto 0) => \div_factor_freqhigh_reg[8]\(3 downto 0)
    );
\minusOp_inferred__0/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_inferred__0/i__carry__0_n_0\,
      CO(3) => \minusOp_inferred__0/i__carry__1_n_0\,
      CO(2) => \minusOp_inferred__0/i__carry__1_n_1\,
      CO(1) => \minusOp_inferred__0/i__carry__1_n_2\,
      CO(0) => \minusOp_inferred__0/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \div_factor_freqhigh_reg[30]\(12 downto 9),
      O(3) => \minusOp_inferred__0/i__carry__1_n_4\,
      O(2) => \minusOp_inferred__0/i__carry__1_n_5\,
      O(1) => \minusOp_inferred__0/i__carry__1_n_6\,
      O(0) => \minusOp_inferred__0/i__carry__1_n_7\,
      S(3 downto 0) => \div_factor_freqhigh_reg[12]\(3 downto 0)
    );
\minusOp_inferred__0/i__carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_inferred__0/i__carry__1_n_0\,
      CO(3) => \minusOp_inferred__0/i__carry__2_n_0\,
      CO(2) => \minusOp_inferred__0/i__carry__2_n_1\,
      CO(1) => \minusOp_inferred__0/i__carry__2_n_2\,
      CO(0) => \minusOp_inferred__0/i__carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \div_factor_freqhigh_reg[30]\(16 downto 13),
      O(3) => \minusOp_inferred__0/i__carry__2_n_4\,
      O(2) => \minusOp_inferred__0/i__carry__2_n_5\,
      O(1) => \minusOp_inferred__0/i__carry__2_n_6\,
      O(0) => \minusOp_inferred__0/i__carry__2_n_7\,
      S(3 downto 0) => \div_factor_freqhigh_reg[16]\(3 downto 0)
    );
\minusOp_inferred__0/i__carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_inferred__0/i__carry__2_n_0\,
      CO(3) => \minusOp_inferred__0/i__carry__3_n_0\,
      CO(2) => \minusOp_inferred__0/i__carry__3_n_1\,
      CO(1) => \minusOp_inferred__0/i__carry__3_n_2\,
      CO(0) => \minusOp_inferred__0/i__carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \div_factor_freqhigh_reg[30]\(20 downto 17),
      O(3) => \minusOp_inferred__0/i__carry__3_n_4\,
      O(2) => \minusOp_inferred__0/i__carry__3_n_5\,
      O(1) => \minusOp_inferred__0/i__carry__3_n_6\,
      O(0) => \minusOp_inferred__0/i__carry__3_n_7\,
      S(3 downto 0) => \div_factor_freqhigh_reg[20]\(3 downto 0)
    );
\minusOp_inferred__0/i__carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_inferred__0/i__carry__3_n_0\,
      CO(3) => \minusOp_inferred__0/i__carry__4_n_0\,
      CO(2) => \minusOp_inferred__0/i__carry__4_n_1\,
      CO(1) => \minusOp_inferred__0/i__carry__4_n_2\,
      CO(0) => \minusOp_inferred__0/i__carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \div_factor_freqhigh_reg[30]\(24 downto 21),
      O(3) => \minusOp_inferred__0/i__carry__4_n_4\,
      O(2) => \minusOp_inferred__0/i__carry__4_n_5\,
      O(1) => \minusOp_inferred__0/i__carry__4_n_6\,
      O(0) => \minusOp_inferred__0/i__carry__4_n_7\,
      S(3 downto 0) => \div_factor_freqhigh_reg[24]\(3 downto 0)
    );
\minusOp_inferred__0/i__carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_inferred__0/i__carry__4_n_0\,
      CO(3) => \minusOp_inferred__0/i__carry__5_n_0\,
      CO(2) => \minusOp_inferred__0/i__carry__5_n_1\,
      CO(1) => \minusOp_inferred__0/i__carry__5_n_2\,
      CO(0) => \minusOp_inferred__0/i__carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \div_factor_freqhigh_reg[30]\(28 downto 25),
      O(3) => \minusOp_inferred__0/i__carry__5_n_4\,
      O(2) => \minusOp_inferred__0/i__carry__5_n_5\,
      O(1) => \minusOp_inferred__0/i__carry__5_n_6\,
      O(0) => \minusOp_inferred__0/i__carry__5_n_7\,
      S(3 downto 0) => \div_factor_freqhigh_reg[28]\(3 downto 0)
    );
\minusOp_inferred__0/i__carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_inferred__0/i__carry__5_n_0\,
      CO(3 downto 2) => \NLW_minusOp_inferred__0/i__carry__6_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \minusOp_inferred__0/i__carry__6_n_2\,
      CO(0) => \minusOp_inferred__0/i__carry__6_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1 downto 0) => \div_factor_freqhigh_reg[30]\(30 downto 29),
      O(3) => \NLW_minusOp_inferred__0/i__carry__6_O_UNCONNECTED\(3),
      O(2) => \minusOp_inferred__0/i__carry__6_n_5\,
      O(1) => \minusOp_inferred__0/i__carry__6_n_6\,
      O(0) => \minusOp_inferred__0/i__carry__6_n_7\,
      S(3) => '0',
      S(2 downto 0) => \div_factor_freqhigh_reg[31]\(2 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sine is
  port (
    DOADO : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \analog_ch10_reg[21]\ : out STD_LOGIC;
    \analog_ch17_reg[16]\ : out STD_LOGIC;
    \analog_ch17_reg[15]\ : out STD_LOGIC;
    \analog_ch11_reg[21]\ : out STD_LOGIC;
    \analog_ch31_reg[8]\ : out STD_LOGIC;
    \analog_ch31_reg[7]\ : out STD_LOGIC;
    \analog_ch29_reg[4]\ : out STD_LOGIC;
    \analog_ch29_reg[3]\ : out STD_LOGIC;
    \analog_ch30_reg[3]\ : out STD_LOGIC;
    \analog_ch30_reg[2]\ : out STD_LOGIC;
    \analog_ch31_reg[2]\ : out STD_LOGIC;
    \analog_ch31_reg[1]\ : out STD_LOGIC;
    \analog_ch1_reg[2]\ : out STD_LOGIC;
    \analog_ch1_reg[1]\ : out STD_LOGIC;
    \analog_ch12_reg[23]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \analog_ch13_reg[24]\ : out STD_LOGIC_VECTOR ( 5 downto 0 );
    \analog_ch14_reg[25]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \analog_ch15_reg[26]\ : out STD_LOGIC_VECTOR ( 9 downto 0 );
    \analog_ch17_reg[26]\ : out STD_LOGIC_VECTOR ( 9 downto 0 );
    \analog_ch18_reg[25]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \analog_ch19_reg[24]\ : out STD_LOGIC_VECTOR ( 5 downto 0 );
    \analog_ch20_reg[23]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ctrl_saxi_aclk : in STD_LOGIC;
    dir : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sine;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sine is
  signal \^doado\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal ampl_cnt_s : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_sine_s_reg_DOADO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal NLW_sine_s_reg_DOBDO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_sine_s_reg_DOPADOP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_sine_s_reg_DOPBDOP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \analog_ch12[20]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \analog_ch12[21]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \analog_ch12[22]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \analog_ch12[23]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \analog_ch13[19]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \analog_ch13[20]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \analog_ch13[21]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \analog_ch13[22]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \analog_ch13[23]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \analog_ch13[24]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \analog_ch14[18]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \analog_ch14[19]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \analog_ch14[20]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \analog_ch14[21]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \analog_ch14[22]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \analog_ch14[23]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \analog_ch14[24]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \analog_ch14[25]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \analog_ch15[17]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \analog_ch15[18]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \analog_ch15[19]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \analog_ch15[20]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \analog_ch15[21]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \analog_ch15[22]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \analog_ch15[23]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \analog_ch15[24]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \analog_ch15[25]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \analog_ch15[26]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \analog_ch17[17]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \analog_ch17[18]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \analog_ch17[19]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \analog_ch17[20]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \analog_ch17[21]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \analog_ch17[22]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \analog_ch17[23]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \analog_ch17[24]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \analog_ch17[25]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \analog_ch17[26]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \analog_ch18[18]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \analog_ch18[19]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \analog_ch18[20]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \analog_ch18[21]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \analog_ch18[22]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \analog_ch18[23]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \analog_ch18[24]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \analog_ch18[25]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \analog_ch19[19]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \analog_ch19[20]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \analog_ch19[21]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \analog_ch19[22]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \analog_ch19[23]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \analog_ch19[24]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \analog_ch1[10]_i_2\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \analog_ch1[1]_i_2\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \analog_ch1[2]_i_2\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \analog_ch1[3]_i_2\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \analog_ch1[4]_i_2\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \analog_ch1[5]_i_2\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \analog_ch1[6]_i_2\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \analog_ch1[7]_i_2\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \analog_ch1[8]_i_2\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \analog_ch1[9]_i_2\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \analog_ch20[20]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \analog_ch20[21]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \analog_ch20[22]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \analog_ch20[23]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \analog_ch28[4]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \analog_ch28[5]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \analog_ch28[6]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \analog_ch28[7]_i_1\ : label is "soft_lutpair48";
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of sine_s_reg : label is "p0_d12";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of sine_s_reg : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of sine_s_reg : label is 3072;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of sine_s_reg : label is "u4_sine/sine_s";
  attribute bram_addr_begin : integer;
  attribute bram_addr_begin of sine_s_reg : label is 0;
  attribute bram_addr_end : integer;
  attribute bram_addr_end of sine_s_reg : label is 1023;
  attribute bram_slice_begin : integer;
  attribute bram_slice_begin of sine_s_reg : label is 0;
  attribute bram_slice_end : integer;
  attribute bram_slice_end of sine_s_reg : label is 11;
begin
  DOADO(11 downto 0) <= \^doado\(11 downto 0);
\ampl_cnt_s_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => D(0),
      Q => ampl_cnt_s(0),
      R => '0'
    );
\ampl_cnt_s_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => D(1),
      Q => ampl_cnt_s(1),
      R => '0'
    );
\ampl_cnt_s_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => D(2),
      Q => ampl_cnt_s(2),
      R => '0'
    );
\ampl_cnt_s_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => D(3),
      Q => ampl_cnt_s(3),
      R => '0'
    );
\ampl_cnt_s_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => D(4),
      Q => ampl_cnt_s(4),
      R => '0'
    );
\ampl_cnt_s_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => D(5),
      Q => ampl_cnt_s(5),
      R => '0'
    );
\ampl_cnt_s_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => D(6),
      Q => ampl_cnt_s(6),
      R => '0'
    );
\ampl_cnt_s_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => D(7),
      Q => ampl_cnt_s(7),
      R => '0'
    );
\analog_ch12[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(0),
      I1 => dir,
      I2 => \^doado\(8),
      O => \analog_ch12_reg[23]\(0)
    );
\analog_ch12[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(1),
      I1 => dir,
      I2 => \^doado\(9),
      O => \analog_ch12_reg[23]\(1)
    );
\analog_ch12[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(2),
      I1 => dir,
      I2 => \^doado\(10),
      O => \analog_ch12_reg[23]\(2)
    );
\analog_ch12[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(3),
      I1 => dir,
      I2 => \^doado\(11),
      O => \analog_ch12_reg[23]\(3)
    );
\analog_ch13[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(0),
      I1 => dir,
      I2 => \^doado\(6),
      O => \analog_ch13_reg[24]\(0)
    );
\analog_ch13[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(1),
      I1 => dir,
      I2 => \^doado\(7),
      O => \analog_ch13_reg[24]\(1)
    );
\analog_ch13[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(2),
      I1 => dir,
      I2 => \^doado\(8),
      O => \analog_ch13_reg[24]\(2)
    );
\analog_ch13[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(3),
      I1 => dir,
      I2 => \^doado\(9),
      O => \analog_ch13_reg[24]\(3)
    );
\analog_ch13[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(4),
      I1 => dir,
      I2 => \^doado\(10),
      O => \analog_ch13_reg[24]\(4)
    );
\analog_ch13[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(5),
      I1 => dir,
      I2 => \^doado\(11),
      O => \analog_ch13_reg[24]\(5)
    );
\analog_ch14[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(0),
      I1 => dir,
      I2 => \^doado\(4),
      O => \analog_ch14_reg[25]\(0)
    );
\analog_ch14[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(1),
      I1 => dir,
      I2 => \^doado\(5),
      O => \analog_ch14_reg[25]\(1)
    );
\analog_ch14[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(2),
      I1 => dir,
      I2 => \^doado\(6),
      O => \analog_ch14_reg[25]\(2)
    );
\analog_ch14[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(3),
      I1 => dir,
      I2 => \^doado\(7),
      O => \analog_ch14_reg[25]\(3)
    );
\analog_ch14[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(4),
      I1 => dir,
      I2 => \^doado\(8),
      O => \analog_ch14_reg[25]\(4)
    );
\analog_ch14[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(5),
      I1 => dir,
      I2 => \^doado\(9),
      O => \analog_ch14_reg[25]\(5)
    );
\analog_ch14[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(6),
      I1 => dir,
      I2 => \^doado\(10),
      O => \analog_ch14_reg[25]\(6)
    );
\analog_ch14[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(7),
      I1 => dir,
      I2 => \^doado\(11),
      O => \analog_ch14_reg[25]\(7)
    );
\analog_ch15[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(0),
      I1 => dir,
      I2 => \^doado\(2),
      O => \analog_ch15_reg[26]\(0)
    );
\analog_ch15[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(1),
      I1 => dir,
      I2 => \^doado\(3),
      O => \analog_ch15_reg[26]\(1)
    );
\analog_ch15[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(2),
      I1 => dir,
      I2 => \^doado\(4),
      O => \analog_ch15_reg[26]\(2)
    );
\analog_ch15[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(3),
      I1 => dir,
      I2 => \^doado\(5),
      O => \analog_ch15_reg[26]\(3)
    );
\analog_ch15[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(4),
      I1 => dir,
      I2 => \^doado\(6),
      O => \analog_ch15_reg[26]\(4)
    );
\analog_ch15[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(5),
      I1 => dir,
      I2 => \^doado\(7),
      O => \analog_ch15_reg[26]\(5)
    );
\analog_ch15[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(6),
      I1 => dir,
      I2 => \^doado\(8),
      O => \analog_ch15_reg[26]\(6)
    );
\analog_ch15[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(7),
      I1 => dir,
      I2 => \^doado\(9),
      O => \analog_ch15_reg[26]\(7)
    );
\analog_ch15[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(8),
      I1 => dir,
      I2 => \^doado\(10),
      O => \analog_ch15_reg[26]\(8)
    );
\analog_ch15[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(9),
      I1 => dir,
      I2 => \^doado\(11),
      O => \analog_ch15_reg[26]\(9)
    );
\analog_ch17[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(2),
      I1 => dir,
      I2 => \^doado\(0),
      O => \analog_ch17_reg[26]\(0)
    );
\analog_ch17[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(3),
      I1 => dir,
      I2 => \^doado\(1),
      O => \analog_ch17_reg[26]\(1)
    );
\analog_ch17[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(4),
      I1 => dir,
      I2 => \^doado\(2),
      O => \analog_ch17_reg[26]\(2)
    );
\analog_ch17[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(5),
      I1 => dir,
      I2 => \^doado\(3),
      O => \analog_ch17_reg[26]\(3)
    );
\analog_ch17[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(6),
      I1 => dir,
      I2 => \^doado\(4),
      O => \analog_ch17_reg[26]\(4)
    );
\analog_ch17[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(7),
      I1 => dir,
      I2 => \^doado\(5),
      O => \analog_ch17_reg[26]\(5)
    );
\analog_ch17[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(8),
      I1 => dir,
      I2 => \^doado\(6),
      O => \analog_ch17_reg[26]\(6)
    );
\analog_ch17[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(9),
      I1 => dir,
      I2 => \^doado\(7),
      O => \analog_ch17_reg[26]\(7)
    );
\analog_ch17[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(10),
      I1 => dir,
      I2 => \^doado\(8),
      O => \analog_ch17_reg[26]\(8)
    );
\analog_ch17[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(11),
      I1 => dir,
      I2 => \^doado\(9),
      O => \analog_ch17_reg[26]\(9)
    );
\analog_ch18[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(4),
      I1 => dir,
      I2 => \^doado\(0),
      O => \analog_ch18_reg[25]\(0)
    );
\analog_ch18[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(5),
      I1 => dir,
      I2 => \^doado\(1),
      O => \analog_ch18_reg[25]\(1)
    );
\analog_ch18[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(6),
      I1 => dir,
      I2 => \^doado\(2),
      O => \analog_ch18_reg[25]\(2)
    );
\analog_ch18[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(7),
      I1 => dir,
      I2 => \^doado\(3),
      O => \analog_ch18_reg[25]\(3)
    );
\analog_ch18[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(8),
      I1 => dir,
      I2 => \^doado\(4),
      O => \analog_ch18_reg[25]\(4)
    );
\analog_ch18[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(9),
      I1 => dir,
      I2 => \^doado\(5),
      O => \analog_ch18_reg[25]\(5)
    );
\analog_ch18[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(10),
      I1 => dir,
      I2 => \^doado\(6),
      O => \analog_ch18_reg[25]\(6)
    );
\analog_ch18[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(11),
      I1 => dir,
      I2 => \^doado\(7),
      O => \analog_ch18_reg[25]\(7)
    );
\analog_ch19[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(6),
      I1 => dir,
      I2 => \^doado\(0),
      O => \analog_ch19_reg[24]\(0)
    );
\analog_ch19[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(7),
      I1 => dir,
      I2 => \^doado\(1),
      O => \analog_ch19_reg[24]\(1)
    );
\analog_ch19[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(8),
      I1 => dir,
      I2 => \^doado\(2),
      O => \analog_ch19_reg[24]\(2)
    );
\analog_ch19[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(9),
      I1 => dir,
      I2 => \^doado\(3),
      O => \analog_ch19_reg[24]\(3)
    );
\analog_ch19[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(10),
      I1 => dir,
      I2 => \^doado\(4),
      O => \analog_ch19_reg[24]\(4)
    );
\analog_ch19[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(11),
      I1 => dir,
      I2 => \^doado\(5),
      O => \analog_ch19_reg[24]\(5)
    );
\analog_ch1[10]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^doado\(9),
      I1 => dir,
      O => \analog_ch31_reg[8]\
    );
\analog_ch1[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^doado\(0),
      I1 => dir,
      O => \analog_ch1_reg[1]\
    );
\analog_ch1[2]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^doado\(1),
      I1 => dir,
      O => \analog_ch1_reg[2]\
    );
\analog_ch1[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^doado\(2),
      I1 => dir,
      O => \analog_ch31_reg[1]\
    );
\analog_ch1[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^doado\(3),
      I1 => dir,
      O => \analog_ch31_reg[2]\
    );
\analog_ch1[5]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^doado\(4),
      I1 => dir,
      O => \analog_ch30_reg[2]\
    );
\analog_ch1[6]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^doado\(5),
      I1 => dir,
      O => \analog_ch30_reg[3]\
    );
\analog_ch1[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^doado\(6),
      I1 => dir,
      O => \analog_ch29_reg[3]\
    );
\analog_ch1[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^doado\(7),
      I1 => dir,
      O => \analog_ch29_reg[4]\
    );
\analog_ch1[9]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^doado\(8),
      I1 => dir,
      O => \analog_ch31_reg[7]\
    );
\analog_ch20[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(8),
      I1 => dir,
      I2 => \^doado\(0),
      O => \analog_ch20_reg[23]\(0)
    );
\analog_ch20[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(9),
      I1 => dir,
      I2 => \^doado\(1),
      O => \analog_ch20_reg[23]\(1)
    );
\analog_ch20[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(10),
      I1 => dir,
      I2 => \^doado\(2),
      O => \analog_ch20_reg[23]\(2)
    );
\analog_ch20[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^doado\(11),
      I1 => dir,
      I2 => \^doado\(3),
      O => \analog_ch20_reg[23]\(3)
    );
\analog_ch28[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^doado\(0),
      I1 => dir,
      O => \analog_ch17_reg[15]\
    );
\analog_ch28[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^doado\(1),
      I1 => dir,
      O => \analog_ch17_reg[16]\
    );
\analog_ch28[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^doado\(10),
      I1 => dir,
      O => \analog_ch11_reg[21]\
    );
\analog_ch28[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^doado\(11),
      I1 => dir,
      O => \analog_ch10_reg[21]\
    );
sine_s_reg: unisim.vcomponents.RAMB18E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0AE00AB10A810A510A2109F009C0098E095D092B08FA08C808960863083107FF",
      INIT_01 => X"0D820D5E0D380D120CEA0CC20C9A0C700C460C1B0BF00BC40B970B6A0B3D0B0E",
      INIT_02 => X"0F4E0F390F230F0C0EF40EDB0EC00EA50E890E6B0E4D0E2D0E0D0DEC0DCA0DA6",
      INIT_03 => X"0FFD0FFC0FF80FF40FEF0FE80FE00FD70FCC0FC10FB40FA60F970F860F750F62",
      INIT_04 => X"0F750F860F970FA60FB40FC10FCC0FD70FE00FE80FEF0FF40FF80FFC0FFD0FFE",
      INIT_05 => X"0DCA0DEC0E0D0E2D0E4D0E6B0E890EA50EC00EDB0EF40F0C0F230F390F4E0F62",
      INIT_06 => X"0B3D0B6A0B970BC40BF00C1B0C460C700C9A0CC20CEA0D120D380D5E0D820DA6",
      INIT_07 => X"08310863089608C808FA092B095D098E09C009F00A210A510A810AB10AE00B0E",
      INIT_08 => X"051E054D057D05AD05DD060E063E067006A106D3070407360768079B07CD07FF",
      INIT_09 => X"027C02A002C602EC0314033C0364038E03B803E3040E043A0467049404C104F0",
      INIT_0A => X"00B000C500DB00F2010A0123013E01590175019301B101D101F1021202340258",
      INIT_0B => X"000100020006000A000F0016001E00270032003D004A0058006700780089009C",
      INIT_0C => X"0089007800670058004A003D00320027001E0016000F000A0006000200010000",
      INIT_0D => X"0234021201F101D101B1019301750159013E0123010A00F200DB00C500B0009C",
      INIT_0E => X"04C104940467043A040E03E303B8038E0364033C031402EC02C602A0027C0258",
      INIT_0F => X"07CD079B07680736070406D306A10670063E060E05DD05AD057D054D051E04F0",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"00000",
      INIT_B => X"00000",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "PERFORMANCE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"00000",
      SRVAL_B => X"00000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 0
    )
        port map (
      ADDRARDADDR(13 downto 12) => B"00",
      ADDRARDADDR(11 downto 4) => ampl_cnt_s(7 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 0) => B"11111111111111",
      CLKARDCLK => ctrl_saxi_aclk,
      CLKBWRCLK => '0',
      DIADI(15 downto 0) => B"0000111111111111",
      DIBDI(15 downto 0) => B"1111111111111111",
      DIPADIP(1 downto 0) => B"00",
      DIPBDIP(1 downto 0) => B"11",
      DOADO(15 downto 12) => NLW_sine_s_reg_DOADO_UNCONNECTED(15 downto 12),
      DOADO(11 downto 0) => \^doado\(11 downto 0),
      DOBDO(15 downto 0) => NLW_sine_s_reg_DOBDO_UNCONNECTED(15 downto 0),
      DOPADOP(1 downto 0) => NLW_sine_s_reg_DOPADOP_UNCONNECTED(1 downto 0),
      DOPBDOP(1 downto 0) => NLW_sine_s_reg_DOPBDOP_UNCONNECTED(1 downto 0),
      ENARDEN => '1',
      ENBWREN => '0',
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Sine_v2_0 is
  port (
    S_AXI_ARREADY : out STD_LOGIC;
    ctrl_saxi_rvalid : out STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    ctrl_saxi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ctrl_saxi_bvalid : out STD_LOGIC;
    ctrl_saxi_arvalid : in STD_LOGIC;
    ctrl_saxi_aclk : in STD_LOGIC;
    ctrl_saxi_awaddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    ctrl_saxi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ctrl_saxi_araddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    ctrl_saxi_wvalid : in STD_LOGIC;
    ctrl_saxi_awvalid : in STD_LOGIC;
    ctrl_saxi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    ctrl_saxi_aresetn : in STD_LOGIC;
    ctrl_saxi_bready : in STD_LOGIC;
    ctrl_saxi_rready : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Sine_v2_0;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Sine_v2_0 is
  signal analog_ch1 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal analog_ch10 : STD_LOGIC_VECTOR ( 31 downto 21 );
  signal analog_ch11 : STD_LOGIC_VECTOR ( 31 downto 21 );
  signal analog_ch12 : STD_LOGIC_VECTOR ( 31 downto 20 );
  signal analog_ch13 : STD_LOGIC_VECTOR ( 24 downto 19 );
  signal analog_ch14 : STD_LOGIC_VECTOR ( 25 downto 18 );
  signal analog_ch15 : STD_LOGIC_VECTOR ( 26 downto 17 );
  signal analog_ch16 : STD_LOGIC_VECTOR ( 27 downto 16 );
  signal analog_ch17 : STD_LOGIC_VECTOR ( 26 downto 15 );
  signal analog_ch18 : STD_LOGIC_VECTOR ( 25 downto 18 );
  signal analog_ch19 : STD_LOGIC_VECTOR ( 24 downto 19 );
  signal analog_ch2 : STD_LOGIC_VECTOR ( 31 downto 2 );
  signal analog_ch20 : STD_LOGIC_VECTOR ( 31 downto 20 );
  signal analog_ch21 : STD_LOGIC_VECTOR ( 31 downto 21 );
  signal analog_ch22 : STD_LOGIC_VECTOR ( 31 to 31 );
  signal analog_ch23 : STD_LOGIC_VECTOR ( 31 to 31 );
  signal analog_ch24 : STD_LOGIC_VECTOR ( 31 to 31 );
  signal analog_ch25 : STD_LOGIC_VECTOR ( 31 to 31 );
  signal analog_ch26 : STD_LOGIC_VECTOR ( 31 to 31 );
  signal analog_ch27 : STD_LOGIC_VECTOR ( 31 to 31 );
  signal analog_ch28 : STD_LOGIC_VECTOR ( 31 downto 4 );
  signal analog_ch29 : STD_LOGIC_VECTOR ( 31 downto 3 );
  signal analog_ch3 : STD_LOGIC_VECTOR ( 31 downto 3 );
  signal analog_ch30 : STD_LOGIC_VECTOR ( 31 downto 2 );
  signal analog_ch31 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal analog_ch4 : STD_LOGIC_VECTOR ( 31 downto 4 );
  signal analog_ch5 : STD_LOGIC_VECTOR ( 31 to 31 );
  signal analog_ch6 : STD_LOGIC_VECTOR ( 31 to 31 );
  signal analog_ch7 : STD_LOGIC_VECTOR ( 31 to 31 );
  signal analog_ch8 : STD_LOGIC_VECTOR ( 31 to 31 );
  signal analog_ch9 : STD_LOGIC_VECTOR ( 31 to 31 );
  signal cnt_out : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal dir : STD_LOGIC;
  signal div_factor_freqhigh : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal div_factor_freqlow : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal freq_trig : STD_LOGIC;
  signal sine_outo : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal sw0 : STD_LOGIC;
  signal u1_Sine_n_100 : STD_LOGIC;
  signal u1_Sine_n_101 : STD_LOGIC;
  signal u1_Sine_n_102 : STD_LOGIC;
  signal u1_Sine_n_103 : STD_LOGIC;
  signal u1_Sine_n_104 : STD_LOGIC;
  signal u1_Sine_n_105 : STD_LOGIC;
  signal u1_Sine_n_106 : STD_LOGIC;
  signal u1_Sine_n_107 : STD_LOGIC;
  signal u1_Sine_n_108 : STD_LOGIC;
  signal u1_Sine_n_109 : STD_LOGIC;
  signal u1_Sine_n_110 : STD_LOGIC;
  signal u1_Sine_n_111 : STD_LOGIC;
  signal u1_Sine_n_112 : STD_LOGIC;
  signal u1_Sine_n_113 : STD_LOGIC;
  signal u1_Sine_n_114 : STD_LOGIC;
  signal u1_Sine_n_115 : STD_LOGIC;
  signal u1_Sine_n_116 : STD_LOGIC;
  signal u1_Sine_n_117 : STD_LOGIC;
  signal u1_Sine_n_118 : STD_LOGIC;
  signal u1_Sine_n_119 : STD_LOGIC;
  signal u1_Sine_n_120 : STD_LOGIC;
  signal u1_Sine_n_121 : STD_LOGIC;
  signal u1_Sine_n_122 : STD_LOGIC;
  signal u1_Sine_n_123 : STD_LOGIC;
  signal u1_Sine_n_124 : STD_LOGIC;
  signal u1_Sine_n_125 : STD_LOGIC;
  signal u1_Sine_n_126 : STD_LOGIC;
  signal u1_Sine_n_128 : STD_LOGIC;
  signal u1_Sine_n_129 : STD_LOGIC;
  signal u1_Sine_n_130 : STD_LOGIC;
  signal u1_Sine_n_131 : STD_LOGIC;
  signal u1_Sine_n_132 : STD_LOGIC;
  signal u1_Sine_n_133 : STD_LOGIC;
  signal u1_Sine_n_134 : STD_LOGIC;
  signal u1_Sine_n_135 : STD_LOGIC;
  signal u1_Sine_n_136 : STD_LOGIC;
  signal u1_Sine_n_137 : STD_LOGIC;
  signal u1_Sine_n_2 : STD_LOGIC;
  signal u1_Sine_n_3 : STD_LOGIC;
  signal u1_Sine_n_36 : STD_LOGIC;
  signal u1_Sine_n_37 : STD_LOGIC;
  signal u1_Sine_n_38 : STD_LOGIC;
  signal u1_Sine_n_39 : STD_LOGIC;
  signal u1_Sine_n_4 : STD_LOGIC;
  signal u1_Sine_n_40 : STD_LOGIC;
  signal u1_Sine_n_41 : STD_LOGIC;
  signal u1_Sine_n_42 : STD_LOGIC;
  signal u1_Sine_n_43 : STD_LOGIC;
  signal u1_Sine_n_44 : STD_LOGIC;
  signal u1_Sine_n_45 : STD_LOGIC;
  signal u1_Sine_n_46 : STD_LOGIC;
  signal u1_Sine_n_47 : STD_LOGIC;
  signal u1_Sine_n_48 : STD_LOGIC;
  signal u1_Sine_n_49 : STD_LOGIC;
  signal u1_Sine_n_50 : STD_LOGIC;
  signal u1_Sine_n_51 : STD_LOGIC;
  signal u1_Sine_n_52 : STD_LOGIC;
  signal u1_Sine_n_53 : STD_LOGIC;
  signal u1_Sine_n_54 : STD_LOGIC;
  signal u1_Sine_n_55 : STD_LOGIC;
  signal u1_Sine_n_56 : STD_LOGIC;
  signal u1_Sine_n_57 : STD_LOGIC;
  signal u1_Sine_n_58 : STD_LOGIC;
  signal u1_Sine_n_59 : STD_LOGIC;
  signal u1_Sine_n_60 : STD_LOGIC;
  signal u1_Sine_n_61 : STD_LOGIC;
  signal u1_Sine_n_62 : STD_LOGIC;
  signal u1_Sine_n_63 : STD_LOGIC;
  signal u1_Sine_n_64 : STD_LOGIC;
  signal u1_Sine_n_65 : STD_LOGIC;
  signal u1_Sine_n_66 : STD_LOGIC;
  signal u1_Sine_n_98 : STD_LOGIC;
  signal u1_Sine_n_99 : STD_LOGIC;
  signal u4_sine_n_12 : STD_LOGIC;
  signal u4_sine_n_13 : STD_LOGIC;
  signal u4_sine_n_14 : STD_LOGIC;
  signal u4_sine_n_15 : STD_LOGIC;
  signal u4_sine_n_16 : STD_LOGIC;
  signal u4_sine_n_17 : STD_LOGIC;
  signal u4_sine_n_18 : STD_LOGIC;
  signal u4_sine_n_19 : STD_LOGIC;
  signal u4_sine_n_20 : STD_LOGIC;
  signal u4_sine_n_21 : STD_LOGIC;
  signal u4_sine_n_22 : STD_LOGIC;
  signal u4_sine_n_23 : STD_LOGIC;
  signal u4_sine_n_24 : STD_LOGIC;
  signal u4_sine_n_25 : STD_LOGIC;
  signal u4_sine_n_26 : STD_LOGIC;
  signal u4_sine_n_27 : STD_LOGIC;
  signal u4_sine_n_28 : STD_LOGIC;
  signal u4_sine_n_29 : STD_LOGIC;
  signal u4_sine_n_30 : STD_LOGIC;
  signal u4_sine_n_31 : STD_LOGIC;
  signal u4_sine_n_32 : STD_LOGIC;
  signal u4_sine_n_33 : STD_LOGIC;
  signal u4_sine_n_34 : STD_LOGIC;
  signal u4_sine_n_35 : STD_LOGIC;
  signal u4_sine_n_36 : STD_LOGIC;
  signal u4_sine_n_37 : STD_LOGIC;
  signal u4_sine_n_38 : STD_LOGIC;
  signal u4_sine_n_39 : STD_LOGIC;
  signal u4_sine_n_40 : STD_LOGIC;
  signal u4_sine_n_41 : STD_LOGIC;
  signal u4_sine_n_42 : STD_LOGIC;
  signal u4_sine_n_43 : STD_LOGIC;
  signal u4_sine_n_44 : STD_LOGIC;
  signal u4_sine_n_45 : STD_LOGIC;
  signal u4_sine_n_46 : STD_LOGIC;
  signal u4_sine_n_47 : STD_LOGIC;
  signal u4_sine_n_48 : STD_LOGIC;
  signal u4_sine_n_49 : STD_LOGIC;
  signal u4_sine_n_50 : STD_LOGIC;
  signal u4_sine_n_51 : STD_LOGIC;
  signal u4_sine_n_52 : STD_LOGIC;
  signal u4_sine_n_53 : STD_LOGIC;
  signal u4_sine_n_54 : STD_LOGIC;
  signal u4_sine_n_55 : STD_LOGIC;
  signal u4_sine_n_56 : STD_LOGIC;
  signal u4_sine_n_57 : STD_LOGIC;
  signal u4_sine_n_58 : STD_LOGIC;
  signal u4_sine_n_59 : STD_LOGIC;
  signal u4_sine_n_60 : STD_LOGIC;
  signal u4_sine_n_61 : STD_LOGIC;
  signal u4_sine_n_62 : STD_LOGIC;
  signal u4_sine_n_63 : STD_LOGIC;
  signal u4_sine_n_64 : STD_LOGIC;
  signal u4_sine_n_65 : STD_LOGIC;
  signal u4_sine_n_66 : STD_LOGIC;
  signal u4_sine_n_67 : STD_LOGIC;
  signal u4_sine_n_68 : STD_LOGIC;
  signal u4_sine_n_69 : STD_LOGIC;
  signal u4_sine_n_70 : STD_LOGIC;
  signal u4_sine_n_71 : STD_LOGIC;
  signal u4_sine_n_72 : STD_LOGIC;
  signal u4_sine_n_73 : STD_LOGIC;
  signal u4_sine_n_74 : STD_LOGIC;
  signal u4_sine_n_75 : STD_LOGIC;
  signal u4_sine_n_76 : STD_LOGIC;
  signal u4_sine_n_77 : STD_LOGIC;
  signal u4_sine_n_78 : STD_LOGIC;
  signal u4_sine_n_79 : STD_LOGIC;
  signal u4_sine_n_80 : STD_LOGIC;
  signal u4_sine_n_81 : STD_LOGIC;
begin
\analog_ch10_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_12,
      Q => analog_ch10(21),
      R => '0'
    );
\analog_ch10_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(9),
      Q => analog_ch10(31),
      R => u1_Sine_n_128
    );
\analog_ch11_reg[21]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_15,
      Q => analog_ch11(21),
      S => u4_sine_n_14
    );
\analog_ch11_reg[22]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_12,
      Q => analog_ch11(22),
      S => u4_sine_n_13
    );
\analog_ch11_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(10),
      Q => analog_ch11(31),
      R => u1_Sine_n_128
    );
\analog_ch12_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_29,
      Q => analog_ch12(20),
      R => '0'
    );
\analog_ch12_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_28,
      Q => analog_ch12(21),
      R => '0'
    );
\analog_ch12_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_27,
      Q => analog_ch12(22),
      R => '0'
    );
\analog_ch12_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_26,
      Q => analog_ch12(23),
      R => '0'
    );
\analog_ch12_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(11),
      Q => analog_ch12(31),
      R => u1_Sine_n_128
    );
\analog_ch13_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_35,
      Q => analog_ch13(19),
      R => '0'
    );
\analog_ch13_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_34,
      Q => analog_ch13(20),
      R => '0'
    );
\analog_ch13_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_33,
      Q => analog_ch13(21),
      R => '0'
    );
\analog_ch13_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_32,
      Q => analog_ch13(22),
      R => '0'
    );
\analog_ch13_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_31,
      Q => analog_ch13(23),
      R => '0'
    );
\analog_ch13_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_30,
      Q => analog_ch13(24),
      R => '0'
    );
\analog_ch14_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_43,
      Q => analog_ch14(18),
      R => '0'
    );
\analog_ch14_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_42,
      Q => analog_ch14(19),
      R => '0'
    );
\analog_ch14_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_41,
      Q => analog_ch14(20),
      R => '0'
    );
\analog_ch14_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_40,
      Q => analog_ch14(21),
      R => '0'
    );
\analog_ch14_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_39,
      Q => analog_ch14(22),
      R => '0'
    );
\analog_ch14_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_38,
      Q => analog_ch14(23),
      R => '0'
    );
\analog_ch14_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_37,
      Q => analog_ch14(24),
      R => '0'
    );
\analog_ch14_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_36,
      Q => analog_ch14(25),
      R => '0'
    );
\analog_ch15_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_53,
      Q => analog_ch15(17),
      R => '0'
    );
\analog_ch15_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_52,
      Q => analog_ch15(18),
      R => '0'
    );
\analog_ch15_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_51,
      Q => analog_ch15(19),
      R => '0'
    );
\analog_ch15_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_50,
      Q => analog_ch15(20),
      R => '0'
    );
\analog_ch15_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_49,
      Q => analog_ch15(21),
      R => '0'
    );
\analog_ch15_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_48,
      Q => analog_ch15(22),
      R => '0'
    );
\analog_ch15_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_47,
      Q => analog_ch15(23),
      R => '0'
    );
\analog_ch15_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_46,
      Q => analog_ch15(24),
      R => '0'
    );
\analog_ch15_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_45,
      Q => analog_ch15(25),
      R => '0'
    );
\analog_ch15_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_44,
      Q => analog_ch15(26),
      R => '0'
    );
\analog_ch16_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(0),
      Q => analog_ch16(16),
      R => '0'
    );
\analog_ch16_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(1),
      Q => analog_ch16(17),
      R => '0'
    );
\analog_ch16_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(2),
      Q => analog_ch16(18),
      R => '0'
    );
\analog_ch16_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(3),
      Q => analog_ch16(19),
      R => '0'
    );
\analog_ch16_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(4),
      Q => analog_ch16(20),
      R => '0'
    );
\analog_ch16_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(5),
      Q => analog_ch16(21),
      R => '0'
    );
\analog_ch16_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(6),
      Q => analog_ch16(22),
      R => '0'
    );
\analog_ch16_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(7),
      Q => analog_ch16(23),
      R => '0'
    );
\analog_ch16_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(8),
      Q => analog_ch16(24),
      R => '0'
    );
\analog_ch16_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(9),
      Q => analog_ch16(25),
      R => '0'
    );
\analog_ch16_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(10),
      Q => analog_ch16(26),
      R => '0'
    );
\analog_ch16_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(11),
      Q => analog_ch16(27),
      R => '0'
    );
\analog_ch17_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_14,
      Q => analog_ch17(15),
      R => '0'
    );
\analog_ch17_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_13,
      Q => analog_ch17(16),
      R => '0'
    );
\analog_ch17_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_63,
      Q => analog_ch17(17),
      R => '0'
    );
\analog_ch17_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_62,
      Q => analog_ch17(18),
      R => '0'
    );
\analog_ch17_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_61,
      Q => analog_ch17(19),
      R => '0'
    );
\analog_ch17_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_60,
      Q => analog_ch17(20),
      R => '0'
    );
\analog_ch17_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_59,
      Q => analog_ch17(21),
      R => '0'
    );
\analog_ch17_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_58,
      Q => analog_ch17(22),
      R => '0'
    );
\analog_ch17_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_57,
      Q => analog_ch17(23),
      R => '0'
    );
\analog_ch17_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_56,
      Q => analog_ch17(24),
      R => '0'
    );
\analog_ch17_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_55,
      Q => analog_ch17(25),
      R => '0'
    );
\analog_ch17_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_54,
      Q => analog_ch17(26),
      R => '0'
    );
\analog_ch18_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_71,
      Q => analog_ch18(18),
      R => '0'
    );
\analog_ch18_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_70,
      Q => analog_ch18(19),
      R => '0'
    );
\analog_ch18_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_69,
      Q => analog_ch18(20),
      R => '0'
    );
\analog_ch18_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_68,
      Q => analog_ch18(21),
      R => '0'
    );
\analog_ch18_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_67,
      Q => analog_ch18(22),
      R => '0'
    );
\analog_ch18_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_66,
      Q => analog_ch18(23),
      R => '0'
    );
\analog_ch18_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_65,
      Q => analog_ch18(24),
      R => '0'
    );
\analog_ch18_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_64,
      Q => analog_ch18(25),
      R => '0'
    );
\analog_ch19_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_77,
      Q => analog_ch19(19),
      R => '0'
    );
\analog_ch19_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_76,
      Q => analog_ch19(20),
      R => '0'
    );
\analog_ch19_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_75,
      Q => analog_ch19(21),
      R => '0'
    );
\analog_ch19_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_74,
      Q => analog_ch19(22),
      R => '0'
    );
\analog_ch19_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_73,
      Q => analog_ch19(23),
      R => '0'
    );
\analog_ch19_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_72,
      Q => analog_ch19(24),
      R => '0'
    );
\analog_ch1_reg[10]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_16,
      Q => analog_ch1(10),
      S => u1_Sine_n_126
    );
\analog_ch1_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_25,
      Q => analog_ch1(1),
      S => u1_Sine_n_137
    );
\analog_ch1_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_24,
      Q => analog_ch1(2),
      S => u1_Sine_n_136
    );
\analog_ch1_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(0),
      Q => analog_ch1(31),
      R => u1_Sine_n_128
    );
\analog_ch1_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_23,
      Q => analog_ch1(3),
      S => u1_Sine_n_135
    );
\analog_ch1_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_22,
      Q => analog_ch1(4),
      S => u1_Sine_n_134
    );
\analog_ch1_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_21,
      Q => analog_ch1(5),
      S => u1_Sine_n_133
    );
\analog_ch1_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_20,
      Q => analog_ch1(6),
      S => u1_Sine_n_132
    );
\analog_ch1_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_19,
      Q => analog_ch1(7),
      S => u1_Sine_n_131
    );
\analog_ch1_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_18,
      Q => analog_ch1(8),
      S => u1_Sine_n_130
    );
\analog_ch1_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_17,
      Q => analog_ch1(9),
      S => u1_Sine_n_129
    );
\analog_ch20_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_81,
      Q => analog_ch20(20),
      R => '0'
    );
\analog_ch20_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_80,
      Q => analog_ch20(21),
      R => '0'
    );
\analog_ch20_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_79,
      Q => analog_ch20(22),
      R => '0'
    );
\analog_ch20_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_78,
      Q => analog_ch20(23),
      R => '0'
    );
\analog_ch20_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(11),
      Q => analog_ch20(31),
      R => dir
    );
\analog_ch21_reg[21]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_25,
      Q => analog_ch21(21),
      S => u1_Sine_n_129
    );
\analog_ch21_reg[22]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_24,
      Q => analog_ch21(22),
      S => u1_Sine_n_126
    );
\analog_ch21_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(10),
      Q => analog_ch21(31),
      R => dir
    );
\analog_ch22_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(9),
      Q => analog_ch22(31),
      R => dir
    );
\analog_ch23_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(8),
      Q => analog_ch23(31),
      R => dir
    );
\analog_ch24_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(7),
      Q => analog_ch24(31),
      R => dir
    );
\analog_ch25_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(6),
      Q => analog_ch25(31),
      R => dir
    );
\analog_ch26_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(5),
      Q => analog_ch26(31),
      R => dir
    );
\analog_ch27_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(4),
      Q => analog_ch27(31),
      R => dir
    );
\analog_ch28_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(3),
      Q => analog_ch28(31),
      R => dir
    );
\analog_ch28_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_14,
      Q => analog_ch28(4),
      S => u4_sine_n_17
    );
\analog_ch28_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_13,
      Q => analog_ch28(5),
      S => u4_sine_n_16
    );
\analog_ch28_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_15,
      Q => analog_ch28(6),
      S => u1_Sine_n_137
    );
\analog_ch28_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_12,
      Q => analog_ch28(7),
      S => u1_Sine_n_136
    );
\analog_ch29_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(2),
      Q => analog_ch29(31),
      R => dir
    );
\analog_ch29_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_19,
      Q => analog_ch29(3),
      S => u4_sine_n_14
    );
\analog_ch29_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_18,
      Q => analog_ch29(4),
      S => u4_sine_n_13
    );
\analog_ch29_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u1_Sine_n_137,
      Q => analog_ch29(5),
      S => u4_sine_n_17
    );
\analog_ch29_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u1_Sine_n_136,
      Q => analog_ch29(6),
      S => u4_sine_n_16
    );
\analog_ch29_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_15,
      Q => analog_ch29(7),
      S => u1_Sine_n_135
    );
\analog_ch29_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_12,
      Q => analog_ch29(8),
      S => u1_Sine_n_134
    );
\analog_ch2_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_25,
      Q => analog_ch2(2),
      S => u1_Sine_n_135
    );
\analog_ch2_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(1),
      Q => analog_ch2(31),
      R => u1_Sine_n_128
    );
\analog_ch2_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_24,
      Q => analog_ch2(3),
      S => u1_Sine_n_134
    );
\analog_ch2_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_23,
      Q => analog_ch2(4),
      S => u1_Sine_n_133
    );
\analog_ch2_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_22,
      Q => analog_ch2(5),
      S => u1_Sine_n_132
    );
\analog_ch2_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_21,
      Q => analog_ch2(6),
      S => u1_Sine_n_131
    );
\analog_ch2_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_20,
      Q => analog_ch2(7),
      S => u1_Sine_n_130
    );
\analog_ch2_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_19,
      Q => analog_ch2(8),
      S => u1_Sine_n_129
    );
\analog_ch2_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_18,
      Q => analog_ch2(9),
      S => u1_Sine_n_126
    );
\analog_ch30_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_21,
      Q => analog_ch30(2),
      S => u4_sine_n_14
    );
\analog_ch30_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(1),
      Q => analog_ch30(31),
      R => dir
    );
\analog_ch30_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_20,
      Q => analog_ch30(3),
      S => u4_sine_n_13
    );
\analog_ch30_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_19,
      Q => analog_ch30(4),
      S => u1_Sine_n_137
    );
\analog_ch30_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_18,
      Q => analog_ch30(5),
      S => u1_Sine_n_136
    );
\analog_ch30_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u1_Sine_n_135,
      Q => analog_ch30(6),
      S => u4_sine_n_17
    );
\analog_ch30_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u1_Sine_n_134,
      Q => analog_ch30(7),
      S => u4_sine_n_16
    );
\analog_ch30_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_15,
      Q => analog_ch30(8),
      S => u1_Sine_n_133
    );
\analog_ch30_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_12,
      Q => analog_ch30(9),
      S => u1_Sine_n_132
    );
\analog_ch31_reg[10]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_12,
      Q => analog_ch31(10),
      S => u1_Sine_n_130
    );
\analog_ch31_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_23,
      Q => analog_ch31(1),
      S => u4_sine_n_14
    );
\analog_ch31_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_22,
      Q => analog_ch31(2),
      S => u4_sine_n_13
    );
\analog_ch31_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(0),
      Q => analog_ch31(31),
      R => dir
    );
\analog_ch31_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_21,
      Q => analog_ch31(3),
      S => u1_Sine_n_137
    );
\analog_ch31_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_20,
      Q => analog_ch31(4),
      S => u1_Sine_n_136
    );
\analog_ch31_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_19,
      Q => analog_ch31(5),
      S => u1_Sine_n_135
    );
\analog_ch31_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_18,
      Q => analog_ch31(6),
      S => u1_Sine_n_134
    );
\analog_ch31_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u1_Sine_n_133,
      Q => analog_ch31(7),
      S => u4_sine_n_17
    );
\analog_ch31_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u1_Sine_n_132,
      Q => analog_ch31(8),
      S => u4_sine_n_16
    );
\analog_ch31_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_15,
      Q => analog_ch31(9),
      S => u1_Sine_n_131
    );
\analog_ch3_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(2),
      Q => analog_ch3(31),
      R => u1_Sine_n_128
    );
\analog_ch3_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_25,
      Q => analog_ch3(3),
      S => u1_Sine_n_133
    );
\analog_ch3_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_24,
      Q => analog_ch3(4),
      S => u1_Sine_n_132
    );
\analog_ch3_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_23,
      Q => analog_ch3(5),
      S => u1_Sine_n_131
    );
\analog_ch3_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_22,
      Q => analog_ch3(6),
      S => u1_Sine_n_130
    );
\analog_ch3_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_21,
      Q => analog_ch3(7),
      S => u1_Sine_n_129
    );
\analog_ch3_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_20,
      Q => analog_ch3(8),
      S => u1_Sine_n_126
    );
\analog_ch4_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(3),
      Q => analog_ch4(31),
      R => u1_Sine_n_128
    );
\analog_ch4_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_25,
      Q => analog_ch4(4),
      S => u1_Sine_n_131
    );
\analog_ch4_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_24,
      Q => analog_ch4(5),
      S => u1_Sine_n_130
    );
\analog_ch4_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_23,
      Q => analog_ch4(6),
      S => u1_Sine_n_129
    );
\analog_ch4_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => u4_sine_n_22,
      Q => analog_ch4(7),
      S => u1_Sine_n_126
    );
\analog_ch5_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(4),
      Q => analog_ch5(31),
      R => u1_Sine_n_128
    );
\analog_ch6_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(5),
      Q => analog_ch6(31),
      R => u1_Sine_n_128
    );
\analog_ch7_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(6),
      Q => analog_ch7(31),
      R => u1_Sine_n_128
    );
\analog_ch8_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(7),
      Q => analog_ch8(31),
      R => u1_Sine_n_128
    );
\analog_ch9_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ctrl_saxi_aclk,
      CE => '1',
      D => sine_outo(8),
      Q => analog_ch9(31),
      R => u1_Sine_n_128
    );
u1_Sine: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Sine_v2_0_ctrl_saxi
     port map (
      DOADO(9 downto 0) => sine_outo(11 downto 2),
      Q(9 downto 0) => analog_ch15(26 downto 17),
      S(2) => u1_Sine_n_2,
      S(1) => u1_Sine_n_3,
      S(0) => u1_Sine_n_4,
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_AWREADY => S_AXI_AWREADY,
      S_AXI_WREADY => S_AXI_WREADY,
      analog_ch1(10) => analog_ch1(31),
      analog_ch1(9 downto 0) => analog_ch1(10 downto 1),
      analog_ch10(1) => analog_ch10(31),
      analog_ch10(0) => analog_ch10(21),
      analog_ch11(2) => analog_ch11(31),
      analog_ch11(1 downto 0) => analog_ch11(22 downto 21),
      analog_ch12(4) => analog_ch12(31),
      analog_ch12(3 downto 0) => analog_ch12(23 downto 20),
      \analog_ch13_reg[24]\(5 downto 0) => analog_ch13(24 downto 19),
      \analog_ch14_reg[25]\(7 downto 0) => analog_ch14(25 downto 18),
      analog_ch16(11 downto 0) => analog_ch16(27 downto 16),
      analog_ch17(11 downto 0) => analog_ch17(26 downto 15),
      \analog_ch18_reg[25]\(7 downto 0) => analog_ch18(25 downto 18),
      \analog_ch19_reg[24]\(5 downto 0) => analog_ch19(24 downto 19),
      \analog_ch1_reg[31]\ => u1_Sine_n_128,
      analog_ch2(8) => analog_ch2(31),
      analog_ch2(7 downto 0) => analog_ch2(9 downto 2),
      analog_ch20(4) => analog_ch20(31),
      analog_ch20(3 downto 0) => analog_ch20(23 downto 20),
      analog_ch21(2) => analog_ch21(31),
      analog_ch21(1 downto 0) => analog_ch21(22 downto 21),
      \analog_ch21_reg[21]\ => u1_Sine_n_129,
      \analog_ch21_reg[22]\ => u1_Sine_n_126,
      analog_ch22(0) => analog_ch22(31),
      analog_ch23(0) => analog_ch23(31),
      analog_ch24(0) => analog_ch24(31),
      analog_ch25(0) => analog_ch25(31),
      analog_ch26(0) => analog_ch26(31),
      analog_ch27(0) => analog_ch27(31),
      analog_ch28(4) => analog_ch28(31),
      analog_ch28(3 downto 0) => analog_ch28(7 downto 4),
      analog_ch29(6) => analog_ch29(31),
      analog_ch29(5 downto 0) => analog_ch29(8 downto 3),
      analog_ch3(6) => analog_ch3(31),
      analog_ch3(5 downto 0) => analog_ch3(8 downto 3),
      analog_ch30(8) => analog_ch30(31),
      analog_ch30(7 downto 0) => analog_ch30(9 downto 2),
      \analog_ch30_reg[8]\ => u1_Sine_n_133,
      \analog_ch30_reg[9]\ => u1_Sine_n_132,
      analog_ch31(10) => analog_ch31(31),
      analog_ch31(9 downto 0) => analog_ch31(10 downto 1),
      \analog_ch31_reg[10]\ => u1_Sine_n_130,
      \analog_ch31_reg[3]\ => u1_Sine_n_137,
      \analog_ch31_reg[4]\ => u1_Sine_n_136,
      \analog_ch31_reg[5]\ => u1_Sine_n_135,
      \analog_ch31_reg[6]\ => u1_Sine_n_134,
      \analog_ch31_reg[9]\ => u1_Sine_n_131,
      analog_ch4(4) => analog_ch4(31),
      analog_ch4(3 downto 0) => analog_ch4(7 downto 4),
      analog_ch5(0) => analog_ch5(31),
      analog_ch6(0) => analog_ch6(31),
      analog_ch7(0) => analog_ch7(31),
      analog_ch8(0) => analog_ch8(31),
      analog_ch9(0) => analog_ch9(31),
      ctrl_saxi_aclk => ctrl_saxi_aclk,
      ctrl_saxi_araddr(4 downto 0) => ctrl_saxi_araddr(4 downto 0),
      ctrl_saxi_aresetn => ctrl_saxi_aresetn,
      ctrl_saxi_arvalid => ctrl_saxi_arvalid,
      ctrl_saxi_awaddr(4 downto 0) => ctrl_saxi_awaddr(4 downto 0),
      ctrl_saxi_awvalid => ctrl_saxi_awvalid,
      ctrl_saxi_bready => ctrl_saxi_bready,
      ctrl_saxi_bvalid => ctrl_saxi_bvalid,
      ctrl_saxi_rdata(31 downto 0) => ctrl_saxi_rdata(31 downto 0),
      ctrl_saxi_rready => ctrl_saxi_rready,
      ctrl_saxi_rvalid => ctrl_saxi_rvalid,
      ctrl_saxi_wdata(31 downto 0) => ctrl_saxi_wdata(31 downto 0),
      ctrl_saxi_wstrb(3 downto 0) => ctrl_saxi_wstrb(3 downto 0),
      ctrl_saxi_wvalid => ctrl_saxi_wvalid,
      dir => dir,
      freq_trig_reg(30 downto 0) => div_factor_freqlow(30 downto 0),
      freq_trig_reg_0(3) => u1_Sine_n_36,
      freq_trig_reg_0(2) => u1_Sine_n_37,
      freq_trig_reg_0(1) => u1_Sine_n_38,
      freq_trig_reg_0(0) => u1_Sine_n_39,
      freq_trig_reg_1(3) => u1_Sine_n_40,
      freq_trig_reg_1(2) => u1_Sine_n_41,
      freq_trig_reg_1(1) => u1_Sine_n_42,
      freq_trig_reg_1(0) => u1_Sine_n_43,
      freq_trig_reg_10(3) => u1_Sine_n_102,
      freq_trig_reg_10(2) => u1_Sine_n_103,
      freq_trig_reg_10(1) => u1_Sine_n_104,
      freq_trig_reg_10(0) => u1_Sine_n_105,
      freq_trig_reg_11(3) => u1_Sine_n_106,
      freq_trig_reg_11(2) => u1_Sine_n_107,
      freq_trig_reg_11(1) => u1_Sine_n_108,
      freq_trig_reg_11(0) => u1_Sine_n_109,
      freq_trig_reg_12(3) => u1_Sine_n_110,
      freq_trig_reg_12(2) => u1_Sine_n_111,
      freq_trig_reg_12(1) => u1_Sine_n_112,
      freq_trig_reg_12(0) => u1_Sine_n_113,
      freq_trig_reg_13(3) => u1_Sine_n_114,
      freq_trig_reg_13(2) => u1_Sine_n_115,
      freq_trig_reg_13(1) => u1_Sine_n_116,
      freq_trig_reg_13(0) => u1_Sine_n_117,
      freq_trig_reg_14(3) => u1_Sine_n_118,
      freq_trig_reg_14(2) => u1_Sine_n_119,
      freq_trig_reg_14(1) => u1_Sine_n_120,
      freq_trig_reg_14(0) => u1_Sine_n_121,
      freq_trig_reg_15(3) => u1_Sine_n_122,
      freq_trig_reg_15(2) => u1_Sine_n_123,
      freq_trig_reg_15(1) => u1_Sine_n_124,
      freq_trig_reg_15(0) => u1_Sine_n_125,
      freq_trig_reg_2(3) => u1_Sine_n_44,
      freq_trig_reg_2(2) => u1_Sine_n_45,
      freq_trig_reg_2(1) => u1_Sine_n_46,
      freq_trig_reg_2(0) => u1_Sine_n_47,
      freq_trig_reg_3(3) => u1_Sine_n_48,
      freq_trig_reg_3(2) => u1_Sine_n_49,
      freq_trig_reg_3(1) => u1_Sine_n_50,
      freq_trig_reg_3(0) => u1_Sine_n_51,
      freq_trig_reg_4(3) => u1_Sine_n_52,
      freq_trig_reg_4(2) => u1_Sine_n_53,
      freq_trig_reg_4(1) => u1_Sine_n_54,
      freq_trig_reg_4(0) => u1_Sine_n_55,
      freq_trig_reg_5(3) => u1_Sine_n_56,
      freq_trig_reg_5(2) => u1_Sine_n_57,
      freq_trig_reg_5(1) => u1_Sine_n_58,
      freq_trig_reg_5(0) => u1_Sine_n_59,
      freq_trig_reg_6(3) => u1_Sine_n_60,
      freq_trig_reg_6(2) => u1_Sine_n_61,
      freq_trig_reg_6(1) => u1_Sine_n_62,
      freq_trig_reg_6(0) => u1_Sine_n_63,
      freq_trig_reg_7(2) => u1_Sine_n_64,
      freq_trig_reg_7(1) => u1_Sine_n_65,
      freq_trig_reg_7(0) => u1_Sine_n_66,
      freq_trig_reg_8(30 downto 0) => div_factor_freqhigh(30 downto 0),
      freq_trig_reg_9(3) => u1_Sine_n_98,
      freq_trig_reg_9(2) => u1_Sine_n_99,
      freq_trig_reg_9(1) => u1_Sine_n_100,
      freq_trig_reg_9(0) => u1_Sine_n_101,
      sw0 => sw0
    );
u2_freq_ce: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_frequency_trigger
     port map (
      E(0) => freq_trig,
      S(2) => u1_Sine_n_2,
      S(1) => u1_Sine_n_3,
      S(0) => u1_Sine_n_4,
      ctrl_saxi_aclk => ctrl_saxi_aclk,
      \div_factor_freqhigh_reg[12]\(3) => u1_Sine_n_114,
      \div_factor_freqhigh_reg[12]\(2) => u1_Sine_n_115,
      \div_factor_freqhigh_reg[12]\(1) => u1_Sine_n_116,
      \div_factor_freqhigh_reg[12]\(0) => u1_Sine_n_117,
      \div_factor_freqhigh_reg[16]\(3) => u1_Sine_n_110,
      \div_factor_freqhigh_reg[16]\(2) => u1_Sine_n_111,
      \div_factor_freqhigh_reg[16]\(1) => u1_Sine_n_112,
      \div_factor_freqhigh_reg[16]\(0) => u1_Sine_n_113,
      \div_factor_freqhigh_reg[20]\(3) => u1_Sine_n_106,
      \div_factor_freqhigh_reg[20]\(2) => u1_Sine_n_107,
      \div_factor_freqhigh_reg[20]\(1) => u1_Sine_n_108,
      \div_factor_freqhigh_reg[20]\(0) => u1_Sine_n_109,
      \div_factor_freqhigh_reg[24]\(3) => u1_Sine_n_102,
      \div_factor_freqhigh_reg[24]\(2) => u1_Sine_n_103,
      \div_factor_freqhigh_reg[24]\(1) => u1_Sine_n_104,
      \div_factor_freqhigh_reg[24]\(0) => u1_Sine_n_105,
      \div_factor_freqhigh_reg[28]\(3) => u1_Sine_n_98,
      \div_factor_freqhigh_reg[28]\(2) => u1_Sine_n_99,
      \div_factor_freqhigh_reg[28]\(1) => u1_Sine_n_100,
      \div_factor_freqhigh_reg[28]\(0) => u1_Sine_n_101,
      \div_factor_freqhigh_reg[30]\(30 downto 0) => div_factor_freqhigh(30 downto 0),
      \div_factor_freqhigh_reg[31]\(2) => u1_Sine_n_64,
      \div_factor_freqhigh_reg[31]\(1) => u1_Sine_n_65,
      \div_factor_freqhigh_reg[31]\(0) => u1_Sine_n_66,
      \div_factor_freqhigh_reg[4]\(3) => u1_Sine_n_122,
      \div_factor_freqhigh_reg[4]\(2) => u1_Sine_n_123,
      \div_factor_freqhigh_reg[4]\(1) => u1_Sine_n_124,
      \div_factor_freqhigh_reg[4]\(0) => u1_Sine_n_125,
      \div_factor_freqhigh_reg[8]\(3) => u1_Sine_n_118,
      \div_factor_freqhigh_reg[8]\(2) => u1_Sine_n_119,
      \div_factor_freqhigh_reg[8]\(1) => u1_Sine_n_120,
      \div_factor_freqhigh_reg[8]\(0) => u1_Sine_n_121,
      \div_factor_freqlow_reg[12]\(3) => u1_Sine_n_52,
      \div_factor_freqlow_reg[12]\(2) => u1_Sine_n_53,
      \div_factor_freqlow_reg[12]\(1) => u1_Sine_n_54,
      \div_factor_freqlow_reg[12]\(0) => u1_Sine_n_55,
      \div_factor_freqlow_reg[16]\(3) => u1_Sine_n_48,
      \div_factor_freqlow_reg[16]\(2) => u1_Sine_n_49,
      \div_factor_freqlow_reg[16]\(1) => u1_Sine_n_50,
      \div_factor_freqlow_reg[16]\(0) => u1_Sine_n_51,
      \div_factor_freqlow_reg[20]\(3) => u1_Sine_n_44,
      \div_factor_freqlow_reg[20]\(2) => u1_Sine_n_45,
      \div_factor_freqlow_reg[20]\(1) => u1_Sine_n_46,
      \div_factor_freqlow_reg[20]\(0) => u1_Sine_n_47,
      \div_factor_freqlow_reg[24]\(3) => u1_Sine_n_40,
      \div_factor_freqlow_reg[24]\(2) => u1_Sine_n_41,
      \div_factor_freqlow_reg[24]\(1) => u1_Sine_n_42,
      \div_factor_freqlow_reg[24]\(0) => u1_Sine_n_43,
      \div_factor_freqlow_reg[28]\(3) => u1_Sine_n_36,
      \div_factor_freqlow_reg[28]\(2) => u1_Sine_n_37,
      \div_factor_freqlow_reg[28]\(1) => u1_Sine_n_38,
      \div_factor_freqlow_reg[28]\(0) => u1_Sine_n_39,
      \div_factor_freqlow_reg[30]\(30 downto 0) => div_factor_freqlow(30 downto 0),
      \div_factor_freqlow_reg[4]\(3) => u1_Sine_n_60,
      \div_factor_freqlow_reg[4]\(2) => u1_Sine_n_61,
      \div_factor_freqlow_reg[4]\(1) => u1_Sine_n_62,
      \div_factor_freqlow_reg[4]\(0) => u1_Sine_n_63,
      \div_factor_freqlow_reg[8]\(3) => u1_Sine_n_56,
      \div_factor_freqlow_reg[8]\(2) => u1_Sine_n_57,
      \div_factor_freqlow_reg[8]\(1) => u1_Sine_n_58,
      \div_factor_freqlow_reg[8]\(0) => u1_Sine_n_59,
      sw0 => sw0
    );
u3_counterampl: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_counter
     port map (
      E(0) => freq_trig,
      Q(7 downto 0) => cnt_out(7 downto 0),
      ctrl_saxi_aclk => ctrl_saxi_aclk
    );
u4_sine: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sine
     port map (
      D(7 downto 0) => cnt_out(7 downto 0),
      DOADO(11 downto 0) => sine_outo(11 downto 0),
      \analog_ch10_reg[21]\ => u4_sine_n_12,
      \analog_ch11_reg[21]\ => u4_sine_n_15,
      \analog_ch12_reg[23]\(3) => u4_sine_n_26,
      \analog_ch12_reg[23]\(2) => u4_sine_n_27,
      \analog_ch12_reg[23]\(1) => u4_sine_n_28,
      \analog_ch12_reg[23]\(0) => u4_sine_n_29,
      \analog_ch13_reg[24]\(5) => u4_sine_n_30,
      \analog_ch13_reg[24]\(4) => u4_sine_n_31,
      \analog_ch13_reg[24]\(3) => u4_sine_n_32,
      \analog_ch13_reg[24]\(2) => u4_sine_n_33,
      \analog_ch13_reg[24]\(1) => u4_sine_n_34,
      \analog_ch13_reg[24]\(0) => u4_sine_n_35,
      \analog_ch14_reg[25]\(7) => u4_sine_n_36,
      \analog_ch14_reg[25]\(6) => u4_sine_n_37,
      \analog_ch14_reg[25]\(5) => u4_sine_n_38,
      \analog_ch14_reg[25]\(4) => u4_sine_n_39,
      \analog_ch14_reg[25]\(3) => u4_sine_n_40,
      \analog_ch14_reg[25]\(2) => u4_sine_n_41,
      \analog_ch14_reg[25]\(1) => u4_sine_n_42,
      \analog_ch14_reg[25]\(0) => u4_sine_n_43,
      \analog_ch15_reg[26]\(9) => u4_sine_n_44,
      \analog_ch15_reg[26]\(8) => u4_sine_n_45,
      \analog_ch15_reg[26]\(7) => u4_sine_n_46,
      \analog_ch15_reg[26]\(6) => u4_sine_n_47,
      \analog_ch15_reg[26]\(5) => u4_sine_n_48,
      \analog_ch15_reg[26]\(4) => u4_sine_n_49,
      \analog_ch15_reg[26]\(3) => u4_sine_n_50,
      \analog_ch15_reg[26]\(2) => u4_sine_n_51,
      \analog_ch15_reg[26]\(1) => u4_sine_n_52,
      \analog_ch15_reg[26]\(0) => u4_sine_n_53,
      \analog_ch17_reg[15]\ => u4_sine_n_14,
      \analog_ch17_reg[16]\ => u4_sine_n_13,
      \analog_ch17_reg[26]\(9) => u4_sine_n_54,
      \analog_ch17_reg[26]\(8) => u4_sine_n_55,
      \analog_ch17_reg[26]\(7) => u4_sine_n_56,
      \analog_ch17_reg[26]\(6) => u4_sine_n_57,
      \analog_ch17_reg[26]\(5) => u4_sine_n_58,
      \analog_ch17_reg[26]\(4) => u4_sine_n_59,
      \analog_ch17_reg[26]\(3) => u4_sine_n_60,
      \analog_ch17_reg[26]\(2) => u4_sine_n_61,
      \analog_ch17_reg[26]\(1) => u4_sine_n_62,
      \analog_ch17_reg[26]\(0) => u4_sine_n_63,
      \analog_ch18_reg[25]\(7) => u4_sine_n_64,
      \analog_ch18_reg[25]\(6) => u4_sine_n_65,
      \analog_ch18_reg[25]\(5) => u4_sine_n_66,
      \analog_ch18_reg[25]\(4) => u4_sine_n_67,
      \analog_ch18_reg[25]\(3) => u4_sine_n_68,
      \analog_ch18_reg[25]\(2) => u4_sine_n_69,
      \analog_ch18_reg[25]\(1) => u4_sine_n_70,
      \analog_ch18_reg[25]\(0) => u4_sine_n_71,
      \analog_ch19_reg[24]\(5) => u4_sine_n_72,
      \analog_ch19_reg[24]\(4) => u4_sine_n_73,
      \analog_ch19_reg[24]\(3) => u4_sine_n_74,
      \analog_ch19_reg[24]\(2) => u4_sine_n_75,
      \analog_ch19_reg[24]\(1) => u4_sine_n_76,
      \analog_ch19_reg[24]\(0) => u4_sine_n_77,
      \analog_ch1_reg[1]\ => u4_sine_n_25,
      \analog_ch1_reg[2]\ => u4_sine_n_24,
      \analog_ch20_reg[23]\(3) => u4_sine_n_78,
      \analog_ch20_reg[23]\(2) => u4_sine_n_79,
      \analog_ch20_reg[23]\(1) => u4_sine_n_80,
      \analog_ch20_reg[23]\(0) => u4_sine_n_81,
      \analog_ch29_reg[3]\ => u4_sine_n_19,
      \analog_ch29_reg[4]\ => u4_sine_n_18,
      \analog_ch30_reg[2]\ => u4_sine_n_21,
      \analog_ch30_reg[3]\ => u4_sine_n_20,
      \analog_ch31_reg[1]\ => u4_sine_n_23,
      \analog_ch31_reg[2]\ => u4_sine_n_22,
      \analog_ch31_reg[7]\ => u4_sine_n_17,
      \analog_ch31_reg[8]\ => u4_sine_n_16,
      ctrl_saxi_aclk => ctrl_saxi_aclk,
      dir => dir
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    ctrl_saxi_awaddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ctrl_saxi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    ctrl_saxi_awvalid : in STD_LOGIC;
    ctrl_saxi_awready : out STD_LOGIC;
    ctrl_saxi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ctrl_saxi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    ctrl_saxi_wvalid : in STD_LOGIC;
    ctrl_saxi_wready : out STD_LOGIC;
    ctrl_saxi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ctrl_saxi_bvalid : out STD_LOGIC;
    ctrl_saxi_bready : in STD_LOGIC;
    ctrl_saxi_araddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ctrl_saxi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    ctrl_saxi_arvalid : in STD_LOGIC;
    ctrl_saxi_arready : out STD_LOGIC;
    ctrl_saxi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ctrl_saxi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ctrl_saxi_rvalid : out STD_LOGIC;
    ctrl_saxi_rready : in STD_LOGIC;
    ctrl_saxi_aclk : in STD_LOGIC;
    ctrl_saxi_aresetn : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "zynq_soc_Sine_0_0,Sine_v2_0,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "Sine_v2_0,Vivado 2017.2";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
begin
  ctrl_saxi_bresp(1) <= \<const0>\;
  ctrl_saxi_bresp(0) <= \<const0>\;
  ctrl_saxi_rresp(1) <= \<const0>\;
  ctrl_saxi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Sine_v2_0
     port map (
      S_AXI_ARREADY => ctrl_saxi_arready,
      S_AXI_AWREADY => ctrl_saxi_awready,
      S_AXI_WREADY => ctrl_saxi_wready,
      ctrl_saxi_aclk => ctrl_saxi_aclk,
      ctrl_saxi_araddr(4 downto 0) => ctrl_saxi_araddr(6 downto 2),
      ctrl_saxi_aresetn => ctrl_saxi_aresetn,
      ctrl_saxi_arvalid => ctrl_saxi_arvalid,
      ctrl_saxi_awaddr(4 downto 0) => ctrl_saxi_awaddr(6 downto 2),
      ctrl_saxi_awvalid => ctrl_saxi_awvalid,
      ctrl_saxi_bready => ctrl_saxi_bready,
      ctrl_saxi_bvalid => ctrl_saxi_bvalid,
      ctrl_saxi_rdata(31 downto 0) => ctrl_saxi_rdata(31 downto 0),
      ctrl_saxi_rready => ctrl_saxi_rready,
      ctrl_saxi_rvalid => ctrl_saxi_rvalid,
      ctrl_saxi_wdata(31 downto 0) => ctrl_saxi_wdata(31 downto 0),
      ctrl_saxi_wstrb(3 downto 0) => ctrl_saxi_wstrb(3 downto 0),
      ctrl_saxi_wvalid => ctrl_saxi_wvalid
    );
end STRUCTURE;

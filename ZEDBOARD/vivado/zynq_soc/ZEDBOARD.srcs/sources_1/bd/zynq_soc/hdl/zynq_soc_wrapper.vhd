--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
--Date        : Mon May  6 23:03:13 2019
--Host        : BLACKHOLE running 64-bit major release  (build 9200)
--Command     : generate_target zynq_soc_wrapper.bd
--Design      : zynq_soc_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zynq_soc_wrapper is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    d5m_iic_scl_io : inout STD_LOGIC;
    d5m_iic_sda_io : inout STD_LOGIC;
    hdmi_iic_scl_io : inout STD_LOGIC;
    hdmi_iic_sda_io : inout STD_LOGIC;
    idata : in STD_LOGIC_VECTOR ( 11 downto 0 );
    ifval : in STD_LOGIC;
    ilval : in STD_LOGIC;
    io_hdmio_clk : out STD_LOGIC;
    io_hdmio_data : out STD_LOGIC_VECTOR ( 15 downto 0 );
    io_hdmio_de : out STD_LOGIC;
    io_hdmio_hsync : out STD_LOGIC;
    io_hdmio_spdif : out STD_LOGIC;
    io_hdmio_vsync : out STD_LOGIC;
    leds_8bits_tri_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    o_xclkin : out STD_LOGIC;
    pixclk : in STD_LOGIC;
    reseto : out STD_LOGIC_VECTOR ( 0 to 0 );
    sws_8bits_tri_i : in STD_LOGIC_VECTOR ( 7 downto 0 );
    trigger : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
end zynq_soc_wrapper;

architecture STRUCTURE of zynq_soc_wrapper is
  component zynq_soc is
  port (
    leds_8bits_tri_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    sws_8bits_tri_i : in STD_LOGIC_VECTOR ( 7 downto 0 );
    o_xclkin : out STD_LOGIC;
    reseto : out STD_LOGIC_VECTOR ( 0 to 0 );
    trigger : out STD_LOGIC_VECTOR ( 0 to 0 );
    idata : in STD_LOGIC_VECTOR ( 11 downto 0 );
    ifval : in STD_LOGIC;
    ilval : in STD_LOGIC;
    pixclk : in STD_LOGIC;
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    hdmi_iic_scl_i : in STD_LOGIC;
    hdmi_iic_scl_o : out STD_LOGIC;
    hdmi_iic_scl_t : out STD_LOGIC;
    hdmi_iic_sda_i : in STD_LOGIC;
    hdmi_iic_sda_o : out STD_LOGIC;
    hdmi_iic_sda_t : out STD_LOGIC;
    io_hdmio_clk : out STD_LOGIC;
    io_hdmio_data : out STD_LOGIC_VECTOR ( 15 downto 0 );
    io_hdmio_spdif : out STD_LOGIC;
    io_hdmio_de : out STD_LOGIC;
    io_hdmio_vsync : out STD_LOGIC;
    io_hdmio_hsync : out STD_LOGIC;
    d5m_iic_scl_i : in STD_LOGIC;
    d5m_iic_scl_o : out STD_LOGIC;
    d5m_iic_scl_t : out STD_LOGIC;
    d5m_iic_sda_i : in STD_LOGIC;
    d5m_iic_sda_o : out STD_LOGIC;
    d5m_iic_sda_t : out STD_LOGIC
  );
  end component zynq_soc;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal d5m_iic_scl_i : STD_LOGIC;
  signal d5m_iic_scl_o : STD_LOGIC;
  signal d5m_iic_scl_t : STD_LOGIC;
  signal d5m_iic_sda_i : STD_LOGIC;
  signal d5m_iic_sda_o : STD_LOGIC;
  signal d5m_iic_sda_t : STD_LOGIC;
  signal hdmi_iic_scl_i : STD_LOGIC;
  signal hdmi_iic_scl_o : STD_LOGIC;
  signal hdmi_iic_scl_t : STD_LOGIC;
  signal hdmi_iic_sda_i : STD_LOGIC;
  signal hdmi_iic_sda_o : STD_LOGIC;
  signal hdmi_iic_sda_t : STD_LOGIC;
begin
d5m_iic_scl_iobuf: component IOBUF
     port map (
      I => d5m_iic_scl_o,
      IO => d5m_iic_scl_io,
      O => d5m_iic_scl_i,
      T => d5m_iic_scl_t
    );
d5m_iic_sda_iobuf: component IOBUF
     port map (
      I => d5m_iic_sda_o,
      IO => d5m_iic_sda_io,
      O => d5m_iic_sda_i,
      T => d5m_iic_sda_t
    );
hdmi_iic_scl_iobuf: component IOBUF
     port map (
      I => hdmi_iic_scl_o,
      IO => hdmi_iic_scl_io,
      O => hdmi_iic_scl_i,
      T => hdmi_iic_scl_t
    );
hdmi_iic_sda_iobuf: component IOBUF
     port map (
      I => hdmi_iic_sda_o,
      IO => hdmi_iic_sda_io,
      O => hdmi_iic_sda_i,
      T => hdmi_iic_sda_t
    );
zynq_soc_i: component zynq_soc
     port map (
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      d5m_iic_scl_i => d5m_iic_scl_i,
      d5m_iic_scl_o => d5m_iic_scl_o,
      d5m_iic_scl_t => d5m_iic_scl_t,
      d5m_iic_sda_i => d5m_iic_sda_i,
      d5m_iic_sda_o => d5m_iic_sda_o,
      d5m_iic_sda_t => d5m_iic_sda_t,
      hdmi_iic_scl_i => hdmi_iic_scl_i,
      hdmi_iic_scl_o => hdmi_iic_scl_o,
      hdmi_iic_scl_t => hdmi_iic_scl_t,
      hdmi_iic_sda_i => hdmi_iic_sda_i,
      hdmi_iic_sda_o => hdmi_iic_sda_o,
      hdmi_iic_sda_t => hdmi_iic_sda_t,
      idata(11 downto 0) => idata(11 downto 0),
      ifval => ifval,
      ilval => ilval,
      io_hdmio_clk => io_hdmio_clk,
      io_hdmio_data(15 downto 0) => io_hdmio_data(15 downto 0),
      io_hdmio_de => io_hdmio_de,
      io_hdmio_hsync => io_hdmio_hsync,
      io_hdmio_spdif => io_hdmio_spdif,
      io_hdmio_vsync => io_hdmio_vsync,
      leds_8bits_tri_o(7 downto 0) => leds_8bits_tri_o(7 downto 0),
      o_xclkin => o_xclkin,
      pixclk => pixclk,
      reseto(0) => reseto(0),
      sws_8bits_tri_i(7 downto 0) => sws_8bits_tri_i(7 downto 0),
      trigger(0) => trigger(0)
    );
end STRUCTURE;

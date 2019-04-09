--01062019 [01-06-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity dataTaps is
generic (
    img_width     : integer := 4096;
    adwr_width    : integer := 15;
    p_data_width  : integer := 11;
    addr_width    : integer := 11);
port (
    aclk        : in std_logic;
    iRawData    : in rData;
    oTpData     : out rTp);
end entity;
architecture arch of dataTaps is
component tap_buffer
generic (
    img_width    : integer := 4096;
    p_data_width : integer := 11;
    addr_width   : integer := 11);
port (
    write_clk    : in std_logic;
    write_enb    : in std_logic;
    w_address    : in std_logic_vector(addr_width downto 0);
    idata        : in std_logic_vector(p_data_width downto 0);
    read_clk     : in std_logic;
    r_address    : in std_logic_vector(addr_width downto 0);
    odata        : out std_logic_vector(p_data_width downto 0));
end component;
    signal d1RawData    :  rData;
    signal d2RawData    :  rData;
    signal wrchx0_io    : std_logic :='0';
    signal wrchx1_io    : std_logic :='0';
    signal wrchx2_io    : std_logic :='0';
    signal wrchx3_io    : std_logic :='0';
    signal w1rchx0_io   : std_logic :='0';
    signal w1rchx1_io   : std_logic :='0';
    signal w1rchx2_io   : std_logic :='0';
    signal w1rchx3_io   : std_logic :='0';
    signal w2rchx0_io   : std_logic :='0';
    signal w2rchx1_io   : std_logic :='0';
    signal w2rchx2_io   : std_logic :='0';
    signal w2rchx3_io   : std_logic :='0';
    signal w3rchx0_io   : std_logic :='0';
    signal w3rchx1_io   : std_logic :='0';
    signal w3rchx2_io   : std_logic :='0';
    signal w3rchx3_io   : std_logic :='0';
    signal write_chs    : integer range 0 to 3;
    signal write_s      : std_logic;
    signal write_p      : std_logic;
    signal tap0_data    : std_logic_vector(p_data_width downto 0) := (others => '0');
    signal tap1_data    : std_logic_vector(p_data_width downto 0) := (others => '0');
    signal tap2_data    : std_logic_vector(p_data_width downto 0) := (others => '0');
    signal tap3_data    : std_logic_vector(p_data_width downto 0) := (others => '0');
begin
    process (aclk) begin
        if (rising_edge(aclk)) then
            write_s <= iRawData.valid;
        end if;
    end process;
    process (aclk) begin
    if (rising_edge(aclk) ) then
        if (write_p = '1') then
            if (write_chs = 3) then
                write_chs <= 0;
            else
                write_chs <= write_chs + 1;
            end if;
        end if;
    end if;
    end process;
    write_p   <= '1' when (write_s ='1' and iRawData.valid ='0') else '0';
    wrchx0_io <= '1' when (write_chs = 0 and iRawData.valid ='1')  else '0';
    wrchx1_io <= '1' when (write_chs = 1 and iRawData.valid ='1')  else '0';
    wrchx2_io <= '1' when (write_chs = 2 and iRawData.valid ='1')  else '0';
    wrchx3_io <= '1' when (write_chs = 3 and iRawData.valid ='1')  else '0';
    process (aclk) begin
        if (rising_edge(aclk) ) then
            d1RawData     <= iRawData;
            d2RawData     <= d1RawData;
            oTpData.pEof  <= d2RawData.pEof;
            oTpData.pSof  <= d2RawData.pSof;
            oTpData.cord  <= d2RawData.cord;
            w1rchx0_io   <= wrchx0_io;
            w1rchx1_io   <= wrchx1_io;
            w1rchx2_io   <= wrchx2_io;
            w1rchx3_io   <= wrchx3_io;
            w2rchx0_io   <= w1rchx0_io;
            w2rchx1_io   <= w1rchx1_io;
            w2rchx2_io   <= w1rchx2_io;
            w2rchx3_io   <= w1rchx3_io;
            w3rchx0_io   <= w2rchx0_io;
            w3rchx1_io   <= w2rchx1_io;
            w3rchx2_io   <= w2rchx2_io;
            w3rchx3_io   <= w2rchx3_io;
        end if;
    end process;
    oTpData.valid <= '1' when (w3rchx0_io ='1' or w3rchx1_io ='1' or w3rchx2_io ='1' or w3rchx3_io ='1')  else '0';
    tap1_readout: process(aclk) begin
    if (rising_edge(aclk) ) then
        if(wrchx0_io ='1' or w1rchx0_io ='1'     or w2rchx0_io ='1' or w3rchx0_io ='1') then
            oTpData.taps.tp1 <= tap1_data;
            oTpData.taps.tp2 <= tap2_data;
            oTpData.taps.tp3 <= tap3_data;
        elsif(wrchx1_io ='1' or w1rchx1_io ='1'  or w2rchx1_io ='1' or w3rchx1_io ='1') then
            oTpData.taps.tp1 <= tap2_data;
            oTpData.taps.tp2 <= tap3_data;
            oTpData.taps.tp3 <= tap0_data;
        elsif(wrchx2_io ='1' or w1rchx2_io ='1'  or w2rchx2_io ='1' or w3rchx2_io ='1') then
            oTpData.taps.tp1 <= tap3_data;
            oTpData.taps.tp2 <= tap0_data;
            oTpData.taps.tp3 <= tap1_data;
        elsif(wrchx3_io ='1' or w1rchx3_io ='1'  or w2rchx3_io ='1' or w3rchx3_io ='1') then
            oTpData.taps.tp1 <= tap0_data; 
            oTpData.taps.tp2 <= tap1_data; 
            oTpData.taps.tp3 <= tap2_data;		
        else
            oTpData.taps.tp1 <= (others => '0');
            oTpData.taps.tp2 <= (others => '0');
            oTpData.taps.tp3 <= (others => '0');
        end if;
    end if;
    end process tap1_readout;
int_line_d0: tap_buffer
generic map(
    img_width    => img_width,
    p_data_width => p_data_width,
    addr_width   => addr_width)
port map(
    write_clk => aclk, 
    write_enb => wrchx0_io,
    w_address => iRawData.cord.x(addr_width downto 0),
    idata     => iRawData.data,
    read_clk  => aclk, 
    r_address => iRawData.cord.x(addr_width downto 0),
    odata     => tap0_data);
int_line_d1: tap_buffer
generic map(
    img_width    => img_width,
    p_data_width => p_data_width,
    addr_width   => addr_width)
port map(
    write_clk => aclk, 
    write_enb => wrchx1_io,
    w_address => iRawData.cord.x(addr_width downto 0),
    idata     => iRawData.data,
    read_clk  => aclk, 
    r_address => iRawData.cord.x(addr_width downto 0),
    odata     => tap1_data);    
int_line_d2: tap_buffer
generic map(
    img_width    => img_width,
    p_data_width => p_data_width,
    addr_width   => addr_width)
port map(
    write_clk  => aclk, 
    write_enb  => wrchx2_io,
    w_address  => iRawData.cord.x(addr_width downto 0),
    idata      => iRawData.data,
    read_clk   => aclk, 
    r_address  => iRawData.cord.x(addr_width downto 0),
    odata      => tap2_data);
int_line_d3: tap_buffer
generic map(
    img_width    => img_width,
    p_data_width => p_data_width,
    addr_width   => addr_width)
port map(
    write_clk => aclk,
    write_enb => wrchx3_io,
    w_address => iRawData.cord.x(addr_width downto 0),
    idata     => iRawData.data,
    read_clk   => aclk, 
    r_address  => iRawData.cord.x(addr_width downto 0),
    odata      => tap3_data);
end architecture;
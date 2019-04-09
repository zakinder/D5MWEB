--01062019 [01-06-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.commonpackage.all;
entity dut_configAxis is 
generic (
    aclk_freq                   : real    := 75.00e6;
    C_config_axis_DATA_WIDTH    : integer := 32;
    C_config_axis_ADDR_WIDTH    : integer := 7);
port (
    config_axis_aclk            : out std_logic;
    config_axis_aresetn         : out std_logic;
    config_axis_awaddr          : out std_logic_vector(C_config_axis_ADDR_WIDTH-1 downto 0);
    config_axis_awprot          : out std_logic_vector(2 downto 0);
    config_axis_awvalid         : out std_logic;
    config_axis_awready         : in std_logic;
    config_axis_wdata           : out std_logic_vector(C_config_axis_DATA_WIDTH-1 downto 0);
    config_axis_wstrb           : out std_logic_vector((C_config_axis_DATA_WIDTH/8)-1 downto 0);
    config_axis_wvalid          : out std_logic;
    config_axis_wready          : in std_logic;
    config_axis_bresp           : in std_logic_vector(1 downto 0);
    config_axis_bvalid          : in std_logic;
    config_axis_bready          : out std_logic;
    config_axis_araddr          : out std_logic_vector(C_config_axis_ADDR_WIDTH-1 downto 0);
    config_axis_arprot          : out std_logic_vector(2 downto 0);
    config_axis_arvalid         : out std_logic;
    config_axis_arready         : in std_logic;
    config_axis_rdata           : in std_logic_vector(C_config_axis_DATA_WIDTH-1 downto 0);
    config_axis_rresp           : in std_logic_vector(1 downto 0);
    config_axis_rvalid          : in std_logic;
    config_axis_rready          : out std_logic);
end dut_configAxis;
architecture arch_imp of dut_configAxis is
    -------------------------------------------------------------------------  
    constant configRegister1                      : integer := 0;
    constant configRegister2                      : integer := 4;
    constant configRegister3                      : integer := 8;
    constant configRegister4                      : integer := 12;
    constant configRegister5                      : integer := 16;
    constant configRegister6                      : integer := 20;
    constant configRegister7                      : integer := 24;
    constant configRegister8                      : integer := 28;
    constant configRegister9                      : integer := 32;
    constant configRegister10                     : integer := 36;
    constant configRegister11                     : integer := 40;
    constant configRegister12                     : integer := 44;
    constant configRegister13                     : integer := 48;
    constant configRegister14                     : integer := 52;
    constant configRegister15                     : integer := 56;
    constant configRegister16                     : integer := 60;
    constant configRegister17                     : integer := 64;
    constant configRegister18                     : integer := 68;
    constant configRegister19                     : integer := 72;
    constant configRegister20                     : integer := 76;
    constant configRegister21                     : integer := 80;
    constant configRegister22                     : integer := 84;
    constant configRegister23                     : integer := 88;
    constant configRegister24                     : integer := 92;
    constant configRegister25                     : integer := 96;
    constant configRegister26                     : integer := 100;
    constant configRegister27                     : integer := 104;
    constant configRegister28                     : integer := 108;
    constant configRegister29                     : integer := 112;
    constant configRegister30                     : integer := 116;
    constant configRegister31                     : integer := 120;
    constant configRegister32                     : integer := 124;  
    -------------------------------------------------------------------------
    procedure maxi_write(
    constant Mawaddr    : integer;
    constant Mwdata     : integer;
    signal Maxi_awaddr  : out std_logic_vector(6 downto 0);
    signal Maxi_wdata   : out std_logic_vector(31 downto 0);
    signal Maxi_awvalid : out std_logic;
    signal Maxi_wvalid  : out std_logic;
    signal Maxi_awready : in std_logic;--address ready
    signal Maxi_wready  : in std_logic;--data ready
    signal Maxi_bready  : out std_logic;
    signal Maxi_bvalid  : in std_logic) is
    begin
        Maxi_awaddr  <= std_logic_vector(to_unsigned(Mawaddr, 7));
        Maxi_wdata   <= std_logic_vector(to_unsigned(Mwdata, Maxi_wdata'length));
        Maxi_awvalid <= '1';
        Maxi_wvalid  <= '1';
        wait until (Maxi_awready and Maxi_wready) = '1';
        Maxi_bready  <='1';
        wait until Maxi_bvalid = '1';  -- Write result valid
        Maxi_awvalid <= '0';
        Maxi_wvalid <= '0';
        Maxi_bready <= '1';
        wait until Maxi_bvalid = '0';-- All finished
        Maxi_bready <= '0';
    end procedure;
    -------------------------------------------------------------------------
    procedure maxi_read(
        constant araddr    : integer;
        signal axi_araddr  : out std_logic_vector(6 downto 0);
        signal axi_arready : in std_logic;
        signal axi_arvalid : out std_logic;
        signal axi_rready  : out std_logic;
        signal axi_rvalid  : in std_logic) is
        begin
            axi_araddr  <= std_logic_vector(to_unsigned(araddr, axi_araddr'length));
            axi_arvalid <= '1';
            axi_rready  <= '1';
            wait until axi_arready = '1';
            wait until axi_rvalid  = '1';
            axi_arvalid <= '0';
            axi_rready  <= '0';
    end procedure;
    -------------------------------------------------------------------------
    begin
    clk_gen(config_axis_aclk, aclk_freq);
    process begin
        config_axis_aresetn  <= '0';
    wait for 100 ns;
        config_axis_aresetn  <= '1';
    wait;
    end process;
    process begin
    config_axis_wstrb <=X"F";
    -------------------------------------------------------------------------------------------
    -- maxi_write(configRegister1,8,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid);
    -- maxi_write(configRegister2,16,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid);
    -- maxi_write(configRegister3,32,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid);
    -- maxi_write(configRegister4,64,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid); 
    -- maxi_write(configRegister5,98,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid);
    -- maxi_write(configRegister6,3,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid);
    -- maxi_write(configRegister7,1,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid);
    -- maxi_write(configRegister8,0,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid); 
    -- maxi_write(configRegister9,5,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid);
    -- maxi_write(configRegister10,16,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid);
    -- maxi_write(configRegister11,32,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid);
    -- maxi_write(configRegister12,64,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid); 
    -- maxi_write(configRegister13,8,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid);
    -- maxi_write(configRegister14,16,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid);
    -- maxi_write(configRegister15,32,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid);
    -- maxi_write(configRegister16,64,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid); 
    -- maxi_write(configRegister17,8,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid);
    -- maxi_write(configRegister18,16,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid);
    -- maxi_write(configRegister19,0,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid);
    -- maxi_write(configRegister20,127,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid); 
    -- maxi_write(configRegister21,7,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid);
    
    
    
    maxi_write(configRegister31,0,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid); 
    
    
    
    

    
    
    -- maxi_write(configRegister23,32,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid);
    -- maxi_write(configRegister24,64,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid); 
    -- maxi_write(configRegister25,8,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid);
    -- maxi_write(configRegister26,16,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid);
    -- maxi_write(configRegister27,32,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid);
    -- maxi_write(configRegister28,64,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid); 
    -- maxi_write(configRegister29,8,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid);
    -- maxi_write(configRegister30,16,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid);
    -- maxi_write(configRegister31,32,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid);
    -- maxi_write(configRegister32,64,config_axis_awaddr,config_axis_wdata,config_axis_awvalid,config_axis_wvalid,config_axis_awready,config_axis_wready,config_axis_bready,config_axis_bvalid);
    -------------------------------------------------------------------------------------------

    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister1, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister2, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister3, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister4, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister5, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister6, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister7, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister8, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister9, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister10, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister11, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister12, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister13, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister14, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister15, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister16, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister17, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister18, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister19, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister20, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister21, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister22, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister23, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister24, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister25, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister26, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister27, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister28, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    -- maxi_read(configRegister29, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
     maxi_read(configRegister30, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
     maxi_read(configRegister31, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
     maxi_read(configRegister32, config_axis_araddr, config_axis_arready, config_axis_arvalid, config_axis_rready, config_axis_rvalid);
    --wait;
    end process;
end arch_imp;
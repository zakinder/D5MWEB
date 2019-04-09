--01212019 [01-21-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.portspackage.all;
entity videoProcess_v1_0_config_axis is
    generic (
    revision_number       : std_logic_vector(31 downto 0) := x"00000000";
    C_S_AXI_DATA_WIDTH    : integer    := 32;
    C_S_AXI_ADDR_WIDTH    : integer    := 7);
    port (
        seconds                 : in std_logic_vector(5 downto 0);
        minutes                 : in std_logic_vector(5 downto 0);
        hours                   : in std_logic_vector(4 downto 0);
        rgbCoord                : out region;
        aBusSelect              : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
        threshold               : out std_logic_vector(15 downto 0);
        videoChannel            : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
        dChannel                : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
        cChannel                : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
        pRegion                 : out poi;
        als                     : out coefficient;
        kls                     : out coefficient;
        fifoStatus              : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
        gridLockDatao           : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
        gridDataRdEn            : out std_logic;
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
end videoProcess_v1_0_config_axis;
architecture arch_imp of videoProcess_v1_0_config_axis is
    constant OPT_MEM_ADDR_BITS : integer := 4;
    constant ADDR_LSB  : integer := (C_S_AXI_DATA_WIDTH/32)+ 1;
    signal axi_awaddr            : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    signal axi_awready           : std_logic;
    signal axi_wready            : std_logic;
    signal axi_bresp             : std_logic_vector(1 downto 0);
    signal axi_bvalid            : std_logic;
    signal axi_araddr            : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    signal axi_arready           : std_logic;
    signal axi_rdata             : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal axi_rresp             : std_logic_vector(1 downto 0);
    signal axi_rvalid            : std_logic;
    signal configRegister1       : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister2       : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister3       : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister4       : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister5       : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister6       : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister7       : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister8       : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister9       : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister10      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister11      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister12      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister13      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister14      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister15      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister16      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister17      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister18      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister19      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister20      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister21      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister22      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister23      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister24      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister25      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister26      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister27      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister28      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister29      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister30      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister31      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal configRegister32      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal slv_reg_rden          : std_logic;
    signal gridDataRd            : std_logic := '0';
    signal gridDataRdPulse       : std_logic := '0';
    signal slv_reg_wren          : std_logic;
    signal reg_data_out          : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal byte_index            : integer;
    signal aw_en                 : std_logic;
begin
    S_AXI_AWREADY    <= axi_awready;
    S_AXI_WREADY     <= axi_wready;
    S_AXI_BRESP      <= axi_bresp;
    S_AXI_BVALID     <= axi_bvalid;
    S_AXI_ARREADY    <= axi_arready;
    S_AXI_RDATA      <= axi_rdata;
    S_AXI_RRESP      <= axi_rresp;
    S_AXI_RVALID     <= axi_rvalid;
    process (S_AXI_ACLK)
    begin
      if rising_edge(S_AXI_ACLK) then 
        if S_AXI_ARESETN = '0' then
          axi_awready <= '0';
          aw_en <= '1';
        else
          if (axi_awready = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1' and aw_en = '1') then
            axi_awready <= '1';
            elsif (S_AXI_BREADY = '1' and axi_bvalid = '1') then
                aw_en <= '1';
                axi_awready <= '0';
          else
            axi_awready <= '0';
          end if;
        end if;
      end if;
    end process;
    process (S_AXI_ACLK)
    begin
      if rising_edge(S_AXI_ACLK) then 
        if S_AXI_ARESETN = '0' then
          axi_awaddr <= (others => '0');
        else
          if (axi_awready = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1' and aw_en = '1') then
            axi_awaddr <= S_AXI_AWADDR;
          end if;
        end if;
      end if;                   
    end process; 
    process (S_AXI_ACLK)
    begin
      if rising_edge(S_AXI_ACLK) then 
        if S_AXI_ARESETN = '0' then
          axi_wready <= '0';
        else
          if (axi_wready = '0' and S_AXI_WVALID = '1' and S_AXI_AWVALID = '1' and aw_en = '1') then
              axi_wready <= '1';
          else
            axi_wready <= '0';
          end if;
        end if;
      end if;
    end process; 
    slv_reg_wren <= axi_wready and S_AXI_WVALID and axi_awready and S_AXI_AWVALID ;
    process (S_AXI_ACLK)
    variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0); 
    begin
      if rising_edge(S_AXI_ACLK) then 
        if S_AXI_ARESETN = '0' then
          configRegister1 <= (others => '0');
          configRegister2 <= (others => '0');
          configRegister3 <= (others => '0');
          configRegister4 <= (others => '0');
          configRegister5 <= (others => '0');
          configRegister6 <= (others => '0');
          configRegister7 <= (others => '0');
          configRegister8 <= (others => '0');
          configRegister9 <= (others => '0');
          configRegister10 <= (others => '0');
          configRegister11 <= (others => '0');
          configRegister12 <= (others => '0');
          configRegister13 <= (others => '0');
          configRegister14 <= (others => '0');
          configRegister15 <= (others => '0');
          configRegister16 <= (others => '0');
          configRegister17 <= (others => '0');
          configRegister18 <= (others => '0');
          configRegister19 <= (others => '0');
          configRegister20 <= (others => '0');
          configRegister21 <= (others => '0');
          configRegister22 <= (others => '0');
          configRegister23 <= (others => '0');
          configRegister24 <= (others => '0');
          configRegister25 <= (others => '0');
          configRegister26 <= (others => '0');
          configRegister27 <= (others => '0');
          configRegister28 <= (others => '0');
          configRegister29 <= (others => '0');
          configRegister30 <= (others => '0');
          configRegister31 <= (others => '0');
          configRegister32 <= (others => '0');
        else
          loc_addr := axi_awaddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
          if (slv_reg_wren = '1') then
            case loc_addr is
              when b"00000" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister1(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"00001" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister2(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"00010" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister3(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"00011" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister4(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"00100" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister5(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"00101" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister6(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"00110" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister7(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"00111" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister8(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"01000" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister9(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"01001" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister10(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"01010" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister11(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"01011" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister12(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"01100" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister13(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"01101" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister14(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"01110" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister15(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"01111" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister16(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"10000" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister17(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"10001" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister18(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"10010" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister19(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"10011" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister20(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"10100" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister21(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"10101" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister22(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"10110" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister23(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"10111" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister24(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"11000" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister25(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"11001" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister26(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"11010" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister27(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"11011" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister28(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"11100" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister29(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"11101" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister30(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"11110" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister31(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"11111" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    configRegister32(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when others =>
                configRegister1       <= configRegister1;
                configRegister2       <= configRegister2;
                configRegister3       <= configRegister3;
                configRegister4       <= configRegister4;
                configRegister5       <= configRegister5;
                configRegister6       <= configRegister6;
                configRegister7       <= configRegister7;
                configRegister8       <= configRegister8;
                configRegister9       <= configRegister9;
                configRegister10      <= configRegister10;
                configRegister11      <= configRegister11;
                configRegister12      <= configRegister12;
                configRegister13      <= configRegister13;
                configRegister14      <= configRegister14;
                configRegister15      <= configRegister15;
                configRegister16      <= configRegister16;
                configRegister17      <= configRegister17;
                configRegister18      <= configRegister18;
                configRegister19      <= configRegister19;
                configRegister20      <= configRegister20;
                configRegister21      <= configRegister21;
                configRegister22      <= configRegister22;
                configRegister23      <= configRegister23;
                configRegister24      <= configRegister24;
                configRegister25      <= configRegister25;
                configRegister26      <= configRegister26;
                configRegister27      <= configRegister27;
                configRegister28      <= configRegister28;
                configRegister29      <= configRegister29;
                configRegister30      <= configRegister30;
                configRegister31      <= configRegister31;
                configRegister32      <= configRegister32;
            end case;
          end if;
        end if;
      end if;                   
    end process; 
    process (S_AXI_ACLK)
    begin
      if rising_edge(S_AXI_ACLK) then 
        if S_AXI_ARESETN = '0' then
          axi_bvalid  <= '0';
          axi_bresp   <= "00"; 
        else
          if (axi_awready = '1' and S_AXI_AWVALID = '1' and axi_wready = '1' and S_AXI_WVALID = '1' and axi_bvalid = '0'  ) then
            axi_bvalid <= '1';
            axi_bresp  <= "00"; 
          elsif (S_AXI_BREADY = '1' and axi_bvalid = '1') then   
            axi_bvalid <= '0';                                 
          end if;
        end if;
      end if;                   
    end process; 
    process (S_AXI_ACLK)
    begin
      if rising_edge(S_AXI_ACLK) then 
        if S_AXI_ARESETN = '0' then
          axi_arready <= '0';
          axi_araddr  <= (others => '1');
        else
          if (axi_arready = '0' and S_AXI_ARVALID = '1') then
            axi_arready <= '1';
            axi_araddr  <= S_AXI_ARADDR;           
          else
            axi_arready <= '0';
          end if;
        end if;
      end if;                   
    end process; 
    process (S_AXI_ACLK)
    begin
      if rising_edge(S_AXI_ACLK) then
        if S_AXI_ARESETN = '0' then
          axi_rvalid <= '0';
          axi_rresp  <= "00";
        else
          if (axi_arready = '1' and S_AXI_ARVALID = '1' and axi_rvalid = '0') then
            axi_rvalid <= '1';
            axi_rresp  <= "00"; 
          elsif (axi_rvalid = '1' and S_AXI_RREADY = '1') then
            axi_rvalid <= '0';
          end if;            
        end if;
      end if;
    end process;
    slv_reg_rden <= axi_arready and S_AXI_ARVALID and (not axi_rvalid) ;
    process (seconds, minutes, hours, fifoStatus, gridLockDatao, configRegister1, configRegister8, configRegister9, configRegister10, configRegister11, configRegister12, configRegister13, configRegister14, configRegister15, configRegister16, configRegister17, configRegister18, configRegister19, configRegister20, configRegister21, configRegister22, configRegister23, configRegister24, configRegister25, configRegister26, configRegister27, configRegister28, configRegister29, configRegister30, configRegister31, configRegister32, axi_araddr, S_AXI_ARESETN, slv_reg_rden)
    variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0);
    begin
        loc_addr := axi_araddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
        case loc_addr is
          when b"00000" =>
            reg_data_out <= configRegister1;
            gridDataRd <='1';
          when b"00001" =>
            reg_data_out <= gridLockDatao;
            gridDataRd <='0';
          when b"00010" =>
            reg_data_out <= x"000000" & "0000000" & fifoStatus(0);
            gridDataRd <='0';
          when b"00011" =>
            reg_data_out <= x"000000" & "0000000" & fifoStatus(1);
            gridDataRd <='0';
          when b"00100" =>
            reg_data_out <= x"000000" & "0000000" & fifoStatus(2);
            gridDataRd <='0';
          when b"00101" =>
            reg_data_out <= x"000000" & fifoStatus(23 downto 16);
            gridDataRd <='0';
          when b"00110" =>
            reg_data_out <= revision_number;
            gridDataRd <='0';
          when b"00111" =>
            reg_data_out <= configRegister8;
            gridDataRd <='0';
          when b"01000" =>
            reg_data_out <= configRegister9;
            gridDataRd <='0';
          when b"01001" =>
            reg_data_out <= configRegister10;
            gridDataRd <='0';
          when b"01010" =>
            reg_data_out <= configRegister11;
            gridDataRd <='0';
          when b"01011" =>
            reg_data_out <= configRegister12;
            gridDataRd <='0';
          when b"01100" =>
            reg_data_out <= configRegister13;
            gridDataRd <='0';
          when b"01101" =>
            reg_data_out <= configRegister14;
            gridDataRd <='0';
          when b"01110" =>
            reg_data_out <= configRegister15;
            gridDataRd <='0';
          when b"01111" =>
            reg_data_out <= configRegister16;
            gridDataRd <='0';
          when b"10000" =>
            reg_data_out <= configRegister17;
            gridDataRd <='0';
          when b"10001" =>
            reg_data_out <= configRegister18;
            gridDataRd <='0';
          when b"10010" =>
            reg_data_out <= configRegister19;
            gridDataRd <='0';
          when b"10011" =>
            reg_data_out <= configRegister20;
            gridDataRd <='0';
          when b"10100" =>
            reg_data_out <= configRegister21;
            gridDataRd <='0';
          when b"10101" =>
            reg_data_out <= configRegister22;
            gridDataRd <='0';
          when b"10110" =>
            reg_data_out <= configRegister23;
            gridDataRd <='0';
          when b"10111" =>
            reg_data_out <= configRegister24;
            gridDataRd <='0';
          when b"11000" =>
            reg_data_out <= configRegister25;
            gridDataRd <='0';
          when b"11001" =>
            reg_data_out <= configRegister26;
            gridDataRd <='0';
          when b"11010" =>
            reg_data_out <= configRegister27;
            gridDataRd <='0';
          when b"11011" =>
            reg_data_out <= configRegister28;
            gridDataRd <='0';
          when b"11100" =>
            reg_data_out <= configRegister29;
            gridDataRd <='0';
          when b"11101" =>
          if (configRegister31 = x"00000000") then
            reg_data_out <= x"000000" & "00" & seconds;
          else
            reg_data_out <= configRegister30;
          end if;
            gridDataRd <='0';
          when b"11110" =>
          if (configRegister31 = x"00000000") then
            reg_data_out <= x"000000" & "00" & minutes;
          else
            reg_data_out <= configRegister31;
          end if;
            gridDataRd <='0';
          when b"11111" =>
          if (configRegister31 = x"00000000") then
            reg_data_out <= x"000000" & "000" & hours;
          else
            reg_data_out <= configRegister32;
          end if;
            gridDataRd <='0';
          when others =>
            gridDataRd <='0';
            reg_data_out  <= (others => '0');
        end case;
    end process;

    
    
    process( S_AXI_ACLK ) is
    begin
      if (rising_edge (S_AXI_ACLK)) then
        if ( S_AXI_ARESETN = '0' ) then
          axi_rdata  <= (others => '0');
        else
          if (slv_reg_rden = '1') then
              axi_rdata <= reg_data_out;     
          end if;   
        end if;
      end if;
    end process;
    cpuOut: process (S_AXI_ACLK)begin
    if (rising_edge (S_AXI_ACLK)) then
        rgbCoord.rl            <= configRegister1(7 downto 0);
        rgbCoord.rh            <= configRegister1(15 downto 8);
        rgbCoord.gl            <= configRegister2(7 downto 0);
        rgbCoord.gh            <= configRegister2(15 downto 8);
        rgbCoord.bl            <= configRegister3(7 downto 0);
        rgbCoord.bh            <= configRegister3(15 downto 8);
        aBusSelect             <= configRegister4;
        threshold              <= configRegister5(15 downto 0);
        videoChannel           <= configRegister6;
        dChannel               <= configRegister7;
        cChannel               <= configRegister8;
        kls.k1                 <= configRegister9;
        kls.k2                 <= configRegister10;
        kls.k3                 <= configRegister11;
        kls.k4                 <= configRegister12;
        kls.k5                 <= configRegister13;
        kls.k6                 <= configRegister14;
        kls.k7                 <= configRegister15;
        kls.k8                 <= configRegister16;
        kls.k9                 <= configRegister17;
        kls.config             <= to_integer(unsigned(configRegister18));
        pRegion.pointInterest  <= to_integer(unsigned(configRegister19(15 downto 0)));
        pRegion.deltaConfig    <= to_integer(unsigned(configRegister20(15 downto 0)));
        pRegion.cpuAckLock     <=configRegister21(0);
        pRegion.cpuReadData    <=configRegister21(1);
        pRegion.cpuReadytoRead <=configRegister21(2);
        pRegion.cpuStreamMode  <=configRegister21(3);
        pRegion.cpuIdleMode    <=configRegister21(4);
        als.k1                 <= configRegister22;
        als.k2                 <= configRegister23;
        als.k3                 <= configRegister24;
        als.k4                 <= configRegister25;
        als.k5                 <= configRegister26;
        als.k6                 <= configRegister27;
        als.k7                 <= configRegister28;
        als.k8                 <= configRegister29;
        als.k9                 <= configRegister30;
        als.config             <= to_integer(unsigned(configRegister31));
    end if;
    end process cpuOut;
    process (S_AXI_ACLK)begin
        if (rising_edge (S_AXI_ACLK)) then
          if (gridDataRd ='1' and gridDataRdPulse ='0') then
            gridDataRdEn <= '1';
          else
            gridDataRdEn <= '0';
          end if;
        end if;
    end process;    
    process (S_AXI_ACLK)begin
        if (rising_edge (S_AXI_ACLK)) then
            gridDataRdPulse <= gridDataRd;
        end if;
    end process;
end arch_imp;
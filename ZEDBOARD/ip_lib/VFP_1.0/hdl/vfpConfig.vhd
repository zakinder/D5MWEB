--02072019 [02-07-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity videoProcess_v1_0_Config is
    generic (
        revision_number       : std_logic_vector(31 downto 0) := x"00000000";
        C_S_AXI_DATA_WIDTH    : integer    := 32;
        C_S_AXI_ADDR_WIDTH    : integer    := 8);
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
        oRgbOsharp              : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
        oEdgeType               : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
        pRegion                 : out poi;
        als                     : out coefficient;
        kls                     : out coefficient;
        fifoStatus              : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
        gridLockDatao           : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
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
end videoProcess_v1_0_Config;
architecture arch_imp of videoProcess_v1_0_Config is
	constant ADDR_LSB            : integer := (C_S_AXI_DATA_WIDTH/32)+ 1;
	constant OPT_MEM_ADDR_BITS   : integer := 5;
	signal axi_awaddr	         : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
	signal axi_awready	         : std_logic;
	signal axi_wready	         : std_logic;
	signal axi_bresp	         : std_logic_vector(1 downto 0);
	signal axi_bvalid	         : std_logic;
	signal axi_araddr	         : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
	signal axi_arready	         : std_logic;
	signal axi_rdata	         : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal axi_rresp	         : std_logic_vector(1 downto 0);
	signal axi_rvalid	         : std_logic;
    signal configRegister0       : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
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
	signal configRegister33	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister34	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister35	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister36	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister37	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister38	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister39	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister40	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister41	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister42	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister43	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister44	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister45	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister46	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister47	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister48	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister49	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister50	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister51	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister52	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister53	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister54	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister55	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister56	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister57	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister58	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister59	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister60	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister61	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister62	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal configRegister63	     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal slv_reg_rden          : std_logic;
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
	      configRegister0 <= (others => '0');
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
	      configRegister33 <= (others => '0');
	      configRegister34 <= (others => '0');
	      configRegister35 <= (others => '0');
	      configRegister36 <= (others => '0');
	      configRegister37 <= (others => '0');
	      configRegister38 <= (others => '0');
	      configRegister39 <= (others => '0');
	      configRegister40 <= (others => '0');
	      configRegister41 <= (others => '0');
	      configRegister42 <= (others => '0');
	      configRegister43 <= (others => '0');
	      configRegister44 <= (others => '0');
	      configRegister45 <= (others => '0');
	      configRegister46 <= (others => '0');
	      configRegister47 <= (others => '0');
	      configRegister48 <= (others => '0');
	      configRegister49 <= (others => '0');
	      configRegister50 <= (others => '0');
	      configRegister51 <= (others => '0');
	      configRegister52 <= (others => '0');
	      configRegister53 <= (others => '0');
	      configRegister54 <= (others => '0');
	      configRegister55 <= (others => '0');
	      configRegister56 <= (others => '0');
	      configRegister57 <= (others => '0');
	      configRegister58 <= (others => '0');
	      configRegister59 <= (others => '0');
	      configRegister60 <= (others => '0');
	      configRegister61 <= (others => '0');
	      configRegister62 <= (others => '0');
	      configRegister63 <= (others => '0');
	    else
	      loc_addr := axi_awaddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
	      if (slv_reg_wren = '1') then
	        case loc_addr is
	          when b"000000" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister0(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"000001" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister1(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"000010" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister2(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"000011" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister3(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"000100" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister4(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"000101" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister5(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"000110" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister6(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"000111" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister7(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"001000" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister8(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"001001" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister9(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"001010" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister10(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"001011" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister11(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"001100" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister12(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"001101" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister13(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"001110" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister14(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"001111" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister15(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"010000" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister16(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"010001" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister17(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"010010" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister18(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"010011" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister19(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"010100" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister20(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"010101" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister21(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"010110" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister22(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"010111" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister23(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"011000" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister24(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"011001" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister25(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"011010" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister26(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"011011" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister27(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"011100" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister28(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"011101" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister29(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"011110" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister30(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"011111" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister31(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"100000" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister32(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"100001" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister33(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"100010" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister34(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"100011" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister35(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"100100" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister36(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"100101" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister37(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"100110" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister38(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"100111" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister39(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"101000" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister40(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"101001" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister41(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"101010" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister42(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"101011" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister43(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"101100" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister44(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"101101" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister45(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"101110" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister46(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"101111" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister47(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"110000" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister48(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"110001" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister49(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"110010" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister50(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"110011" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister51(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"110100" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister52(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"110101" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister53(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"110110" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister54(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"110111" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister55(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"111000" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister56(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"111001" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister57(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"111010" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister58(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"111011" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister59(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"111100" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister60(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"111101" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister61(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"111110" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister62(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"111111" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                configRegister63(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when others =>
                --stored cpu values
	            configRegister0 <= configRegister0;
	            configRegister1 <= configRegister1;
	            configRegister2 <= configRegister2;
	            configRegister3 <= configRegister3;
	            configRegister4 <= configRegister4;
	            configRegister5 <= configRegister5;
	            configRegister6 <= configRegister6;
	            configRegister7 <= configRegister7;
	            configRegister8 <= configRegister8;
	            configRegister9 <= configRegister9;
	            configRegister10 <= configRegister10;
	            configRegister11 <= configRegister11;
	            configRegister12 <= configRegister12;
	            configRegister13 <= configRegister13;
	            configRegister14 <= configRegister14;
	            configRegister15 <= configRegister15;
	            configRegister16 <= configRegister16;
	            configRegister17 <= configRegister17;
	            configRegister18 <= configRegister18;
	            configRegister19 <= configRegister19;
	            configRegister20 <= configRegister20;
	            configRegister21 <= configRegister21;
	            configRegister22 <= configRegister22;
	            configRegister23 <= configRegister23;
	            configRegister24 <= configRegister24;
	            configRegister25 <= configRegister25;
	            configRegister26 <= configRegister26;
	            configRegister27 <= configRegister27;
	            configRegister28 <= configRegister28;
	            configRegister29 <= configRegister29;
	            configRegister30 <= configRegister30;
	            configRegister31 <= configRegister31;
	            configRegister32 <= configRegister32;
	            configRegister33 <= configRegister33;
	            configRegister34 <= configRegister34;
	            configRegister35 <= configRegister35;
	            configRegister36 <= configRegister36;
	            configRegister37 <= configRegister37;
	            configRegister38 <= configRegister38;
	            configRegister39 <= configRegister39;
	            configRegister40 <= configRegister40;
	            configRegister41 <= configRegister41;
	            configRegister42 <= configRegister42;
	            configRegister43 <= configRegister43;
	            configRegister44 <= configRegister44;
	            configRegister45 <= configRegister45;
	            configRegister46 <= configRegister46;
	            configRegister47 <= configRegister47;
	            configRegister48 <= configRegister48;
	            configRegister49 <= configRegister49;
	            configRegister50 <= configRegister50;
	            configRegister51 <= configRegister51;
	            configRegister52 <= configRegister52;
	            configRegister53 <= configRegister53;
	            configRegister54 <= configRegister54;
	            configRegister55 <= configRegister55;
	            configRegister56 <= configRegister56;
	            configRegister57 <= configRegister57;
	            configRegister58 <= configRegister58;
	            configRegister59 <= configRegister59;
	            configRegister60 <= configRegister60;
	            configRegister61 <= configRegister61;
	            configRegister62 <= configRegister62;
	            configRegister63 <= configRegister63;
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
    slv_reg_rden <= axi_arready and S_AXI_ARVALID and (not axi_rvalid);
    process (seconds, minutes, hours, fifoStatus, gridLockDatao,axi_araddr, S_AXI_ARESETN, slv_reg_rden, configRegister0, configRegister1, configRegister2, configRegister3, configRegister4, configRegister5, configRegister6, configRegister7, configRegister8, configRegister9, configRegister10, configRegister11, configRegister12, configRegister13, configRegister14, configRegister15, configRegister16, configRegister17, configRegister18, configRegister19, configRegister20, configRegister21, configRegister22, configRegister23, configRegister24, configRegister25, configRegister26, configRegister27, configRegister28, configRegister29, configRegister30, configRegister31, configRegister32, configRegister33, configRegister34, configRegister35, configRegister36, configRegister37, configRegister38, configRegister39, configRegister40, configRegister41, configRegister42, configRegister43, configRegister44, configRegister45, configRegister46, configRegister47, configRegister48, configRegister49, configRegister50, configRegister51, configRegister52, configRegister53, configRegister54, configRegister55, configRegister56, configRegister57, configRegister58, configRegister59, configRegister60, configRegister61, configRegister62, configRegister63)
    variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0);
    begin
        loc_addr := axi_araddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
        case loc_addr is
          when b"000000" =>
            reg_data_out <= configRegister0;
          when b"000001" =>
            reg_data_out <= configRegister1;
          when b"000010" =>
            reg_data_out <= configRegister2;
          when b"000011" =>
            reg_data_out <= configRegister3;
          when b"000100" =>
            reg_data_out <= configRegister4;
          when b"000101" =>
            reg_data_out <= configRegister5;
          when b"000110" =>
            reg_data_out <= configRegister6;
          when b"000111" =>
            reg_data_out <= configRegister7;
          when b"001000" =>
            reg_data_out <= configRegister8;
          when b"001001" =>
            reg_data_out <= configRegister9;
          when b"001010" =>
            reg_data_out <= configRegister10;
          when b"001011" =>
            reg_data_out <= configRegister11;
          when b"001100" =>
            reg_data_out <= configRegister12;
          when b"001101" =>
            reg_data_out <= configRegister13;
          when b"001110" =>
            reg_data_out <= configRegister14;
          when b"001111" =>
            reg_data_out <= configRegister15;
          when b"010000" =>
            reg_data_out <= configRegister16;
          when b"010001" =>
            reg_data_out <= configRegister17;
          when b"010010" =>
            reg_data_out <= configRegister18;
          when b"010011" =>
            reg_data_out <= configRegister19;
          when b"010100" =>
            reg_data_out <= configRegister20;
          when b"010101" =>
            reg_data_out <= configRegister21;
          when b"010110" =>
            reg_data_out <= configRegister22;
          when b"010111" =>
            reg_data_out <= configRegister23;
          when b"011000" =>
            reg_data_out <= configRegister24;
          when b"011001" =>
            reg_data_out <= configRegister25;
          when b"011010" =>
            reg_data_out <= configRegister26;
          when b"011011" =>
            reg_data_out <= configRegister27;
          when b"011100" =>
            reg_data_out <= configRegister28;
          when b"011101" =>
	        reg_data_out <= configRegister29;
          when b"011110" =>
	        reg_data_out <= configRegister30;
          when b"011111" =>
	        reg_data_out <= configRegister31;
	      when b"100000" =>
	        reg_data_out <= configRegister32;
	      when b"100001" =>
	        reg_data_out <= configRegister33;
	      when b"100010" =>
	        reg_data_out <= configRegister34;
	      when b"100011" =>
	        reg_data_out <= configRegister35;
	      when b"100100" =>
	        reg_data_out <= configRegister36;
	      when b"100101" =>
	        reg_data_out <= configRegister37;
	      when b"100110" =>
	        reg_data_out <= gridLockDatao;--fifoDataIn
	      when b"100111" =>
	        reg_data_out <= x"000000" & "0000000" & fifoStatus(0);--offFrameDataARM
	      when b"101000" =>
	        reg_data_out <= x"000000" & "0000000" & fifoStatus(1);--fifoEmptyh
	      when b"101001" =>
	        reg_data_out <= x"000000" & "0000000" & fifoStatus(2);--fifoFullh
	      when b"101010" =>
	        reg_data_out <= x"000000" & fifoStatus(23 downto 16);--cpuGridCont
	      when b"101011" =>
	        reg_data_out <= configRegister43;
	      when b"101100" =>
	        reg_data_out <= configRegister44;
	      when b"101101" =>
	        reg_data_out <= configRegister45;
	      when b"101110" =>
	        reg_data_out <= configRegister46;
	      when b"101111" =>
	        reg_data_out <= configRegister47;
	      when b"110000" =>
	        reg_data_out <= configRegister48;
	      when b"110001" =>
	        reg_data_out <= configRegister49;
	      when b"110010" =>
	        reg_data_out <= configRegister50;
	      when b"110011" =>
	        reg_data_out <= configRegister51;
	      when b"110100" =>
	        reg_data_out <= configRegister52;
	      when b"110101" =>
	        reg_data_out <= configRegister53;
	      when b"110110" =>
	        reg_data_out <= configRegister54;
	      when b"110111" =>
	        reg_data_out <= configRegister55;
	      when b"111000" =>
	        reg_data_out <= configRegister56;
	      when b"111001" =>
	        reg_data_out <= configRegister57;
	      when b"111010" =>
	        reg_data_out <= configRegister58;
	      when b"111011" =>
	        reg_data_out <= configRegister59;
	      when b"111100" =>
	        reg_data_out <= x"000000" & "00" & seconds;
	      when b"111101" =>
	        reg_data_out <= x"000000" & "00" & minutes;
	      when b"111110" =>
	        reg_data_out <= x"000000" & "000" & hours;
	      when b"111111" =>
	        reg_data_out <= revision_number;
          when others =>
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
        oRgbOsharp              <= configRegister0;
        oEdgeType               <= configRegister1;
        aBusSelect              <= configRegister3;
        threshold               <= configRegister4(15 downto 0);
        videoChannel            <= configRegister5;
        dChannel                <= configRegister6;
        cChannel                <= configRegister7;
        kls.k1                  <= configRegister8;
        kls.k2                  <= configRegister9;
        kls.k3                  <= configRegister10;
        kls.k4                  <= configRegister11;
        kls.k5                  <= configRegister12;
        kls.k6                  <= configRegister13;
        kls.k7                  <= configRegister14;
        kls.k8                  <= configRegister15;
        kls.k9                  <= configRegister16;
        kls.config              <= to_integer(unsigned(configRegister17));
        als.k1                  <= configRegister21;
        als.k2                  <= configRegister22;
        als.k3                  <= configRegister23;
        als.k4                  <= configRegister24;
        als.k5                  <= configRegister25;
        als.k6                  <= configRegister26;
        als.k7                  <= configRegister27;
        als.k8                  <= configRegister28;
        als.k9                  <= configRegister29;
        als.config              <= to_integer(unsigned(configRegister30));
        pRegion.pointInterest   <= to_integer(unsigned(configRegister31(15 downto 0)));--set the point
        pRegion.deltaConfig     <= to_integer(unsigned(configRegister32(15 downto 0)));--set the point delta
        pRegion.cpuAckGoAgain   <= configRegister33(0);
        pRegion.cpuWgridLock    <= configRegister34(0);
        pRegion.cpuAckoffFrame  <= configRegister35(0);
        pRegion.fifoReadAddress <= configRegister36(13 downto 0);--fifo read address location upto cpuGridCont[Max-Locations]
        pRegion.fifoReadEnable  <= configRegister36(16);--fifo read enable
        pRegion.clearFifoData   <= configRegister37(0);--clear the fifo
        rgbCoord.rl             <= configRegister50(7 downto 0);
        rgbCoord.rh             <= configRegister51(7 downto 0);
        rgbCoord.gl             <= configRegister52(7 downto 0);
        rgbCoord.gh             <= configRegister53(7 downto 0);
        rgbCoord.bl             <= configRegister54(7 downto 0);
        rgbCoord.bh             <= configRegister55(7 downto 0);
    end if;
    end process cpuOut;
end arch_imp;
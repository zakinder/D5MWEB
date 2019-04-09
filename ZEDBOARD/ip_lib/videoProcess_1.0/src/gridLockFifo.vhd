--01062019 [01-06-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity gridLockFifo is
generic (
    DATA_WIDTH :integer := 24;
    ADDR_WIDTH :integer := 14);
port (
    Data_out    :out std_logic_vector (DATA_WIDTH-1 downto 0);
    empty_out   :out std_logic;
    ReadEn_in   :in  std_logic;
    RClk        :in  std_logic;
    Data_in     :in  std_logic_vector (DATA_WIDTH-1 downto 0);
    Full_out    :out std_logic;
    WriteEn_in  :in  std_logic;
    WClk        :in  std_logic;
    cleared    :in  std_logic);
end entity;
architecture rtl of gridLockFifo is
    constant FIFO_DEPTH :integer := 2**ADDR_WIDTH;
    type RAM is array (integer range <>)of std_logic_vector (DATA_WIDTH-1 downto 0);
    signal Mem : RAM (0 to FIFO_DEPTH-1);
    signal pNextWordToWrite     :std_logic_vector (ADDR_WIDTH-1 downto 0);
    signal pNextWordToRead      :std_logic_vector (ADDR_WIDTH-1 downto 0);
    signal EqualAddresses       :std_logic;
    signal NextWriteAddressEn   :std_logic;
    signal NextReadAddressEn    :std_logic;
    signal Set_Status           :std_logic;
    signal Rst_Status           :std_logic;
    signal Status               :std_logic;
    signal PresetFull           :std_logic;
    signal PresetEmpty          :std_logic;
    signal empty,full           :std_logic;
    component graycounter is
    generic (
        counter_width :integer := 4);
    port (
        graycount_out :out std_logic_vector (counter_width-1 downto 0);
        enable_in     :in  std_logic;
        cleared       :in  std_logic;
        clk           :in  std_logic);
    end component;
begin
    process (RClk) begin
        if (rising_edge(RClk)) then
            if (ReadEn_in = '1' and empty = '0') then
                Data_out <= Mem(conv_integer(pNextWordToRead));
            end if;
        end if;
    end process;
    process (WClk) begin
        if (rising_edge(WClk)) then
            if (WriteEn_in = '1' and full = '0') then
                Mem(conv_integer(pNextWordToWrite)) <= Data_in;
            end if;
        end if;
    end process;
    NextWriteAddressEn <= WriteEn_in and (not full);
    NextReadAddressEn  <= ReadEn_in  and (not empty);
    GrayCounter_pWr : graycounter
    generic map (
    COUNTER_WIDTH => 14)
    port map (
        graycount_out => pNextWordToWrite,
        enable_in     => NextWriteAddressEn,
        cleared      => cleared,
        clk           => WClk);
    graycounter_prd : graycounter
    generic map (
    COUNTER_WIDTH => 14)
    port map (
        graycount_out => pNextWordToRead,
        enable_in     => NextReadAddressEn,
        cleared      => cleared,
        clk           => RClk);

    EqualAddresses <= '1' when (pNextWordToWrite = pNextWordToRead) else '0';
    --'Quadrant selectors' logic:
    process (pNextWordToWrite, pNextWordToRead)
        variable set_status_bit0 :std_logic;
        variable set_status_bit1 :std_logic;
        variable rst_status_bit0 :std_logic;
        variable rst_status_bit1 :std_logic;
    begin
        set_status_bit0 := pNextWordToWrite(ADDR_WIDTH-2) xnor pNextWordToRead(ADDR_WIDTH-1);
        set_status_bit1 := pNextWordToWrite(ADDR_WIDTH-1) xor  pNextWordToRead(ADDR_WIDTH-2);
        Set_Status      <= set_status_bit0 and set_status_bit1;
        rst_status_bit0 := pNextWordToWrite(ADDR_WIDTH-2) xor  pNextWordToRead(ADDR_WIDTH-1);
        rst_status_bit1 := pNextWordToWrite(ADDR_WIDTH-1) xnor pNextWordToRead(ADDR_WIDTH-2);
        Rst_Status      <= rst_status_bit0 and rst_status_bit1;
    end process;
    process (Set_Status, Rst_Status, cleared) begin--D Latch w/ Asynchronous Clear & Preset.
        if (Rst_Status = '1' or cleared = '1') then
            Status <= '0';  --Going 'Empty'.
        elsif (Set_Status = '1') then
            Status <= '1';  --Going 'Full'.
        end if;
    end process;
    --'Full_out' logic for the writing port:
    PresetFull <= Status and EqualAddresses;  --'Full' Fifo.
    process (WClk, PresetFull) begin --D Flip-Flop w/ Asynchronous Preset.
        if (PresetFull = '1') then
            full <= '1';
        elsif (rising_edge(WClk)) then
            full <= '0';
        end if;
    end process;
    Full_out <= full;
    --'empty_out' logic for the reading port:
    PresetEmpty <= not Status and EqualAddresses;  --'Empty' Fifo.
    process (RClk, PresetEmpty) begin --D Flip-Flop w/ Asynchronous Preset.
        if (PresetEmpty = '1') then
            empty <= '1';
        elsif (rising_edge(RClk)) then
            empty <= '0';
        end if;
    end process;
    empty_out <= empty;
end architecture;
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.std_logic_arith.all;
entity graycounter is
    generic (
    counter_width :integer := 4);
    port (
    graycount_out :out std_logic_vector (counter_width-1 downto 0);  
    enable_in     :in  std_logic;
    cleared      :in  std_logic;
    clk           :in  std_logic);
end entity;
architecture rtl of graycounter is
signal binarycount :std_logic_vector (13 downto 0);
begin
process (clk) begin
    if (rising_edge(clk)) then
        if (cleared = '1') then
            binarycount   <= conv_std_logic_vector(1, counter_width);  
            graycount_out <= (others=>'0');
        elsif (enable_in = '1') then
            binarycount   <= binarycount + 1;
            graycount_out <= (binarycount(13) & 
            (binarycount(13) xor binarycount(12)) & 
            (binarycount(12) xor binarycount(11)) & 
            (binarycount(11) xor binarycount(10)) & 
            (binarycount(10) xor binarycount(9)) & 
            (binarycount(9) xor binarycount(8)) & 
            (binarycount(8) xor binarycount(7)) & 
            (binarycount(7) xor binarycount(6)) & 
            (binarycount(6) xor binarycount(5)) & 
            (binarycount(5) xor binarycount(4)) & 
            (binarycount(4) xor binarycount(3)) & 
            (binarycount(3) xor binarycount(2)) & 
            (binarycount(2) xor binarycount(1)) & 
            (binarycount(1) xor binarycount(0))); 
        end if;
    end if;
end process;
end architecture;
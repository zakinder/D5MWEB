--02062019 [02-06-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity gridLockFifo is
generic (
    GFIFO_DATA_WIDTH : integer := 24;
    GFIFO_ADDR_WIDTH : integer := 14);
port (
    clk              : in  std_logic;
    clearedH         : in  std_logic;
    --READ PORT
    readEn           : in  std_logic;
    fifoReadAddress  : in  std_logic_vector (GFIFO_ADDR_WIDTH-1 downto 0);
    dataO            : out std_logic_vector (GFIFO_DATA_WIDTH-1 downto 0);
    --WRITE PORT
    writeEn          : in  std_logic;
    fifoWriteAddress : in  std_logic_vector (GFIFO_ADDR_WIDTH-1 downto 0);
    dataIn           : in  std_logic_vector (GFIFO_DATA_WIDTH-1 downto 0);
    --STATUS
    dataCapturedHp   : out std_logic;
    dataAllReadHp    : out std_logic;
    emptyO           : out std_logic;
    FullO            : out std_logic);
end entity;
architecture rtl of gridLockFifo is
    constant FIFO_DEPTH :integer := 2**GFIFO_ADDR_WIDTH;--16384
    type RAM is array (integer range <>)of std_logic_vector (GFIFO_DATA_WIDTH-1 downto 0);
    signal Mem : RAM (0 to FIFO_DEPTH-1);
    signal equalAddresses       : std_logic;
    signal nextWriteAddressEn   : std_logic;
    signal nextReadAddressEn    : std_logic;
    signal setStatus            : std_logic;
    signal rstStatus            : std_logic;
    signal Status               : std_logic;
    signal presetFull           : std_logic;
    signal PresetEmpty          : std_logic;
    signal empty                : std_logic;
    signal full                 : std_logic;
    signal fifoWriteA           : integer := 0;
    signal fifoReadA            : integer := 0;
begin
fifoWriteA <= to_integer(unsigned(fifoWriteAddress));
fifoReadA  <= to_integer(unsigned(fifoReadAddress));
    readPort: process (clk) begin
        if (rising_edge(clk)) then
            if (readEn = '1' and empty = '0') then
                dataO <= Mem(fifoReadA);
            end if;
        end if;
    end process readPort;
    
    writePort: process (clk) begin
        if (rising_edge(clk)) then
            if (writeEn = '1' and full = '0') then
                Mem(fifoWriteA) <= dataIn;
            end if;
        end if;
    end process writePort;
    
    nextWriteAddressEn <= writeEn and (not full);
    nextReadAddressEn  <= readEn  and (not empty);
    
    dataCapturedHp <= '1' when (fifoWriteA = FIFO_DEPTH-1) else '0';
    dataAllReadHp  <= '1' when (fifoReadA  = FIFO_DEPTH-1) else '0';
    
    
    equalAddresses <= '1' when (fifoWriteAddress = fifoReadAddress) else '0';
    
    process (fifoWriteAddress, fifoReadAddress)
        variable set_status_bit0 :std_logic;
        variable set_status_bit1 :std_logic;
        variable rst_status_bit0 :std_logic;
        variable rst_status_bit1 :std_logic;
    begin
        set_status_bit0 := fifoWriteAddress(GFIFO_ADDR_WIDTH-2) xnor fifoReadAddress(GFIFO_ADDR_WIDTH-1);
        set_status_bit1 := fifoWriteAddress(GFIFO_ADDR_WIDTH-1) xor  fifoReadAddress(GFIFO_ADDR_WIDTH-2);
        setStatus      <= set_status_bit0 and set_status_bit1;
        rst_status_bit0 := fifoWriteAddress(GFIFO_ADDR_WIDTH-2) xor  fifoReadAddress(GFIFO_ADDR_WIDTH-1);
        rst_status_bit1 := fifoWriteAddress(GFIFO_ADDR_WIDTH-1) xnor fifoReadAddress(GFIFO_ADDR_WIDTH-2);
        rstStatus      <= rst_status_bit0 and rst_status_bit1;
    end process;
    process (setStatus, rstStatus, clearedH) begin--D Latch w/ Asynchronous Clear & Preset.
        if (rstStatus = '1' or clearedH = '1') then
            Status <= '0';  --Going 'Empty'.
        elsif (setStatus = '1') then
            Status <= '1';  --Going 'Full'.
        end if;
    end process;
    --'FullO' logic for the writing port:
    presetFull <= Status and equalAddresses;  --'Full' Fifo.
    process (clk, presetFull) begin --D Flip-Flop w/ Asynchronous Preset.
        if (presetFull = '1') then
            full <= '1';
        elsif (rising_edge(clk)) then
            full <= '0';
        end if;
    end process;
    FullO <= full;
    --'emptyO' logic for the reading port:
    PresetEmpty <= not Status and equalAddresses;  --'Empty' Fifo.
    process (clk, PresetEmpty) begin --D Flip-Flop w/ Asynchronous Preset.
        if (PresetEmpty = '1') then
            empty <= '1';
        elsif (rising_edge(clk)) then
            empty <= '0';
        end if;
    end process;
    emptyO <= empty;
end architecture;
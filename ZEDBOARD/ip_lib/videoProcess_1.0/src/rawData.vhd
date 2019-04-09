library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity rawData is
  port (
    pixclk            : in std_logic;
    ifval             : in std_logic;
    ilval             : in std_logic;
    idata             : in std_logic_vector(11 downto 0);
	
	
	
    remainder           : out std_logic_vector(15 downto 0));
end rawData;
architecture behavioral of rawData is


signal s_axis_divisor_tvalid   :  std_logic;
signal s_axis_dividend_tvalid  :  std_logic;
signal m_axis_dout_tvalid      :  std_logic;
signal m_axis_dout_tdata       :  std_logic_vector(31 downto 0) := (others => '0');  -- tdata for channel dout

begin

-----------------------------------------------------------------------------------------
--pixclk
-----------------------------------------------------------------------------------------
--line start/end pulse
pSol <= hi when (pLineSyn = lo and ilval = hi) else lo;
pEol <= hi when (pLineSyn = hi and ilval = lo) else lo;
--frame start/end pulse
pSof <= hi when (pFrameSyn = lo and ifval = hi) else lo;
pEof <= hi when (pFrameSyn = hi and ifval = lo) else lo;
d5mDataSyncP: process(pixclk) begin
    if rising_edge(pixclk) then
        pLine       <= ilval;
        pLineSyn    <= pLine;
        pFrame      <= ifval;
        pFrameSyn   <= pFrame;
        if (pFrame = hi and pLine = hi) then
            pDataWrAddress  <= pDataWrAddress + one;
        else
            pDataWrAddress      <= zero;
        end if;
        if (pEol = hi) then
            imgWidth  <= pDataWrAddress;
        else
            imgWidth  <= imgWidth;
        end if;
        d5mLine(pDataWrAddress) <= idata;
    end if;
end process d5mDataSyncP;
-----------------------------------------------------------------------------------------
end behavioral;
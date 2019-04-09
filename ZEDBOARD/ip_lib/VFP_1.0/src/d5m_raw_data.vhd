--01062019 [01-06-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity d5m_raw_data is
generic (
    img_width         : integer := 8);
port (
    m_axis_aclk       : in std_logic;
    m_axis_aresetn    : in std_logic;
    pixclk            : in std_logic;
    ifval             : in std_logic;
    ilval             : in std_logic;
    idata             : in std_logic_vector(11 downto 0);
    oRawData          : out rData);
end d5m_raw_data;
architecture arch_imp of d5m_raw_data is
    --PIXCLK SIDE
    signal pLine          : std_logic :=lo;
    signal pFrame         : std_logic :=lo;
    signal pLineSyn       : std_logic :=lo;
    signal pDataWrAddress : integer   := zero;
    signal pSof           : std_logic :=lo;
    signal pSol           : std_logic :=lo;
    signal pEof           : std_logic :=lo;
    signal pEol           : std_logic :=lo;
    --M_AXIS_ACLK SIDE
    signal ilvalSync1     : std_logic :=lo;
    signal ilvalSync2     : std_logic :=lo;
    signal ilvalSync3     : std_logic :=lo;
    signal ilvalSync4     : std_logic :=lo;
    signal ifvalSync1     : std_logic :=lo;
    signal ifvalSync2     : std_logic :=lo;
    signal ifvalSync3     : std_logic :=lo;
    signal ifvalSync4     : std_logic :=lo;
    signal pFullSync1     : std_logic :=lo;
    signal pFullSync2     : std_logic :=lo;
    signal pFullSync3     : std_logic :=lo;
    signal pFullSync4     : std_logic :=lo;
    signal EndOfLine      : std_logic :=lo;
    signal pFull          : std_logic :=lo;
    ----
    signal rVdata         : std_logic_vector(11 downto 0):= (others => lo);
    signal rLine          : std_logic :=lo;
    type d5mSt is (readLineState,eolState,eofState,sofState);
    signal d5mStates : d5mSt; 
    signal cordx          : integer :=zero;
    signal cordy          : integer :=zero;
	signal imgWidth       : integer := 3071; --set default max
    --- SIDES : img_width is dynamic therefore need to set max for max resolution of screen
    type plineRam is array (0 to img_width) of std_logic_vector (11 downto 0);
    signal d5mLine        : plineRam := (others => (others => lo));
begin
-----------------------------------------------------------------------------------------
--pixclk
-----------------------------------------------------------------------------------------
EndOfLine <= hi when (pLineSyn = hi and ilval = lo) else lo;
d5mDataSyncP: process(pixclk) begin
    if rising_edge(pixclk) then
        pLine       <= ilval;
		pLineSyn    <= pLine;
        pFrame      <= ifval;
        if (pFrame = hi and pLine = hi) then
            pDataWrAddress  <= pDataWrAddress + one;
			pFull           <= lo;
        else
            pDataWrAddress <= zero;
			pFull          <= hi;--ram is full
        end if;
        if (EndOfLine = hi) then
            imgWidth  <= pDataWrAddress;
        else
            imgWidth  <= imgWidth;
        end if;
        d5mLine(pDataWrAddress) <= idata;
    end if;
end process d5mDataSyncP;
-----------------------------------------------------------------------------------------
cdcSignals: process (m_axis_aclk) begin
    if rising_edge(m_axis_aclk) then
        ilvalSync1  <= ilval;
        ilvalSync2  <= ilvalSync1;
		ifvalSync1  <= ifval;
        ifvalSync2  <= ifvalSync1;
		pFullSync1  <= pFull;
		pFullSync2  <= pFullSync1;
    end if;
end process cdcSignals;
edgeDetect: process (m_axis_aclk) begin
    if rising_edge(m_axis_aclk) then
        pFullSync3  <= pFullSync2;
        pFullSync4  <= pFullSync3;
        ilvalSync3  <= ilvalSync2;
        ilvalSync4  <= ilvalSync3;
		ifvalSync3  <= ifvalSync2;
        ifvalSync4  <= ifvalSync3;
    end if;
end process edgeDetect;
pSol <= hi when (ilvalSync4 = lo and ilvalSync2 = hi) else lo;--risingEdge Detect
pEol <= hi when (ilvalSync4 = hi and ilvalSync2 = lo) else lo;--fallingEdge Detect
readLineP: process (m_axis_aclk) begin
    if (rising_edge (m_axis_aclk)) then
        if (m_axis_aresetn = lo) then
            d5mStates <= sofState;
			pSof      <= lo;
			pEof      <= lo;
			rLine     <= lo;
			cordx     <= zero;
			cordy     <= zero;
        else
        case (d5mStates) is
        when sofState =>
            pEof      <= lo;
            if (ifvalSync2 = hi) and (pEol = hi) then --endOfLine and Sof
                pSof      <= hi;
                d5mStates <= readLineState;
            end if;
        when readLineState =>
            if (cordx = imgWidth) then
                rLine         <= lo;
                d5mStates     <= eolState;
                cordx         <= zero;
			else
                cordx         <= cordx + one;--start reading
				rLine         <= hi;
				pSof          <= lo;
				d5mStates     <= readLineState;
            end if;
        when eolState =>
            if (ifvalSync2 = lo)  then --endOfLine and Sof
                cordy     <= zero;
                d5mStates <= eofState;
		    elsif(pEol = hi) then
                d5mStates <= readLineState;
                cordy     <= cordy + one;
			else
                d5mStates <= eolState;
            end if;
        when eofState =>	
			d5mStates <= sofState;
            pEof      <= hi;
        when others =>
            d5mStates <= sofState;
        end case;
        end if;
    end if;
end process readLineP;
d5mLineRamP: process (m_axis_aclk) begin
    if rising_edge(m_axis_aclk) then
        rVdata <= d5mLine(cordx);
    end if;
end process d5mLineRamP;
d5mP: process (m_axis_aclk) begin
    if rising_edge(m_axis_aclk) then
        oRawData.valid  <= rLine;
        oRawData.pEof   <= pEof;
        oRawData.pSof   <= pSof;
        oRawData.cord.x <= std_logic_vector(to_unsigned(cordx, 16)); 
        oRawData.cord.y <= std_logic_vector(to_unsigned(cordy, 16)); 
        if (rLine = hi) then
            oRawData.data <= rVdata;
        else
            oRawData.data <= (others =>lo);
        end if;
    end if;
end process d5mP;
end arch_imp;
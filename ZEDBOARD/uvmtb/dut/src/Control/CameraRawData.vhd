----------------------------------------------------------------
--Last Modfied  : 01062019 [01-06-2019]
--Module        : CameraRawData
--This module read camera input control valids and data signals.
----------------------------------------------------------------
--CameraRawData is the first module inside the VFP system which 
--communicate with D5M camera.It receives the data of 12 bits 
--per pixel at each clock cycle from the cmos camera when the 
--frame valid and line valid are asserted high.Pixel clock is 
--used to synchronize 12-bits input idata on the rising edge 
--of the clock.Input valids(ilval and ifval) are used to start 
--loading idata into line data buffer.The d5mLine line buffer 
--operate on two separate clocks pixclk and m_axis_aclk.It is 
--used to store and synchronize pixel data across clock pixclk 
--and m_axis_aclk domain boundaries.When pLine and pFrame are 
--enabled, the line buffer stores the pData at each triggering 
--pixclk clock edge.As long as both valids are active high by 
--the camera, the line buffer stores the pData upto maximum 
--supported image width maxImgWidth of plineRam.
--maxImgWidth maximum image width is configured as fixed constant 
--value of img_width which is 3741.calImgWidth Image width values 
--varies which is adjusted by the camera valid signals upto 
--maximum supported value. 
----------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity CameraRawData is
generic (
    dataWidth         : integer := 12;
    img_width         : integer := 2751);
port (
    m_axis_aclk       : in std_logic;
    m_axis_aresetn    : in std_logic;
    pixclk            : in std_logic;--pixel clock
    ifval             : in std_logic;--frame valid
    ilval             : in std_logic;--line valid
    idata             : in std_logic_vector(dataWidth-1 downto 0);--bayer format data
    oRawData          : out r2xData);--m_axis_aclk sync bayer format data and control record
end CameraRawData;
architecture arch_imp of CameraRawData is
	signal maxImgWidth    : integer := img_width;--D5M max supported img_width = 2751
	--single line buffer
    type plineRam is array (0 to maxImgWidth) of std_logic_vector (dataWidth-1 downto 0);
    signal d5mLine        : plineRam := (others => (others => lo));
	-------------------------------------------------------------------------------------
    --PIXCLK SIDE
	-------------------------------------------------------------------------------------
	--synchronize valid signals
    signal pLine          : std_logic :=lo;
    signal pFrame         : std_logic :=lo;
    signal pLineSyn       : std_logic :=lo;
	--
    signal pData          : std_logic_vector(dataWidth-1 downto 0):= (others => lo);
    signal pDataWrAddress : integer   := zero;
	--End of Line pulse
    signal endOfLine      : std_logic :=lo;
	signal calImgWidth    : integer := img_width;--D5M max supported img_width = 2751
	-------------------------------------------------------------------------------------
	--M_AXIS_ACLK  SIDE
	-------------------------------------------------------------------------------------
	--synchronize valid signals
    signal ilvalSync1     : std_logic :=lo;
    signal ilvalSync2     : std_logic :=lo;
    signal ilvalSync3     : std_logic :=lo;
    signal ilvalSync4     : std_logic :=lo;
    signal ifvalSync1     : std_logic :=lo;
    signal ifvalSync2     : std_logic :=lo;
	--start of frame pulse
    signal pSof           : std_logic :=lo;
	--end of frame pulse
    signal pEof           : std_logic :=lo;
	--end of Line pulse
    signal pEolBufferFull : std_logic :=lo;
    ----
    signal rVdata         : std_logic_vector(dataWidth-1 downto 0):= (others => lo);
    signal rLine          : std_logic :=lo;
	--d5mStates States
    type d5mSt is (readLineState,eolState,eofState,sofState);
    signal d5mStates : d5mSt; 
	--
    signal cordx          : integer :=zero;
    signal cordy          : integer :=zero;

begin
-----------------------------------------------------------------------------------------
--pixclk
-----------------------------------------------------------------------------------------
--Synchronize Camera inputs
synchronized5mInputsP: process (pixclk) begin
    if rising_edge(pixclk) then
        pLine       <= ilval;
		pLineSyn    <= pLine;
        pFrame      <= ifval;
        pData       <= idata;
    end if;
end process synchronized5mInputsP;
--Generates endOfLine pulse of two clock cycles
endOfLine <= hi when (pLineSyn = hi and ilval = lo) else lo;
--Generates d5mline write addresses
d5mLineRamAdressGeneratorP: process(pixclk) begin
    if rising_edge(pixclk) then
        if (pFrame = hi and pLine = hi) then
            pDataWrAddress  <= pDataWrAddress + one;
        else
            pDataWrAddress <= zero;
        end if;
    end if;
end process d5mLineRamAdressGeneratorP;
--Update d5mline calImgWidth address
updatecalImgWidthP: process (pixclk) begin
    if rising_edge(pixclk) then
		--update calImgWidth value when endOfLine pulsed
        if (endOfLine = hi) then
            calImgWidth  <= pDataWrAddress;
        else
            calImgWidth  <= calImgWidth;
        end if;
    end if;
end process updatecalImgWidthP;
d5mLineRamWriteP: process (pixclk) begin
    if rising_edge(pixclk) then
        if (pFrame = hi and pLine = hi) then
            d5mLine(pDataWrAddress) <= pData;
        end if;
    end if;
end process d5mLineRamWriteP;
-----------------------------------------------------------------------------------------
--Line Valid cdc_synchronizer
lineValidcdcP: process (m_axis_aclk) begin
    if rising_edge(m_axis_aclk) then
        ilvalSync1  <= ilval;
        ilvalSync2  <= ilvalSync1;
        ilvalSync3  <= ilvalSync2;
        ilvalSync4  <= ilvalSync3;
    end if;
end process lineValidcdcP;
--camera contolled pEolBufferFull pulse when fallingEdge of line valid is detected
pEolBufferFull <= hi when (ilvalSync4 = hi and ilvalSync2 = lo) else lo;
--Line Valid cdc synchronizer
frameValidcdcP: process (m_axis_aclk) begin
    if rising_edge(m_axis_aclk) then
		ifvalSync1  <= ifval;
        ifvalSync2  <= ifvalSync1;
    end if;
end process frameValidcdcP;
--d5mStates state machine generate synchronized rLine,pSof,pEof cordx and cordy signals
readLineP: process (m_axis_aclk) begin
    if (rising_edge (m_axis_aclk)) then
        if (m_axis_aresetn = lo) then
            --initial state to sofState
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
			-- assert pSof hi when line buffer is full and ready to read.
            if (ifvalSync2 = hi) and (pEolBufferFull = hi) then
                pSof      <= hi;
                d5mStates <= readLineState;
            end if;
        when readLineState =>
		--only enter in this state for read operation when line buffer 
		--is full and ready to read.Once read operation is completed go to eolState state.
            if (cordx = calImgWidth) then
			    --read operation is completed.
			    --reset cordx counter and rLine low and go to eolState state.
                rLine         <= lo;
                cordx         <= zero;
                d5mStates     <= eolState;
			else
                --read line buffer data counter
                cordx         <= cordx + one;
                --assert rLine hi for valid read of line buffer data
				rLine         <= hi;
				pSof          <= lo;
				d5mStates     <= readLineState;
            end if;
        when eolState =>
		--only enter in this state once read operation is completed go to eolState state.
		--in this state check conditions are: 
		--if image frame operation is completed else check if
		--line buffer is full
            if (ifvalSync2 = lo)  then
			    --per image frame operation is completed
			    --reset cordy counter
                cordy     <= zero;
                d5mStates <= eofState;
		    elsif(pEolBufferFull = hi) then
                --line buffer is full and ready to read.
                cordy     <= cordy + one;
                d5mStates <= readLineState;
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
d5mLineRamReadP: process (m_axis_aclk) begin
    if rising_edge(m_axis_aclk) then
        rVdata <= d5mLine(cordx);
    end if;
end process d5mLineRamReadP;
cameraRawDataOutputsP: process (m_axis_aclk) begin
    if rising_edge(m_axis_aclk) then
        oRawData.valid  <= rLine;
        oRawData.pEof   <= pEof;
        oRawData.pSof   <= pSof;
        oRawData.cord.x <= std_logic_vector(to_unsigned(cordx, 16)); 
        oRawData.cord.y <= std_logic_vector(to_unsigned(cordy, 16)); 
        if (rLine = hi) then
            oRawData.data <= rVdata(11 downto 0);
            oRawData.dita <= std_logic_vector(resize(unsigned(rVdata), oRawData.dita'length));
        else
            oRawData.data <= (others =>lo);
            oRawData.dita <= (others =>lo);
        end if;
    end if;
end process cameraRawDataOutputsP;
end arch_imp;
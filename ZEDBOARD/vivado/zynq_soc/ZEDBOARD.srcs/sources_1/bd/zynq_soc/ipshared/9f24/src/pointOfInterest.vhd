--04112019 [04-11-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity pointOfInterest is
generic (
    i_data_width   : integer := 8;
    s_data_width   : integer := 16;
    b_data_width   : integer := 32);
port (
    clk            : in std_logic;
    rst_l          : in std_logic;
    iCord          : in coord;
    endOfFrame     : in std_logic;
    pRegion        : in poi;
    iRgb           : in channel;
    oRgb           : out channel;
    gridLockDatao  : out std_logic_vector(b_data_width-1 downto 0);
    fifoStatus     : out std_logic_vector(b_data_width-1 downto 0);
    oGridLocation  : out std_logic);
end entity;
architecture arch of pointOfInterest is

    constant FIFO_ADDR_WIDTH :integer := 13;
    constant FIFO_DATA_WIDTH :integer := 24;
    constant FIFO_DEPTH :integer := 2**(FIFO_ADDR_WIDTH);--8192
    
    type fState is (idle,lockReady,fifoFullStatus,fifoEmptyStatus);
    signal fifoControlState : fState;
    
    signal rgb              : channel;
    signal frameSize        : intersectPoint;
    signal initCord         : intersectPoint;
    signal newCord          : intersectPoint;
    signal grid1Cord        : intersectPoint;
    signal grid2Cord        : intersectPoint;
    signal grid3Cord        : intersectPoint;
    signal grid4Cord        : intersectPoint; 
    
    signal pXcont           : integer;
    signal pYcont           : integer;
    signal wrAddrsGlCtr     : integer := 0;
    signal point_Interest   : integer := 0;
    signal GlEnable         : std_logic;
    signal rdData           : std_logic_vector(23 downto 0);
    signal wrDataIn         : std_logic_vector(23 downto 0);
    signal clearData        : std_logic;
    signal wrEn             : std_logic; 
    signal emptyO           : std_logic; 
    signal wrDone           : std_logic; 
    signal rdDone           : std_logic; 
    signal fullO            : std_logic;
    signal wrAddress        : std_logic_vector (FIFO_ADDR_WIDTH-1 downto 0); 
    signal gridEn           : std_logic;    
    signal fifoIsFull       : std_logic;
    signal fifoIsEmpty      : std_logic;
    signal gridContMax      : std_logic_vector (15 downto 0); 
    signal pInterestWidth   : integer := 128;
    signal pInterestHight   : integer := 128;
    
    
begin

    -----------------------------------------------------------
    initCord.rht   <= 0;
    initCord.lft   <= 65535;
    initCord.top   <= 65535;
    initCord.bot   <= 0;
    frameSize.lft  <= 1;
    frameSize.rht  <= 1920;
    frameSize.top  <= 5;
    frameSize.bot  <= 1080;
    point_Interest <= pRegion.pointInterest;
    oGridLocation  <= GlEnable;
    fifoStatus     <= "00000000" & gridContMax & "00000" & fifoIsFull & fifoIsEmpty & fifoIsFull;
    gridLockDatao  <= x"00" & rdData;
    wrAddress      <= std_logic_vector(to_unsigned(wrAddrsGlCtr,13)) when (gridEn = '1');
    -----------------------------------------------------------
    
    process (clk) begin
        if (rising_edge (clk)) then
        if (rst_l = '0') then
            fifoControlState <= idle;
            gridEn           <= '0';
            fifoIsFull       <= '0';
            fifoIsEmpty      <= '0';
        else
        case (fifoControlState) is
        when idle =>
            fifoIsFull   <= '0';
            fifoIsEmpty  <= '0';
            --Enable
            if (pRegion.cpuWgridLock = '1') then
                fifoControlState <= lockReady;
                gridEn           <= '1';
            end if;
        when lockReady =>
            fifoIsFull  <= '0';
            fifoIsEmpty <= '0';
            
            --Done
            if (wrDone = '1') then
                fifoControlState <= fifoFullStatus;
                gridEn           <= '0';
            end if;
        when fifoFullStatus => 
            fifoIsFull   <= '1';--Full
            fifoIsEmpty  <= '0';
            if (wrDone = '1') then
                gridContMax <= "000" & wrAddress;
            end if;
            if (rdDone = '1') then
                fifoControlState <= fifoEmptyStatus;               
            end if;
        when fifoEmptyStatus =>
            fifoIsFull   <= '0';
            fifoIsEmpty  <= '1';
            if (pRegion.cpuAckGoAgain = '1') then
                fifoControlState <= idle;              
            end if;
        when others =>
            fifoControlState <= idle;
        end case;
        end if;
        end if;
    end process;  

    GlEnablePointer: process (clk)begin
        if rising_edge(clk) then
            wrDataIn <= (iRgb.red & iRgb.green & iRgb.blue);
            if (((pXcont >= point_Interest) and (pXcont <= point_Interest + pInterestWidth)) and ((pYcont >= point_Interest) and (pYcont <= point_Interest + pInterestHight))) 
            and (iRgb.valid = '1') then
                GlEnable     <= '1';
            else
                GlEnable     <= '0';
            end if;
            if (gridEn = '1' and GlEnable = '1') then
                wrEn         <= '1';
                wrAddrsGlCtr <= wrAddrsGlCtr + 1;
            elsif (gridEn = '1' and GlEnable = '0')then
                wrEn          <= '0';
                wrAddrsGlCtr  <= wrAddrsGlCtr;
            else
                wrEn          <= '0';
                wrAddrsGlCtr  <=  0;
            end if;
        end if;
    end process GlEnablePointer;

    gridLockFifo_int : gridLockFifo
    generic map(
        DATA_WIDTH => FIFO_DATA_WIDTH,
        ADDR_WIDTH => FIFO_ADDR_WIDTH)
    port map(
        clk            => clk,
        clrStatus      => pRegion.clearFifoData,
        --READ PORT
        rdEn           => pRegion.fifoReadEnable,
        rdAddress      => pRegion.fifoReadAddress(FIFO_ADDR_WIDTH-1 downto 0),
        dataO          => rdData,
        --WRITE PORT
        wrEn           => wrEn,
        wrAddress      => wrAddress,
        dataIn         => wrDataIn,
        --STATUS
        wrDone         => wrDone,
        rdDone         => rdDone,
        emptyO         => emptyO,
        fullO          => fullO);

    dataOutP: process (clk)begin
        if rising_edge(clk) then
            pXcont      <= to_integer((unsigned(iCord.x)));
            pYcont      <= to_integer((unsigned(iCord.y)));
            oRgb.valid  <= iRgb.valid;
            oRgb.red    <= rgb.red;
            oRgb.green  <= rgb.green;
            oRgb.blue   <= rgb.blue;
        end if;
    end process dataOutP;

    pixelCoordP: process (clk)begin
        if rising_edge(clk) then
            if iRgb.valid = '1' then
               ------------------------------------
                if (GlEnable = '1') then 
                    ------------------------------------
                    --Left Coordinate Point
                    ------------------------------------
                    if (pXcont <= newCord.lft) then
                        if ( pXcont >= frameSize.lft) then 
                            newCord.lft <= pXcont - 1;
                        end if;   
                    end if;
                    ------------------------------------
                    --Right Coordinate Point
                    ------------------------------------
                    if (pXcont >= newCord.rht) then
                        if ( pXcont <= frameSize.rht) then 
                            newCord.rht <= pXcont + 1;
                        end if;   
                    end if;
                    ------------------------------------
                    --Top Coordinate Point
                    ------------------------------------
                    if (pYcont <= newCord.top) then
                        if ( pYcont >= frameSize.top) then 
                            newCord.top <= pYcont - 1;
                        end if;   
                    end if;
                    ------------------------------------
                    --Bottom Coordinate Point
                    ------------------------------------
                    if (pYcont >= newCord.bot ) then
                        if ( pYcont <= frameSize.bot) then 
                            newCord.bot  <= pYcont + 1;
                        end if;   
                    end if;
                end if;--GlEnable
                ------------------------------------
                -- 3RD FRAME DISPLAY 1ST
                ------------------------------------
                if ((pYcont = grid4Cord.bot) and ((pXcont >= grid4Cord.lft) and (pXcont <= grid4Cord.rht)))then
                    rgb.red        <= x"FF";
                    rgb.green      <= x"00";
                    rgb.blue       <= x"00";
                elsif ((pYcont = grid4Cord.top) and ((pXcont >= grid4Cord.lft) and (pXcont <= grid4Cord.rht)))then
                    rgb.red        <= x"FF";
                    rgb.green      <= x"00";
                    rgb.blue       <= x"00";
                elsif ((pXcont = grid4Cord.lft) and ((pYcont >= grid4Cord.top) and (pYcont <= grid4Cord.bot)))then
                    rgb.red        <= x"FF";
                    rgb.green      <= x"00";
                    rgb.blue       <= x"00";
                elsif ((pXcont = grid4Cord.rht) and ((pYcont >= grid4Cord.top) and (pYcont <= grid4Cord.bot)))then
                    rgb.red        <= x"FF";
                    rgb.green      <= x"00";
                    rgb.blue       <= x"00";
                ------------------------------------
                -- 2ND FRAME DISPLAY 2ND
                ------------------------------------
                elsif ((pYcont = grid3Cord.bot) and ((pXcont >= grid3Cord.lft) and (pXcont <= grid3Cord.rht)))then
                    rgb.red        <=    x"00";
                    rgb.green      <=    x"FF";
                    rgb.blue       <=    x"00";
                elsif ((pYcont = grid3Cord.top) and ((pXcont >= grid3Cord.lft) and (pXcont <= grid3Cord.rht)))then
                    rgb.red        <=    x"00";
                    rgb.green      <=    x"FF";
                    rgb.blue       <=    x"00";
                elsif ((pXcont = grid3Cord.lft) and ((pYcont >= grid3Cord.top) and (pYcont <= grid3Cord.bot)))then
                    rgb.red        <=    x"00";
                    rgb.green      <=    x"FF";
                    rgb.blue       <=    x"00";
                elsif ((pXcont = grid3Cord.rht) and ((pYcont >= grid3Cord.top) and (pYcont <= grid3Cord.bot)))then
                    rgb.red        <=    x"00";
                    rgb.green      <=    x"FF";
                    rgb.blue       <=    x"00";
                ------------------------------------
                -- 1ST FRAME DISPLAY 3RD
                ------------------------------------
                elsif ((pYcont = grid2Cord.bot) and ((pXcont >= grid2Cord.lft) and (pXcont <= grid3Cord.rht)))then
                    rgb.red        <=    x"00";
                    rgb.green      <=    x"00";
                    rgb.blue       <=    x"FF";
                elsif ((pYcont = grid2Cord.top) and ((pXcont >= grid2Cord.lft) and (pXcont <= grid3Cord.rht)))then
                    rgb.red        <=    x"00";
                    rgb.green      <=    x"00";
                    rgb.blue       <=    x"FF";
                elsif ((pXcont = grid2Cord.lft) and ((pYcont >= grid2Cord.top) and (pYcont <= grid2Cord.bot)))then
                    rgb.red        <=    x"00";
                    rgb.green      <=    x"00";
                    rgb.blue       <=    x"FF";
                elsif ((pXcont = grid3Cord.rht) and ((pYcont >= grid2Cord.top) and (pYcont <= grid2Cord.bot)))then
                    rgb.red        <=    x"00";
                    rgb.green      <=    x"00";
                    rgb.blue       <=    x"FF";
                ------------------------------------
                -- INIT FRAME DISPLAY LAST
                ------------------------------------
                elsif ((pYcont = grid1Cord.bot) and ((pXcont >= grid1Cord.lft) and (pXcont <= grid1Cord.rht)))then
                    rgb.red        <=    x"80";
                    rgb.green      <=    x"00";
                    rgb.blue       <=    x"80";
                elsif ((pYcont = grid1Cord.top) and ((pXcont >= grid1Cord.lft) and (pXcont <= grid1Cord.rht)))then
                    rgb.red        <=    x"80";
                    rgb.green      <=    x"00";
                    rgb.blue       <=    x"80";
                elsif ((pXcont = grid1Cord.lft) and ((pYcont >= grid1Cord.top) and (pYcont <= grid1Cord.bot)))then
                    rgb.red        <=    x"80";
                    rgb.green      <=    x"00";
                    rgb.blue       <=    x"80";
                elsif ((pXcont = grid1Cord.rht) and ((pYcont >= grid1Cord.top) and (pYcont <= grid1Cord.bot)))then
                    rgb.red        <=    x"80";
                    rgb.green      <=    x"00";
                    rgb.blue       <=    x"80";
                else
                    rgb.red        <= iRgb.red;
                    rgb.green      <= iRgb.green;
                    rgb.blue       <= iRgb.blue;
                end if;
            end if;--iRgb.valid
            if (endOfFrame = '1')then
                --RESET COORDINATES TO DEFAULT
                newCord.lft       <= initCord.lft;
                newCord.rht       <= initCord.rht;
                newCord.top       <= initCord.top;
                newCord.bot       <= initCord.bot;
                -- 1ST FRAME
                grid1Cord.lft     <= newCord.lft;
                grid1Cord.rht     <= newCord.rht;
                grid1Cord.top     <= newCord.top;
                grid1Cord.bot     <= newCord.bot;
                -- 2ND FRAME
                grid2Cord.lft     <= grid1Cord.lft;
                grid2Cord.rht     <= grid1Cord.rht;
                grid2Cord.top     <= grid1Cord.top;
                grid2Cord.bot     <= grid1Cord.bot;
                -- 3RD FRAME
                grid3Cord.lft     <= grid2Cord.lft;
                grid3Cord.rht     <= grid2Cord.rht;
                grid3Cord.top     <= grid2Cord.top;
                grid3Cord.bot     <= grid2Cord.bot;
                -- 4TH FRAME
                grid4Cord.lft     <= grid3Cord.lft;
                grid4Cord.rht     <= grid3Cord.rht;
                grid4Cord.top     <= grid3Cord.top;
                grid4Cord.bot     <= grid3Cord.bot;
            end if;--endOfFrame
        end if;
    end process pixelCoordP;
end architecture;
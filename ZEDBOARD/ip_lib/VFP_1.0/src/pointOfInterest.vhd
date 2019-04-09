--02072019 [02-07-2019]
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
    iRgb           : in channel;
    oRgb           : out channel;
    iCord          : in coord;
    endOfFrame     : in std_logic;
    pRegion        : in poi;
    gridLockDatao  : out std_logic_vector(b_data_width-1 downto 0);
    fifoStatus     : out std_logic_vector(b_data_width-1 downto 0);
    oGridLocation  : out std_logic);
end entity;
architecture arch of pointOfInterest is
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
    signal gridLocationCont : integer := 0;
    signal point_Interest   : integer := 0;
    signal deltaConfig      : integer := 0;
    --------------------------------------------------------------
    type STgfifoState is (S1idle,SgridLockReady,SfifoFull,SfifoEmpty);
    signal STgfifo : STgfifoState;
    type SToffFrameState is (S2idle,SoffFrame);
    signal SToffFrame : SToffFrameState;
    --------------------------------------------------------------
    signal gridLocation     : std_logic;
    signal gridLocationR    : std_logic;
    signal gridLockData     : std_logic_vector(23 downto 0);
    signal fifoDatainR      : std_logic_vector(23 downto 0);
    signal clearData        : std_logic;
    signal fifoDatain       : std_logic_vector(23 downto 0); 
    signal fifoWriteh       : std_logic; 
    signal fifoEmptyh       : std_logic; 
    signal dataCapturedHp   : std_logic; 
    signal dataAllReadHp    : std_logic; 
    signal fifoFullh        : std_logic;
    signal lockData         : std_logic; 
    signal stateStatus      : std_logic_vector(3 downto 0);
    signal gridDataEn       : std_logic;
    signal fifoWriteAddress : std_logic_vector (13 downto 0); 
    signal gridEn           : std_logic;    
    signal fifoIsFull       : std_logic;
    signal fifoIsEmpty      : std_logic;
    signal offFrameDataARM  : std_logic;
    signal offFrameData     : std_logic;
    signal pInterestWidth   : integer := 128;
    signal pInterestHight   : integer := 128;
    signal gridContMax      : std_logic_vector (15 downto 0); 
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
    deltaConfig    <= pRegion.deltaConfig;
    oGridLocation  <= gridLocation;
    fifoStatus     <= "00000000" & gridContMax & "00000" & fifoIsFull & fifoIsEmpty & offFrameDataARM;
    gridLockDatao  <= x"00" & gridLockData;
    -----------------------------------------------------------
    process (clk) begin
        if (rising_edge (clk)) then
        if (rst_l = '0') then
            ---------------------------------------------
            STgfifo      <= S1idle;
            gridEn       <= '0';
            fifoIsFull   <= '0';
            fifoIsEmpty  <= '0';
            offFrameData <= '0';
            ---------------------------------------------
        else
        case (STgfifo) is
        when S1idle =>
            ---------------------------------------------
            gridEn       <= '0';
            fifoIsFull   <= '0';
            fifoIsEmpty  <= '0';
            offFrameData <= '0';
            ---------------------------------------------
            if (pRegion.cpuWgridLock = '1') and (endOfFrame ='0') then --CPU Would Enable [HIGHT] Grid else Idle
                STgfifo <= SgridLockReady;            
            end if;
            ---------------------------------------------
        when SgridLockReady =>
            ---------------------------------------------
            gridEn      <= '1';
            fifoIsFull  <= '0';
            fifoIsEmpty <= '0';
            if (endOfFrame ='1') then
                offFrameData <= '1';
            end if;
            ---------------------------------------------
            if (dataCapturedHp = '1') then --Fifo will assert [PULSE] When All Grid Data is Stored
                STgfifo <= SfifoFull;               
            end if;
            ---------------------------------------------
        when SfifoFull =>
            ---------------------------------------------
            gridEn       <= '0';
            fifoIsFull   <= '1';
            fifoIsEmpty  <= '0';
            offFrameData <= '0';
            if (dataCapturedHp = '1') then
                gridContMax <= "00" & fifoWriteAddress;
            end if;
            ---------------------------------------------
            if (dataAllReadHp = '1') then --Fifo will assert [PULSE] When All Data is Read
                STgfifo <= SfifoEmpty;               
            end if;
            ---------------------------------------------
        when SfifoEmpty =>
            ---------------------------------------------
            gridEn       <= '0';
            fifoIsFull   <= '0';
            fifoIsEmpty  <= '1';
            offFrameData <= '0';
            ---------------------------------------------
            if (pRegion.cpuAckGoAgain = '1') then --once CPU see fifoIsEmpty Ack [PULSE] Would be Asserted
                STgfifo <= S1idle;              
            end if;
            ---------------------------------------------
        when others =>
            STgfifo <= S1idle;
        end case;
        end if;
        end if;
    end process;  
    ----------------------------------------------------------- 
    process (clk) begin
        if (rising_edge (clk)) then
        if (rst_l = '0') then
            ---------------------------------------------
            SToffFrame       <= S2idle;
            offFrameDataARM  <= '0';
            ---------------------------------------------
        else
        case (SToffFrame) is
        when S2idle =>
            ---------------------------------------------
            offFrameDataARM      <= '0';
            ---------------------------------------------
            if (offFrameData ='1') then
                SToffFrame <= SoffFrame;            
            end if;
            ---------------------------------------------
        when SoffFrame =>
            ---------------------------------------------
            offFrameDataARM <= '1';
            ---------------------------------------------
            if (pRegion.cpuAckoffFrame = '1') then
                SToffFrame <= S2idle;               
            end if;
            ---------------------------------------------
        when others =>
            SToffFrame <= S2idle;
        end case;
        end if;
        end if;
    end process; 
    -----------------------------------------------------------
    pixelRangeP: process (clk)begin
        if rising_edge(clk) then
            if (((pXcont >= point_Interest) and (pXcont <= point_Interest + pInterestWidth)) and ((pYcont >= point_Interest) and (pYcont <= point_Interest + pInterestHight))) and (gridEn = '1') and (iRgb.valid = '1')then
                gridLocation <='1';
            else
                gridLocation <='0';
            end if;
            gridLocationR <= gridLocation;
        end if;
    end process pixelRangeP;
    gridLocationP: process (clk)begin
        if rising_edge(clk) then
            if (gridLocation ='1') and (endOfFrame ='0') then
                gridLocationCont <= gridLocationCont + 1;
            elsif(dataCapturedHp ='1') then
                gridLocationCont <= 0;--Only Reset When dataCapturedHp is still High
            else
                gridLocationCont <= gridLocationCont;--OffFrame Data if endOfFrame asserted H and dataCapturedHp is still Low
            end if;
        end if;
    end process gridLocationP;
    -----------------------------------------------------------
    fifoWriteP: process (clk)begin
        if rising_edge(clk) then
        --FIXED RANGE
            if (gridLocationR = '1') then
                --WRITE PORT
                fifoWriteh          <= '1';
                fifoDatainR         <= (iRgb.red & iRgb.green & iRgb.blue);
            else
                fifoWriteh          <= '0';
                fifoDatainR         <= (others => '0');
            end if;
            fifoWriteAddress       <= std_logic_vector(to_unsigned(gridLocationCont,14));
        end if;
    end process fifoWriteP;
    -- fifoclearDataP: process (clk)begin
        -- if rising_edge(clk) then
            -- if (pRegion.clearFifoData = '1') then
                -- clearData  <= '1';
            -- else
                -- clearData  <= '0';
            -- end if;
        -- end if;
    -- end process fifoclearDataP;
    gridLockFifo_int : gridLockFifo
    generic map(
        GFIFO_DATA_WIDTH => 24,
        GFIFO_ADDR_WIDTH => 14)
    port map(
        clk              => clk,
        clearedH         => pRegion.clearFifoData,
        --READ PORT
        readEn           => pRegion.fifoReadEnable,
        fifoReadAddress  => pRegion.fifoReadAddress(13 downto 0),
        dataO            => gridLockData,
        --WRITE PORT
        writeEn          => fifoWriteh,
        fifoWriteAddress => fifoWriteAddress,
        dataIn           => fifoDatainR,
        --STATUS
        dataCapturedHp   => dataCapturedHp,
        dataAllReadHp    => dataAllReadHp,
        emptyO           => fifoEmptyh,
        FullO            => fifoFullh);
    -----------------------------------------------------------
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
    -----------------------------------------------------------
    pixelCoordP: process (clk)begin
        if rising_edge(clk) then
            if iRgb.valid = '1' then
               ------------------------------------
                if (gridLocation = '1') then 
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
                end if;--gridLocation
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
                    rgb.green     <=    x"00";
                    rgb.blue      <=    x"FF";
                elsif ((pYcont = grid2Cord.top) and ((pXcont >= grid2Cord.lft) and (pXcont <= grid3Cord.rht)))then
                    rgb.red        <=    x"00";
                    rgb.green        <=    x"00";
                    rgb.blue        <=    x"FF";
                elsif ((pXcont = grid2Cord.lft) and ((pYcont >= grid2Cord.top) and (pYcont <= grid2Cord.bot)))then
                    rgb.red        <=    x"00";
                    rgb.green        <=    x"00";
                    rgb.blue        <=    x"FF";
                elsif ((pXcont = grid3Cord.rht) and ((pYcont >= grid2Cord.top) and (pYcont <= grid2Cord.bot)))then
                    rgb.red        <=    x"00";
                    rgb.green        <=    x"00";
                    rgb.blue        <=    x"FF";
                ------------------------------------
                -- INIT FRAME DISPLAY LAST
                ------------------------------------
                elsif ((pYcont = grid1Cord.bot) and ((pXcont >= grid1Cord.lft) and (pXcont <= grid1Cord.rht)))then
                    rgb.red        <=    x"80";
                    rgb.green        <=    x"00";
                    rgb.blue        <=    x"80";
                elsif ((pYcont = grid1Cord.top) and ((pXcont >= grid1Cord.lft) and (pXcont <= grid1Cord.rht)))then
                    rgb.red        <=    x"80";
                    rgb.green        <=    x"00";
                    rgb.blue        <=    x"80";
                elsif ((pXcont = grid1Cord.lft) and ((pYcont >= grid1Cord.top) and (pYcont <= grid1Cord.bot)))then
                    rgb.red        <=    x"80";
                    rgb.green        <=    x"00";
                    rgb.blue        <=    x"80";
                elsif ((pXcont = grid1Cord.rht) and ((pYcont >= grid1Cord.top) and (pYcont <= grid1Cord.bot)))then
                    rgb.red        <=    x"80";
                    rgb.green        <=    x"00";
                    rgb.blue        <=    x"80";
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
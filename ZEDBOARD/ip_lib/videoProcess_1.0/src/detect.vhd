library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.portspackage.all;
entity detect is
generic (
    i_data_width   : integer := 8);
port (
    clk             : in std_logic;
    rst_l           : in std_logic;
    pValid          : in std_logic;
    endOfFrame      : in std_logic;
    iRed            : in std_logic_vector(i_data_width-1 downto 0);
    iGreen          : in std_logic_vector(i_data_width-1 downto 0);
    iBlue           : in std_logic_vector(i_data_width-1 downto 0);
    rgbCoord        : in region;
    Xcont           : in std_logic_vector(15 downto 0);
    Ycont           : in std_logic_vector(15 downto 0);
    pDetect         : out std_logic;
    oRed            : out std_logic_vector(i_data_width-1 downto 0);
    oGreen          : out std_logic_vector(i_data_width-1 downto 0);
    oBlue           : out std_logic_vector(i_data_width-1 downto 0);
    oValid          : out std_logic);
end entity;
architecture arch of detect is
    --------------------------------------------------------------
    signal LEFTCOORD   : unsigned(15 downto 0) := x"0001";--0
    signal RIGHTCOORD  : unsigned(15 downto 0) := x"0780";--1920
    signal TOPCOORD    : unsigned(15 downto 0) := x"0005";--5 need to fix first few lines
    signal BOTTOMCOORD : unsigned(15 downto 0) := x"0438";--1080
    --------------------------------------------------------------
    signal pEnable         : std_logic;
    --------------------------------------------------------------
    signal newRightX       : unsigned(15 downto 0) := x"0000";
    signal newLeftX        : unsigned(15 downto 0) := x"FFFF";
    signal newTopY         : unsigned(15 downto 0) := x"FFFF";
    signal newBotY         : unsigned(15 downto 0) := x"0000";
    signal updateRightX    : unsigned(15 downto 0) := x"0000";
    signal updateLeftX     : unsigned(15 downto 0) := x"FFFF";
    signal updateTopY      : unsigned(15 downto 0) := x"FFFF";
    signal updateBotY      : unsigned(15 downto 0) := x"0000";
    signal leftX           : unsigned(15 downto 0);
    signal rightX          : unsigned(15 downto 0);
    signal topY            : unsigned(15 downto 0);
    signal botY            : unsigned(15 downto 0);
    signal prevLeftX       : unsigned(15 downto 0);
    signal prevRightX      : unsigned(15 downto 0);
    signal prevTopY        : unsigned(15 downto 0);
    signal prevBotY        : unsigned(15 downto 0);
    signal prev2LeftX      : unsigned(15 downto 0);
    signal prev2RightX     : unsigned(15 downto 0);
    signal prev2TopY       : unsigned(15 downto 0);
    signal prev2BotY       : unsigned(15 downto 0);
    signal prev3LeftX      : unsigned(15 downto 0);
    signal prev3RightX     : unsigned(15 downto 0);
    signal prev3TopY       : unsigned(15 downto 0);
    signal prev3BotY       : unsigned(15 downto 0);   
    --------------------------------------------------------------
    signal pXcont          : unsigned(15 downto 0);
    signal pYcont          : unsigned(15 downto 0);
    signal Cur_Color_R     : std_logic_vector(i_data_width-1 downto 0);
    signal Cur_Color_G     : std_logic_vector(i_data_width-1 downto 0);
    signal Cur_Color_B     : std_logic_vector(i_data_width-1 downto 0); 
    --------------------------------------------------------------
begin
pDetect <= pEnable;
pixelRangeP: process (clk)begin
if rising_edge(clk) then
    if((iRed>rgbCoord.rl and iRed<rgbCoord.rh) and (iGreen>rgbCoord.gl and iGreen<rgbCoord.gh) and (iBlue>rgbCoord.bl and iBlue<rgbCoord.bh))then
        pEnable <='1';
    else
        pEnable <='0';
    end if;
end if;
end process pixelRangeP;
dataOutP: process (clk)begin
    if rising_edge(clk) then
       pXcont <=unsigned(Xcont);
       pYcont <=unsigned(Ycont);
        oValid <= pValid;
        oRed    <= Cur_Color_R;
        oGreen    <= Cur_Color_G;
        oBlue    <= Cur_Color_B;
    end if;
end process dataOutP;
pixelCoordP: process (clk)begin
    if rising_edge(clk) then
        if pValid = '1' then
           ------------------------------------
            --Process coordinate to be fetched
            ------------------------------------
            if (pEnable = '1') then 
                ------------------------------------
                --Left Coordinates
                ------------------------------------
                if (pXcont <= newLeftX) then
                    if ( pXcont >= LEFTCOORD) then 
                        newLeftX <= pXcont - x"0001";
                    end if;   
                end if;
                ------------------------------------
                --Right Coordinates
                ------------------------------------
                if (pXcont >= newRightX) then
                    if ( pXcont <= RIGHTCOORD) then 
                        newRightX <= pXcont + x"0001";
                    end if;   
                end if;
                ------------------------------------
                --Top Coordinates
                ------------------------------------
                if (pYcont <= newTopY) then
                    if ( pYcont >= TOPCOORD) then 
                        newTopY <= pYcont - x"0001";
                    end if;   
                end if;
                ------------------------------------
                --Bottom Coordinates
                ------------------------------------
                if (pYcont >= newBotY) then
                    if ( pYcont <= BOTTOMCOORD) then 
                        newBotY <= pYcont + x"0001";
                    end if;   
                end if;
            end if;--pEnable
            ------------------------------------
            -- STREAM SELECTED OBJECT PIXELS TO DISPLAY WITH MTBOX 4 COORDINATES
            ------------------------------------
            -- 3RD FRAME DISPLAY 1ST
            ------------------------------------
            if ((pYcont = prev3BotY) and ((pXcont >= prev3LeftX) and (pXcont <= prev3RightX)))then
                Cur_Color_R        <=    x"FF";
                Cur_Color_G        <=    x"00";
                Cur_Color_B        <=    x"00";
            elsif ((pYcont = prev3TopY) and ((pXcont >= prev3LeftX) and (pXcont <= prev3RightX)))then
                Cur_Color_R        <=    x"FF";
                Cur_Color_G        <=    x"00";
                Cur_Color_B        <=    x"00";
            elsif ((pXcont = prev3LeftX) and ((pYcont >= prev3TopY) and (pYcont <= prev3BotY)))then
                Cur_Color_R        <=    x"FF";
                Cur_Color_G        <=    x"00";
                Cur_Color_B        <=    x"00";
            elsif ((pXcont = prev3RightX) and ((pYcont >= prev3TopY) and (pYcont <= prev3BotY)))then
                Cur_Color_R        <=    x"FF";
                Cur_Color_G        <=    x"00";
                Cur_Color_B        <=    x"00";
            ------------------------------------
            -- 2ND FRAME DISPLAY 2ND
            ------------------------------------
            elsif ((pYcont = prev2BotY) and ((pXcont >= prev2LeftX) and (pXcont <= prev2RightX)))then
                Cur_Color_R        <=    x"00";
                Cur_Color_G        <=    x"FF";
                Cur_Color_B        <=    x"00";
            elsif ((pYcont = prev2TopY) and ((pXcont >= prev2LeftX) and (pXcont <= prev2RightX)))then
                Cur_Color_R        <=    x"00";
                Cur_Color_G        <=    x"FF";
                Cur_Color_B        <=    x"00";
            elsif ((pXcont = prev2LeftX) and ((pYcont >= prev2TopY) and (pYcont <= prev2BotY)))then
                Cur_Color_R        <=    x"00";
                Cur_Color_G        <=    x"FF";
                Cur_Color_B        <=    x"00";
            elsif ((pXcont = prev2RightX) and ((pYcont >= prev2TopY) and (pYcont <= prev2BotY)))then
                Cur_Color_R        <=    x"00";
                Cur_Color_G        <=    x"FF";
                Cur_Color_B        <=    x"00";
            ------------------------------------
            -- 1ST FRAME DISPLAY 3RD
            ------------------------------------
            elsif ((pYcont = prevBotY) and ((pXcont >= prevLeftX) and (pXcont <= prev2RightX)))then
                Cur_Color_R        <=    x"00";
                Cur_Color_G        <=    x"00";
                Cur_Color_B        <=    x"FF";
            elsif ((pYcont = prevTopY) and ((pXcont >= prevLeftX) and (pXcont <= prev2RightX)))then
                Cur_Color_R        <=    x"00";
                Cur_Color_G        <=    x"00";
                Cur_Color_B        <=    x"FF";
            elsif ((pXcont = prevLeftX) and ((pYcont >= prevTopY) and (pYcont <= prevBotY)))then
                Cur_Color_R        <=    x"00";
                Cur_Color_G        <=    x"00";
                Cur_Color_B        <=    x"FF";
            elsif ((pXcont = prev2RightX) and ((pYcont >= prevTopY) and (pYcont <= prevBotY)))then
                Cur_Color_R        <=    x"00";
                Cur_Color_G        <=    x"00";
                Cur_Color_B        <=    x"FF";
            ------------------------------------
            -- INIT FRAME DISPLAY LAST
            ------------------------------------
            elsif ((pYcont = botY) and ((pXcont >= leftX) and (pXcont <= rightX)))then
                Cur_Color_R        <=    x"80";
                Cur_Color_G        <=    x"00";
                Cur_Color_B        <=    x"80";
            elsif ((pYcont = topY) and ((pXcont >= leftX) and (pXcont <= rightX)))then
                Cur_Color_R        <=    x"80";
                Cur_Color_G        <=    x"00";
                Cur_Color_B        <=    x"80";
            elsif ((pXcont = leftX) and ((pYcont >= topY) and (pYcont <= botY)))then
                Cur_Color_R        <=    x"80";
                Cur_Color_G        <=    x"00";
                Cur_Color_B        <=    x"80";
            elsif ((pXcont = rightX) and ((pYcont >= topY) and (pYcont <= botY)))then
                Cur_Color_R        <=    x"80";
                Cur_Color_G        <=    x"00";
                Cur_Color_B        <=    x"80";
            else
                Cur_Color_R        <=    iRed;
                Cur_Color_G        <=    iGreen;
                Cur_Color_B        <=    iBlue;
            end if;
        end if;--pValid
        ----------------------------------------------------------------------------------- 
        --endOfFrame
        -----------------------------------------------------------------------------------
        if (endOfFrame = '1')then
            -----------------------------------------------------------------------------------
            --UPDATE COORDINATES TO DEFAULT
            newLeftX        <=  updateLeftX ; --MAX+BLANK OFFSET
            newRightX       <=  updateRightX; --MIN+BLANK OFFSET
            newTopY         <=  updateTopY  ; --MAX+BLANK OFFSET
            newBotY         <=  updateBotY  ; --MIN+BLANK OFFSET
            -----------------------------------------------------------------------------------
            --FETCH NEW COORDINATES
            leftX           <= newLeftX;
            rightX          <= newRightX;
            topY            <= newTopY;
            botY            <= newBotY;
            ---------------------------------------------------
            ---------------------------------------------------
            -- PROCESS
            -- PROCESSING 3 TIMES EACH MTBOX IF OBJECT WAS DETECTED
            -- 1ST FRAME
            prevLeftX       <= leftX;
            prevRightX      <= rightX;
            prevTopY        <= topY;
            prevBotY        <= botY;
            -- 2ND FRAME
            prev2LeftX      <= prevLeftX;
            prev2RightX     <= prevRightX;
            prev2TopY       <= prevTopY;
            prev2BotY       <= prevBotY;
            -- 3RD FRAME
            prev3LeftX      <= prev2LeftX;
            prev3RightX     <= prev2RightX;
            prev3TopY       <= prev2TopY;
            prev3BotY       <= prev2BotY;
        end if;--endOfFrame
        -----------------------------------------------------------------------------------
    end if;
end process pixelCoordP;
end architecture;
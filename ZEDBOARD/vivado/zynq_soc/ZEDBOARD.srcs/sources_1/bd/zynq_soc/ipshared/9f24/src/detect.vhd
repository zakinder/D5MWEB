--02142019 [02-14-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity detect is
generic (
    i_data_width   : integer := 8);
port (
    clk            : in std_logic;
    rst_l          : in std_logic;
    iRgb           : in channel;
    oRgb           : out channel;
    rgbCoord       : in region;
    iCord          : in coord;
    endOfFrame     : in std_logic;
    pDetect        : out std_logic);
end entity;

architecture arch of detect is

    signal pEnable         : std_logic;
    signal frameSize       : intersectPoints;
    signal initCord        : intersectPoints;
    signal newCord         : intersectPoints;
    signal grid1Cord       : intersectPoints;
    signal grid2Cord       : intersectPoints;
    signal grid3Cord       : intersectPoints;
    signal grid4Cord       : intersectPoints;
    signal pXcont          : unsigned(15 downto 0);
    signal pYcont          : unsigned(15 downto 0);
    signal rgb             : channel;
    
begin

    initCord.rht  <= x"0000";
    initCord.lft  <= x"FFFF";
    initCord.top  <= x"FFFF";
    initCord.bot  <= x"0000";

    frameSize.lft <= x"0001";--0
    frameSize.rht <= x"0780";--1920
    frameSize.top <= x"0005";--5 need to fix first few lines
    frameSize.bot <= x"0438";--1080
    pDetect       <= pEnable;

pixelRangeP: process (clk)begin
if rising_edge(clk) then
    if((iRgb.red>rgbCoord.rl and iRgb.red<rgbCoord.rh) and (iRgb.green>rgbCoord.gl and iRgb.green<rgbCoord.gh) and (iRgb.blue>rgbCoord.bl and iRgb.blue<rgbCoord.bh))then
        pEnable <='1';
    else
        pEnable <='0';
    end if;
end if;
end process pixelRangeP;
dataOutP: process (clk)begin
    if rising_edge(clk) then
        pXcont      <= unsigned(iCord.x);
        pYcont      <= unsigned(iCord.y);
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
            if (pEnable = '1') then 
                ------------------------------------
                --Left Coordinates
                ------------------------------------
                if (pXcont <= newCord.lft) then
                    if ( pXcont >= frameSize.lft) then 
                        newCord.lft <= pXcont - x"0001";
                    end if;   
                end if;
                ------------------------------------
                --Right Coordinates
                ------------------------------------
                if (pXcont >= newCord.rht) then
                    if ( pXcont <= frameSize.rht) then 
                        newCord.rht <= pXcont + x"0001";
                    end if;   
                end if;
                ------------------------------------
                --Top Coordinates
                ------------------------------------
                if (pYcont <= newCord.top) then
                    if ( pYcont >= frameSize.top) then 
                        newCord.top <= pYcont - x"0001";
                    end if;   
                end if;
                ------------------------------------
                --Bottom Coordinates
                ------------------------------------
                if (pYcont >= newCord.bot) then
                    if ( pYcont <= frameSize.bot) then 
                        newCord.bot <= pYcont + x"0001";
                    end if;   
                end if;
            end if;--pEnable
            ------------------------------------
            -- 4TH FRAME
            ------------------------------------
            if ((pYcont = grid4Cord.bot) and ((pXcont >= grid4Cord.lft) and (pXcont <= grid4Cord.rht)))then
                rgb.red        <=    x"FF";
                rgb.green      <=    x"00";
                rgb.blue       <=    x"00";
            elsif ((pYcont = grid4Cord.top) and ((pXcont >= grid4Cord.lft) and (pXcont <= grid4Cord.rht)))then
                rgb.red        <=    x"FF";
                rgb.green      <=    x"00";
                rgb.blue       <=    x"00";
            elsif ((pXcont = grid4Cord.lft) and ((pYcont >= grid4Cord.top) and (pYcont <= grid4Cord.bot)))then
                rgb.red        <=    x"FF";
                rgb.green      <=    x"00";
                rgb.blue       <=    x"00";
            elsif ((pXcont = grid4Cord.rht) and ((pYcont >= grid4Cord.top) and (pYcont <= grid4Cord.bot)))then
                rgb.red        <=    x"FF";
                rgb.green      <=    x"00";
                rgb.blue       <=    x"00";
            ------------------------------------
           -- 3RD FRAME
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
            -- 2ND FRAME
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
            -- 1ST FRAME
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
                rgb.red        <=    iRgb.red;
                rgb.green      <=    iRgb.green;
                rgb.blue       <=    iRgb.blue;
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
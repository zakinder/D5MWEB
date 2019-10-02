--05012019 [05-01-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
use work.portspackage.all;
entity mWrRd is
generic (
    revision_number  : std_logic_vector(31 downto 0) := x"00000000";
    s_data_width     : integer    := 16;
    b_data_width     : integer    := 32);
port (
    seconds          : in std_logic_vector(5 downto 0);
    minutes          : in std_logic_vector(5 downto 0);
    hours            : in std_logic_vector(4 downto 0);
    oLumTh           : out integer;
    oHsvPerCh        : out integer;
    oYccPerCh        : out integer;
    rgbCoord         : out region;
    aBusSelect       : out std_logic_vector(b_data_width-1 downto 0);
    threshold        : out std_logic_vector(s_data_width -1 downto 0);
    videoChannel     : out std_logic_vector(b_data_width-1 downto 0);
    dChannel         : out std_logic_vector(b_data_width-1 downto 0);
    cChannel         : out std_logic_vector(b_data_width-1 downto 0);
    oRgbOsharp       : out std_logic_vector(b_data_width-1 downto 0);
    oEdgeType        : out std_logic_vector(b_data_width-1 downto 0);
    pRegion          : out poi;
    als              : out coefficient;
    kls              : out coefficient;
    fifoStatus       : in std_logic_vector(b_data_width-1 downto 0);
    gridLockDatao    : in std_logic_vector(b_data_width-1 downto 0);
    wrRegsIn         : in mRegs;
    rdRegsOut        : out mRegs);
end mWrRd;
architecture Behavioral of mWrRd is
begin
    oRgbOsharp              <= wrRegsIn.cfigReg0;
    oEdgeType               <= wrRegsIn.cfigReg1;
    aBusSelect              <= wrRegsIn.cfigReg3;
    threshold               <= wrRegsIn.cfigReg4(s_data_width -1 downto 0);
    videoChannel            <= wrRegsIn.cfigReg5;
    dChannel                <= wrRegsIn.cfigReg6;
    cChannel                <= wrRegsIn.cfigReg7;
    kls.k1                  <= wrRegsIn.cfigReg8;
    kls.k2                  <= wrRegsIn.cfigReg9;
    kls.k3                  <= wrRegsIn.cfigReg10;
    kls.k4                  <= wrRegsIn.cfigReg11;
    kls.k5                  <= wrRegsIn.cfigReg12;
    kls.k6                  <= wrRegsIn.cfigReg13;
    kls.k7                  <= wrRegsIn.cfigReg14;
    kls.k8                  <= wrRegsIn.cfigReg15;
    kls.k9                  <= wrRegsIn.cfigReg16;
    kls.config              <= to_integer(unsigned(wrRegsIn.cfigReg17));
    als.k1                  <= wrRegsIn.cfigReg21;
    als.k2                  <= wrRegsIn.cfigReg22;
    als.k3                  <= wrRegsIn.cfigReg23;
    als.k4                  <= wrRegsIn.cfigReg24;
    als.k5                  <= wrRegsIn.cfigReg25;
    als.k6                  <= wrRegsIn.cfigReg26;
    als.k7                  <= wrRegsIn.cfigReg27;
    als.k8                  <= wrRegsIn.cfigReg28;
    als.k9                  <= wrRegsIn.cfigReg29;
    als.config              <= to_integer(unsigned(wrRegsIn.cfigReg30));
    pRegion.pointInterest   <= to_integer(unsigned(wrRegsIn.cfigReg31(s_data_width -1 downto 0)));--set the point
    pRegion.deltaConfig     <= to_integer(unsigned(wrRegsIn.cfigReg32(s_data_width -1 downto 0)));--set the point delta
    pRegion.cpuAckGoAgain   <= wrRegsIn.cfigReg33(0);
    pRegion.cpuWgridLock    <= wrRegsIn.cfigReg34(0);
    pRegion.cpuAckoffFrame  <= wrRegsIn.cfigReg35(0);
    pRegion.fifoReadAddress <= wrRegsIn.cfigReg36(13 downto 0);--fifo read address location upto cpuGridCont[Max-Locations]
    pRegion.fifoReadEnable  <= wrRegsIn.cfigReg36(16);--fifo read enable
    pRegion.clearFifoData   <= wrRegsIn.cfigReg37(0);--clear the fifo
    rgbCoord.rl             <= wrRegsIn.cfigReg50(7 downto 0);
    rgbCoord.rh             <= wrRegsIn.cfigReg51(7 downto 0);
    rgbCoord.gl             <= wrRegsIn.cfigReg52(7 downto 0);
    rgbCoord.gh             <= wrRegsIn.cfigReg53(7 downto 0);
    rgbCoord.bl             <= wrRegsIn.cfigReg54(7 downto 0);
    rgbCoord.bh             <= wrRegsIn.cfigReg55(7 downto 0);
    oLumTh                  <= to_integer(unsigned(wrRegsIn.cfigReg56));
    oHsvPerCh               <= to_integer(unsigned(wrRegsIn.cfigReg57));
    oYccPerCh               <= to_integer(unsigned(wrRegsIn.cfigReg58));
    rdRegsOut.cfigReg0      <= wrRegsIn.cfigReg0;
    rdRegsOut.cfigReg1      <= wrRegsIn.cfigReg1;
    rdRegsOut.cfigReg2      <= wrRegsIn.cfigReg2;
    rdRegsOut.cfigReg3      <= wrRegsIn.cfigReg3;
    rdRegsOut.cfigReg4      <= wrRegsIn.cfigReg4;
    rdRegsOut.cfigReg5      <= wrRegsIn.cfigReg5;
    rdRegsOut.cfigReg6      <= wrRegsIn.cfigReg6;
    rdRegsOut.cfigReg7      <= wrRegsIn.cfigReg7;
    rdRegsOut.cfigReg8      <= wrRegsIn.cfigReg8;
    rdRegsOut.cfigReg9      <= wrRegsIn.cfigReg9;
    rdRegsOut.cfigReg10     <= wrRegsIn.cfigReg10;
    rdRegsOut.cfigReg11     <= wrRegsIn.cfigReg11;
    rdRegsOut.cfigReg12     <= wrRegsIn.cfigReg12;
    rdRegsOut.cfigReg13     <= wrRegsIn.cfigReg13;
    rdRegsOut.cfigReg14     <= wrRegsIn.cfigReg14;
    rdRegsOut.cfigReg15     <= wrRegsIn.cfigReg15;
    rdRegsOut.cfigReg16     <= wrRegsIn.cfigReg16;
    rdRegsOut.cfigReg17     <= wrRegsIn.cfigReg17;
    rdRegsOut.cfigReg28     <= wrRegsIn.cfigReg28;
    rdRegsOut.cfigReg29     <= wrRegsIn.cfigReg29;
    rdRegsOut.cfigReg30     <= wrRegsIn.cfigReg30;
    rdRegsOut.cfigReg31     <= wrRegsIn.cfigReg31;
    rdRegsOut.cfigReg32     <= wrRegsIn.cfigReg32;
    rdRegsOut.cfigReg33     <= wrRegsIn.cfigReg33;
    rdRegsOut.cfigReg34     <= wrRegsIn.cfigReg34;
    rdRegsOut.cfigReg35     <= wrRegsIn.cfigReg35;
    rdRegsOut.cfigReg36     <= x"0000" & "00" & wrRegsIn.cfigReg36(13 downto 0);
    rdRegsOut.cfigReg37     <= wrRegsIn.cfigReg37;
    rdRegsOut.cfigReg38     <= gridLockDatao;
    rdRegsOut.cfigReg39     <= x"000000" & "0000000" & fifoStatus(0);--fifoFullh
    rdRegsOut.cfigReg40     <= x"000000" & "0000000" & fifoStatus(1);--fifoEmptyh
    rdRegsOut.cfigReg41     <= x"000000" & "0000000" & fifoStatus(2);--fifoFullh
    rdRegsOut.cfigReg42     <= x"000000" & fifoStatus(23 downto 16);--cpuGridCont
    rdRegsOut.cfigReg43     <= wrRegsIn.cfigReg43;
    rdRegsOut.cfigReg44     <= wrRegsIn.cfigReg44;
    rdRegsOut.cfigReg45     <= wrRegsIn.cfigReg45;
    rdRegsOut.cfigReg46     <= wrRegsIn.cfigReg46;
    rdRegsOut.cfigReg47     <= wrRegsIn.cfigReg47;
    rdRegsOut.cfigReg48     <= wrRegsIn.cfigReg48;
    rdRegsOut.cfigReg49     <= wrRegsIn.cfigReg49;
    rdRegsOut.cfigReg50     <= wrRegsIn.cfigReg50;
    rdRegsOut.cfigReg51     <= wrRegsIn.cfigReg51;
    rdRegsOut.cfigReg52     <= wrRegsIn.cfigReg52;
    rdRegsOut.cfigReg53     <= wrRegsIn.cfigReg53;
    rdRegsOut.cfigReg54     <= wrRegsIn.cfigReg54;
    rdRegsOut.cfigReg55     <= wrRegsIn.cfigReg55;
    rdRegsOut.cfigReg56     <= wrRegsIn.cfigReg56;
    rdRegsOut.cfigReg57     <= wrRegsIn.cfigReg57;
    rdRegsOut.cfigReg58     <= wrRegsIn.cfigReg58;
    rdRegsOut.cfigReg59     <= wrRegsIn.cfigReg59;
    rdRegsOut.cfigReg60     <= x"000000" & "00" & seconds;
    rdRegsOut.cfigReg61     <= x"000000" & "00" & minutes;
    rdRegsOut.cfigReg62     <= x"000000" & "000" & hours;
    rdRegsOut.cfigReg63     <= revision_number;
end Behavioral;
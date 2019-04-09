--02062019 [02-06-2019]
library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.fixed_pkg.all;
use work.float_pkg.all;
use work.constantspackage.all;
package vpfRecords is
type ty1sf is record
    k1      : sfixed(4 downto -3);
    k2      : sfixed(4 downto -3);
    k3      : sfixed(4 downto -3);
    k4      : sfixed(4 downto -3);
    k5      : sfixed(4 downto -3);
    k6      : sfixed(4 downto -3);
    k7      : sfixed(4 downto -3);
    k8      : sfixed(4 downto -3);
    k9      : sfixed(4 downto -3);
end record;
type ty2sf is record
    k1      : sfixed(24 downto -3);
    k2      : sfixed(24 downto -3);
    k3      : sfixed(24 downto -3);
    k4      : sfixed(24 downto -3);
    k5      : sfixed(24 downto -3);
    k6      : sfixed(24 downto -3);
    k7      : sfixed(24 downto -3);
    k8      : sfixed(24 downto -3);
    k9      : sfixed(24 downto -3);
end record;
type ty1sn is record
    k1      : signed(14 downto 0);
    k2      : signed(14 downto 0);
    k3      : signed(14 downto 0);
    k4      : signed(14 downto 0);
    k5      : signed(14 downto 0);
    k6      : signed(14 downto 0);
    k7      : signed(14 downto 0);
    k8      : signed(14 downto 0);
    k9      : signed(14 downto 0);
end record;
type ty2sn is record
    k1      : signed(19 downto 0);
    k2      : signed(19 downto 0);
    k3      : signed(19 downto 0);
    k4      : signed(19 downto 0);
    k5      : signed(19 downto 0);
    k6      : signed(19 downto 0);
    k7      : signed(19 downto 0);
    k8      : signed(19 downto 0);
    k9      : signed(19 downto 0);
end record;
type ccKernel is record
    ccSf        : ty1sf;
    ccProdSf    : ty2sf;
    ccProdToSn  : ty2sn;
    ccProdTrSn  : ty1sn;
end record;
type rgbToSfRecord is record
    red    : sfixed(9 downto 0);
    green  : sfixed(9 downto 0);
    blue   : sfixed(9 downto 0);
end record;
type rgbSnSumRecord is record
    red    : signed(ADD_RESULT_WIDTH-1 downto 0);
    green  : signed(ADD_RESULT_WIDTH-1 downto 0);
    blue   : signed(ADD_RESULT_WIDTH-1 downto 0);
end record;
type rgbSnSumTrRecord is record
    red    : signed(12 downto 0);
    green  : signed(12 downto 0);
    blue   : signed(12 downto 0);
end record;
type ccRgbRecord is record
    rgbToSf        : rgbToSfRecord;
    rgbSnSum       : rgbSnSumRecord;
    rgbSnSumTr     : rgbSnSumTrRecord;
end record;
type channel is record
    valid  : std_logic;
    red    : std_logic_vector(7 downto 0);
    green  : std_logic_vector(7 downto 0);
    blue   : std_logic_vector(7 downto 0);
end record;
type tpRgb is record
    valid  : std_logic;
    red    : std_logic_vector(11 downto 0);
    green  : std_logic_vector(11 downto 0);
    blue   : std_logic_vector(11 downto 0);
end record;
type uChannel is record
    valid : std_logic;
    red   : unsigned(7 downto 0);
    green : unsigned(7 downto 0);
    blue  : unsigned(7 downto 0);
end record;
type intChannel is record
    valid  : std_logic;
    red    : integer;
    green  : integer;
    blue   : integer;
end record;
type blurchannel is record
    valid  : std_logic;
    red    : std_logic_vector(11 downto 0);
    green  : std_logic_vector(11 downto 0);
    blue   : std_logic_vector(11 downto 0);
end record;
type intersectPoints is record
    lft  : unsigned(15 downto 0);
    rht  : unsigned(15 downto 0);
    top  : unsigned(15 downto 0);
    bot  : unsigned(15 downto 0);
end record;
type intersectPoint is record
    lft  : integer;
    rht  : integer;
    top  : integer;
    bot  : integer;
end record;
type hsvChannel is record
    valid  : std_logic;
    h      : std_logic_vector(7 downto 0);
    s      : std_logic_vector(7 downto 0);
    v      : std_logic_vector(7 downto 0);
end record;
type coord is record
    x      : std_logic_vector(15 downto 0);
    y      : std_logic_vector(15 downto 0);
end record;
type cord is record
    x      : integer;
    y      : integer;
end record;
type coefficient is record
    k1      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    k2      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    k3      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    k4      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    k5      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    k6      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    k7      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    k8      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    k9      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    config  : integer;
end record;
type region is record
    rl      : std_logic_vector(i_data_width-1 downto 0);-- :=x"0A";
    rh      : std_logic_vector(i_data_width-1 downto 0);-- :=x"50";
    gl      : std_logic_vector(i_data_width-1 downto 0);-- :=x"0A";
    gh      : std_logic_vector(i_data_width-1 downto 0);-- :=x"50";
    bl      : std_logic_vector(i_data_width-1 downto 0);-- :=x"0A";
    bh      : std_logic_vector(i_data_width-1 downto 0);-- :=x"50";
end record;
type poi is record
    pointInterest   : integer;
    deltaConfig     : integer;
    cpuAckGoAgain   : std_logic;
    cpuWgridLock    : std_logic;
    cpuAckoffFrame  : std_logic;
    fifoReadAddress : std_logic_vector(13 downto 0);
    fifoReadEnable  : std_logic;
    clearFifoData   : std_logic;
end record;  

type rawRgb is record
    red     : unsigned(11 downto 0);
    green   : unsigned(12 downto 0);
    blue    : unsigned(11 downto 0);
end record;
type tp is record
    tp1    : std_logic_vector(11 downto 0);
    tp2    : std_logic_vector(11 downto 0);
    tp3    : std_logic_vector(11 downto 0);
end record;

type uTp is record
    tp1    : unsigned(11 downto 0);
    tp2    : unsigned(11 downto 0);
    tp3    : unsigned(11 downto 0);
end record;

type rData is record
    pEof    : std_logic;
    pSof    : std_logic;
    valid   : std_logic;
    data    : std_logic_vector(11 downto 0);
    cord    : coord;
end record;

type rTp is record
    pEof    : std_logic;
    pSof    : std_logic;
    valid   : std_logic;
    taps    : tp;
    cord    : coord;
end record;
type rRgb is record
    pEof    : std_logic;
    pSof    : std_logic;
    valid   : std_logic;
    red     : std_logic_vector(7 downto 0);
    green   : std_logic_vector(7 downto 0);
    blue    : std_logic_vector(7 downto 0);
    cord    : coord;
end record;
type fcolors is record
    rgb              : channel;
    hsv              : channel;
    sharp            : channel;
    blur1x           : channel;
    blur2x           : channel;
    blur3x           : channel;
    blur4x           : channel;
    rgbCorrect       : channel;
    soble            : channel;
    rgbDetect        : channel;
    rgbPoi           : channel;
    rgbSum           : tpRgb;
    rgbDetectLock    : std_logic;
    rgbPoiLock       : std_logic;
    pEof             : std_logic;
    pSof             : std_logic;
    cod              : coord;
end record;
end package;
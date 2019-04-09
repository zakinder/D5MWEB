--01222019 [01-22-2019]
library ieee;
library work;
use ieee.std_logic_1164.all;
use work.constantspackage.all;
package portspackage is
type channel is record
    valid                 : std_logic;
    red                   : std_logic_vector(7 downto 0);
    green                 : std_logic_vector(7 downto 0);
    blue                  : std_logic_vector(7 downto 0);
end record;
type coord is record
    x                     : std_logic_vector(15 downto 0);
    y                     : std_logic_vector(15 downto 0);
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
    rl                   : std_logic_vector(i_data_width-1 downto 0);-- :=x"0A";
    rh                   : std_logic_vector(i_data_width-1 downto 0);-- :=x"50";
    gl                   : std_logic_vector(i_data_width-1 downto 0);-- :=x"0A";
    gh                   : std_logic_vector(i_data_width-1 downto 0);-- :=x"50";
    bl                   : std_logic_vector(i_data_width-1 downto 0);-- :=x"0A";
    bh                   : std_logic_vector(i_data_width-1 downto 0);-- :=x"50";
end record;
type poi is record
    pointInterest                    : integer;
    deltaConfig                      : integer;
    cpuAckLock                       : std_logic;
    cpuReadData                      : std_logic;
    cpuReadytoRead                   : std_logic;
    cpuStreamMode                    : std_logic;
    cpuIdleMode                      : std_logic;
end record;
component videoProcess_v1_0_rgb_m_axis is
generic (
    i_data_width                : integer := 8;
    s_data_width                : integer := 16);
port (                          
    --stream clock/reset
    m_axis_mm2s_aclk     : in std_logic;
    m_axis_mm2s_aresetn  : in std_logic;
    --config
    aBusSelect           : in std_logic_vector(31 downto 0);
    --ycbcr
    color_valid          : in std_logic;
    mpeg444Y             : in std_logic_vector(i_data_width-1 downto 0);
    mpeg444CB            : in std_logic_vector(i_data_width-1 downto 0);
    mpeg444CR            : in std_logic_vector(i_data_width-1 downto 0);
    --image resolution
    pXcont               : in std_logic_vector(15 downto 0);
    pYcont               : in std_logic_vector(15 downto 0);
    endOfFrame           : in std_logic;
    --stream to master out
    rx_axis_tready_o     : in std_logic;
    rx_axis_tvalid       : out std_logic;
    rx_axis_tuser        : out std_logic;
    rx_axis_tlast        : out std_logic;
    rx_axis_tdata        : out std_logic_vector(s_data_width-1 downto 0);
    --tx channel
    rgb_m_axis_tvalid    : out std_logic;
    rgb_m_axis_tlast     : out std_logic;
    rgb_m_axis_tuser     : out std_logic;
    rgb_m_axis_tready    : in std_logic;
    rgb_m_axis_tdata     : out std_logic_vector(s_data_width-1 downto 0);
    --rx channel
    rgb_s_axis_tready    : out std_logic;
    rgb_s_axis_tvalid    : in std_logic;
    rgb_s_axis_tuser     : in std_logic;
    rgb_s_axis_tlast     : in std_logic;
    rgb_s_axis_tdata     : in std_logic_vector(s_data_width-1 downto 0));
end component videoProcess_v1_0_rgb_m_axis;
component videoProcess_v1_0_m_axis_mm2s is
generic (
    s_data_width: integer:= 32);
port (
    aclk                        : in std_logic;
    aresetn                     : in std_logic;
    rgb_s_axis_tready           : out std_logic;
    rgb_s_axis_tvalid           : in std_logic;
    rgb_s_axis_tuser            : in std_logic;
    rgb_s_axis_tlast            : in std_logic;
    rgb_s_axis_tdata            : in std_logic_vector(s_data_width-1  downto 0);
    m_axis_mm2s_tkeep           : out std_logic_vector(2 downto 0);
    m_axis_mm2s_tstrb           : out std_logic_vector(2 downto 0);
    m_axis_mm2s_tid             : out std_logic_vector(0 downto 0);
    m_axis_mm2s_tdest           : out std_logic_vector(0 downto 0);  
    m_axis_mm2s_tready          : in std_logic;
    m_axis_mm2s_tvalid          : out std_logic;
    m_axis_mm2s_tuser           : out std_logic;
    m_axis_mm2s_tlast           : out std_logic;
    m_axis_mm2s_tdata           : out std_logic_vector(s_data_width-1 downto 0));
end component videoProcess_v1_0_m_axis_mm2s;
component d5m_raw_data is
port (
    pixclk                      : in std_logic;
    ifval                       : in std_logic;
    ilval                       : in std_logic;
    idata                       : in std_logic_vector(11 downto 0);
    endOfFrame                  : out std_logic;
    p_tdata                     : out std_logic_vector(11 downto 0);
    p_tvalid                    : out std_logic;
    oCord                       : out coord;
    m_axis_aclk                 : in std_logic;
    m_axis_aresetn              : in std_logic);
end component d5m_raw_data;
component videoProcess_v1_0_config_axis is
generic (
    revision_number    : std_logic_vector(31 downto 0) := x"02052019";
    C_S_AXI_DATA_WIDTH : integer:= 32;
    C_S_AXI_ADDR_WIDTH : integer:= 4);
port (
    seconds                 : in std_logic_vector(5 downto 0);
    minutes                 : in std_logic_vector(5 downto 0);
    hours                   : in std_logic_vector(4 downto 0);
    rgbCoord                : out region;
    aBusSelect              : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    threshold               : out std_logic_vector(15 downto 0);
    videoChannel            : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    dChannel                : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    cChannel                : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    pRegion                 : out poi;
    als                     : out coefficient;
    kls                     : out coefficient;
    fifoStatus              : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    gridLockDatao           : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    gridDataRdEn            : out std_logic;
    S_AXI_ACLK              : in std_logic;
    S_AXI_ARESETN           : in std_logic;
    S_AXI_AWADDR            : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_AWPROT            : in std_logic_vector(2 downto 0);
    S_AXI_AWVALID           : in std_logic;
    S_AXI_AWREADY           : out std_logic;
    S_AXI_WDATA             : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_WSTRB             : in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
    S_AXI_WVALID            : in std_logic;
    S_AXI_WREADY            : out std_logic;
    S_AXI_BRESP             : out std_logic_vector(1 downto 0);
    S_AXI_BVALID            : out std_logic;
    S_AXI_BREADY            : in std_logic;
    S_AXI_ARADDR            : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_ARPROT            : in std_logic_vector(2 downto 0);
    S_AXI_ARVALID           : in std_logic;
    S_AXI_ARREADY           : out std_logic;
    S_AXI_RDATA             : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_RRESP             : out std_logic_vector(1 downto 0);
    S_AXI_RVALID            : out std_logic;
    S_AXI_RREADY            : in std_logic);
end component videoProcess_v1_0_config_axis;
component buffer_controller is
generic (
    img_width                   : integer := 4096;
    adwr_width                  : integer := 15;
    p_data_width                : integer := 11;
    addr_width                  : integer := 11);
port (                          
    aclk                        : in std_logic;
    i_enable                    : in std_logic;
    i_data                      : in std_logic_vector(p_data_width downto 0);
    i_wadd                      : in std_logic_vector(adwr_width downto 0);
    i_radd                      : in std_logic_vector(adwr_width downto 0);
    en_datao                    : out std_logic;
    taps0x                      : out std_logic_vector(p_data_width downto 0);
    taps1x                      : out std_logic_vector(p_data_width downto 0);
    taps2x                      : out std_logic_vector(p_data_width downto 0));
end component buffer_controller;
component raw2rgb is 
generic (
    rgbo_width                  : integer := 8;
    cont_width                  : integer := 16;
    p_data_width                : integer := 11);
port (                          
    clk                         : in std_logic;
    rst_l                       : in std_logic;
    iValid                      : in std_logic;
    i_tap0                      : in std_logic_vector(p_data_width downto 0);
    i_tap1                      : in std_logic_vector(p_data_width downto 0);
    i_tap2                      : in std_logic_vector(p_data_width downto 0);
    rxCord                      : in coord;
    oRgb                        : out channel);
end component raw2rgb;
component digi_clk is
port (
    clk1                        : in std_logic;
    seconds                     : out std_logic_vector(5 downto 0);
    minutes                     : out std_logic_vector(5 downto 0);
    hours                       : out std_logic_vector(4 downto 0));
end component digi_clk;
component frameProcess is
generic (
    i_data_width   : integer := 8;
    s_data_width   : integer := 16;
    b_data_width   : integer := 32;
    i_precision    : integer := 12;
    i_full_range   : boolean := FALSE;
    img_width      : integer := 256;
    adwr_width     : integer := 16;
    addr_width     : integer := 11);
port (              
    clk             : in std_logic;
    rst_l           : in std_logic;
    iRgb            : in channel;
    oRgb            : out channel;
    rgbCoord        : in region;
    videoChannel    : in std_logic_vector(b_data_width-1 downto 0);
    dChannel        : in std_logic_vector(b_data_width-1 downto 0);
    cChannel        : in std_logic_vector(b_data_width-1 downto 0);
    pRegion         : in poi;
    fifoStatus      : out std_logic_vector(b_data_width-1 downto 0);
    gridLockDatao   : out std_logic_vector(b_data_width-1 downto 0);
    gridDataRdEn    : in std_logic;
    endOfFrame      : in std_logic;
    threshold       : in std_logic_vector(s_data_width-1 downto 0); 
    kls             : in coefficient;
    als             : in coefficient;
    iCord           : in coord;
    oCord           : out coord);
end component frameProcess;
component frameTestPattern is
generic (
    s_data_width  : integer := 16);
port (             
    clk           : in std_logic;
    iValid        : in std_logic;
    Xcont         : in std_logic_vector(s_data_width-1 downto 0);
    Ycont         : in std_logic_vector(s_data_width-1 downto 0);
    rgbSum        : out std_logic_vector(11 downto 0));
end component frameTestPattern;
component sharpFilter is
generic (
    i_data_width  : integer := 8;
    img_width     : integer := 256;
    adwr_width    : integer := 16;
    addr_width    : integer := 11);
port (                
    clk            : in std_logic;
    rst_l          : in std_logic;
    iRed           : in std_logic_vector(i_data_width-1 downto 0);
    iGreen         : in std_logic_vector(i_data_width-1 downto 0);
    iBlue          : in std_logic_vector(i_data_width-1 downto 0);
    iValid         : in std_logic;
    iaddress       : in std_logic_vector(15 downto 0);
    kls            : in coefficient;  
    endOfFrame     : in std_logic;      
    oRed           : out std_logic_vector(i_data_width-1 downto 0);
    oGreen         : out std_logic_vector(i_data_width-1 downto 0);
    oBlue          : out std_logic_vector(i_data_width-1 downto 0);
    oValid         : out std_logic);
end component sharpFilter;
component blurFilter is
generic (
    i_data_width  : integer := 8;
    img_width     : integer := 256;
    adwr_width    : integer := 16;
    addr_width    : integer := 11);
port (                
    clk           : in std_logic;
    rst_l         : in std_logic;
    iRed          : in std_logic_vector(i_data_width-1 downto 0);
    iGreen        : in std_logic_vector(i_data_width-1 downto 0);
    iBlue         : in std_logic_vector(i_data_width-1 downto 0);
    iValid        : in std_logic;
    iaddress      : in std_logic_vector(adwr_width-1 downto 0);
    oRed          : out std_logic_vector(i_data_width-1 downto 0);
    oGreen        : out std_logic_vector(i_data_width-1 downto 0);
    oBlue         : out std_logic_vector(i_data_width-1 downto 0);
    oValid        : out std_logic);
end component blurFilter;
component sobel is
generic (
    i_data_width   : integer := 8;
    img_width      : integer := 256;
    adwr_width     : integer := 16;
    addr_width     : integer := 11);
port (                
    clk            : in std_logic;
    rst_l          : in std_logic;
    videoChannel   : in std_logic_vector(31 downto 0);
    endOfFrame     : in std_logic;
    iRed           : in std_logic_vector(i_data_width-1 downto 0);
    iGreen         : in std_logic_vector(i_data_width-1 downto 0);
    iBlue          : in std_logic_vector(i_data_width-1 downto 0);
    iValid         : in std_logic;
    threshold      : in std_logic_vector(15 downto 0);
    iaddress       : in std_logic_vector(15 downto 0);
    kls            : in coefficient; 
    oRed           : out std_logic_vector(i_data_width-1 downto 0);
    oGreen         : out std_logic_vector(i_data_width-1 downto 0);
    oBlue          : out std_logic_vector(i_data_width-1 downto 0);
    oValid         : out std_logic);
end component sobel;
component detect is
generic (
    i_data_width    : integer := 8);
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
end component detect;
component pointOfInterest is
generic (
    i_data_width   : integer := 8;
    s_data_width   : integer := 16;
    b_data_width   : integer := 32);
port (
clk             : in std_logic;
rst_l           : in std_logic;
iValid          : in std_logic;
iRed            : in std_logic_vector(i_data_width-1 downto 0);
iGreen          : in std_logic_vector(i_data_width-1 downto 0);
iBlue           : in std_logic_vector(i_data_width-1 downto 0);
-----------------------------------------------------------
iXcont          : in std_logic_vector(s_data_width-1 downto 0);
iYcont          : in std_logic_vector(s_data_width-1 downto 0);
-----------------------------------------------------------
endOfFrame      : in std_logic;
gridDataRdEn    : in std_logic;
pRegion         : in poi;
gridLockDatao   : out std_logic_vector(b_data_width-1 downto 0);
fifoStatus      : out std_logic_vector(b_data_width-1 downto 0);
-----------------------------------------------------------
oGridLocation   : out std_logic;
oRed            : out std_logic_vector(i_data_width-1 downto 0);
oGreen          : out std_logic_vector(i_data_width-1 downto 0);
oBlue           : out std_logic_vector(i_data_width-1 downto 0);
oValid          : out std_logic);
end component pointOfInterest;
component hsv_c is
    generic (
    i_data_width    : integer := 8);
    port (  
    pixclk          : in  std_logic;
    reset           : in  std_logic;
    iRed            : in  std_logic_vector(i_data_width-1 downto 0);
    iGreen          : in  std_logic_vector(i_data_width-1 downto 0);
    iBlue           : in  std_logic_vector(i_data_width-1 downto 0);
    oH              : out std_logic_vector(i_data_width-1 downto 0);
    oS              : out std_logic_vector(i_data_width-1 downto 0);
    oV              : out std_logic_vector(i_data_width-1 downto 0));
end component hsv_c;
component rgb_ycbcr is
generic (
    i_data_width    : integer:= 8;
    i_precision     : integer:= 12;
    i_full_range    : boolean:= FALSE);
port (                          
    clk             : in  std_logic;
    rst_l           : in  std_logic;
    iRed            : in  std_logic_vector(i_data_width-1 downto 0);
    iGreen          : in  std_logic_vector(i_data_width-1 downto 0);
    iBlue           : in  std_logic_vector(i_data_width-1 downto 0);
    iValid          : in  std_logic;
    y               : out std_logic_vector(i_data_width-1 downto 0);
    cb              : out std_logic_vector(i_data_width-1 downto 0);
    cr              : out std_logic_vector(i_data_width-1 downto 0);
    oValid          : out std_logic);
end component rgb_ycbcr;
component color_correction is
generic (
    i_data_width    : integer := 8;
    C_WHOLE_WIDTH   : integer := 3;
    C_FRAC_WIDTH    : integer := 8);
port (                          
    clk       : in std_logic;
    rst       : in std_logic;
    iRgb      : in channel;
    iXcont    : in std_logic_vector(15 downto 0);
    iYcont    : in std_logic_vector(15 downto 0);
    als       : in coefficient;
    oXcont    : out std_logic_vector(15 downto 0);
    oYcont    : out std_logic_vector(15 downto 0);
    Xcont     : out std_logic_vector(15 downto 0);
    Ycont     : out std_logic_vector(15 downto 0);
    oRed      : out std_logic_vector(i_data_width-1 downto 0);
    oGreen    : out std_logic_vector(i_data_width-1 downto 0);
    oBlue     : out std_logic_vector(i_data_width-1 downto 0);
    oValid    : out std_logic);
end component color_correction;    
end package;
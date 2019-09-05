--05012019 [05-01-2019]
library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
package portspackage is
component Filters is
generic (
    F_TES                 : boolean := false;
    F_LUM                 : boolean := false;
    F_TRM                 : boolean := false;
    F_RGB                 : boolean := false;
    F_SHP                 : boolean := false;
    F_BLU                 : boolean := false;
    F_EMB                 : boolean := false;
    F_YCC                 : boolean := false;
    F_SOB                 : boolean := false;
    F_CGA                 : boolean := false;
    F_HSV                 : boolean := false;
    F_HSL                 : boolean := false;
    M_SOB_LUM             : boolean := false;
    M_SOB_TRM             : boolean := false;
    M_SOB_RGB             : boolean := false;
    M_SOB_SHP             : boolean := false;
    M_SOB_BLU             : boolean := false;
    M_SOB_YCC             : boolean := false;
    M_SOB_CGA             : boolean := false;
    M_SOB_HSV             : boolean := false;
    M_SOB_HSL             : boolean := false;
    F_CGA_TO_CGA          : boolean := false;
    F_CGA_TO_HSL          : boolean := false;
    F_CGA_TO_HSV          : boolean := false;
    F_CGA_TO_YCC          : boolean := false;
    F_CGA_TO_SHP          : boolean := false;
    F_CGA_TO_BLU          : boolean := false;
    F_SHP_TO_SHP          : boolean := false;
    F_SHP_TO_HSL          : boolean := false;
    F_SHP_TO_HSV          : boolean := false;
    F_SHP_TO_YCC          : boolean := false;
    F_SHP_TO_CGA          : boolean := false;
    F_SHP_TO_BLU          : boolean := false;
    F_BLU_TO_BLU          : boolean := false;
    F_BLU_TO_HSL          : boolean := false;
    F_BLU_TO_HSV          : boolean := false;
    F_BLU_TO_YCC          : boolean := false;
    F_BLU_TO_CGA          : boolean := false;
    F_BLU_TO_SHP          : boolean := false;
    img_width             : integer := 4096;
    img_height            : integer := 4096;
    i_data_width          : integer := 8);
port (                          
    clk                   : in std_logic;
    rst_l                 : in std_logic;
    txCord                : in coord;
    lumThreshold          : in  std_logic_vector(7 downto 0);
    iRgb                  : in channel;
    cHsv                  : in std_logic_vector(2 downto 0);
    cYcc                  : in std_logic_vector(2 downto 0);
    iKcoeff               : in kernelCoeff;
    edgeValid             : out std_logic;
    oRgb                  : out frameColors);
end component Filters; 
component ColorSpaceLimits is
generic (
    i_data_width   : integer := 8);
port (  
    clk            : in  std_logic;
    reset          : in  std_logic;
    iRgb           : in channel;
    rgbColors      : out type_RgbArray(0 to i_data_width-1));
end component ColorSpaceLimits;
component SyncFrames is
generic (
    sDelay         : integer := 8);
port (  
    clk            : in  std_logic;
    reset          : in  std_logic;
    iRgb           : in channel;
    oRgb           : out channel);
end component SyncFrames;
component ByteToFloatTop is
port (  
    aclk           : in std_logic;
    rst_l          : in std_logic;
    iValid         : in std_logic;
    iData          : in std_logic_vector(7 downto 0);
    oValid         : out std_logic;
    oDataFloat     : out std_logic_vector(31 downto 0));
end component ByteToFloatTop;
component rgbAssertion is
port (  
    clk            : in  std_logic;
    reset          : in  std_logic;
    valid          : in  std_logic;
    iRed           : in  std_logic_vector(7 downto 0);
    iGreen         : in  std_logic_vector(7 downto 0);
    iBlue          : in  std_logic_vector(7 downto 0));
end component rgbAssertion;
component Kernel is
generic (
    INRGB_FRAME        : boolean := false;
    RGBLP_FRAME        : boolean := false;
    RGBTR_FRAME        : boolean := false;
    SHARP_FRAME        : boolean := false;
    BLURE_FRAME        : boolean := false;
    EMBOS_FRAME        : boolean := false;
    YCBCR_FRAME        : boolean := false;
    SOBEL_FRAME        : boolean := false;
    CGAIN_FRAME        : boolean := false;
    HSV_FRAME          : boolean := false;
    HSL_FRAME          : boolean := false;
    img_width          : integer := 4096;
    img_height         : integer := 4096;
    i_data_width       : integer := 8);
port (                          
    clk                : in std_logic;
    rst_l              : in std_logic;
    lumThreshold       : in  std_logic_vector(7 downto 0);
    txCord             : in coord;
    iRgb               : in channel;
    iKcoeff            : in kernelCoeff;
    oEdgeValid         : out std_logic;
    oRgb               : out colors);
end component Kernel; 
component TextGen is
generic (
    img_width        : integer := 4096;
    img_height       : integer := 4096;
    displayText      : string  := (others => NUL));
port (  
    clk      : in std_logic;
    rst_l    : in std_logic;
    txCord   : in coord;
    location : in cord;
    iRgb     : in channel;
    oRgb     : out channel);
end component TextGen;
component FontRom is
port (  
    clk     : in std_logic;
    addr    : in integer;
    fontRow : out std_logic_vector(FONT_WIDTH-1 downto 0));
end component FontRom;
component PixelOnDisplay is
generic (
    displayText : string := (others => NUL));
port (  
    clk         : in std_logic;
    location    : in cord;
    grid        : in cord;
    pixel       : out std_logic);
end component PixelOnDisplay;
component ColorTrim is
generic (
    i_data_width  : integer := 8);
port (  
    clk            : in  std_logic;
    reset          : in  std_logic;
    iRgb           : in channel;
    oRgb           : out channel);
end component ColorTrim;
component ColorAvg is
generic (
    i_data_width  : integer := 8);
port (  
    clk            : in  std_logic;
    reset          : in  std_logic;
    iRgb           : in channel;
    oRgb           : out channel);
end component ColorAvg;
component videoSelect is
generic (
    img_width                   : integer := 4096;
    i_data_width                : integer := 8;
    b_data_width                : integer := 32;
    s_data_width                : integer := 16);
port (  
    clk                         : in std_logic;
    rst_l                       : in std_logic;
    videoChannel                : in std_logic_vector(b_data_width-1 downto 0);
    dChannel                    : in std_logic_vector(b_data_width-1 downto 0);
    cChannel                    : in std_logic_vector(b_data_width-1 downto 0);
    cRgbOsharp                  : in std_logic_vector(b_data_width-1 downto 0);
    iFrameData                  : in fcolors;
    oEof                        : out std_logic;
    oSof                        : out std_logic;
    oCord                       : out coord;
    oRgb                        : out channel);
end component videoSelect;
component videoProcess_v1_0_rgb_m_axis is
generic (
    i_data_width                : integer := 8;
    b_data_width                : integer := 32;
    s_data_width                : integer := 16);
port (                          
    m_axis_mm2s_aclk            : in std_logic;
    m_axis_mm2s_aresetn         : in std_logic;
    aBusSelect                  : in std_logic_vector(b_data_width-1 downto 0);
    iStreamData                 : in vStreamData;
    rx_axis_tready_o            : in std_logic;
    rx_axis_tvalid              : out std_logic;
    rx_axis_tuser               : out std_logic;
    rx_axis_tlast               : out std_logic;
    rx_axis_tdata               : out std_logic_vector(s_data_width-1 downto 0);
    rgb_m_axis_tvalid           : out std_logic;
    rgb_m_axis_tlast            : out std_logic;
    rgb_m_axis_tuser            : out std_logic;
    rgb_m_axis_tready           : in std_logic;
    rgb_m_axis_tdata            : out std_logic_vector(s_data_width-1 downto 0);
    rgb_s_axis_tready           : out std_logic;
    rgb_s_axis_tvalid           : in std_logic;
    rgb_s_axis_tuser            : in std_logic;
    rgb_s_axis_tlast            : in std_logic;
    rgb_s_axis_tdata            : in std_logic_vector(s_data_width-1 downto 0));
end component videoProcess_v1_0_rgb_m_axis;
component videoProcess_v1_0_m_axis_mm2s is
generic (
    s_data_width                : integer := 16);
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
component CameraRawData is
generic (
    img_width                   : integer:= 0);
port (
    m_axis_aclk                 : in std_logic;
    m_axis_aresetn              : in std_logic;
    pixclk                      : in std_logic;
    ifval                       : in std_logic;
    ilval                       : in std_logic;
    idata                       : in std_logic_vector(11 downto 0);
    oRawData                    : out rData);
end component CameraRawData;
component CameraRawToRgb is
generic (
    img_width                   : integer := 8;
    dataWidth                   : integer := 12;
    addrWidth                   : integer := 12);
port (
    m_axis_mm2s_aclk            : in std_logic;
    m_axis_mm2s_aresetn         : in std_logic;
    pixclk                      : in std_logic;
    ifval                       : in std_logic;
    ilval                       : in std_logic;
    idata                       : in std_logic_vector(dataWidth-1 downto 0);
    oRgbSet                     : out rRgb);
end component CameraRawToRgb;
component VideoStream is
generic (
    revision_number             : std_logic_vector(31 downto 0) := x"00000000";
    i_data_width                : integer := 8;
    s_data_width                : integer := 16;
    b_data_width                : integer := 32;
    img_width                   : integer := 256;
    adwrWidth                   : integer := 16;
    addrWidth                   : integer := 12);
port (
    m_axis_mm2s_aclk            : in std_logic;
    m_axis_mm2s_aresetn         : in std_logic;
    iWrRegs                     : in mRegs;
    oRdRegs                     : out mRegs;
    iRgbSet                     : in rRgb;
    oStreamData                 : out vStreamData;
    oBusSelect                  : out std_logic_vector(b_data_width-1 downto 0));
end component VideoStream;
component videoProcess_v1_0_Config is
generic (
    revision_number             : std_logic_vector(31 downto 0) := x"02052019";
    C_S_AXI_DATA_WIDTH          : integer:= 32;
    C_S_AXI_ADDR_WIDTH          : integer:= 4);
port (
    wrRegsOut                   : out mRegs;
    rdRegsIn                    : in mRegs;
    S_AXI_ACLK                  : in std_logic;
    S_AXI_ARESETN               : in std_logic;
    S_AXI_AWADDR                : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_AWPROT                : in std_logic_vector(2 downto 0);
    S_AXI_AWVALID               : in std_logic;
    S_AXI_AWREADY               : out std_logic;
    S_AXI_WDATA                 : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_WSTRB                 : in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
    S_AXI_WVALID                : in std_logic;
    S_AXI_WREADY                : out std_logic;
    S_AXI_BRESP                 : out std_logic_vector(1 downto 0);
    S_AXI_BVALID                : out std_logic;
    S_AXI_BREADY                : in std_logic;
    S_AXI_ARADDR                : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_ARPROT                : in std_logic_vector(2 downto 0);
    S_AXI_ARVALID               : in std_logic;
    S_AXI_ARREADY               : out std_logic;
    S_AXI_RDATA                 : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_RRESP                 : out std_logic_vector(1 downto 0);
    S_AXI_RVALID                : out std_logic;
    S_AXI_RREADY                : in std_logic);
end component videoProcess_v1_0_Config;
component buffer_controller is
generic (
    img_width                   : integer := 4096;
    adwrWidth                   : integer := 16;
    dataWidth                   : integer := 12;
    addrWidth                   : integer := 12);
port (                          
    aclk                        : in std_logic;
    i_enable                    : in std_logic;
    i_data                      : in std_logic_vector(dataWidth - 1 downto 0);
    i_wadd                      : in std_logic_vector(adwrWidth - 1 downto 0);
    i_radd                      : in std_logic_vector(adwrWidth - 1 downto 0);
    en_datao                    : out std_logic;
    taps0x                      : out std_logic_vector(dataWidth - 1 downto 0);
    taps1x                      : out std_logic_vector(dataWidth - 1 downto 0);
    taps2x                      : out std_logic_vector(dataWidth - 1 downto 0));
end component buffer_controller;
component TapsController is
generic (
    img_width     : integer := 4096;
    tpDataWidth   : integer := 8);
port (                          
    clk         : in std_logic;
    iRgb        : in channel;
    rst_l       : in std_logic;
    tpValid     : out std_logic;
    tp0         : out std_logic_vector(tpDataWidth - 1 downto 0);
    tp1         : out std_logic_vector(tpDataWidth - 1 downto 0);
    tp2         : out std_logic_vector(tpDataWidth - 1 downto 0));
end component TapsController;
component tapLine is
generic (
    img_width    : integer := 4095;
    tpDataWidth  : integer := 12);
port (                          
    clk          : in std_logic;
    rst_l       : in std_logic;
    valid        : in std_logic;
    idata        : in std_logic_vector(tpDataWidth - 1 downto 0);
    odata        : out std_logic_vector(tpDataWidth - 1 downto 0));
end component tapLine;

component sharpMac is
port (                
    clk                         : in std_logic;
    rst_l                       : in std_logic;
    vTap0x                      : in std_logic_vector(7 downto 0);
    vTap1x                      : in std_logic_vector(7 downto 0);
    vTap2x                      : in std_logic_vector(7 downto 0);
    kls                         : in coefficient;  
    endOfFrame                  : in std_logic;     
    DataO                       : out std_logic_vector(7 downto 0));
end component sharpMac;
component dataTaps is
generic (
    img_width                   : integer := 4096;
    dataWidth                   : integer := 11;
    addrWidth                   : integer := 12);
port (                          
    aclk                        : in std_logic;
    iRawData                    : in rData;
    oTpData                     : out rTp);
end component dataTaps;
component ReadCoeffFile is
generic (
    s_data_width  : integer := 16;
    input_file    : string  := (others => NUL));
port (                          
    clk             : in std_logic;
    reset           : in std_logic;
    iCord           : in coord;
    kSet1Out        : out  kernelCoeff);
end component ReadCoeffFile;
component RawToRgb is 
port (                          
    clk                         : in std_logic;
    rst_l                       : in std_logic;
    iTpData                     : in rTp;
    oRgbSet                     : out rRgb);
end component RawToRgb;
component digiClk is
port (
    clk1                        : in std_logic;
    seconds                     : out std_logic_vector(5 downto 0);
    minutes                     : out std_logic_vector(5 downto 0);
    hours                       : out std_logic_vector(4 downto 0));
end component digiClk;
component frameProcess is
generic (
    i_data_width                : integer := 8;
    s_data_width                : integer := 16;
    b_data_width                : integer := 32;
    img_width                   : integer := 256;
    adwrWidth                   : integer := 16;
    addrWidth                   : integer := 12);
port (              
    clk                         : in std_logic;
    rst_l                       : in std_logic;
    iRgbSet                     : in rRgb;
    iRgbCoord                   : in region;
    iPoiRegion                  : in poi;
    iKls                        : in coefficient;
    iAls                        : in coefficient;
    iLumTh                      : in integer;
    iHsvPerCh                   : in integer;
    iYccPerCh                   : in integer;
    iEdgeType                   : in std_logic_vector(b_data_width-1 downto 0);
    iThreshold                  : in std_logic_vector(s_data_width-1 downto 0); 
    oFrameData                  : out fcolors;
    oFifoStatus                 : out std_logic_vector(b_data_width-1 downto 0);
    oGridLockData               : out std_logic_vector(b_data_width-1 downto 0));
end component frameProcess;
component frameTestPattern is
generic (
    s_data_width                : integer := 16);
port (             
    clk                         : in std_logic;
    iValid                      : in std_logic;
    iCord                       : in coord;
    oRgb                        : out tpRgb);
end component frameTestPattern;
component sharpFilter is
generic (
    i_data_width                : integer := 8;
    img_width                   : integer := 256;
    adwrWidth                   : integer := 16;
    addrWidth                   : integer := 12);
port (                
    clk                         : in std_logic;
    rst_l                       : in std_logic;
    iRgb                        : in channel;
    kls                         : in coefficient;
    endOfFrame                  : in std_logic;   
    oRgb                        : out channel);
end component sharpFilter;
component FrameMask is
generic (
    eBlack         : boolean := false);
port (                
    clk            : in  std_logic;
    iEdgeValid     : in  std_logic;
    i1Rgb          : in channel;
    i2Rgb          : in channel;
    oRgb           : out channel);
end component FrameMask;
component dither is
generic (
    img_width         : integer := 512;
    img_height        : integer := 512;
    color_width       : integer := 8;
    reduced_width     : integer := 4);
port (                
    clk               : in  std_logic;
    enable            : in  std_logic;
    x                 : in  integer range 0 to img_width-1;
    din_r             : in  std_logic_vector(color_width-1 downto 0);
    din_g             : in  std_logic_vector(color_width-1 downto 0);
    din_b             : in  std_logic_vector(color_width-1 downto 0);
    dout_r            : out std_logic_vector(color_width-1 downto 0) := (others => '0');
    dout_g            : out std_logic_vector(color_width-1 downto 0) := (others => '0');
    dout_b            : out std_logic_vector(color_width-1 downto 0) := (others => '0'));
end component dither;
component blurFilter is
generic (
    iMSB                        : integer := 11;
    iLSB                        : integer := 4;
    i_data_width                : integer := 8;
    img_width                   : integer := 256;
    adwrWidth                   : integer := 16;
    addrWidth                   : integer := 12);
port (                
    clk                         : in std_logic;
    rst_l                       : in std_logic;
    iRgb                        : in channel;
    oRgb                        : out channel);
end component blurFilter;
component blurMac is
port (                
    clk                         : in std_logic;
    rst_l                       : in std_logic;
    vTap0x                      : in std_logic_vector(7 downto 0);
    vTap1x                      : in std_logic_vector(7 downto 0);
    vTap2x                      : in std_logic_vector(7 downto 0);
    DataO                       : out std_logic_vector(11 downto 0));
end component blurMac;
component TestPattern is
port (                
    clk                   : in std_logic;
    ChannelS              : in integer;
    rgbSum                : in tpRgb;
    oRgb                  : out channel);
end component TestPattern;
component edgeObjects is
generic (
    i_data_width                : integer := 8);
port (                
    clk                         : in std_logic;
    rst_l                       : in std_logic;
    iRgb                        : in channel;
    oRgbRemix                   : out channel);
end component edgeObjects;
component sobelFilter is
generic (
    i_data_width                : integer := 8;
    img_width                   : integer := 256;
    adwrWidth                   : integer := 16;
    addrWidth                   : integer := 12);
port (                
    clk                         : in std_logic;
    rst_l                       : in std_logic;
    iRgb                        : in channel;
    iEdgeType                   : in std_logic_vector(31 downto 0);
    endOfFrame                  : in std_logic;
    threshold                   : in std_logic_vector(15 downto 0);
    kls                         : in coefficient;
    oRgb                        : out channel;
    sValid                      : out std_logic;
    edgeValid                   : out std_logic);
end component sobelFilter;
component detect is
generic (
    i_data_width                : integer := 8);
port (
    clk                         : in std_logic;
    rst_l                       : in std_logic;
    endOfFrame                  : in std_logic;
    iRgb                        : in channel;
    oRgb                        : out channel;
    rgbCoord                    : in region;
    iCord                       : in coord;
    pDetect                     : out std_logic);
end component detect;
component pointOfInterest is
generic (
    i_data_width                : integer := 8;
    s_data_width                : integer := 16;
    b_data_width                : integer := 32);
port (
    clk                         : in std_logic;
    rst_l                       : in std_logic;
    iRgb                        : in channel;
    oRgb                        : out channel;
    iCord                       : in coord;
    endOfFrame                  : in std_logic;
    pRegion                     : in poi;
    gridLockDatao               : out std_logic_vector(b_data_width-1 downto 0);
    fifoStatus                  : out std_logic_vector(b_data_width-1 downto 0);
    oGridLocation               : out std_logic);
end component pointOfInterest;
component gridLockFifo is
generic (
    FIFO_DEPTH                  : integer := 24;
    FIFO_DATA_WIDTH             : integer := 24;
    FIFO_ADDR_WIDTH             : integer := 14);
port (
    clk                         : in  std_logic;
    clrStatus                   : in  std_logic;
    rdEn                        : in  std_logic;
    rdAddress                   : in  std_logic_vector (FIFO_ADDR_WIDTH-1 downto 0);
    dataO                       : out std_logic_vector (FIFO_DATA_WIDTH-1 downto 0);
    wrEn                        : in  std_logic;
    wrAddress                   : in  std_logic_vector (FIFO_ADDR_WIDTH-1 downto 0);
    dataIn                      : in  std_logic_vector (FIFO_DATA_WIDTH-1 downto 0);
    wrDone                      : out std_logic;
    rdDone                      : out std_logic;
    emptyO                      : out std_logic;
    fullO                       : out std_logic);
end component;
component hsv_c is
generic (
    i_data_width                : integer := 8);
port (  
    clk                         : in  std_logic;
    reset                       : in  std_logic;
    iRgb                        : in channel;
    oHsv                        : out hsvChannel);
end component hsv_c;
component LumValues is
generic (
    F_LGT                       : boolean := false;
    F_DRK                       : boolean := false;
    F_LUM                       : boolean := false;
    i_data_width                : integer := 8);
port (  
    clk                         : in  std_logic;
    reset                       : in  std_logic;
    iRgb                        : in channel;
    oRgb                        : out channel);
end component LumValues;
component SegmentColors is
port (  
    clk                         : in  std_logic;
    reset                       : in  std_logic;
    lumThreshold                : in  std_logic_vector(7 downto 0);
    iRgb                        : in channel;
    oRgb                        : out channel);
end component SegmentColors;
component AvgValues is
generic (
    i_data_width   : integer := 8);
port (  
    clk            : in  std_logic;
    reset          : in  std_logic;
    aRgb           : in channel;
    bRgb           : in channel;
    cRgb           : in channel;
    oRgb           : out channel);
end component AvgValues;
component hsl_c is
generic (
    i_data_width                : integer := 8);
port (  
    clk                         : in  std_logic;
    reset                       : in  std_logic;
    iRgb                        : in channel;
    oHsl                        : out hslChannel);
end component hsl_c;
component rgb_ycbcr is
generic (
    i_data_width                : integer:= 8;
    i_precision                 : integer:= 12;
    i_full_range                : boolean:= FALSE);
port (                          
    clk                         : in  std_logic;
    rst_l                       : in  std_logic;
    iRgb                        : in channel;
    y                           : out std_logic_vector(i_data_width-1 downto 0);
    cb                          : out std_logic_vector(i_data_width-1 downto 0);
    cr                          : out std_logic_vector(i_data_width-1 downto 0);
    oValid                      : out std_logic);
end component rgb_ycbcr;
component colorCorrection is
generic (
    img_width                   : integer := 4096;
    i_data_width                : integer := 8);
port (                          
    clk                         : in std_logic;
    rst_l                       : in std_logic;
    iRgb                        : in channel;
    als                         : in coefficient;
    oRgb                        : out channel);
end component colorCorrection; 
component ImageKernel is
generic (
    SHARP_FRAME           : boolean := false;
    BLURE_FRAME           : boolean := false;
    EMBOS_FRAME           : boolean := false;
    YCBCR_FRAME           : boolean := false;
    SOBEL_FRAME           : boolean := false;
    CGAIN_FRAME           : boolean := false;
    img_width             : integer := 4096;
    i_data_width          : integer := 8);
port (                          
    clk                   : in std_logic;
    rst_l                 : in std_logic;
    iRgb                  : in channel;
    als                   : in coefficient;
    oEdgeValid            : out std_logic;
    oRgb                  : out colors);
end component ImageKernel; 
component KernelCore is
generic (
    SHARP_FRAME           : boolean := false;
    BLURE_FRAME           : boolean := false;
    EMBOS_FRAME           : boolean := false;
    YCBCR_FRAME           : boolean := false;
    SOBEL_FRAME           : boolean := false;
    CGAIN_FRAME           : boolean := false;
    img_width             : integer := 4096;
    i_data_width          : integer := 8);
port (                          
    clk              : in std_logic;
    rst_l            : in std_logic;
    iRgb             : in channel;
    kCoeff           : in kernelCoeff;
    oRgb             : out channel);
end component KernelCore; 
component tap_buffer
generic (
    img_width                   : integer := 4096;
    dataWidth                   : integer := 12;
    addrWidth                   : integer := 12);
port (
    write_clk                   : in std_logic;
    write_enb                   : in std_logic;
    w_address                   : in std_logic_vector(addrWidth - 1 downto 0);
    idata                       : in std_logic_vector(dataWidth - 1 downto 0);
    read_clk                    : in std_logic;
    r_address                   : in std_logic_vector(addrWidth - 1 downto 0);
    odata                       : out std_logic_vector(dataWidth - 1 downto 0));
end component;
component mWrRd
generic (
    revision_number             : std_logic_vector(31 downto 0) := x"00000000";
    s_data_width                : integer    := 16;
    b_data_width                : integer    := 32);
port (
    seconds                     : in std_logic_vector(5 downto 0);
    minutes                     : in std_logic_vector(5 downto 0);
    hours                       : in std_logic_vector(4 downto 0);
    rgbCoord                    : out region;
    aBusSelect                  : out std_logic_vector(b_data_width-1 downto 0);
    threshold                   : out std_logic_vector(s_data_width-1 downto 0);
    videoChannel                : out std_logic_vector(b_data_width-1 downto 0);
    dChannel                    : out std_logic_vector(b_data_width-1 downto 0);
    cChannel                    : out std_logic_vector(b_data_width-1 downto 0);
    oRgbOsharp                  : out std_logic_vector(b_data_width-1 downto 0);
    oEdgeType                   : out std_logic_vector(b_data_width-1 downto 0);
    pRegion                     : out poi;
    als                         : out coefficient;
    kls                         : out coefficient;
    oLumTh                      : out integer;
    oHsvPerCh                   : out integer;
    oYccPerCh                   : out integer;
    fifoStatus                  : in std_logic_vector(b_data_width-1 downto 0);
    gridLockDatao               : in std_logic_vector(b_data_width-1 downto 0);
    wrRegsIn                    : in mRegs;
    rdRegsOut                   : out mRegs);
end component;
component pixelCord is
port (                          
    clk                         : in std_logic;
    iRgb                        : in channel;
    iPixelEn                    : in std_logic;
    iEof                        : in std_logic;
    iCord                       : in cord;
    oRgb                        : out channel);
end component pixelCord; 
component AxisExternal
generic (
    revision_number             : std_logic_vector(31 downto 0) := x"05022019";
    C_rgb_m_axis_TDATA_WIDTH    : integer := 16;
    C_rgb_s_axis_TDATA_WIDTH    : integer := 16;
    C_m_axis_mm2s_TDATA_WIDTH   : integer := 16;
    C_vfpConfig_DATA_WIDTH      : integer := 32;
    C_vfpConfig_ADDR_WIDTH      : integer := 8;
    conf_data_width             : integer := 32;
    conf_addr_width             : integer := 8;
    i_data_width                : integer := 8;
    s_data_width                : integer := 16;
    b_data_width                : integer := 32);
port (
    iBusSelect                  : in std_logic_vector(b_data_width-1 downto 0);
    iStreamData                 : in vStreamData;
    oWrRegs                     : out mRegs;
    iRdRegs                     : in mRegs;
    rgb_m_axis_aclk             : in std_logic;
    rgb_m_axis_aresetn          : in std_logic;
    rgb_m_axis_tready           : in std_logic;
    rgb_m_axis_tvalid           : out std_logic;
    rgb_m_axis_tlast            : out std_logic;
    rgb_m_axis_tuser            : out std_logic;
    rgb_m_axis_tdata            : out std_logic_vector(C_rgb_m_axis_TDATA_WIDTH-1 downto 0);
    rgb_s_axis_aclk             : in std_logic;
    rgb_s_axis_aresetn          : in std_logic;
    rgb_s_axis_tready           : out std_logic;
    rgb_s_axis_tvalid           : in std_logic;
    rgb_s_axis_tuser            : in std_logic;
    rgb_s_axis_tlast            : in std_logic;
    rgb_s_axis_tdata            : in std_logic_vector(C_rgb_s_axis_TDATA_WIDTH-1 downto 0);
    m_axis_mm2s_aclk            : in std_logic;
    m_axis_mm2s_aresetn         : in std_logic;
    m_axis_mm2s_tready          : in std_logic;
    m_axis_mm2s_tvalid          : out std_logic;
    m_axis_mm2s_tuser           : out std_logic;
    m_axis_mm2s_tlast           : out std_logic;
    m_axis_mm2s_tdata           : out std_logic_vector(C_m_axis_mm2s_TDATA_WIDTH-1 downto 0);
    m_axis_mm2s_tkeep           : out std_logic_vector(2 downto 0);
    m_axis_mm2s_tstrb           : out std_logic_vector(2 downto 0);
    m_axis_mm2s_tid             : out std_logic_vector(0 downto 0);
    m_axis_mm2s_tdest           : out std_logic_vector(0 downto 0);
    vfpconfig_aclk              : in std_logic;
    vfpconfig_aresetn           : in std_logic;
    vfpconfig_awaddr            : in std_logic_vector(C_vfpConfig_ADDR_WIDTH-1 downto 0);
    vfpconfig_awprot            : in std_logic_vector(2 downto 0);
    vfpconfig_awvalid           : in std_logic;
    vfpconfig_awready           : out std_logic;
    vfpconfig_wdata             : in std_logic_vector(C_vfpConfig_DATA_WIDTH-1 downto 0);
    vfpconfig_wstrb             : in std_logic_vector((C_vfpConfig_DATA_WIDTH/8)-1 downto 0);
    vfpconfig_wvalid            : in std_logic;
    vfpconfig_wready            : out std_logic;
    vfpconfig_bresp             : out std_logic_vector(1 downto 0);
    vfpconfig_bvalid            : out std_logic;
    vfpconfig_bready            : in std_logic;
    vfpconfig_araddr            : in std_logic_vector(C_vfpConfig_ADDR_WIDTH-1 downto 0);
    vfpconfig_arprot            : in std_logic_vector(2 downto 0);
    vfpconfig_arvalid           : in std_logic;
    vfpconfig_arready           : out std_logic;
    vfpconfig_rdata             : out std_logic_vector(C_vfpConfig_DATA_WIDTH-1 downto 0);
    vfpconfig_rresp             : out std_logic_vector(1 downto 0);
    vfpconfig_rvalid            : out std_logic;
    vfpconfig_rready            : in std_logic);
end component;
component fixedToFloat is
port (                
    aclk                    : in STD_LOGIC;
    s_axis_a_tvalid         : in STD_LOGIC;
    s_axis_a_tdata          : in STD_LOGIC_VECTOR (31 downto 0 );
    m_axis_result_tvalid    : out STD_LOGIC;
    m_axis_result_tdata     : out STD_LOGIC_VECTOR (31 downto 0));
end component fixedToFloat;
component floatToFixed is
port (                
    aclk                    : in STD_LOGIC;
    s_axis_a_tvalid         : in STD_LOGIC;
    s_axis_a_tdata          : in STD_LOGIC_VECTOR (31 downto 0 );
    m_axis_result_tvalid    : out STD_LOGIC;
    m_axis_result_tdata     : out STD_LOGIC_VECTOR (31 downto 0));
end component floatToFixed;
component squareRootTop is
port ( 
    clk                         : in std_logic;
    ivalid                      : in std_logic;
    idata                       : in std_logic_vector(31 downto 0);
    ovalid                      : out std_logic;
    odata                       : out std_logic_vector(31 downto 0));
end component squareRootTop;
component squareRoot is
port (                
    aclk                    : in STD_LOGIC;
    s_axis_a_tvalid         : in STD_LOGIC;
    s_axis_a_tdata          : in STD_LOGIC_VECTOR (31 downto 0);
    m_axis_result_tvalid    : out STD_LOGIC;
    m_axis_result_tdata     : out STD_LOGIC_VECTOR (31 downto 0));
end component squareRoot;

end package;
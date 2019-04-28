--04112019 [04-11-2019]
library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantspackage.all;
use work.vpfRecords.all;
package portspackage is
component videoSelect is
    port (
    clk               : in std_logic;
    rst_l             : in std_logic;
    videoChannel      : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    dChannel          : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    cChannel          : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    cRgbOsharp        : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    iFrameData        : in fcolors;
    oEof              : out std_logic;
    oSof              : out std_logic;
    oCord             : out coord;
    oRgb              : out channel);
end component videoSelect;
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
    iEof                 : in std_logic;
    iSof                 : in std_logic;
	iCord                : in coord;
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
generic (
    img_width         : integer:= 0);
port (
    m_axis_aclk       : in std_logic;
    m_axis_aresetn    : in std_logic;
    pixclk            : in std_logic;
    ifval             : in std_logic;
    ilval             : in std_logic;
    idata             : in std_logic_vector(11 downto 0);
    oRawData          : out rData);
end component d5m_raw_data;
component videoProcess_v1_0_Config is
generic (
    revision_number         : std_logic_vector(31 downto 0) := x"02052019";
    C_S_AXI_DATA_WIDTH      : integer:= 32;
    C_S_AXI_ADDR_WIDTH      : integer:= 4);
port (
    wrRegsOut               : out mRegs;
    rdRegsIn                : in mRegs;
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
end component videoProcess_v1_0_Config;
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
component squareRootTop is
port ( 
    clk            : in std_logic;
    ivalid         : in std_logic;
    idata          : in std_logic_vector(31 downto 0);
    ovalid         : out std_logic;
    odata          : out std_logic_vector(31 downto 0));
end component squareRootTop;
component sharpMac is
port (                
    clk         : in std_logic;
    rst_l       : in std_logic;
    vTap0x      : in std_logic_vector(7 downto 0);
    vTap1x      : in std_logic_vector(7 downto 0);
    vTap2x      : in std_logic_vector(7 downto 0);
    kls         : in coefficient;  
    endOfFrame  : in std_logic;     
    DataO       : out std_logic_vector(7 downto 0));
end component sharpMac;
component dataTaps is
generic (
    img_width                   : integer := 4096;
    adwr_width                  : integer := 15;
    p_data_width                : integer := 11;
    addr_width                  : integer := 11);
port (                          
    aclk        : in std_logic;
    iRawData    : in rData;
    oTpData     : out rTp);
end component dataTaps;
component raw2rgb is 
port (                          
    clk            : in std_logic;
    rst_l          : in std_logic;
    iTpData        : in rTp;
    oRgbSet        : out rRgb);
end component raw2rgb;
component digiClk is
port (
    clk1                        : in std_logic;
    seconds                     : out std_logic_vector(5 downto 0);
    minutes                     : out std_logic_vector(5 downto 0);
    hours                       : out std_logic_vector(4 downto 0));
end component digiClk;
component frameProcess is
generic (
    i_data_width      : integer := 8;
    s_data_width      : integer := 16;
    b_data_width      : integer := 32;
    img_width         : integer := 256;
    adwr_width        : integer := 16;
    addr_width        : integer := 11);
port (              
    clk               : in std_logic;
    rst_l             : in std_logic;
    iRgbSet           : in rRgb;
    --cpu side in
    iRgbCoord         : in region;
    iPoiRegion        : in poi;
    iKls              : in coefficient;
    iAls              : in coefficient;
    iEdgeType         : in std_logic_vector(b_data_width-1 downto 0);
    iThreshold        : in std_logic_vector(s_data_width-1 downto 0); 
    --out
    oFrameData        : out fcolors;
    --to cpu
    oFifoStatus       : out std_logic_vector(b_data_width-1 downto 0);
    oGridLockData     : out std_logic_vector(b_data_width-1 downto 0));
end component frameProcess;
component frameTestPattern is
generic (
    s_data_width  : integer := 16);
port (             
    clk                   : in std_logic;
    iValid                : in std_logic;
    iCord                 : in coord;
    oRgb                  : out tpRgb);
end component frameTestPattern;
component sharpFilter is
generic (
    i_data_width  : integer := 8;
    img_width     : integer := 256;
    adwr_width    : integer := 16;
    addr_width    : integer := 11);
port (                
    clk           : in std_logic;
    rst_l         : in std_logic;
    iRgb          : in channel;
    kls           : in coefficient;
    endOfFrame    : in std_logic;   
    oRgb          : out channel);
end component sharpFilter;
component blurFilter is
generic (
    i_data_width  : integer := 8;
    img_width     : integer := 256;
    adwr_width    : integer := 16;
    addr_width    : integer := 11);
port (                
    clk            : in std_logic;
    rst_l          : in std_logic;
    iRgb           : in channel;
    oRgb           : out blurchannel);
end component blurFilter;
component blurMac is
port (                
	clk            : in std_logic;
	rst_l          : in std_logic;
	vTap0x         : in std_logic_vector(7 downto 0);
	vTap1x         : in std_logic_vector(7 downto 0);
	vTap2x         : in std_logic_vector(7 downto 0);
    DataO          : out std_logic_vector(11 downto 0));
end component blurMac;
component sobel is
generic (
    i_data_width   : integer := 8;
    img_width      : integer := 256;
    adwr_width     : integer := 16;
    addr_width     : integer := 11);
port (                
    clk            : in std_logic;
    rst_l          : in std_logic;
    iRgb           : in channel;
    bRgb           : in channel;
    sRgb           : in channel;
    oRgb           : out channel;
    oRgbRemix      : out channel;
    videoChannel   : in std_logic_vector(31 downto 0);
    endOfFrame     : in std_logic;
    threshold      : in std_logic_vector(15 downto 0);
    kls            : in coefficient);
end component sobel;
component detect is
generic (
    i_data_width    : integer := 8);
port (
    clk            : in std_logic;
    rst_l          : in std_logic;
    endOfFrame     : in std_logic;
    iRgb           : in channel;
    oRgb           : out channel;
    rgbCoord       : in region;
    iCord          : in coord;
    pDetect        : out std_logic);
end component detect;
component pointOfInterest is
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
end component pointOfInterest;
component gridLockFifo is
generic (
    DATA_WIDTH       : integer := 24;
    ADDR_WIDTH       : integer := 14);
port (
    clk              : in  std_logic;
    clrStatus        : in  std_logic;
    --READ PORT
    rdEn             : in  std_logic;
    rdAddress        : in  std_logic_vector (ADDR_WIDTH-1 downto 0);
    dataO            : out std_logic_vector (DATA_WIDTH-1 downto 0);
    --WRITE PORT
    wrEn             : in  std_logic;
    wrAddress        : in  std_logic_vector (ADDR_WIDTH-1 downto 0);
    dataIn           : in  std_logic_vector (DATA_WIDTH-1 downto 0);
    --STATUS
    wrDone           : out std_logic;
    rdDone           : out std_logic;
    emptyO           : out std_logic;
    fullO            : out std_logic);
end component;
component hsv_c is
    generic (
    i_data_width    : integer := 8);
    port (  
    clk            : in  std_logic;
    reset          : in  std_logic;
    iRgb           : in channel;
    oHsv           : out hsvChannel);
end component hsv_c;
component divider
port (
    clk            :  in std_logic;
    dividend       : in std_logic_vector(15 downto 0);
    divisor        : in std_logic_vector(15 downto 0);
    quotient       : out std_logic_vector(15 downto 0);
    remainder      : out std_logic_vector(15 downto 0));
end component;
component rgb_ycbcr is
generic (
    i_data_width    : integer:= 8;
    i_precision     : integer:= 12;
    i_full_range    : boolean:= FALSE);
port (                          
    clk       : in  std_logic;
    rst_l     : in  std_logic;
    iRgb      : in channel;
    y         : out std_logic_vector(i_data_width-1 downto 0);
    cb        : out std_logic_vector(i_data_width-1 downto 0);
    cr        : out std_logic_vector(i_data_width-1 downto 0);
    oValid    : out std_logic);
end component rgb_ycbcr;
component colorCorrection is
generic (
    i_data_width    : integer := 8);
port (                          
    clk       : in std_logic;
    rst_l     : in std_logic;
    iRgb      : in channel;
    als       : in coefficient;
    oRgb      : out channel);
end component colorCorrection;   
component tap_buffer
generic (
    img_width    : integer := 4096;
    p_data_width : integer := 11;
    addr_width   : integer := 11);
port (
    write_clk    : in std_logic;
    write_enb    : in std_logic;
    w_address    : in std_logic_vector(addr_width downto 0);
    idata        : in std_logic_vector(p_data_width downto 0);
    read_clk     : in std_logic;
    r_address    : in std_logic_vector(addr_width downto 0);
    odata        : out std_logic_vector(p_data_width downto 0));
end component;
component mWrRd
generic (
    revision_number  : std_logic_vector(31 downto 0) := x"00000000";
    data_width       : integer    := 32);
port (
    seconds          : in std_logic_vector(5 downto 0);
    minutes          : in std_logic_vector(5 downto 0);
    hours            : in std_logic_vector(4 downto 0);
    rgbCoord         : out region;
    aBusSelect       : out std_logic_vector(data_width-1 downto 0);
    threshold        : out std_logic_vector(15 downto 0);
    videoChannel     : out std_logic_vector(data_width-1 downto 0);
    dChannel         : out std_logic_vector(data_width-1 downto 0);
    cChannel         : out std_logic_vector(data_width-1 downto 0);
    oRgbOsharp       : out std_logic_vector(data_width-1 downto 0);
    oEdgeType        : out std_logic_vector(data_width-1 downto 0);
    pRegion          : out poi;
    als              : out coefficient;
    kls              : out coefficient;
    fifoStatus       : in std_logic_vector(data_width-1 downto 0);
    gridLockDatao    : in std_logic_vector(data_width-1 downto 0);
    wrRegsIn         : in mRegs;
    rdRegsOut        : out mRegs);
end component;
end package;
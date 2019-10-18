// INTERFACE : axi_lite_IF [AXI4_LITE]
interface d5m_camera_if(input bit ACLK,pixclk,reset,ARESETN);
`define d5m_data1x_witdh 12
`define axi_data1x_witdh 15

`define d5m_data2x_witdh 24
`define axi_data2x_witdh 24

    logic [23:0]    idata;
    logic           ifval;
    logic           ilval;
    logic [7:0]     AWADDR;
    logic [ 2:0]    AWPROT;
    logic           AWVALID;
    logic           AWREADY;
    logic [31:0]    WDATA;
    logic [ 3:0]    WSTRB;
    logic           WVALID;
    logic           WREADY;
    logic [1:0]     BRESP;
    logic           BVALID;
    logic           BREADY;
    logic [7:0]     ARADDR;
    logic [ 2:0]    ARPROT;
    logic           ARVALID;
    logic           ARREADY;
    logic [31:0]    RDATA;
    logic [ 1:0]    RRESP;
    logic           RVALID;
    logic           RREADY;
    logic           rgb_m_axis_tready; //input
    logic           rgb_m_axis_tvalid; //output
    logic           rgb_m_axis_tlast;  //output
    logic           rgb_m_axis_tuser;  //output
    logic [23:0]    rgb_m_axis_tdata;  //output
    //rx channel               
    logic           rgb_s_axis_tready;//output
    logic           rgb_s_axis_tvalid;//input
    logic           rgb_s_axis_tlast; //input
    logic           rgb_s_axis_tuser; //input
    logic [23:0]    rgb_s_axis_tdata; //input
    //destination channel                                    
    logic           m_axis_mm2s_tready;//input
    logic           m_axis_mm2s_tvalid;//output
    logic           m_axis_mm2s_tuser; //output
    logic           m_axis_mm2s_tlast; //output
    logic [23:0]    m_axis_mm2s_tdata; //output
    logic [2:0]     m_axis_mm2s_tkeep; //output
    logic [2:0]     m_axis_mm2s_tstrb; //output
    logic [0:0]     m_axis_mm2s_tid;   //output
    logic [0:0]     m_axis_mm2s_tdest; //output
    //
    logic           valid;             //output
    logic [7:0]     red;               //output
    logic [7:0]     green;             //output
    logic [7:0]     blue;              //output
    logic [11:0]    xCord;             //output
    logic [11:0]    yCord;             //output
    logic           endOfFrame;        //output
    logic           readyToRead; 
    logic [23:0]    rgb;             //output
    logic           lvalid;          //output
    logic           fvalid;          //output
    modport ConfigMaster(input pixclk,reset,idata,ifval,ilval,ACLK,ARESETN,AWADDR,AWPROT,AWVALID,WDATA,WSTRB,WVALID,BREADY,ARADDR,ARPROT,ARVALID,RREADY,rgb_m_axis_tready,rgb_s_axis_tvalid,rgb_s_axis_tlast,rgb_s_axis_tuser,rgb_s_axis_tdata,m_axis_mm2s_tready,readyToRead, 
    output  AWREADY,ARREADY,RDATA,RRESP,RVALID,WREADY,BRESP,BVALID,rgb_m_axis_tvalid,rgb_m_axis_tlast,rgb_m_axis_tuser,rgb_m_axis_tdata,rgb_s_axis_tready,m_axis_mm2s_tvalid,m_axis_mm2s_tuser,m_axis_mm2s_tlast,m_axis_mm2s_tdata,m_axis_mm2s_tkeep,m_axis_mm2s_tstrb,m_axis_mm2s_tid,m_axis_mm2s_tdest,valid,red,green,blue,xCord,yCord,endOfFrame,rgb,lvalid,fvalid);
endinterface: d5m_camera_if
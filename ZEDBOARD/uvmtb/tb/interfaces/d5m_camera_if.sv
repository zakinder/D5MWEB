// INTERFACE : axi_lite_IF [AXI4_LITE]
interface d5m_camera_if(input bit ACLK,pixclk,reset,ARESETN);
    logic [11:0]    idata;
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
    modport         ConfigMaster(input pixclk,reset,idata,ifval,ilval,ACLK,ARESETN,AWADDR,AWPROT,AWVALID,WDATA,WSTRB,WVALID,BREADY,ARADDR,ARPROT,ARVALID,RREADY, output  AWREADY,ARREADY,RDATA,RRESP,RVALID,WREADY,BRESP,BVALID);
endinterface: d5m_camera_if
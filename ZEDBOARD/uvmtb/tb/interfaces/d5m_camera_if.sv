// INTERFACE : axi_lite_IF [AXI4_LITE]
interface d5m_camera_if(input bit pixclk,reset);
    logic [11:0]    idata;
    logic           ifval;
    logic           ilval;
    modport         ConfigMaster(input pixclk,reset,idata,ifval,ilval);
endinterface: d5m_camera_if
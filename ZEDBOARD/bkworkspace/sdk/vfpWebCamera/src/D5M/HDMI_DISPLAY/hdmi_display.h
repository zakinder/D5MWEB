#ifndef __ZED_HDMI_DISPLAY_H__
#define __ZED_HDMI_DISPLAY_H__
#include <xaxivdma.h>
#include <xbasic_types.h>
#include <xvtc.h>
#include "../HDMI_IIC/zed_iic.h"
struct struct_hdmi_display_start
{
   Xuint32 uBaseAddr_IIC_HdmiOut;
   Xuint32 uBaseAddr_CFA;
   Xuint32 uDeviceId_VTC_HdmioGenerator;
   Xuint32 uDeviceId_VDMA_HdmiDisplay;
   Xuint32 uNumFrames_HdmiDisplay;
   zed_iic_t hdmi_out_iic;
   XVtc vtc_hdmio_generator;
   XAxiVdma vdma_hdmi;
   XAxiVdma_DmaSetup vdmacfg_hdmi_read;
   XAxiVdma_DmaSetup vdmacfg_hdmi_write;
   Xuint32 bVerbose;
   // HDMI Output settings
   Xuint32 hdmio_width_Stride;
   Xuint32 hdmio_height;
   Xuint32 hdmio_resolution;
   Xuint32 time;
   Xuint32 sec;
   Xuint32 min;
   Xuint32 hr;
   Xuint32 exposer;
   Xuint32 brightness;
   Xuint32 pixelvalue;
   Xuint32 video_address;
   Xuint32 fifoData;
   Xuint8 lockData;
   Xuint8 fifoEmptyh;
   Xuint8 fifoFullh;
   Xuint16 cpuGridCont;
   
   
   
   Xuint16 fRgbCoordRL;
   Xuint16 fRgbCoordRH;
   
   Xuint16 fRgbCoordGL;
   Xuint16 fRgbCoordGH;
   
   Xuint16 fRgbCoordBL;
   Xuint16 fRgbCoordBH;

   
   
   
   
   
   
};
typedef struct struct_hdmi_display_start hdmi_display_start;

hdmi_display_start pvideo;
#define VDMA_BASEADDR XPAR_AXIVDMA_0_BASEADDR
#define CARRIER_HDMI_OUT_CONFIG_LEN  (40)
#define VIDEO_BASEADDR0 0x01000000 + 0x01000000
#define VIDEO_BASEADDR1 XPAR_DDR_MEM_BASEADDR + 0x3000000
#define VIDEO_BASEADDR2 XPAR_DDR_MEM_BASEADDR + 0x4000000
void buffer();
void d5m_vdma_hdmi(hdmi_display_start *pvideo);
void buffer_vdma_hdmi(hdmi_display_start *pvideo);
void colorBars_vdma_hdmi(hdmi_display_start *pvideo);
void bars(hdmi_display_start *pvideo);
void VdmaInit();
void clear_colorBars();
int colorBars();
#endif // __ZED_HDMI_DISPLAY_H__

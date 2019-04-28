#ifndef __ZED_HDMI_DISPLAY_H__
#define __ZED_HDMI_DISPLAY_H__

#include "../SYSTEM_CONFIG_HEADER/system_config_header.h"

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

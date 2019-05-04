// LAST TESTED : 05/03/2019
#include "hdmi_display.h"
#include "../MENU_CALLS/menu_calls.h"
#include <sleep.h>
#include <xil_cache.h>
#include <xil_printf.h>
#include <xil_types.h>
#include <xparameters.h>
#include "../SYSTEM_CONFIG_HEADER/system_config_header.h"
#include "../UART/uartio.h"
#include "../VIDEO_FRAME_BUFFER/video_frame_buffer.h"
#include "../VIDEO_GENERATOR/video_generator.h"
#define VDMA_BASEADDR XPAR_AXIVDMA_0_BASEADDR
u32 srcBufferx1 = VIDEO_BASEADDR0;
u32 srcBufferx2 = VIDEO_BASEADDR1;
u32 srcBufferx3 = VIDEO_BASEADDR2;
Xuint8 carrier_hdmi_out_configs[CARRIER_HDMI_OUT_CONFIG_LEN][3] =
{
    {ADV7511_ADDR>>1, 0x15, 0x01}, // Input YCbCr 4:2:2 with seperate syncs
    {ADV7511_ADDR>>1, 0x16, 0x38}, // Output format 444, Input Color Depth = 8
                                   //    R0x16[  7] = Output Video Format = 0 (444)
                                   //    R0x16[5:4] = Input Video Color Depth = 11 (8 bits/color)
                                   //    R0x16[3:2] = Input Video Style = 10 (style 1)
                                   //    R0x16[  1] = DDR Input Edge = 0 (falling edge)
                                   //    R0x16[  0] = Output Color Space = 0 (RGB)
#if 0
    // HDTV YCbCr (16to235) to RGB (0to255)
    {ADV7511_ADDR>>1, 0x18, 0xE7}, // Color Space Conversion
                                   //    R0x18[  7] = CSC enable = 1 (CSC enabled)
                                   //    R0x18[6:5] = CSC Scaling Factor = 11 (+/- 4.0, -16384 - 16380)
                                   //    R0x18[4:0] = CSC coefficient A1[12:8] = 00111
    {ADV7511_ADDR>>1, 0x19, 0x34}, //    R0x19[7:0] = CSC coefficient A1[ 7:0] =      00110100
    {ADV7511_ADDR>>1, 0x1A, 0x04}, //    R0x1A[  5] = CSC coefficient update
                                   //    R0x1A[4:0] = CSC coefficient A2[12:8] = 00100
    {ADV7511_ADDR>>1, 0x1B, 0xAD}, //    R0x1B[7:0] = CSC coefficient A2[ 7:0] =      10101101
    {ADV7511_ADDR>>1, 0x1C, 0x00}, //    R0x1C[4:0] = CSC coefficient A3[12:8] = 00000
    {ADV7511_ADDR>>1, 0x1D, 0x00}, //    R0x1D[7:0] = CSC coefficient A3[ 7:0] =      00000000
    {ADV7511_ADDR>>1, 0x1E, 0x1C}, //    R0x1E[4:0] = CSC coefficient A4[12:8] = 11100
    {ADV7511_ADDR>>1, 0x1F, 0x1B}, //    R0x1F[7:0] = CSC coefficient A4[ 7:0] =      00011011
    {ADV7511_ADDR>>1, 0x20, 0x1D}, //    R0x20[4:0] = CSC coefficient B1[12:8] = 11101
    {ADV7511_ADDR>>1, 0x21, 0xDC}, //    R0x21[7:0] = CSC coefficient B1[ 7:0] =      11011100
    {ADV7511_ADDR>>1, 0x22, 0x04}, //    R0x22[4:0] = CSC coefficient B2[12:8] = 00100
    {ADV7511_ADDR>>1, 0x23, 0xAD}, //    R0x23[7:0] = CSC coefficient B2[ 7:0] =      10101101
    {ADV7511_ADDR>>1, 0x24, 0x1F}, //    R0x24[4:0] = CSC coefficient B3[12:8] = 11111
    {ADV7511_ADDR>>1, 0x25, 0x24}, //    R0x25[7:0] = CSC coefficient B3[ 7:0] =      00100100
    {ADV7511_ADDR>>1, 0x26, 0x01}, //    R0x26[4:0] = CSC coefficient B4[12:8] = 00001
    {ADV7511_ADDR>>1, 0x27, 0x35}, //    R0x27[7:0] = CSC coefficient B4[ 7:0] =      00110101
    {ADV7511_ADDR>>1, 0x28, 0x00}, //    R0x28[4:0] = CSC coefficient C1[12:8] = 00000
    {ADV7511_ADDR>>1, 0x29, 0x00}, //    R0x29[7:0] = CSC coefficient C1[ 7:0] =      00000000
    {ADV7511_ADDR>>1, 0x2A, 0x04}, //    R0x2A[4:0] = CSC coefficient C2[12:8] = 00100
    {ADV7511_ADDR>>1, 0x2B, 0xAD}, //    R0x2B[7:0] = CSC coefficient C2[ 7:0] =      10101101
    {ADV7511_ADDR>>1, 0x2C, 0x08}, //    R0x2C[4:0] = CSC coefficient C3[12:8] = 01000
    {ADV7511_ADDR>>1, 0x2D, 0x7C}, //    R0x2D[7:0] = CSC coefficient C3[ 7:0] =      01111100
    {ADV7511_ADDR>>1, 0x2E, 0x1B}, //    R0x2E[4:0] = CSC coefficient C4[12:8] = 11011
    {ADV7511_ADDR>>1, 0x2F, 0x77}, //    R0x2F[7:0] = CSC coefficient C4[ 7:0] =      01110111
#else
    // HDTV YCbCr (16to235) to RGB (16to235)
    {ADV7511_ADDR>>1, 0x18, 0xAC},
    {ADV7511_ADDR>>1, 0x19, 0x53},
    {ADV7511_ADDR>>1, 0x1A, 0x08},
    {ADV7511_ADDR>>1, 0x1B, 0x00},
    {ADV7511_ADDR>>1, 0x1C, 0x00},
    {ADV7511_ADDR>>1, 0x1D, 0x00},
    {ADV7511_ADDR>>1, 0x1E, 0x19},
    {ADV7511_ADDR>>1, 0x1F, 0xD6},
    {ADV7511_ADDR>>1, 0x20, 0x1C},
    {ADV7511_ADDR>>1, 0x21, 0x56},
    {ADV7511_ADDR>>1, 0x22, 0x08},
    {ADV7511_ADDR>>1, 0x23, 0x00},
    {ADV7511_ADDR>>1, 0x24, 0x1E},
    {ADV7511_ADDR>>1, 0x25, 0x88},
    {ADV7511_ADDR>>1, 0x26, 0x02},
    {ADV7511_ADDR>>1, 0x27, 0x91},
    {ADV7511_ADDR>>1, 0x28, 0x1F},
    {ADV7511_ADDR>>1, 0x29, 0xFF},
    {ADV7511_ADDR>>1, 0x2A, 0x08},
    {ADV7511_ADDR>>1, 0x2B, 0x00},
    {ADV7511_ADDR>>1, 0x2C, 0x0E},
    {ADV7511_ADDR>>1, 0x2D, 0x85},
    {ADV7511_ADDR>>1, 0x2E, 0x18},
    {ADV7511_ADDR>>1, 0x2F, 0xBE},
#endif
    {ADV7511_ADDR>>1, 0x41, 0x10}, // Power down control
                                   // R0x41[  6] = PowerDown = 0 (power-up)
    {ADV7511_ADDR>>1, 0x48, 0x08}, // Video Input Justification
                                   // R0x48[8:7] = Video Input Justification = 01 (right justified)
    {ADV7511_ADDR>>1, 0x55, 0x00}, // Set RGB in AVinfo Frame
                                   // R0x55[6:5] = Output Format = 00 (RGB)
    {ADV7511_ADDR>>1, 0x56, 0x28}, // Aspect Ratio
                                   // R0x56[5:4] = Picture Aspect Ratio = 10 (16:9)
                                   // R0x56[3:0] = Active Format Aspect Ratio = 1000 (Same as Aspect Ratio)
    {ADV7511_ADDR>>1, 0x98, 0x03}, // ADI Recommended Write
    {ADV7511_ADDR>>1, 0x9A, 0xE0}, // ADI Recommended Write
    {ADV7511_ADDR>>1, 0x9C, 0x30}, // PLL Filter R1 Value
    {ADV7511_ADDR>>1, 0x9D, 0x61}, // Set clock divide
    {ADV7511_ADDR>>1, 0xA2, 0xA4}, // ADI Recommended Write
    {ADV7511_ADDR>>1, 0xA3, 0xA4}, // ADI Recommended Write
    {ADV7511_ADDR>>1, 0xAF, 0x04}, // HDMI/DVI Modes
                                   // R0xAF[  7] = HDCP Enable = 0 (HDCP disabled)
                                   // R0xAF[  4] = Frame Encryption = 0 (Current frame NOT HDCP encrypted)
                                   // R0xAF[3:2] = 01 (fixed)
                                   // R0xAF[  1] = HDMI/DVI Mode Select = 0 (DVI Mode)
  //{ADV7511_ADDR>>1, 0xBA, 0x00}, // Programmable delay for input video clock = 000 = -1.2ns
    {ADV7511_ADDR>>1, 0xBA, 0x60}, // Programmable delay for input video clock = 011 = no delay
    {ADV7511_ADDR>>1, 0xE0, 0xD0}, // Must be set to 0xD0 for proper operation
    {ADV7511_ADDR>>1, 0xF9, 0x00}  // Fixed I2C Address (This should be set to a non-conflicting I2C address)
};
void colorBars_vdma_hdmi(hdmi_display_start *pvideo)
{
   int ret;
   Xuint32 iterations = 0;
   xil_printf( "\n\r" );
   xil_printf( "HDMI IIC Initialization ...\n\r" );
   ret = zed_iic_axi_init(&(pvideo->hdmi_out_iic),"ZED HDMI I2C Controller", pvideo->uBaseAddr_IIC_HdmiOut );
   if ( !ret )
   {
      xil_printf( "ERROR : Failed to initialize IIC driver\n\r" );
      return -1;
   }
   xil_printf( "HDMI Output Initialization ...\n\r" );
   {
      int i;
      for ( i = 0; i < CARRIER_HDMI_OUT_CONFIG_LEN; i++ )
      {
      pvideo->hdmi_out_iic.fpIicWrite( &(pvideo->hdmi_out_iic), carrier_hdmi_out_configs[i][0], carrier_hdmi_out_configs[i][1], &(carrier_hdmi_out_configs[i][2]), 1 );
      }
   }
   xil_printf( "Clear Frame Buffer\n\r" );
   clear_colorBars();
   xil_printf( "Video DMA (Output Side) Initialization ...\n\r" );
   vgen_init( &(pvideo->vtc_hdmio_generator), pvideo->uDeviceId_VTC_HdmioGenerator );
   vgen_config( &(pvideo->vtc_hdmio_generator), pvideo->hdmio_resolution, 1 );
   Xil_Out32((VDMA_BASEADDR + 0x000), 0x00000004);
   Xil_Out32((VDMA_BASEADDR + 0x000), 0x00000008);
   Xil_Out32((VDMA_BASEADDR + 0x05C), pvideo->video_address);
   Xil_Out32((VDMA_BASEADDR + 0x060), pvideo->video_address);
   Xil_Out32((VDMA_BASEADDR + 0x064), pvideo->video_address);
   Xil_Out32((VDMA_BASEADDR + 0x058), pvideo->hdmio_width_Stride);
   Xil_Out32((VDMA_BASEADDR + 0x054), pvideo->hdmio_width_Stride);
   Xil_Out32((VDMA_BASEADDR + 0x000), 0x00000003);
   Xil_Out32((VDMA_BASEADDR + 0x050), pvideo->hdmio_height);
   vfb_tx_stop( &(pvideo->vdma_hdmi) );
   colorBars(0);
   //vfb_tx_start( &(pvideo->vdma_hdmi));
   u32 menu_enable  = 0;
   while(menu_enable != 0x20)
  {
	   menu_enable = uart_prompt_io();
   if ( iterations > 0 )
   {
      xil_printf( "\n\rPress ENTER to re-start ...\n\r" );
   }
   iterations++;
   xil_printf( "Generate Color Bars\n\r" );
   colorBars(iterations-1);
   xil_printf( "HDMI Output Re-Initialization ...\n\r" );
   {
      int i;
      for ( i = 0; i < CARRIER_HDMI_OUT_CONFIG_LEN; i++ )
      {
      pvideo->hdmi_out_iic.fpIicWrite( &(pvideo->hdmi_out_iic), carrier_hdmi_out_configs[i][0], carrier_hdmi_out_configs[i][1], &(carrier_hdmi_out_configs[i][2]), 1 );
      }
   }
   sleep(1);
   vfb_dump_registers( &(pvideo->vdma_hdmi) );
   if ( vfb_check_errors( &(pvideo->vdma_hdmi), 0 ) )
   {
      vfb_dump_registers( &(pvideo->vdma_hdmi) );
   }
   xil_printf("\n\r");
   xil_printf( "Done\n\r" );
   xil_printf("\n\r");
  }
}
void bars(hdmi_display_start *pvideo)
{
   int ret;
   Xuint32 iterations = 0;
   xil_printf( "\n\r" );
   xil_printf( "HDMI IIC Initialization ...\n\r" );
   ret = zed_iic_axi_init(&(pvideo->hdmi_out_iic),"ZED HDMI I2C Controller", pvideo->uBaseAddr_IIC_HdmiOut );
   if ( !ret )
   {
      xil_printf( "ERROR : Failed to initialize IIC driver\n\r" );
      return -1;
   }
   xil_printf( "HDMI Output Initialization ...\n\r" );
   {
      int i;
      for ( i = 0; i < CARRIER_HDMI_OUT_CONFIG_LEN; i++ )
      {
      pvideo->hdmi_out_iic.fpIicWrite( &(pvideo->hdmi_out_iic), carrier_hdmi_out_configs[i][0], carrier_hdmi_out_configs[i][1], &(carrier_hdmi_out_configs[i][2]), 1 );
      }
   }
   xil_printf( "Clear Frame Buffer\n\r" );
   clear_colorBars();
   xil_printf( "Video DMA (Output Side) Initialization ...\n\r" );
   vgen_init( &(pvideo->vtc_hdmio_generator), pvideo->uDeviceId_VTC_HdmioGenerator );
   vgen_config( &(pvideo->vtc_hdmio_generator), pvideo->hdmio_resolution, 1 );
   Xil_Out32((VDMA_BASEADDR + 0x000), 0x00000004);                  // RESET
   Xil_Out32((VDMA_BASEADDR + 0x000), 0x00000008);                  // GEN-LOCK
   Xil_Out32((VDMA_BASEADDR + 0x05C), pvideo->video_address);       // START ADDRESS
   Xil_Out32((VDMA_BASEADDR + 0x060), pvideo->video_address);       // START ADDRESS
   Xil_Out32((VDMA_BASEADDR + 0x064), pvideo->video_address);       // START ADDRESS
   Xil_Out32((VDMA_BASEADDR + 0x058), pvideo->hdmio_width_Stride);  // FRAME DELAY AND STRIDE
   Xil_Out32((VDMA_BASEADDR + 0x054), pvideo->hdmio_width_Stride);
   Xil_Out32((VDMA_BASEADDR + 0x000), 0x00000003);                  // ENABLE CIRCULAR MODE
   Xil_Out32((VDMA_BASEADDR + 0x050), pvideo->hdmio_height);
   vfb_tx_stop( &(pvideo->vdma_hdmi) );                             // STOP READING CAM
   colorBars(0);
   u32 menu_enable  = 0;
   while(D5M_mReadReg(D5M_BASE,r_sec_reg_60) != 5)
  {
   if ( iterations > 0 )
   {
      xil_printf( "\n\rPress ENTER to re-start ...\n\r" );
   }
   iterations++;
   xil_printf( "Generate Color Bars\n\r" );
   colorBars(iterations-1);
   xil_printf( "HDMI Output Re-Initialization ...\n\r" );
   {
      int i;
      for ( i = 0; i < CARRIER_HDMI_OUT_CONFIG_LEN; i++ )
      {
      pvideo->hdmi_out_iic.fpIicWrite( &(pvideo->hdmi_out_iic), carrier_hdmi_out_configs[i][0], carrier_hdmi_out_configs[i][1], &(carrier_hdmi_out_configs[i][2]), 1 );
      }
   }
   sleep(1);
    //vfb_dump_registers( &(pvideo->vdma_hdmi) );
    //if ( vfb_check_errors( &(pvideo->vdma_hdmi), 0 ) )
    //{
    //   vfb_dump_registers( &(pvideo->vdma_hdmi) );
    //}
   xil_printf("\n\r");
   xil_printf( "Done\n\r" );
   xil_printf("\n\r");
  }
}
void d5m_vdma_hdmi(hdmi_display_start *pvideo)
{
    int ret;
    int i;
    ret = zed_iic_axi_init(&(pvideo->hdmi_out_iic),"HDMI I2C Controller", pvideo->uBaseAddr_IIC_HdmiOut );
    if(ret != XST_SUCCESS)
    {
       xil_printf("Failed to initialize I2C chain\n\r" );
    }
    for ( i = 0; i < CARRIER_HDMI_OUT_CONFIG_LEN; i++ )
    {
    pvideo->hdmi_out_iic.fpIicWrite(&(pvideo->hdmi_out_iic),carrier_hdmi_out_configs[i][0],carrier_hdmi_out_configs[i][1],&(carrier_hdmi_out_configs[i][2]), 1 );
    }
    vfb_common_init(pvideo->uDeviceId_VDMA_HdmiDisplay,&(pvideo->vdma_hdmi));
    vfb_tx_init(&(pvideo->vdma_hdmi),&(pvideo->vdmacfg_hdmi_read),pvideo->hdmio_resolution,pvideo->hdmio_resolution,pvideo->video_address,pvideo->uNumFrames_HdmiDisplay);
    vgen_init( &(pvideo->vtc_hdmio_generator),pvideo->uDeviceId_VTC_HdmioGenerator);
    vgen_config( &(pvideo->vtc_hdmio_generator),pvideo->hdmio_resolution,0);
}
void manualVdmaConfig(hdmi_display_start *pvideo)
{
    int ret;
    int i;
    ret = zed_iic_axi_init(&(pvideo->hdmi_out_iic),"HDMI I2C Controller", pvideo->uBaseAddr_IIC_HdmiOut );
    if(ret != XST_SUCCESS)
    {
       xil_printf("Failed to initialize I2C chain\n\r" );
    }
    for ( i = 0; i < CARRIER_HDMI_OUT_CONFIG_LEN; i++ )
    {
    pvideo->hdmi_out_iic.fpIicWrite(&(pvideo->hdmi_out_iic),carrier_hdmi_out_configs[i][0],carrier_hdmi_out_configs[i][1],&(carrier_hdmi_out_configs[i][2]), 1 );
    }
    vgen_init( &(pvideo->vtc_hdmio_generator),pvideo->uDeviceId_VTC_HdmioGenerator);
    vgen_config( &(pvideo->vtc_hdmio_generator),pvideo->hdmio_resolution,0);
   Xil_DCacheDisable();
   //SS2M input camera data
   Xil_Out32((VDMA_BASEADDR + 0x030), 0x00000004);                 // Reset
   Xil_Out32((VDMA_BASEADDR + 0x030), 0x00000008);                 // Genlock
   Xil_Out32((VDMA_BASEADDR + 0x0AC), VIDEO_BASEADDR0);            // 1ST FRAME
   //Xil_Out32((VDMA_BASEADDR + 0x0B0), VIDEO_BASEADDR0);          // 2ND FRAME
   //Xil_Out32((VDMA_BASEADDR + 0x0B4), VIDEO_BASEADDR0);           // 3RD FRAME
   Xil_Out32((VDMA_BASEADDR + 0x0A8), pvideo->hdmio_width_Stride); // Frame Delay and Stride
   Xil_Out32((VDMA_BASEADDR + 0x0A4), pvideo->hdmio_width_Stride); // Row
   Xil_Out32((VDMA_BASEADDR + 0x030), 0x00000003);                 // Enable circular mode
   Xil_Out32((VDMA_BASEADDR + 0x0A0), pvideo->hdmio_height);       // Hight
   //MM2S output camera data
   Xil_Out32((VDMA_BASEADDR + 0x000), 0x00000004);                 // reset
   Xil_Out32((VDMA_BASEADDR + 0x000), 0x00000008);                 // gen-lock
   Xil_Out32((VDMA_BASEADDR + 0x05C), VIDEO_BASEADDR0);            // 3RD FRAME
   //Xil_Out32((VDMA_BASEADDR + 0x060), VIDEO_BASEADDR0);          // 3RD FRAME
   //Xil_Out32((VDMA_BASEADDR + 0x064), VIDEO_BASEADDR0);          // 3RD FRAME
   Xil_Out32((VDMA_BASEADDR + 0x058), pvideo->hdmio_width_Stride); //Frame Delay and Stride
   Xil_Out32((VDMA_BASEADDR + 0x054), pvideo->hdmio_width_Stride); // Row
   Xil_Out32((VDMA_BASEADDR + 0x000), 0x00000003);                 // enable circular mode
   Xil_Out32((VDMA_BASEADDR + 0x050), pvideo->hdmio_height);       // Hight
   Xil_DCacheDisable();
   printf("Compute Brightness[%i]\n",(unsigned) computeBrightness());
}
void buffer_vdma_hdmi(hdmi_display_start *pvideo)
{
    int ret;
    int i;
    ret = zed_iic_axi_init(&(pvideo->hdmi_out_iic),"HDMI I2C Controller", pvideo->uBaseAddr_IIC_HdmiOut );
    for ( i = 0; i < CARRIER_HDMI_OUT_CONFIG_LEN; i++ )
    {
    pvideo->hdmi_out_iic.fpIicWrite( &(pvideo->hdmi_out_iic), carrier_hdmi_out_configs[i][0], carrier_hdmi_out_configs[i][1], &(carrier_hdmi_out_configs[i][2]), 1 );
    }
    vgen_init( &(pvideo->vtc_hdmio_generator), pvideo->uDeviceId_VTC_HdmioGenerator );
    vgen_config( &(pvideo->vtc_hdmio_generator), pvideo->hdmio_resolution, 0 );
    Xil_Out32((VDMA_BASEADDR + 0x000), 0x00000004);      // reset
    Xil_Out32((VDMA_BASEADDR + 0x000), 0x00000008);      // gen-lock
    Xil_Out32((VDMA_BASEADDR + 0x05C), pvideo->video_address); // start address
    Xil_Out32((VDMA_BASEADDR + 0x060), VIDEO_BASEADDR1); // start address
    Xil_Out32((VDMA_BASEADDR + 0x064), VIDEO_BASEADDR2); // start address
    Xil_Out32((VDMA_BASEADDR + 0x058), pvideo->hdmio_width_Stride);//Frame Delay and Stride
    Xil_Out32((VDMA_BASEADDR + 0x054), pvideo->hdmio_width_Stride);
    Xil_Out32((VDMA_BASEADDR + 0x000), 0x00000003);      // enable circular mode
    Xil_Out32((VDMA_BASEADDR + 0x050), pvideo->hdmio_height);
    u32 menu_enable  = 0;
    while(menu_enable != 0x20)
   {
 	   menu_enable = uart_prompt_io();
      //buffer();
   }
}
void clear_colorBars()
{
   xil_printf( "Video Frame Buffer Initialization ...\n\r" );
   Xuint32 row, col;
   Xuint32 pixel;
   volatile Xuint32 *pStorageMem = (Xuint32 *) srcBufferx1;
      for ( row = 0; row < pvideo.hdmio_height; row++ )
      {
         for ( col = 0; col < pvideo.hdmio_width_Stride; col++ )
         {
            pixel = 0x00000000;
            *pStorageMem++ = pixel;
         }
      }
}
int colorBars(Xuint32 offset)
{
   Xuint16 frames, row, col;
   Xuint16 cbar, pixel;
   volatile Xuint16 *pStorageMem = (Xuint16 *) srcBufferx1;
   for ( frames = 0; frames < 1; frames++ )
   {
      for ( row = 0; row < pvideo.hdmio_height; row++ )
      {
         for ( col = 0; col < pvideo.hdmio_width_Stride; col++ )
         {
            cbar = (col * 30) / pvideo.hdmio_width_Stride;
            cbar = (cbar + offset) % 16;
            switch ( cbar )
            {
            case 0: pixel  = 0x8000; break;
            case 1: pixel  = 0xFF00; break;
            case 2: pixel  = 0x8000; break;
            case 3: pixel  = 0x0000; break;
            case 4: pixel  = 0xFF00; break;
            case 5: pixel  = 0x0000; break;
            case 6: pixel  = 0x8000; break;
            case 7: pixel  = 0x0000; break;
            case 8: pixel  = 0x8080; break;
            case 9: pixel  = 0x0000; break;
            case 10: pixel = 0x8080; break;
            case 11: pixel = 0x0000; break;
            case 12: pixel = 0x0000; break;
            case 13: pixel = 0xFF00; break;
            case 14: pixel = 0x0000; break;
            case 15: pixel = 0xFF00; break;
            case 16: pixel = 0x0000; break;
            case 17: pixel = 0x0000; break;
            case 18: pixel = 0x0000; break;
            case 19: pixel = 0x0000; break;
            case 20: pixel = 0x0000; break;
            case 21: pixel = 0x0000; break;
            case 22: pixel = 0x0000; break;
            case 23: pixel = 0x0000; break;
            case 24: pixel = 0x0000; break;
            case 25: pixel = 0x0000; break;
            case 26: pixel = 0x0000; break;
            case 27: pixel = 0x0000; break;
            case 28: pixel = 0x0000; break;
            case 29: pixel = 0x0000; break;
            case 30: pixel = 0x0000; break;
            }
            *pStorageMem++ = pixel;
         }
      }
   }
   Xil_DCacheFlush();
   return 0;
}

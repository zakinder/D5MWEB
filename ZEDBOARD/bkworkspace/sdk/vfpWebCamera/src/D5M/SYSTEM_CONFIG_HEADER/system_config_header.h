// LAST TESTED : 09/01/2019
#ifndef __SYSTEM_CONFIG_HEADER_H__
#define __SYSTEM_CONFIG_HEADER_H__
#include <xaxivdma.h>
#include <xbasic_types.h>
#include <xvtc.h>
#include "../HDMI_IIC/zed_iic.h"
typedef unsigned char un8bits;//Unsign 8 bits
typedef char sn8bits;//Sign 8 bits
typedef unsigned short un16bits;//Unsign 16 bits
typedef short sn16bits;//Sign 16 bits
typedef unsigned long un32bits;//Unsign 32 bits
typedef long sn32bits;//Sign 32 bits
typedef unsigned long long un64bits;//Unsign 64 bits
typedef signed long long sn64bits;//Sign 64 bits
typedef float Xfloat32;
typedef double Xfloat64;
typedef unsigned long Xboolean;
struct videoStreamStruct
{
   Xuint16 fDbusSelect;
   Xuint16 fThreshold;
   Xuint16 fVideoType;
   Xuint16 fMAXgridcont;
   Xuint16 fPointInterest;
   Xuint16 fFifoFixedValue;
   Xuint16 d5mExposer;
   Xuint16 d5mBrightness;
   Xuint16 fRgbCoordRL;
   Xuint16 fRgbCoordRH;
   Xuint16 fRgbCoordGL;
   Xuint16 fRgbCoordGH;
   Xuint16 fRgbCoordBL;
   Xuint16 fRgbCoordBH;
};
typedef struct videoStreamStruct videoStreamInit;
videoStreamInit pStream;
struct kernelStruct
{
   Xuint16 K1;
   Xuint16 K2;
   Xuint16 K3;
   Xuint16 K4;
   Xuint16 K5;
   Xuint16 K6;
   Xuint16 K7;
   Xuint16 K8;
   Xuint16 K9;
   Xuint16 Kc;
};
typedef struct kernelStruct sobelInit;
sobelInit pprewitt;
sobelInit psobel;
typedef struct kernelStruct colorInit;
colorInit pcolor;
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
#endif // __SYSTEM_CONFIG_HEADER_H__
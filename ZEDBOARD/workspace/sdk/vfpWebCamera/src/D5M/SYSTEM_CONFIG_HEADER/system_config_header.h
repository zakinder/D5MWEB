// LAST TESTED : 02/05/2018
#ifndef __SYSTEM_CONFIG_HEADER_H__
#define __SYSTEM_CONFIG_HEADER_H__
#include <xparameters.h>
#include <xbasic_types.h>
//OFFSETS
#define w_abusselect_reg_3         12
#define w_threshold_reg_4          16
#define w_videochannel_reg_5       20
#define w_dchannel_reg_6           24
#define w_cchannel_reg_7           28
#define w_kernel_1_reg_08          32
#define w_kernel_2_reg_09          36
#define w_kernel_3_reg_10          40
#define w_kernel_4_reg_11          44
#define w_kernel_5_reg_12          48
#define w_kernel_6_reg_13          52
#define w_kernel_7_reg_14          56
#define w_kernel_8_reg_15          60
#define w_kernel_9_reg_16          64
#define w_kernalconfig_reg_17      68
#define w_a11fl_reg_21             84
#define w_a12fl_reg_22             88
#define w_a13fl_reg_23             92
#define w_a21fl_reg_24             96
#define w_a22fl_reg_25             100
#define w_a23fl_reg_26             104
#define w_a31fl_reg_27             108
#define w_a32fl_reg_28             112
#define w_a33fl_reg_29             116
#define w_aconfig_reg_30           120
#define w_pointinterest_reg_31     124
#define w_deltaconfig_reg_32       128
#define w_cpuackgoagain_reg_33     132
#define w_cpuwgridlock_reg_34      136
#define w_cpuackoffframe_reg_35    140
#define w_gridlockaddress_reg_36   144
#define w_clearfifodata_reg_37     148
#define r_pointinterest_reg_31     124
#define r_readaddress_reg_36       144
#define r_gridlockdatai_reg_38     152
#define r_fifofullh_reg_39         156
#define r_fifoemptyh_reg_40        160
#define r_fifofullh_reg_41         164
#define r_cpugridcont_reg_42       168
#define w_rh_reg_50                200
#define w_rl_reg_51                204
#define w_gh_reg_52                208
#define w_gl_reg_53                212
#define w_bh_reg_54                216
#define w_bl_reg_55                220
#define r_sec_reg_60               240
#define r_min_reg_61               244
#define r_hour_reg_62              248
#define r_revisionnumber_reg_63    252
//-----------------------------------
#define SCREEN_WIDTH_HORIZONTAL 1920
#define SCREEN_HEIGHT_VERTICAL 1080
#define VIDEO_RESOLUTION_VGA       0
#define VIDEO_RESOLUTION_480P      1
#define VIDEO_RESOLUTION_576P      2
#define VIDEO_RESOLUTION_SVGA      3
#define VIDEO_RESOLUTION_XGA       4
#define VIDEO_RESOLUTION_720P      5
#define VIDEO_RESOLUTION_SXGA      6
#define VIDEO_RESOLUTION_1080P     7
#define VIDEO_RESOLUTION_UXGA      8
#define NUM_VIDEO_RESOLUTIONS      9
#define ADV7511_ADDR 0x72
#define H_STRIDE 3840
#define H_ACTIVE 1920
#define V_ACTIVE 1080
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
#define UART_ADDRESS XPAR_PS7_UART_1_BASEADDR
#define D5M_BASE XPAR_PS_VIDEO_D5M_VFP_VFPCONFIG_BASEADDR
#define fSharp 0x0004
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
typedef struct kernelStruct colorInit;
#endif // __SYSTEM_CONFIG_HEADER_H__

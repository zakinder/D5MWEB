// LAST TESTED : 09/08/2019
#ifndef __SYSTEM_CONFIG_DEFINES_H__
#define __SYSTEM_CONFIG_DEFINES_H__
#include <xaxivdma.h>
#define ONESECOND    0x13D92D3F
#define ONE_SECOND 3250000000
#define READ_WRITE_MUL_FACTOR 0x10
#define DEFAULT_HYPERTERMINAL_UART_ID XPAR_PS7_UART_1_DEVICE_ID
#define UART_BASEADDR        XPAR_XUARTPS_1_BASEADDR
#define UART_ADDRESS XPAR_PS7_UART_1_BASEADDR
#define D5M_BASE XPAR_PS_VIDEO_D5M_VFP_VFPCONFIG_BASEADDR
/*****************************************************************************************************************/
#define D5M_mWriteReg(BaseAddress, RegOffset, Data) \
  	Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define D5M_mReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
/*****************************************************************************************************************/
//OFFSETS
#define wSobel                      0
#define wSobelRgbDetect             1
#define wSobelRgbPoi                2
#define wHsvRgbPoi                  3
#define wSharp                      4
#define wBlurv1                     5
#define wBlurv2                     6
#define wBlurv3                     7
#define wBlurv4                     8
#define wHsv                        9
#define wRgbRemix                   11
#define wTestPatternV1              12
#define wTestPatternV2              13
#define wTestPatternV3              14
#define wTestPatternV4              15
#define wTestPatternV5              16
#define wRgbCorrect                 17
#define wHsl                        18
#define hsvCcBl                     19
/*****************************************************************************************************************/
#define selCgain                    0
#define selSharp                    1
#define selBlur                     2
#define selHsl                      3
#define selHsv                      4
#define selRgb                      5
#define selSoble                    6
#define selEmboss                   7
#define selMaskSobelLum             8
#define selMaskSobelTrm             9
#define selMaskSobelRgb             10
#define selMaskSobelShp             11
#define selMaskSobelBlu             13
#define selMaskSobelYcc             14
#define selMaskSobelHsv             15
#define selMaskSobelHsl             16
#define selMaskSobelCga             17
#define selColorTrm                 18
#define selColorLmp                 19
#define selTPattern                 20
#define selCgainToCgain             21
#define selCgainToHsl               22
#define selCgainToHsv               23
#define selCgainToYcbcr             24
#define selCgainToShp               25
#define selCgainToBlu               26
#define selShpToCgain               27
#define selShpToHsl                 28
#define selShpToHsv                 29
#define selShpToYcbcr               30
#define selShpToShp                 31
#define selShpToBlu                 32
#define selRgbCorrect               45
#define selRgbRemix                 46
#define selRgbDetect                47
#define selRgbPoi                   48
#define selYcbcr                    49
/*****************************************************************************************************************/
#define hsvPerChHsv                0
#define hsvPerChH                  1
#define hsvPerChS                  2
#define hsvPerChV                  3
#define YccPerChYCbCr              0
#define YccPerChY                  1
#define YccPerChCb                 2
#define YccPerChCr                 3
/****************************************************************
YCBCR
*****************************************************************/
#define kCoefVals_kCoeffYcbcr_k1   0x0101//--  0.257
#define kCoefVals_kCoeffYcbcr_k2   0x01F8//--  0.504
#define kCoefVals_kCoeffYcbcr_k3   0x0062//--  0.098
#define kCoefVals_kCoeffYcbcr_k4   0xFF6C//-- -0.148
#define kCoefVals_kCoeffYcbcr_k5   0xFEDD//-- -0.291
#define kCoefVals_kCoeffYcbcr_k6   0x01B7//--  0.439
#define kCoefVals_kCoeffYcbcr_k7   0x01B7//--  0.439
#define kCoefVals_kCoeffYcbcr_k8   0xFE90//-- -0.368
#define kCoefVals_kCoeffYcbcr_k9   0xFFB9//-- -0.071
#define kCoefVals_kCoeffYcbcr_kSet 1

/****************************************************************
CGAIN_1
*****************************************************************/
#define kCoefVals_kCoef1Cgain_k1   0x05DC//--  1500  =  1.500
#define kCoefVals_kCoef1Cgain_k2   0xFF06//-- -250   = -0.250
#define kCoefVals_kCoef1Cgain_k3   0xFE0C//-- -500   = -0.500
#define kCoefVals_kCoef1Cgain_k4   0xFE0C//-- -500   = -0.500
#define kCoefVals_kCoef1Cgain_k5   0x05DC//--  1500  =  1.500
#define kCoefVals_kCoef1Cgain_k6   0xFF06//-- -250   = -0.250
#define kCoefVals_kCoef1Cgain_k7   0xFF06//-- -250   = -0.250
#define kCoefVals_kCoef1Cgain_k8   0xFE0C//-- -500   = -0.500
#define kCoefVals_kCoef1Cgain_k9   0x05DC//--  1500  =  1.500
/****************************************************************
CGAIN_2
*****************************************************************/
#define kCoefVals_kCoef2Cgain_k1   0x05DC//--  1375  =  1.500
#define kCoefVals_kCoef2Cgain_k2   0xFF06//-- -250   = -0.250
#define kCoefVals_kCoef2Cgain_k3   0xFF83//-- -500   = -0.125
#define kCoefVals_kCoef2Cgain_k4   0xFF83//-- -500   = -0.125
#define kCoefVals_kCoef2Cgain_k5   0x05DC//--  1375  =  1.500
#define kCoefVals_kCoef2Cgain_k6   0xFF06//-- -250   = -0.250
#define kCoefVals_kCoef2Cgain_k7   0xFF06//-- -250   = -0.250
#define kCoefVals_kCoef2Cgain_k8   0xFF83//-- -500   = -0.125
#define kCoefVals_kCoef2Cgain_k9   0x05DC//--  1375  =  1.500
/****************************************************************
CGAIN_3
*****************************************************************/
#define kCoefVals_kCoef3Cgain_k1   0x05DC//--  1375  =  1.500
#define kCoefVals_kCoef3Cgain_k2   0xFF83//-- -250   = -0.125
#define kCoefVals_kCoef3Cgain_k3   0xFF83//-- -500   = -0.125
#define kCoefVals_kCoef3Cgain_k4   0xFF83//-- -500   = -0.125
#define kCoefVals_kCoef3Cgain_k5   0x05DC//--  1375  =  1.500
#define kCoefVals_kCoef3Cgain_k6   0xFF06//-- -250   = -0.125
#define kCoefVals_kCoef3Cgain_k7   0xFF83//-- -250   = -0.125
#define kCoefVals_kCoef3Cgain_k8   0xFF83//-- -500   = -0.125
#define kCoefVals_kCoef3Cgain_k9   0x05DC//--  1375  =  1.500
/****************************************************************
CGAIN_4
*****************************************************************/
#define kCoefVals_kCoef4Cgain_k1   0x04E2//--  1375  =  1.250
#define kCoefVals_kCoef4Cgain_k2   0xFF83//-- -250   = -0.125
#define kCoefVals_kCoef4Cgain_k3   0xFF83//-- -500   = -0.125
#define kCoefVals_kCoef4Cgain_k4   0xFF83//-- -500   = -0.125
#define kCoefVals_kCoef4Cgain_k5   0x04E2//--  1375  =  1.250
#define kCoefVals_kCoef4Cgain_k6   0xFF06//-- -250   = -0.125
#define kCoefVals_kCoef4Cgain_k7   0xFF83//-- -250   = -0.125
#define kCoefVals_kCoef4Cgain_k8   0xFF83//-- -500   = -0.125
#define kCoefVals_kCoef4Cgain_k9   0x04E2//--  1375  =  1.250
/****************************************************************
CGAIN_5
*****************************************************************/
#define kCoefVals_kCoef5Cgain_k1   0x04E2//--  1375  =  1.250
#define kCoefVals_kCoef5Cgain_k2   0xFF83//-- -250   = -0.125
#define kCoefVals_kCoef5Cgain_k3   0xFF83//-- -500   = -0.125
#define kCoefVals_kCoef5Cgain_k4   0xFF83//-- -500   = -0.125
#define kCoefVals_kCoef5Cgain_k5   0x04E2//--  1375  =  1.250
#define kCoefVals_kCoef5Cgain_k6   0xFF06//-- -250   = -0.125
#define kCoefVals_kCoef5Cgain_k7   0xFF83//-- -250   = -0.125
#define kCoefVals_kCoef5Cgain_k8   0xFF83//-- -500   = -0.125
#define kCoefVals_kCoef5Cgain_k9   0x04E2//--  1375  =  1.250
/****************************************************************
CGAIN_6
*****************************************************************/
#define kCoefVals_kCoef6Cgain_k1   0x055F//--  1375  =  1.375
#define kCoefVals_kCoef6Cgain_k2   0xFF83//-- -250   = -0.125
#define kCoefVals_kCoef6Cgain_k3   0xFF83//-- -500   = -0.125
#define kCoefVals_kCoef6Cgain_k4   0xFF83//-- -500   = -0.125
#define kCoefVals_kCoef6Cgain_k5   0x055F//--  1375  =  1.375
#define kCoefVals_kCoef6Cgain_k6   0xFF06//-- -250   = -0.125
#define kCoefVals_kCoef6Cgain_k7   0xFF83//-- -250   = -0.125
#define kCoefVals_kCoef6Cgain_k8   0xFF83//-- -500   = -0.125
#define kCoefVals_kCoef6Cgain_k9   0x055F//--  1375  =  1.375
/****************************************************************
CGAIN_7
*****************************************************************/
#define kCoefVals_kCoef7Cgain_k1   0x055F//--  1375  =  1.375
#define kCoefVals_kCoef7Cgain_k2   0xFF06//-- -250   = -0.250
#define kCoefVals_kCoef7Cgain_k3   0xFF83//-- -500   = -0.125
#define kCoefVals_kCoef7Cgain_k4   0xFF83//-- -500   = -0.125
#define kCoefVals_kCoef7Cgain_k5   0x055F//--  1375  =  1.375
#define kCoefVals_kCoef7Cgain_k6   0xFF06//-- -250   = -0.250
#define kCoefVals_kCoef7Cgain_k7   0xFF06//-- -250   = -0.250
#define kCoefVals_kCoef7Cgain_k8   0xFF83//-- -500   = -0.125
#define kCoefVals_kCoef7Cgain_k9   0x055F//--  1375  =  1.375
#define kCoefVals_kCoeffCgain_kSet 2
#define kCoefVals_kCoef2Cgain_kSet 8
/****************************************************************
SHARP
*****************************************************************/
#define kCoefVals_kCoeffSharp_k1   0x0000//--  0
#define kCoefVals_kCoeffSharp_k2   0xFE0C//-- -0.5
#define kCoefVals_kCoeffSharp_k3   0x0000//--  0
#define kCoefVals_kCoeffSharp_k4   0xFE0C//-- -0.5
#define kCoefVals_kCoeffSharp_k5   0x0BB8//--  3
#define kCoefVals_kCoeffSharp_k6   0xFE0C//-- -0.5
#define kCoefVals_kCoeffSharp_k7   0x0000//--  0
#define kCoefVals_kCoeffSharp_k8   0xFE0C//-- -0.5
#define kCoefVals_kCoeffSharp_k9   0x0000//--  0
#define kCoefVals_kCoeffSharp_kSet 3
/****************************************************************
BLURE
*****************************************************************/
#define kCoefVals_kCoeffBlure_k1   0x006F//-- 0.111
#define kCoefVals_kCoeffBlure_k2   0x006F//-- 0.111
#define kCoefVals_kCoeffBlure_k3   0x006F//-- 0.111
#define kCoefVals_kCoeffBlure_k4   0x006F//-- 0.111
#define kCoefVals_kCoeffBlure_k5   0x006F//-- 0.111
#define kCoefVals_kCoeffBlure_k6   0x006F//-- 0.111
#define kCoefVals_kCoeffBlure_k7   0x006F//-- 0.111
#define kCoefVals_kCoeffBlure_k8   0x006F//-- 0.111
#define kCoefVals_kCoeffBlure_k9   0x006F//-- 0.111
#define kCoefVals_kCoeffBlure_kSet 4
/****************************************************************
SOBEL_X
*****************************************************************/
    //  GX
    //  [-1 +0 +1]
    //  [-2 +0 +2]
    //  [-1 +0 +1]
#define kCoefVals_kCoefXSobel_k1   0xFC18//--  [-1]
#define kCoefVals_kCoefXSobel_k2   0x0000//--  [+0]
#define kCoefVals_kCoefXSobel_k3   0x03E8//--  [+1]
#define kCoefVals_kCoefXSobel_k4   0xF830//--  [-2]
#define kCoefVals_kCoefXSobel_k5   0x0000//--  [+0]
#define kCoefVals_kCoefXSobel_k6   0x07D0//--  [+2]
#define kCoefVals_kCoefXSobel_k7   0xFC18//--  [-1]
#define kCoefVals_kCoefXSobel_k8   0x0000//--  [+0]
#define kCoefVals_kCoefXSobel_k9   0x03E8//--  [+1]
#define kCoefVals_kCoefXSobel_kSet 5
/****************************************************************
SOBEL_Y
*****************************************************************/
    //  GY
    //  [+1 +2 +1]
    //  [+0 +0 +0]
    //  [-1 -2 -1]
#define kCoefVals_kCoefYSobel_k1   0x03E8//--  [+1]
#define kCoefVals_kCoefYSobel_k2   0x07D0//--  [+2]
#define kCoefVals_kCoefYSobel_k3   0x03E8//--  [+1]
#define kCoefVals_kCoefYSobel_k4   0x0000//--  [-2]
#define kCoefVals_kCoefYSobel_k5   0x0000//--  [+0]
#define kCoefVals_kCoefYSobel_k6   0x0000//--  [+2]
#define kCoefVals_kCoefYSobel_k7   0xFC18//--  [-1]
#define kCoefVals_kCoefYSobel_k8   0xF830//--  [-2]
#define kCoefVals_kCoefYSobel_k9   0xFC18//--  [-1]
#define kCoefVals_kCoefYSobel_kSet 6
/****************************************************************
EMBOS
*****************************************************************/
#define kCoefVals_kCoeffEmbos_k1   0xFC18//-- -1
#define kCoefVals_kCoeffEmbos_k2   0xFC18//-- -1
#define kCoefVals_kCoeffEmbos_k3   0x0000//--  0
#define kCoefVals_kCoeffEmbos_k4   0xFC18//-- -1
#define kCoefVals_kCoeffEmbos_k5   0x0000//--  0
#define kCoefVals_kCoeffEmbos_k6   0x03E8//--  1
#define kCoefVals_kCoeffEmbos_k7   0x0000//--  0
#define kCoefVals_kCoeffEmbos_k8   0x03E8//--  1
#define kCoefVals_kCoeffEmbos_k9   0x03E8//--  1
#define kCoefVals_kCoeffEmbos_kSet 7
/****************************************************************
PREWIT_X
*****************************************************************/
//  GX
//  [+1 +0 -1]
//  [+1 +0 -1]
//  [+1 +0 -1]
#define kCoefVals_kCoefXPrewit_k1   0x03E8//--  [+1]
#define kCoefVals_kCoefXPrewit_k2   0x0000//--  [+0]
#define kCoefVals_kCoefXPrewit_k3   0xFC18//--  [-1]
#define kCoefVals_kCoefXPrewit_k4   0x03E8//--  [+1]
#define kCoefVals_kCoefXPrewit_k5   0x0000//--  [+0]
#define kCoefVals_kCoefXPrewit_k6   0xFC18//--  [-1]
#define kCoefVals_kCoefXPrewit_k7   0x03E8//--  [+1]
#define kCoefVals_kCoefXPrewit_k8   0x0000//--  [+0]
#define kCoefVals_kCoefXPrewit_k9   0xFC18//--  [-1]
#define kCoefVals_kCoefXPrewit_kSet 5
/****************************************************************
PREWIT_Y
*****************************************************************/
//  GY
//  [+1 +1 +1]
//  [+0 +0 +0]
//  [-1 -1 -1]
#define kCoefVals_kCoefYPrewit_k1   0x03E8//--  [+1]
#define kCoefVals_kCoefYPrewit_k2   0x03E8//--  [+1]
#define kCoefVals_kCoefYPrewit_k3   0x03E8//--  [+1]
#define kCoefVals_kCoefYPrewit_k4   0x0000//--  [+0]
#define kCoefVals_kCoefYPrewit_k5   0x0000//--  [+0]
#define kCoefVals_kCoefYPrewit_k6   0x0000//--  [+0]
#define kCoefVals_kCoefYPrewit_k7   0xFC18//--  [-1]
#define kCoefVals_kCoefYPrewit_k8   0xFC18//--  [-1]
#define kCoefVals_kCoefYPrewit_k9   0xFC18//--  [-1]
#define kCoefVals_kCoefYPrewit_kSet 6
/*****************************************************************************************************************/
#define w_oRgbOsharp_reg_0          0//open
#define w_oEdgeType_reg_1           4//open
#define reg_2                       8//open
#define w_abusselect_reg_3          12
#define w_threshold_reg_4           16
#define w_videochannel_reg_5        20
#define w_dchannel_reg_6            24
#define w_cchannel_reg_7            28
/****************************************************************
KERNEL
*****************************************************************/
#define w_kernal_1_reg_08           32
#define w_kernal_2_reg_09           36
#define w_kernal_3_reg_10           40
#define w_kernal_4_reg_11           44
#define w_kernal_5_reg_12           48
#define w_kernal_6_reg_13           52
#define w_kernal_7_reg_14           56
#define w_kernal_8_reg_15           60
#define w_kernal_9_reg_16           64
#define w_kernalconfig_reg_17       68
#define w_kSet_reg_17               68
/****************************************************************
UNSED KERNEL
*****************************************************************/
#define w_a11fl_reg_21              84
#define w_a12fl_reg_22              88
#define w_a13fl_reg_23              92
#define w_a21fl_reg_24              96
#define w_a22fl_reg_25              100
#define w_a23fl_reg_26              104
#define w_a31fl_reg_27              108
#define w_a32fl_reg_28              112
#define w_a33fl_reg_29              116
#define w_aconfig_reg_30            120
#define w_pointinterest_reg_31      124
#define r_pointinterest_reg_31      124
#define w_deltaconfig_reg_32        128
#define w_cpuackgoagain_reg_33      132
#define w_cpuwgridlock_reg_34       136
#define w_cpuackoffframe_reg_35     140
#define w_gridlockaddress_reg_36    144
#define r_readaddress_reg_36        144
#define w_clearfifodata_reg_37      148
#define r_gridlockdatai_reg_38      152
#define r_fifofullh_reg_39          156
#define r_fifoemptyh_reg_40         160
#define r_fifofullh_reg_41          164
#define r_cpugridcont_reg_42        168
#define w_empty_reg_43              172
#define w_empty_reg_44              176
#define w_empty_reg_45              180
#define w_empty_reg_46              184
#define w_empty_reg_47              188
#define w_empty_reg_48              192
#define w_empty_reg_49              196
#define w_rh_reg_50                 200
#define w_rl_reg_51                 204
#define w_gh_reg_52                 208
#define w_gl_reg_53                 212
#define w_bh_reg_54                 216
#define w_bl_reg_55                 220
#define w_lumTh_reg_56              224
#define w_hsvPerCh_reg_57           228
#define w_yccPerCh_reg_58           232
#define w_empty_reg_59              236
#define r_sec_reg_60                240
#define r_min_reg_61                244
#define r_hour_reg_62               248
#define r_revisionnumber_reg_63     252
/*****************************************************************************************************************/
#define SCREEN_WIDTH_HORIZONTAL     1920
#define SCREEN_HEIGHT_VERTICAL      1080
#define VIDEO_RESOLUTION_VGA        0
#define VIDEO_RESOLUTION_480P       1
#define VIDEO_RESOLUTION_576P       2
#define VIDEO_RESOLUTION_SVGA       3
#define VIDEO_RESOLUTION_XGA        4
#define VIDEO_RESOLUTION_720P       5
#define VIDEO_RESOLUTION_SXGA       6
#define VIDEO_RESOLUTION_1080P      7
#define VIDEO_RESOLUTION_UXGA       8
#define NUM_VIDEO_RESOLUTIONS       9
#define ADV7511_ADDR                0x72
#define H_STRIDE                    3840
#define H_ACTIVE                    1920
#define V_ACTIVE                    1080
/*****************************************************************************************************************/
#ifndef uartPRINTF
#define uartPRINTF    printf
#endif
#define uart_Black_Text() uartPRINTF("\x1B[30m")
#define uart_Red_Text() uartPRINTF("\x1B[31m")
#define uart_Green_Text() uartPRINTF("\x1B[32m")
#define uart_Yellow_Text() uartPRINTF("\x1B[33m")
#define uart_Blue_Text() uartPRINTF("\x1B[34m")
#define uart_Magenta_Text() uartPRINTF("\x1B[35m")
#define uart_Cyan_Text() uartPRINTF("\x1B[36m")
#define uart_White_Text() uartPRINTF("\x1B[37m")
#define uart_Default_Text() uartPRINTF("\x1B[39m")
#define print_prompt() uartPRINTF("\x1B[31m")
#define print_prompt_Default_Text() uartPRINTF("\x1B[39m")
#define uart_Black_Background() uartPRINTF("\x1B[40m")
#define uart_Red_Background() uartPRINTF("\x1B[41m")
#define uart_Green_Background() uartPRINTF("\x1B[42m")
#define uart_Yellow_Background() uartPRINTF("\x1B[43m")
#define uart_Blue_Background() uartPRINTF("\x1B[44m")
#define uart_Magenta_Background() uartPRINTF("\x1B[45m")
#define uart_Cyan_Background() uartPRINTF("\x1B[46m")
#define uart_White_Background() uartPRINTF("\x1B[47m")
#define uart_Default_Background() uartPRINTF("\x1B[49m")
#define uart_Cursor_Home() uartPRINTF("\x1B[H")
#define uart_Cursor_Set_XY_Position(X,Y) uartPRINTF("\x1B[%d;%dH",X,Y)
#define uart_Cursor_Show() uartPRINTF("\x1B[?25h")
#define uart_Cursor_Hide() uartPRINTF("\x1B[?25l")
#define uart_Cursor_Up(Rows) uartPRINTF("\x1B[%dA",Rows)
#define uart_Cursor_Down(Rows) uartPRINTF("\x1B[%dB",Rows)
#define uart_Cursor_Left(Columns) uartPRINTF("\x1B[%dC",Columns)
#define uart_Cursor_Right(Columns) uartPRINTF("\x1B[%dD",Columns)
#define uart_Clear_Line_To_End() uartPRINTF("\x1B[0K")
#define uart_Clear_Line_Up_To_Cursor() uartPRINTF("\x1B[1K")
#define uart_Clear_Line() uartPRINTF("\x1B[2K")
#define uart_Clear_Screen() uartPRINTF("\x1B[2J")
#define uart_Clear_Screen_To_End() uartPRINTF("\x1B[J")
#define uart_Clear_Screen_Up_To_Cursor() uartPRINTF("\x1B[1J")
#define uart_Text_Attributes_None() uartPRINTF("\x1B[0m")
#define uart_Text_Attributes_Bold() uartPRINTF("\x1B[1m")
#define uart_Text_Attributes_italic() uartPRINTF("\x1B[3m")
#define uart_Text_Attributes_underline() uartPRINTF("\x1B[4m")
#define uart_Text_Attributes_strike() uartPRINTF("\x1B[9m")
#define uart_Text_Attributes_Dim() uartPRINTF("\x1B[2m")
#define uart_Text_Attributes_Blink() uartPRINTF("\x1B[5m")
#define uart_Text_Attributes_Reverse() uartPRINTF("\x1B[7m")
#define uart_Text_Attributes_Hidden() uartPRINTF("\x1B[8m")
#define uart_Mode_Insert() uartPRINTF("\x1B[4h")
#define uart_Mode_Overwrite() uartPRINTF("\x1B[4l")
#define uart_Mode_Scrolling_Smooth() uartPRINTF("\x1B[?4h")
#define uart_Mode_Scrolling_Jump() uartPRINTF("\x1B[?4l")
#define uart_Editing_Insert_Lines(Lines) uartPRINTF("\x1B[%dL",Lines)
#define uart_Editing_Delete_Lines(Lines) uartPRINTF("\x1B[%dM",Lines)
#define uart_Editing_Delete_Characters(Characters) uartPRINTF("\x1B[%dP",Characters)
/*****************************************************************************************************************/
#define KEYPRESS_ARROW_UP       240
#define KEYPRESS_ARROW_DOWN     241
#define KEYPRESS_ARROW_LEFT     242
#define KEYPRESS_ARROW_RIGHT    243
#define KEYPRESS_END            244
/*****************************************************************************************************************/
#define menu_select             1
#define menuCheck               19
#define kernalCoef              0
/*****************************************************************************************************************/
#define kernalconfig            0x6769666E
#define clear                   0x10ECC0
#define mainmenu                0x4773053D
#define uart_0_baseaddr         0xe0000000
#define uart_1_baseaddr         0xe0001000
#define cmds_exposer            0x7265736F
#define timex                   0x137C66
#define display1                0x429F579F
#define display2                0x429F57A0
#define display3                0x429F57A1
#define display5                0x429F57A3
#define display6                0x429F57A4
#define quit                    0x1EBAA
#define pl_testpattern          0x65747461
#define hdmi                    0x1C1FB
#define vga                     0x327F
#define xbright                 0xA8B548
#define blur                    0x1AE04
#define emboss                  0xAC6E0D
#define sharp                   0x134D38
#define hsv                     0x2D94
#define hsl                     0x2D8A
#define rgb                     0x30F0
#define rgbpoi                  0xBF59FF
#define sobel                   0x13686E
#define prewit                  0xBE08B2
#define prewitt                 0x76C5768
#define cgain                   0x10D7F4
#define menucall                0x47B89810
/************************************/
#define wcgain1                 0x7C03B49
#define wcgain2                 0x7C03B4A
#define wcgain3                 0x7C03B4B
#define wcgain4                 0x7C03B4C
#define wcgain5                 0x7C03B4D
#define wcgain6                 0x7C03B4E
#define wcgain7                 0x7C03B4F
#define wsobel                  0xC8FCCE
#define wprewit                 0x7D5D472
#define wsharp                  0xC8E198
#define wemboss                 0x7C439CD
#define wblur                   0x13D674
#define keygain                 0x70F0134
/************************************/
#define hsvpervalue             0xF43BADEF
#define yccpervalue             0x5E197EEF
#define lumvalue                0x4812C2CF
/************************************/
#define rgbdetect               0xEB640CB6
#define video0                  0xC5C5BA
#define video1                  0xC5C5BB
#define video2                  0xC5C5BC
#define video3                  0xC5C5BD
#define video4                  0xC5C5BE
#define video5                  0xC5C5BF
#define video6                  0xC5C5C0
#define video7                  0xC5C5C1
#define video8                  0xC5C5C2
#define video9                  0xC5C5C3
#define video10                 0x7B9B94E
#define video11                 0x7B9B94F
#define video12                 0x7B9B950
#define video13                 0x7B9B951
#define video14                 0x7B9B952
#define video15                 0x7B9B953
#define video16                 0x7B9B954
#define video17                 0x7B9B955
#define video18                 0x7B9B956
#define video19                 0x7B9B957
#define video20                 0x7B9B958
#define video21                 0x7B9B959
#define video22                 0x7B9B95A
#define video23                 0x7B9B95B
#define video24                 0x7B9B95C
#define video25                 0x7B9B95D
#define video26                 0x7B9B95E
#define video27                 0x7B9B95F
#define video28                 0x7B9B960
#define video29                 0x7B9B961
#define video30                 0x7B9B962
#define video31                 0x7B9B963
#define video32                 0x7B9B964
#define video45                 0x7B9B971
#define video46                 0x7B9B972
#define video47                 0x7B9B973
#define video48                 0x7B9B974
#define video49                 0x7B9B975
#define ycbcrenable             0x511543CD
#define ycbcrdisable            0x2AC07A9D
#define ycbcr                   0x1423E0
#define rgbremix                0x4ABF54CE
#define colorgain               0x976BB8C4
#define colorcorrection         0x74636572
#define edgethreshold           0x6C6F6873
#define version                 0x7B5FAC0
#define blur1x                  0xA7FA12
#define blur2x                  0xA7FA1C
#define blur3x                  0xA7FA26
#define blur4x                  0xA7FA30
#define blur5x                  0xA7FA3A
#define readfifo                0x4A9D28FF
#define keyuart                 0x70F3844
#define parttern1               0x494E615D
#define parttern2               0x494E615E
#define parttern3               0x494E615F
#define parttern4               0x494E6160
#define parttern5               0x494E6161
#define fullhdmi                0x447C467B
#define zoom                    0x20CAF
#define threshold               0xF8E00808
#define coord                   0x10FCFC
#define colorbars               0x976BA59B
#define genimage                0x44236327
#define keyarrow                0x46956815
#define keyarrow1               0xC1D610D3
#define keyarrow2               0xC1D610D4
#define keyarrow3               0xC1D610D5
#define quit_current_state      0x71
/*****************************************************************************************************************/
#define d5m_testpattern         0x2484DA56
#define d5m_colorgain           0x4EA1D4C4
#define d5m_channel             0xA20498D6
#define cmds_readregs           0x67657264
#define cmds_readexposer        0x6C8BED28
#define cmds_updated5m          0x64657461
#define cmds_readd5m            0x6D056464
#define cmds_configd5m          0x64676966
#define cmds_videochannel       0x68636F65
#define cmds_displaytype        0x350AAA59
#define cmdw_vgadraw            0x777617264
#define cmdw_d5mreg             0x7EFE83F9
#define cmdw_d5mcsize           0x7A697363
#define cmdr_plread             0x7C25A8B2
#define cmdr_d5mreg             0x7C039379
#define cmdr_d5mviewmenu        0x77656976
#define cmds_printpixel         0x6970746E
#define cmds_vdfxa              0xD94700A9
#define cmds_vdfxb              0xD94700AA
#define cmds_vdfxc              0xD94700AB
#define cmds_vdtesta            0x61747365
#define cmds_vdtestb            0x62747365
#define cmds_vdtestc            0x63747365
#define cmds_vdapia             0x7CC5F0A3
#define cmds_vdapib             0x7CC5F0A4
#define cmds_vdapic             0x7CC5F0A5
#define cmds_vgaapia            0x61697061
#define cmds_vgaapib            0x62697061
#define cmds_vgaapic            0x63697061
#define cmds_quit               0x95BA400A
#define cmds_space              0x20
#define cmds_uart               0x95BA4834
#define cmds_hdmitx             0x7CB0C08C
#define cmds_videoconfig        0x6F636F65
#define cmds_readfifo           0x66696664
#define cmds_fifomode           0x646F6D6F
#define cmds_fifostatus         0x5B28281D
#define cmds_gridpoint          0x148D411C
#define cmds_griddelta          0x148B46A1
#define sdcard                  0xC06994
/*****************************************************************************************************************/
#endif // __SYSTEM_CONFIG_DEFINES_H__
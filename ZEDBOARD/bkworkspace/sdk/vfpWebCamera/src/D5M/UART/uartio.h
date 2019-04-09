#include <xbasic_types.h>
#define uart(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (u32)(RegOffset))
#define COUNTS_PER_USECOND  (XPAR_CPU_CORTEXA9_CORE_CLOCK_FREQ_HZ / (2U*1000000U))
void menu_print_prompt();
u32 enter_value_or_quit(char s[],u32 current_state);
u32 enter_or_quit(char s[],u32 current_state);
void menu_cls();
u32 uart_prompt_io();
void uartvalue();
#define ONESECOND    0x13D92D3F
#define ONE_SECOND 3250000000
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
#ifdef _XPARAMETERS_PS_H_
    #define CYCLES_FOR_1_MS     100000
#else
    #define CYCLES_FOR_1_MS     800000
#endif
#define clear  0x10ECC0
#define mainmenu 0x4773053D

#define menu_select 1
#define menuCheck 19


#define KEYPRESS_ARROW_UP 240
#define KEYPRESS_ARROW_DOWN 241
#define KEYPRESS_ARROW_LEFT 242
#define KEYPRESS_ARROW_RIGHT 243
#define KEYPRESS_END 244
#define one_second 74067512
#define READ_WRITE_MUL_FACTOR 0x10
#define DEFAULT_HYPERTERMINAL_UART_ID XPAR_PS7_UART_1_DEVICE_ID
#define UART_BASEADDR        XPAR_XUARTPS_1_BASEADDR
#define uart_0_baseaddr 0xe0000000
#define uart_1_baseaddr 0xe0001000
#define cmds_exposer 0x7265736F
#define timex 0x137C66
#define cmds_readregs 0x67657264
#define cmds_readexposer 0x6C8BED28
#define cmds_updated5m 0x64657461
#define cmds_readd5m 0x6D056464
#define cmds_configd5m 0x64676966
#define cmds_videochannel 0x68636F65
#define cmds_displaytype 0x350AAA59

#define QUIT_VALUE 999
#define VGA_FRAME_ADDRESS             0x00200000
#define VGA_MEMORY_ATTRIBUTE         0x00010c06
// CMDW [WRITE]
#define cmdw_vgadraw 0x777617264
#define cmdw_d5mreg 0x7EFE83F9
#define cmdw_d5mcsize 0x7A697363
// CMDR [READ]
#define cmdr_plread 0x7C25A8B2
#define cmdr_d5mreg 0x7C039379
#define cmdr_d5mviewmenu 0x77656976
// CMDS [SET]
// VDMA FUNCTION TESTS
#define cmds_printpixel 0x6970746E
#define cmds_vdfxa 0xD94700A9
#define cmds_vdfxb 0xD94700AA
#define cmds_vdfxc 0xD94700AB
// VDMA TEST
#define cmds_vdtesta 0x61747365
#define cmds_vdtestb 0x62747365
#define cmds_vdtestc 0x63747365
// VDMA API
#define cmds_vdapia 0x7CC5F0A3
#define cmds_vdapib 0x7CC5F0A4
#define cmds_vdapic 0x7CC5F0A5
// VGA API
#define cmds_vgaapia 0x61697061
#define cmds_vgaapib 0x62697061
#define cmds_vgaapic 0x63697061
// CMDS QUIT
#define cmds_quit 0x95BA400A
#define cmds_space 0x20
// CMDS PHERI
#define cmds_uart 0x95BA4834
#define cmds_hdmitx 0x7CB0C08C
#define cmds_videoconfig 0x6F636F65
// CMDS PHERI
#define display1 0x429F579F
#define display2 0x429F57A0
#define display3 0x429F57A1

#define display5 0x429F57A3
#define display6 0x429F57A4
#define quit 0x1EBAA
#define d5m_testpattern 0x2484DA56
#define pl_testpattern 0x65747461
#define d5m_colorgain 0x4EA1D4C4
#define d5m_channel 0xA20498D6
#define hdmi 0x1C1FB
#define vga 0x327F
#define xbright 0xA8B548
#define blur 0x1AE04
#define sharp 0x134D38
#define hsv 0x2D94
#define rgb 0x30F0
#define colorgain 0x976BB8C4 //terminal value need to be decoded currently invalid
#define parttern1 0x494E615D
#define parttern2 0x494E615E
#define parttern3 0x494E615F
#define parttern4 0x494E6160
#define parttern5 0x494E6161
#define fullhdmi 0x447C467B
#define zoom 0x20CAF
#define emboss 0xAC6E0D
#define embross 0x6BC571D
#define threshold 0xF8E00808
#define coord 0x10FCFC
#define colorbars 0x976BA59B
#define genimage 0x44236327
#define cmds_readfifo 0x66696664
#define cmds_fifomode 0x646F6D6F
#define cmds_fifostatus 0x5B28281D
#define cmds_gridpoint 0x148D411C
#define cmds_griddelta 0x148B46A1
#define quit_current_state 0x71

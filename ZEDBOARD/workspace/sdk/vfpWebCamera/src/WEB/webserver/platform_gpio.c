#include "platform_gpio.h"
#include <xparameters.h>
#include <stdio.h>
#include <xbasic_types.h>
#include <xil_io.h>
#include <xil_io.h>

#define SINE_WAVE XPAR_PS_VIDEO_PS_TO_PS_SINE_0_CTRL_SAXI_BASEADDR


#if defined(XPAR_LEDS_8BITS_BASEADDR)
#define LED_BASE XPAR_LEDS_8BITS_BASEADDR
#elif defined(XPAR_LEDS_4BITS_BASEADDR)
#define LED_BASE XPAR_LEDS_4BITS_BASEADDR
#elif defined(XPAR_LEDS_6BIT_BASEADDR)
#define LED_BASE XPAR_LEDS_6BIT_BASEADDR
#else
#define NO_GPIOS
#endif
#if defined(XPAR_DIP_SWITCHES_8BITS_BASEADDR)
#define DIP_BASE XPAR_DIP_SWITCHES_8BITS_BASEADDR
#elif defined(XPAR_DIPS_4BIT_BASEADDR)
#define DIP_BASE XPAR_DIPS_4BIT_BASEADDR
#elif defined(XPAR_PUSH_BUTTONS_POSITION_BASEADDR)
#define DIP_BASE XPAR_PUSH_BUTTONS_POSITION_BASEADDR 
#elif defined(XPAR_DIP_SWITCHES_4BITS_BASEADDR)
#define DIP_BASE XPAR_DIP_SWITCHES_4BITS_BASEADDR
#else
#define NO_GPIOS
#endif

#define SINE_ctrl_saxi_SLV_REG0_OFFSET 0
#define SINE_ctrl_saxi_SLV_REG1_OFFSET 4
#define SINE_ctrl_saxi_SLV_REG2_OFFSET 8
#define SINE_ctrl_saxi_SLV_REG3_OFFSET 12
#define SINE_ctrl_saxi_SLV_REG4_OFFSET 16
#define SINE_ctrl_saxi_SLV_REG5_OFFSET 20
#define SINE_ctrl_saxi_SLV_REG6_OFFSET 24
#define SINE_ctrl_saxi_SLV_REG7_OFFSET 28
#define SINE_ctrl_saxi_SLV_REG8_OFFSET 32
#define SINE_ctrl_saxi_SLV_REG9_OFFSET 36
#define SINE_ctrl_saxi_SLV_REG10_OFFSET 40
#define SINE_ctrl_saxi_SLV_REG11_OFFSET 44
#define SINE_ctrl_saxi_SLV_REG12_OFFSET 48
#define SINE_ctrl_saxi_SLV_REG13_OFFSET 52
#define SINE_ctrl_saxi_SLV_REG14_OFFSET 56
#define SINE_ctrl_saxi_SLV_REG15_OFFSET 60
#define SINE_ctrl_saxi_SLV_REG16_OFFSET 64
#define SINE_ctrl_saxi_SLV_REG17_OFFSET 68
#define SINE_ctrl_saxi_SLV_REG18_OFFSET 72
#define SINE_ctrl_saxi_SLV_REG19_OFFSET 76
#define SINE_ctrl_saxi_SLV_REG20_OFFSET 80
#define SINE_ctrl_saxi_SLV_REG21_OFFSET 84
#define SINE_ctrl_saxi_SLV_REG22_OFFSET 88
#define SINE_ctrl_saxi_SLV_REG23_OFFSET 92
#define SINE_ctrl_saxi_SLV_REG24_OFFSET 96
#define SINE_ctrl_saxi_SLV_REG25_OFFSET 100
#define SINE_ctrl_saxi_SLV_REG26_OFFSET 104
#define SINE_ctrl_saxi_SLV_REG27_OFFSET 108
#define SINE_ctrl_saxi_SLV_REG28_OFFSET 112
#define SINE_ctrl_saxi_SLV_REG29_OFFSET 116
#define SINE_ctrl_saxi_SLV_REG30_OFFSET 120
#define SINE_ctrl_saxi_SLV_REG31_OFFSET 124
#define shift_un16bits 16
void platform_init_gpios()
{

    *(volatile unsigned int*)(LED_BASE + 4) = 0;
    //*(volatile unsigned int*)(DIP_BASE + 4) = ~0;
    *(volatile int *)(LED_BASE) = 0;

}

int TOGGLE_LEDS()
{
    static int state = 0;
    state = ~state;
  *(volatile int *)(LED_BASE) = state;
    return state;
}
unsigned int ADC_DATA()
{
	return *(volatile unsigned int *)(SINE_WAVE);
}
unsigned int  GET_SWITCH_STATE()
{
	return 0;
    //return *(volatile unsigned int *)(DIP_BASE);
} 
int READ_P1_SINE_WAVE()
{
	return Xil_In32((SINE_WAVE) + 0x0);
} 
u32 READ_P2_SINE_WAVE()
{
	return Xil_In32((SINE_WAVE) + 0x4);
} 
u32 READ_P3_SINE_WAVE()
{
	return Xil_In32((SINE_WAVE) + 0x8);
} 
u32 READ_P4_SINE_WAVE()
{
	return Xil_In32((SINE_WAVE) + 0xC);
}
void WRITE_SW0_SINE_WAVE()
{
	Xil_Out32((SINE_WAVE) + (0x0), (u32)(0x00000000));
}
void WRITE_SW1_SINE_WAVE()
{
	Xil_Out32((SINE_WAVE) + (0x0), (u32)(0xFFFFFFFF));
}

void WRITE_FREQHIGH_SINE_WAVE()
//Default
//--255[FF] --4095[FFF] --8190[1FFE]
{
	Xil_Out32((SINE_WAVE) + (0x4), (u32)(0x00000FFF));
}
void WRITE_FREQLOW_SINE_WAVE()
//Default
//--15[F]   --10[A]     --4[4]
{
	Xil_Out32((SINE_WAVE) + (0x8), (u32)(0x00000004));
}
void WRITE_FREQHIGH(u32 data)

{
	Xil_Out32((SINE_WAVE) + (0x4), (u32)(data));
}
void WRITE_FREQLOW(u32 data)

{
	Xil_Out32((SINE_WAVE) + (0x8), (u32)(data));
}
void WRITE_SET0()
{
	WRITE_SW0_SINE_WAVE();
	WRITE_FREQHIGH_SINE_WAVE();
	WRITE_FREQLOW_SINE_WAVE();
}
int rch00signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG0_OFFSET);
}
int rch01signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG1_OFFSET);
}
int rch02signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG2_OFFSET);
}
int rch03signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG3_OFFSET);
}
int rch04signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG4_OFFSET);
}
int rch05signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG5_OFFSET);
}
int rch06signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG6_OFFSET);
}
int rch07signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG7_OFFSET);
}
int rch08signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG8_OFFSET);
}
int rch09signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG9_OFFSET);
}
int rch10signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG10_OFFSET);
}
int rch11signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG11_OFFSET);
}
int rch12signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG12_OFFSET);
}
int rch13signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG13_OFFSET);
}
int rch14signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG14_OFFSET);
}
int rch15signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG15_OFFSET);
}
int rch16signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG16_OFFSET);
}
int rch17signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG17_OFFSET);
}
int rch18signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG18_OFFSET);
}
int rch19signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG19_OFFSET);
}
int rch20signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG20_OFFSET);
}
int rch21signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG21_OFFSET);
}
int rch22signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG22_OFFSET);
}
int rch23signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG23_OFFSET);
}
int rch24signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG24_OFFSET);
}
int rch25signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG25_OFFSET);
}
int rch26signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG26_OFFSET);
}
int rch27signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG27_OFFSET);
}
int rch28signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG28_OFFSET);
}
int rch29signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG29_OFFSET);
}
int rch30signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG30_OFFSET);
}
int rch31signal()
{
	return Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG31_OFFSET);
}
void read_adc_channels(plregisters *interrupt)
/**
 * Function: read_adc_channels
 * ------------------------------------------
 * @struct: plregisters *interrupt
 * ------------------------------------------
 */
{
interrupt->ch00 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG0_OFFSET);
interrupt->ch01 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG1_OFFSET);
interrupt->ch02 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG2_OFFSET);
interrupt->ch03 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG3_OFFSET);
interrupt->ch04 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG4_OFFSET);
interrupt->ch05 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG5_OFFSET);
interrupt->ch06 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG6_OFFSET);
interrupt->ch07 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG7_OFFSET);
interrupt->ch08 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG8_OFFSET);
interrupt->ch09 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG9_OFFSET);
interrupt->ch10 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG10_OFFSET);
interrupt->ch11 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG11_OFFSET);
interrupt->ch12 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG12_OFFSET);
interrupt->ch13 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG13_OFFSET);
interrupt->ch14 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG14_OFFSET);
interrupt->ch15 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG15_OFFSET);
interrupt->ch16 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG16_OFFSET);
interrupt->ch17 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG17_OFFSET);
interrupt->ch18 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG18_OFFSET);
interrupt->ch19 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG19_OFFSET);
interrupt->ch20 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG20_OFFSET);
interrupt->ch21 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG21_OFFSET);
interrupt->ch22 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG22_OFFSET);
interrupt->ch23 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG23_OFFSET);
interrupt->ch24 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG24_OFFSET);
interrupt->ch25 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG25_OFFSET);
interrupt->ch26 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG26_OFFSET);
interrupt->ch27 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG27_OFFSET);
interrupt->ch28 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG28_OFFSET);
interrupt->ch29 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG29_OFFSET);
interrupt->ch30 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG30_OFFSET);
interrupt->ch31 =  Xil_In32((SINE_WAVE) + SINE_ctrl_saxi_SLV_REG31_OFFSET);
}
void sample_adc(void *CallBackRef)
{
	read_adc_channels(&interrupt);
}
u32 ch00(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch00 =  interrupt->ch00;
}
u32 ch01(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch01 =  interrupt->ch01;
}
u32 ch02(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch02 =  interrupt->ch02;
}
u32 ch03(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch03 =  interrupt->ch03;
}
u32 ch04(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch04 =  interrupt->ch04;
}
u32 ch05(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch05 =  interrupt->ch05;
}
u32 ch06(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch06 =  interrupt->ch06;
}
u32 ch07(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch07 =  interrupt->ch07;
}
u32 ch08(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch08 =  interrupt->ch08;
}
u32 ch09(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch09 =  interrupt->ch09;
}
u32 ch10(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch10 =  interrupt->ch10;
}
u32 ch11(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch11 =  interrupt->ch11;
}
u32 ch12(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch12 =  interrupt->ch12;
}
u32 ch13(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch13 =  interrupt->ch13;
}
u32 ch14(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch14 =  interrupt->ch14;
}
u32 ch15(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch15 =  interrupt->ch15;
}
u32 ch16(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch16 =  interrupt->ch16;
}
u32 ch17(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch17 =  interrupt->ch17;
}
u32 ch18(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch18 =  interrupt->ch18;
}
u32 ch19(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch19 =  interrupt->ch19;
}
u32 ch20(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch20 =  interrupt->ch20;
}
u32 ch21(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch21 =  interrupt->ch21;
}
u32 ch22(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch22 =  interrupt->ch22;
}
u32 ch23(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch23 =  interrupt->ch23;
}
u32 ch24(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch24 =  interrupt->ch24;
}
u32 ch25(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch25 =  interrupt->ch25;
}
u32 ch26(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch26 =  interrupt->ch26;
}
u32 ch27(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch27 =  interrupt->ch27;
}
u32 ch28(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch28 =  interrupt->ch28;
}
u32 ch29(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch29 =  interrupt->ch29;
}
u32 ch30(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch30 =  interrupt->ch30;
}
u32 ch31(channel *ch_ptr,plregisters *interrupt)
{
	return ch_ptr->ch31 =  interrupt->ch31;
}

void adcchannels()
{
	printf("%i\n",(&ch_ptr,&interrupt));
	printf("%i\n",ch01(&ch_ptr,&interrupt));
	printf("%i\n",ch02(&ch_ptr,&interrupt));
	printf("%i\n",ch03(&ch_ptr,&interrupt));
	printf("%i\n",ch04(&ch_ptr,&interrupt));
	printf("%i\n",ch05(&ch_ptr,&interrupt));
	printf("%i\n",ch06(&ch_ptr,&interrupt));
	printf("%i\n",ch07(&ch_ptr,&interrupt));
	printf("%i\n",ch08(&ch_ptr,&interrupt));
	printf("%i\n",ch09(&ch_ptr,&interrupt));
	printf("%i\n",ch10(&ch_ptr,&interrupt));
	printf("%i\n",ch11(&ch_ptr,&interrupt));
	printf("%i\n",ch12(&ch_ptr,&interrupt));
	printf("%i\n",ch13(&ch_ptr,&interrupt));
	printf("%i\n",ch14(&ch_ptr,&interrupt));
	printf("%i\n",ch15(&ch_ptr,&interrupt));
	printf("%i\n",ch16(&ch_ptr,&interrupt));
	printf("%i\n",ch17(&ch_ptr,&interrupt));
	printf("%i\n",ch18(&ch_ptr,&interrupt));
	printf("%i\n",ch19(&ch_ptr,&interrupt));
	printf("%i\n",ch20(&ch_ptr,&interrupt));
	printf("%i\n",ch21(&ch_ptr,&interrupt));
	printf("%i\n",ch22(&ch_ptr,&interrupt));
	printf("%i\n",ch23(&ch_ptr,&interrupt));
	printf("%i\n",ch24(&ch_ptr,&interrupt));
	printf("%i\n",ch25(&ch_ptr,&interrupt));
	printf("%i\n",ch26(&ch_ptr,&interrupt));
	printf("%i\n",ch27(&ch_ptr,&interrupt));
	printf("%i\n",ch28(&ch_ptr,&interrupt));
	printf("%i\n",ch29(&ch_ptr,&interrupt));
	printf("%i\n",ch30(&ch_ptr,&interrupt));
	printf("%i\n",ch31(&ch_ptr,&interrupt));
	printf("\n\n\n");
}

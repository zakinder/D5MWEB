#ifndef __PLATFORM_GPIO_H_
#define __PLATFORM_GPIO_H_

#include <xbasic_types.h>
typedef unsigned long	un32bits;//Unsign 32 bits
void platform_init_gpios();
int TOGGLE_LEDS();
unsigned int GET_SWITCH_STATE();
void WRITE_SW0_SINE_WAVE();
void WRITE_SW1_SINE_WAVE();
void WRITE_FREQHIGH_SINE_WAVE();
void WRITE_FREQLOW_SINE_WAVE();
void WRITE_FREQLOW(u32 data);
void WRITE_FREQHIGH(u32 data);
int rch00signal();
int rch01signal();
int rch02signal();
int rch03signal();
int rch04signal();
int rch05signal();
int rch06signal();
int rch07signal();
int rch08signal();
int rch09signal();
int rch10signal();
int rch11signal();
int rch12signal();
int rch13signal();
int rch14signal();
int rch15signal();
int rch16signal();
int rch17signal();
int rch18signal();
int rch19signal();
int rch20signal();
int rch21signal();
int rch22signal();
int rch23signal();
int rch24signal();
int rch25signal();
int rch26signal();
int rch27signal();
int rch28signal();
int rch29signal();
int rch30signal();
int rch31signal();
typedef struct adc_channels_read_on_interrupt
{
    un32bits ch00;
    un32bits ch01;
    un32bits ch02;
    un32bits ch03;
    un32bits ch04;
    un32bits ch05;
    un32bits ch06;
    un32bits ch07;
    un32bits ch08;
    un32bits ch09;
    un32bits ch10;
    un32bits ch11;
    un32bits ch12;
    un32bits ch13;
    un32bits ch14;
    un32bits ch15;
    un32bits ch16;
    un32bits ch17;
    un32bits ch18;
    un32bits ch19;
    un32bits ch20;
    un32bits ch21;
    un32bits ch22;
    un32bits ch23;
    un32bits ch24;
    un32bits ch25;
    un32bits ch26;
    un32bits ch27;
    un32bits ch28;
    un32bits ch29;
    un32bits ch30;
    un32bits ch31;
} plregisters;
typedef struct adc_channels_read_after_interrupt
{
    un32bits ch00;
    un32bits ch01;
    un32bits ch02;
    un32bits ch03;
    un32bits ch04;
    un32bits ch05;
    un32bits ch06;
    un32bits ch07;
    un32bits ch08;
    un32bits ch09;
    un32bits ch10;
    un32bits ch11;
    un32bits ch12;
    un32bits ch13;
    un32bits ch14;
    un32bits ch15;
    un32bits ch16;
    un32bits ch17;
    un32bits ch18;
    un32bits ch19;
    un32bits ch20;
    un32bits ch21;
    un32bits ch22;
    un32bits ch23;
    un32bits ch24;
    un32bits ch25;
    un32bits ch26;
    un32bits ch27;
    un32bits ch28;
    un32bits ch29;
    un32bits ch30;
    un32bits ch31;
} channel;



void read_adc_channels(plregisters *interrupt);
plregisters interrupt;
channel ch_ptr;
void adcchannels();
#endif

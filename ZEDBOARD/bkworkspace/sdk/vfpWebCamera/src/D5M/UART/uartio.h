// LAST TESTED : 09/01/2019
#ifndef __UART_H__
#define __UART_H__
#include <xbasic_types.h>
u8 uart_per_byte_read(u32 uart_address);
u16 uart_two_byte_read(u32 uart_address);
u8 keypress_to_uart(u32 uart_address);
u32 uart_prompt_io();
int bit_expo(int base_value, int exponent);
unsigned int uart_prompt_excute();
void uartvalue();
u32 enter_value_or_quit(char s[],u32 current_state);
u32 enter_or_quit(char s[],u32 current_state);
void menu_print_prompt();
u32 uartcmd(u32 argA,u32 argB);
void keyArrow1Select();
void keyArrow2Select();
void cmds_menu();
void master_menu();
void menu_cls();
#endif // __UART_H__

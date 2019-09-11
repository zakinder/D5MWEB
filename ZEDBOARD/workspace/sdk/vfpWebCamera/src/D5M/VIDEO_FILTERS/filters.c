// LAST TESTED : 09/10/2019

#include "filters.h"

#include <sleep.h>
#include <stdio.h>
#include <xil_types.h>

#include "../SYSTEM_CONFIG_HEADER/system_config_defines.h"
#include "../UART/uartio.h"
#include "../VIDEO_CHANNEL/channel.h"

void CgainInit(){
    //DEFAULT CONFIGURABLE
    pCgCf.K1   = CgCf_k1;
    pCgCf.K2   = CgCf_k2;
    pCgCf.K3   = CgCf_k3;
    pCgCf.K4   = CgCf_k4;
    pCgCf.K5   = CgCf_k5;
    pCgCf.K6   = CgCf_k6;
    pCgCf.K7   = CgCf_k7;
    pCgCf.K8   = CgCf_k8;
    pCgCf.K9   = CgCf_k9;
    pCgCf.Kc   = CgCf_kc;
    CgCoef(&pCgCf);
    }
void pKeyInit(){
    //DEFAULT CONFIGURABLE
    pKey.ValueDown   = 10;
    pKey.ValueUp     = 10;
    pKey.ValueLeft   = 10;
    pKey.ValueRight  = 10;
    pKey.ValueMax    = 4095;
    printf("ValueDown  Value[%d]\n",(unsigned) pKey.ValueDown);
    printf("ValueUp    Value[%d]\n",(unsigned) pKey.ValueUp);
    printf("ValueLeft  Value[%d]\n",(unsigned) pKey.ValueLeft);
    printf("ValueRight Value[%d]\n",(unsigned) pKey.ValueRight);
    }
void CgainConfig(u16 kValues) {
    //DEFAULT CONFIGURABLE
    pCgCf.K1   = CgCf_k1 + kValues;
    pCgCf.K2   = CgCf_k2 + kValues;
    pCgCf.K3   = CgCf_k3 - kValues;
    pCgCf.K4   = CgCf_k4 - kValues;
    pCgCf.K5   = CgCf_k5 + kValues;
    pCgCf.K6   = CgCf_k6 + kValues;
    pCgCf.K7   = CgCf_k7 + kValues;
    pCgCf.K8   = CgCf_k8 - kValues;
    pCgCf.K9   = CgCf_k9 + kValues;
	pCgCf.Kc   = CgCf_kc;
    CgCoef(&pCgCf);
    }
void CgCoef(Coef *pCgCf)
{
    D5M_mWriteReg(D5M_BASE,w_kernel_1_reg_08,pCgCf->K1);
    D5M_mWriteReg(D5M_BASE,w_kernel_2_reg_09,pCgCf->K2);
    D5M_mWriteReg(D5M_BASE,w_kernel_3_reg_10,pCgCf->K3);
    D5M_mWriteReg(D5M_BASE,w_kernel_4_reg_11,pCgCf->K4);
    D5M_mWriteReg(D5M_BASE,w_kernel_5_reg_12,pCgCf->K5);
    D5M_mWriteReg(D5M_BASE,w_kernel_6_reg_13,pCgCf->K6);
    D5M_mWriteReg(D5M_BASE,w_kernel_7_reg_14,pCgCf->K7);
    D5M_mWriteReg(D5M_BASE,w_kernel_8_reg_15,pCgCf->K8);
    D5M_mWriteReg(D5M_BASE,w_kernel_9_reg_16,pCgCf->K9);
    D5M_mWriteReg(D5M_BASE,w_kSet_reg_17,pCgCf->Kc);
    usleep(1);
    videoFeatureSelect(selCgain);
}
void keyCgainConfigSelect()
{

	int keySelect    = menu_select;
	u8 userinput     = 0;
	u16 kValues      = 0;
	int menu_Active = TRUE;
    KeyPrValue();
	while (menu_Active == TRUE) {
		switch (keySelect) {
		case menuCheck:
			menu_Active = FALSE;
			break;
		case menu_select:
            menu_print_prompt();
            CgainConfig(kValues);
            CgCfPrintPrompt(kValues,&pCgCf);
			userinput   = keypress_to_uart(uart_1_baseaddr);
			keySelect = userinput + 10;
			break;
		case KEYPRESS_ARROW_DOWN:
			if (kValues <= 1)
				kValues = 0;
			else
				kValues -= pKey.ValueDown;
			keySelect  = menu_select;
			break;
		case KEYPRESS_ARROW_UP:
			if (kValues > pKey.ValueMax)
				kValues = pKey.ValueMax + 1;
			else
				kValues += pKey.ValueUp;
			keySelect  = menu_select;
			break;
		case KEYPRESS_ARROW_RIGHT:
			if (kValues > pKey.ValueMax)
				kValues = pKey.ValueMax + 1;
			else
				kValues += pKey.ValueRight;
			keySelect  = menu_select;
			break;
		case KEYPRESS_ARROW_LEFT:
			if (kValues <= 1)
				kValues = 1;
			else
				kValues -= pKey.ValueLeft;
			keySelect  = menu_select;
			break;
		default:
			keySelect  = menu_select;
			break;
		}
	}
}
void KeyPrValue()
{
    printf("Enter KeyPr ValueDown\n");
    menu_print_prompt();
    pKey.ValueDown  = uart_prompt_io();
    printf("Enter KeyPr ValueUp\n");
    menu_print_prompt();
    pKey.ValueUp    = uart_prompt_io();
    printf("Enter KeyPr ValueLeft\n");
    menu_print_prompt();
    pKey.ValueLeft  = uart_prompt_io();
    printf("Enter KeyPr ValueRight\n");
    menu_print_prompt();
    pKey.ValueRight = uart_prompt_io();
    printf("Enter ValueMax\n");
    menu_print_prompt();
    pKey.ValueMax = uart_prompt_io();
    printf("ValueDown  Value[%d]\n",(unsigned) pKey.ValueDown);
    printf("ValueUp    Value[%d]\n",(unsigned) pKey.ValueUp);
    printf("ValueLeft  Value[%d]\n",(unsigned) pKey.ValueLeft);
    printf("ValueRight Value[%d]\n",(unsigned) pKey.ValueRight);
    printf("ValueMax   Value[%d]\n",(unsigned) pKey.ValueMax);
}
void CgCfPrintPrompt(u16 kValues,Coef *pCgCf)
{
	unsigned int uK1 = pCgCf->K1;
	unsigned int uK2 = (~pCgCf->K2)&0x00FF;
	unsigned int uK3 = (~pCgCf->K3)&0x00FF;
	unsigned int uK4 = pCgCf->K4;
	unsigned int uK5 = (~pCgCf->K5)&0x00FF;
	unsigned int uK6 = (~pCgCf->K6)&0x00FF;
	unsigned int uK7 = pCgCf->K7;
	unsigned int uK8 = (~pCgCf->K8)&0x00FF;
	unsigned int uK9 = (~pCgCf->K9)&0x00FF;
	int   K1,K2,K3,K4,K5,K6,K7,K8,K9;
    uK1 = pCgCf->K1 + kValues;
    uK2 = (~(pCgCf->K2+kValues))&0x00FF;
    uK3 = (~(pCgCf->K3-kValues))&0x00FF;
    K1 = uK1;
    K2 = (~uK2);
    K3 = (~uK3);
    uK4 = (~(pCgCf->K4-kValues))&0x00FF;
    uK5 = pCgCf->K5 + kValues;
    uK6 = (~(pCgCf->K6+kValues))&0x00FF;
    K4 = (~uK4);
    K5 = uK5;
    K6 = (~uK6);
    uK7 = (~(pCgCf->K7+kValues))&0x00FF;
    uK8 = (~(pCgCf->K8-kValues))&0x00FF;
    uK9 = pCgCf->K9 + kValues;
    K7 = (~uK7);
    K8 = (~uK8);
    K9 = uK9;
    printf("\n"
    "|-----------------------|\r\n"
    "|           CG1         |\r\n"
    "|-----------------------|\r\n"
    "|%d   |%d   |%d   |\r\n"
    "|-------|-------|-------|\r\n"
    "|%d   |%d   |%d   |\r\n"
    "|-------|-------|-------|\r\n"
    "|%d   |%d   |%d   |\r\n"
    "|-------|-------|-------|\r\n",K1,K2,K3,K4,K5,K6,K7,K8,K9);
	printf(">>>>>>>>>>>>>>>>>>>>>%d",(unsigned)kValues);
}

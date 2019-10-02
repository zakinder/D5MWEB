// LAST TESTED : 09/12/2019
#include "filters.h"
#include <sleep.h>
#include <stdio.h>
#include <xil_types.h>
#include "../MENU_CALLS/menu_calls.h"
#include "../SYSTEM_CONFIG_HEADER/kernels_defines.h"
#include "../SYSTEM_CONFIG_HEADER/system_config_defines.h"
#include "../UART/uartio.h"
#include "../VIDEO_CHANNEL/channel.h"
void CgCfPrintPrompt(u16 kValues,Coef *pCgCf,InCoef *pInCoef);
void KernelInit(){
    pYcCf.K1   = YcCf_k1;
    pYcCf.K2   = YcCf_k2;
    pYcCf.K3   = YcCf_k3;
    pYcCf.K4   = YcCf_k4;
    pYcCf.K5   = YcCf_k5;
    pYcCf.K6   = YcCf_k6;
    pYcCf.K7   = YcCf_k7;
    pYcCf.K8   = YcCf_k8;
    pYcCf.K9   = YcCf_k9;
    pYcCf.Kc   = YcCf_kc;
    pYcCf.Vid  = selCgain;
    CgCoef(&pYcCf);
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
    pCgCf.Vid  = selCgain;
    CgCoef(&pCgCf);
    pShCf.K1   = ShCf_k1;
    pShCf.K2   = ShCf_k2;
    pShCf.K3   = ShCf_k3;
    pShCf.K4   = ShCf_k4;
    pShCf.K5   = ShCf_k5;
    pShCf.K6   = ShCf_k6;
    pShCf.K7   = ShCf_k7;
    pShCf.K8   = ShCf_k8;
    pShCf.K9   = ShCf_k9;
    pShCf.Kc   = ShCf_kc;
    pShCf.Vid  = selSharp;
    CgCoef(&pShCf);
    pBlCf.K1   = BlCf_k1;
    pBlCf.K2   = BlCf_k2;
    pBlCf.K3   = BlCf_k3;
    pBlCf.K4   = BlCf_k4;
    pBlCf.K5   = BlCf_k5;
    pBlCf.K6   = BlCf_k6;
    pBlCf.K7   = BlCf_k7;
    pBlCf.K8   = BlCf_k8;
    pBlCf.K9   = BlCf_k9;
    pBlCf.Kc   = BlCf_kc;
    pBlCf.Vid  = selSharp;
    CgCoef(&pBlCf);
    pSxCf.K1   = SxCf_k1;
    pSxCf.K2   = SxCf_k2;
    pSxCf.K3   = SxCf_k3;
    pSxCf.K4   = SxCf_k4;
    pSxCf.K5   = SxCf_k5;
    pSxCf.K6   = SxCf_k6;
    pSxCf.K7   = SxCf_k7;
    pSxCf.K8   = SxCf_k8;
    pSxCf.K9   = SxCf_k9;
    pSxCf.Kc   = SxCf_kc;
    pSxCf.Vid  = selSoble;
    CgCoef(&pSxCf);
    pSyCf.K1   = SyCf_k1;
    pSyCf.K2   = SyCf_k2;
    pSyCf.K3   = SyCf_k3;
    pSyCf.K4   = SyCf_k4;
    pSyCf.K5   = SyCf_k5;
    pSyCf.K6   = SyCf_k6;
    pSyCf.K7   = SyCf_k7;
    pSyCf.K8   = SyCf_k8;
    pSyCf.K9   = SyCf_k9;
    pSyCf.Kc   = SyCf_kc;
    pSyCf.Vid  = selSoble;
    CgCoef(&pSyCf);
    pPxCf.K1   = PxCf_k1;
    pPxCf.K2   = PxCf_k2;
    pPxCf.K3   = PxCf_k3;
    pPxCf.K4   = PxCf_k4;
    pPxCf.K5   = PxCf_k5;
    pPxCf.K6   = PxCf_k6;
    pPxCf.K7   = PxCf_k7;
    pPxCf.K8   = PxCf_k8;
    pPxCf.K9   = PxCf_k9;
    pPxCf.Kc   = PxCf_kc;
    pPxCf.Vid  = selSoble;
    CgCoef(&pPxCf);
    pPyCf.K1   = PyCf_k1;
    pPyCf.K2   = PyCf_k2;
    pPyCf.K3   = PyCf_k3;
    pPyCf.K4   = PyCf_k4;
    pPyCf.K5   = PyCf_k5;
    pPyCf.K6   = PyCf_k6;
    pPyCf.K7   = PyCf_k7;
    pPyCf.K8   = PyCf_k8;
    pPyCf.K9   = PyCf_k9;
    pPyCf.Kc   = PyCf_kc;
    pPyCf.Vid  = selSoble;
    CgCoef(&pPyCf);
    pEmCf.K1   = EmCf_k1;
    pEmCf.K2   = EmCf_k2;
    pEmCf.K3   = EmCf_k3;
    pEmCf.K4   = EmCf_k4;
    pEmCf.K5   = EmCf_k5;
    pEmCf.K6   = EmCf_k6;
    pEmCf.K7   = EmCf_k7;
    pEmCf.K8   = EmCf_k8;
    pEmCf.K9   = EmCf_k9;
    pEmCf.Kc   = EmCf_kc;
    pEmCf.Vid  = selSharp;
    CgCoef(&pEmCf);
    pCg1Cf.K1   = Cg1Cf_k1;
    pCg1Cf.K2   = Cg1Cf_k2;
    pCg1Cf.K3   = Cg1Cf_k3;
    pCg1Cf.K4   = Cg1Cf_k4;
    pCg1Cf.K5   = Cg1Cf_k5;
    pCg1Cf.K6   = Cg1Cf_k6;
    pCg1Cf.K7   = Cg1Cf_k7;
    pCg1Cf.K8   = Cg1Cf_k8;
    pCg1Cf.K9   = Cg1Cf_k9;
    pCg1Cf.Kc   = Cg1Cf_kc;
    pCg1Cf.Vid  = selCgainToCgain;
    CgCoef(&pCg1Cf);
}
void pKeyInit(){
    //DEFAULT CONFIGURABLE
    pKey.ValueDown   = 10;
    pKey.ValueUp     = 10;
    pKey.ValueLeft   = 10;
    pKey.ValueRight  = 10;
    pKey.ValueMax    = 4095;
    printf("ValueDown  Value[%d]\r\n",(unsigned) pKey.ValueDown);
    printf("ValueUp    Value[%d]\r\n",(unsigned) pKey.ValueUp);
    printf("ValueLeft  Value[%d]\r\n",(unsigned) pKey.ValueLeft);
    printf("ValueRight Value[%d]\r\n",(unsigned) pKey.ValueRight);
}
void CgainConfig(u16 kValues,Coef *pCf) {
    //INCREMENTED CONFIGURABLE
    pCf->K1   = CgCf_k1 + kValues;
    pCf->K2   = CgCf_k2 + kValues;
    pCf->K3   = CgCf_k3 - kValues;
    pCf->K4   = CgCf_k4 - kValues;
    pCf->K5   = CgCf_k5 + kValues;
    pCf->K6   = CgCf_k6 + kValues;
    pCf->K7   = CgCf_k7 + kValues;
    pCf->K8   = CgCf_k8 - kValues;
    pCf->K9   = CgCf_k9 + kValues;
	pCf->Kc   = CgCf_kc;
    CgCoef(pCf);
}
void KernelConfig(Coef *pCf){
	int keySelect   = kc;
	int kcId;
	int menu_Active = TRUE;
	Xuint16 uKvalue = 0x0000;
	while (menu_Active == TRUE) {
		switch (keySelect) {
		case clear:
			menu_Active = FALSE;
			break;
		case kc:
            printKId();
            printf("Enter kc ID\n");
            menu_print_prompt();
            kcId  = uart_prompt_io();
            if(kcId == YcCf_kc){
               CgCoef(&pYcCf);
                *pCf = pYcCf;
                printf("Selected YCbCr\n");
                keySelect = kernalCoef;
                break;}
            else if(kcId == CgCf_kc){
               CgCoef(&pCgCf);
                *pCf = pCgCf;
                printf("Selected ColorGain\n");
                keySelect = kernalCoef;
                break;}
            else if(kcId == ShCf_kc){
                CgCoef(&pShCf);
                *pCf = pShCf;
                printf("Selected Sharp\n");
                keySelect = kernalCoef;
                break;}
            else if(kcId == BlCf_kc){
                CgCoef(&pBlCf);
                *pCf = pBlCf;
                printf("Selected Blur\n");
                keySelect = kernalCoef;
                break;}
            else if(kcId == SxCf_kc){
                CgCoef(&pSxCf);
                *pCf = pSxCf;
                printf("Selected SobelX\n");
                keySelect = kernalCoef;
                break;}
            else if(kcId == SyCf_kc){
                CgCoef(&pSyCf);
                *pCf = pSyCf;
                printf("Selected SobelY\n");
                keySelect = kernalCoef;
                break;}
            else if(kcId == PxCf_kc){
                CgCoef(&pPxCf);
                *pCf = pPxCf;
                printf("Selected Prewitt X\n");
                keySelect = kernalCoef;
                break;}
            else if(kcId == PyCf_kc){
                CgCoef(&pPyCf);
                *pCf = pPyCf;
                printf("Selected Prewitt Y\n");
                keySelect = kernalCoef;
                break;}
            else if(kcId == EmCf_kc){
                CgCoef(&pEmCf);
                *pCf = pEmCf;
                printf("Selected Embross\n");
                keySelect = kernalCoef;
                break;}
            else if(kcId == Cg1Cf_kc){
                CgCoef(&pCg1Cf);
                *pCf = pCg1Cf;
                printf("Selected YCbCr\n");
                keySelect = kernalCoef;
                break;}
            else{
                keySelect = kernalCoef;
                break;}
		case kernalCoef:
			CgCoef(pCf);
            CgCfPrintPrompt(0,pCf,&pInCoef);
            printf("\n\n\n");
			printf("Enter per k1-k9 or k0 for all\n");
            menu_print_prompt();
			keySelect = uart_prompt_io();
            break;
		case k0:
            printf("Enter k1 Value\n");
            menu_print_prompt();
            pCf->K1  = uart_prompt_io();
            printf("Enter k2 Value\n");
            menu_print_prompt();
            pCf->K2  = uart_prompt_io();
            printf("Enter k3 Value\n");
            menu_print_prompt();
            pCf->K3  = uart_prompt_io();
            printf("Enter k4 Value\n");
            menu_print_prompt();
            pCf->K4  = uart_prompt_io();
            printf("Enter k5 Value\n");
            menu_print_prompt();
            pCf->K5  = uart_prompt_io();
            printf("Enter k6 Value\n");
            menu_print_prompt();
            pCf->K6  = uart_prompt_io();
            printf("Enter k7 Value\n");
            menu_print_prompt();
            pCf->K7  = uart_prompt_io();
            printf("Enter k8 Value\n");
            menu_print_prompt();
            pCf->K8  = uart_prompt_io();
            printf("Enter k9 Value\n");
            menu_print_prompt();
            pCf->K9  = uart_prompt_io();
            keySelect = kernalCoef;
            break;
		case k1:
            printf("Enter k1 Value\n");
            menu_print_prompt();
            pCf->K1  = uart_prompt_io();
            keySelect = kernalCoef;
            break;
		case k2:
            printf("Enter k2 Value\n");
            menu_print_prompt();
            uKvalue   = uart_prompt_io();
            pCf->K2  = ((~uKvalue)&0xFFFF)+ 0x1;
            keySelect = kernalCoef;
            break;
		case k3:
            printf("Enter k3 Value\n");
            menu_print_prompt();
            uKvalue   = uart_prompt_io();
            pCf->K3  = ((~uKvalue)&0xFFFF)+ 0x1;
            keySelect = kernalCoef;
            break;
		case k4:
            printf("Enter k4 Value\n");
            menu_print_prompt();
            uKvalue   = uart_prompt_io();
            pCf->K4  = ((~uKvalue)&0xFFFF)+ 0x1;
            keySelect = kernalCoef;
            break;
		case k5:
            printf("Enter k5 Value\n");
            menu_print_prompt();
            pCf->K5  = uart_prompt_io();
            keySelect = kernalCoef;
            break;
		case k6:
            printf("Enter k6 Value\n");
            menu_print_prompt();
            uKvalue   = uart_prompt_io();
            pCf->K6  = ((~uKvalue)&0xFFFF)+ 0x1;
            keySelect = kernalCoef;
            break;
		case k7:
            printf("Enter k7 Value\n");
            menu_print_prompt();
            uKvalue   = uart_prompt_io();
            pCf->K7  = ((~uKvalue)&0xFFFF)+ 0x1;
            keySelect = kernalCoef;
            break;
		case k8:
            printf("Enter k8 Value\n");
            menu_print_prompt();
            uKvalue   = uart_prompt_io();
            pCf->K8  = ((~uKvalue)&0xFFFF)+ 0x1;
            keySelect = kernalCoef;
            break;
		case k9:
            printf("Enter k9 Value\n");
            menu_print_prompt();
            pCf->K9  = uart_prompt_io();
            keySelect = kernalCoef;
            break;
		case keygain:
			keyCgainConfigSelect();
        case menucall:
        	menu_calls(TRUE);
            break;
		default:
			keySelect  = kernalCoef;
			break;
		}
	}
}
void CgCoef(Coef *pCf) {
    D5M_mWriteReg(D5M_BASE,w_kernal_1_reg_08,pCf->K1);
    D5M_mWriteReg(D5M_BASE,w_kernal_2_reg_09,pCf->K2);
    D5M_mWriteReg(D5M_BASE,w_kernal_3_reg_10,pCf->K3);
    D5M_mWriteReg(D5M_BASE,w_kernal_4_reg_11,pCf->K4);
    D5M_mWriteReg(D5M_BASE,w_kernal_5_reg_12,pCf->K5);
    D5M_mWriteReg(D5M_BASE,w_kernal_6_reg_13,pCf->K6);
    D5M_mWriteReg(D5M_BASE,w_kernal_7_reg_14,pCf->K7);
    D5M_mWriteReg(D5M_BASE,w_kernal_8_reg_15,pCf->K8);
    D5M_mWriteReg(D5M_BASE,w_kernal_9_reg_16,pCf->K9);
    D5M_mWriteReg(D5M_BASE,w_kSet_reg_17,pCf->Kc);
    usleep(1);
    videoFeatureSelect(pCf->Vid);
}
void keyCgainConfigSelect(){
	int keySelect    = menu_select;
	u8 userinput     = 0;
	u16 kValues      = 0;
	int menu_Active  = TRUE;
    KeyPrValue();
	while (menu_Active == TRUE) {
		switch (keySelect) {
		case menuCheck:
			menu_Active = FALSE;
			break;
		case menu_select:
            menu_print_prompt();
            CgainConfig(kValues,&pCf);
            printf("\n\n");
            CgCfPrintPrompt(kValues,&pCf,&pInCoef);
			userinput   = keypress_to_uart(uart_1_baseaddr);
			keySelect   = userinput + 10;
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
        case kernalconfig:
        	KernelConfig(&pCf);
            break;
        case menucall:
        	menu_calls(TRUE);
            break;
		default:
			keySelect  = menu_select;
			break;
		}
	}
}
void KeyPrValue(){
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
void CgCfPrintPrompt(u16 kValues,Coef *pCf,InCoef *pInCoef){
    pInCoef->K1 = (pCf->K1 + kValues);
    pInCoef->K2 = (~((~(pCf->K2+kValues))&0x00FF));
    pInCoef->K3 = (~((~(pCf->K3+kValues))&0x00FF));
    pInCoef->K4 = (~((~(pCf->K4+kValues))&0x00FF));
    pInCoef->K5 = (pCf->K5 + kValues);
    pInCoef->K6 = (~((~(pCf->K6+kValues))&0x00FF));
    pInCoef->K7 = (~((~(pCf->K7+kValues))&0x00FF));
    pInCoef->K8 = (~((~(pCf->K8+kValues))&0x00FF));
    pInCoef->K9 = (pCf->K9 + kValues);
    printf("|-----------------------|\r\n");
    printf("|           CG1         |\r\n");
    printf("|-----------------------|\r\n");
    printf("|%d   |%d   |%d   |\r\n",pInCoef->K1,pInCoef->K2,pInCoef->K3);
    printf("|-----------------------|\r\n");
    printf("|%d   |%d   |%d   |\r\n",pInCoef->K4,pInCoef->K5,pInCoef->K6);
    printf("|-----------------------|\r\n");
    printf("|%d   |%d   |%d   |\r\n",pInCoef->K7,pInCoef->K8,pInCoef->K9);
    printf("|-----------------------|\r\n");
    printf("Increment Value = %d\n",(unsigned)kValues);
}
void printKId() {
printf(
"\n"
"|---------------------|\n"
"| 1- Ycbcr            |\n"
"| 2- Cgain            |\n"
"| 3- Sharp            |\n"
"| 4- Blure            |\n"
"| 5- XSobel/Prewit    |\n"
"| 6- YSobel/Prewit    |\n"
"| 7- Embross          |\n"
"|---------------------|\n");
menu_print_prompt();
}

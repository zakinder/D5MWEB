
#ifndef SRC_D5M_VIDEO_FILTERS_FILTERS_H_
#define SRC_D5M_VIDEO_FILTERS_FILTERS_H_
#include <xbasic_types.h>
struct kStruct
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
typedef struct kStruct Coef;
Coef pCgCf;
struct KeypressStruct
{
   Xuint16 ValueDown;
   Xuint16 ValueUp;
   Xuint16 ValueLeft;
   Xuint16 ValueRight;
   Xuint16 ValueMax;
};
typedef struct KeypressStruct KeyVal;
KeyVal pKey;
void CgainInit();
void pKeyInit();
void CgainConfig(u16 kValues);
void CgCoef(Coef *pCgCf);
void CgCfPrintPrompt(u16 kValues,Coef *pCgCf);
void KeyPrValue();
void keyCgainConfigSelect();
#endif /* SRC_D5M_VIDEO_FILTERS_FILTERS_H_ */

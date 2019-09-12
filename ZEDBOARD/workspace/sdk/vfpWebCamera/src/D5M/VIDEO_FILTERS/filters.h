
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
struct kInStruct
{
   Xint16 K1;
   Xint16 K2;
   Xint16 K3;
   Xint16 K4;
   Xint16 K5;
   Xint16 K6;
   Xint16 K7;
   Xint16 K8;
   Xint16 K9;
   Xint16 Kc;
};
typedef struct kInStruct InCoef;
Coef pCgCf;
InCoef pInCoef;

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
void CgCfPrintPrompt(u16 kValues,Coef *pCgCf,InCoef *pInCoef);
void KeyPrValue();
void KernelConfig();
void keyCgainConfigSelect();
#define k0                     0x42E
#define k1                     0x42F
#define k2                     0x430
#define k3                     0x431
#define k4                     0x432
#define k5                     0x433
#define k6                     0x434
#define k7                     0x435
#define k8                     0x436
#define k9                     0x437
#define kc                     0x491
#endif /* SRC_D5M_VIDEO_FILTERS_FILTERS_H_ */

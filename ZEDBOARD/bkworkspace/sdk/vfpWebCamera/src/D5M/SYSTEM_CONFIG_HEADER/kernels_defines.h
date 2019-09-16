// LAST TESTED : 09/08/2019
#ifndef __KERNELS_DEFINES_H__
#define __KERNELS_DEFINES_H__
/****************************************************************
KERNELS
*****************************************************************/
//YCBCR -->ID: 1
#define YcCf_k1                    0x0101//--  1500  =  0.257
#define YcCf_k2                    0x01F8//-- -250   =  0.504
#define YcCf_k3                    0x0062//-- -500   =  0.098
#define YcCf_k4                    0xFF6C//-- -500   = -0.148
#define YcCf_k5                    0xFEDD//--  1500  = -0.291
#define YcCf_k6                    0x01B7//-- -250   =  0.439
#define YcCf_k7                    0x01B7//-- -250   =  0.439
#define YcCf_k8                    0xFE90//-- -500   = -0.368
#define YcCf_k9                    0xFFB9//--  1500  = -0.071
#define YcCf_kc                    0x0001//--  1
//CGAIN -->ID: 2
#define CgCf_k1                    0x05DC//--  1500  =  1.500
#define CgCf_k2                    0xFF06//-- -250   = -0.250
#define CgCf_k3                    0xFE0C//-- -500   = -0.500
#define CgCf_k4                    0xFE0C//-- -500   = -0.500
#define CgCf_k5                    0x05DC//--  1500  =  1.500
#define CgCf_k6                    0xFF06//-- -250   = -0.250
#define CgCf_k7                    0xFF06//-- -250   = -0.250
#define CgCf_k8                    0xFE0C//-- -500   = -0.500
#define CgCf_k9                    0x05DC//--  1500  =  1.500
#define CgCf_kc                    0x0002//--  2
//SHARP -->ID: 3
#define ShCf_k1                    0x0000//--  0
#define ShCf_k2                    0xFE0C//-- -0.5
#define ShCf_k3                    0x0000//--  0
#define ShCf_k4                    0xFE0C//-- -0.5
#define ShCf_k5                    0x0BB8//--  3
#define ShCf_k6                    0xFE0C//-- -0.5
#define ShCf_k7                    0x0000//--  0
#define ShCf_k8                    0xFE0C//-- -0.5
#define ShCf_k9                    0x0000//--  0
#define ShCf_kc                    0x0003//--  3
//BLURE -->ID: 4
#define BlCf_k1                    0x006F//-- 0.111
#define BlCf_k2                    0x006F//-- 0.111
#define BlCf_k3                    0x006F//-- 0.111
#define BlCf_k4                    0x006F//-- 0.111
#define BlCf_k5                    0x006F//-- 0.111
#define BlCf_k6                    0x006F//-- 0.111
#define BlCf_k7                    0x006F//-- 0.111
#define BlCf_k8                    0x006F//-- 0.111
#define BlCf_k9                    0x006F//-- 0.111
#define BlCf_kc                    0x0004//-- 4
//XSobel -->ID: 5
#define SxCf_k1                    0xFC18//--  [-1]
#define SxCf_k2                    0x0000//--  [+0]
#define SxCf_k3                    0x03E8//--  [+1]
#define SxCf_k4                    0xF830//--  [-2]
#define SxCf_k5                    0x0000//--  [+0]
#define SxCf_k6                    0x07D0//--  [+2]
#define SxCf_k7                    0xFC18//--  [-1]
#define SxCf_k8                    0x0000//--  [+0]
#define SxCf_k9                    0x03E8//--  [+1]
#define SxCf_kc                    0x0005//--  5
//YSobel -->ID: 6
#define SyCf_k1                    0x03E8//--  [+1]
#define SyCf_k2                    0x07D0//--  [+2]
#define SyCf_k3                    0x03E8//--  [+1]
#define SyCf_k4                    0x0000//--  [-2]
#define SyCf_k5                    0x0000//--  [+0]
#define SyCf_k6                    0x0000//--  [+2]
#define SyCf_k7                    0xFC18//--  [-1]
#define SyCf_k8                    0xF830//--  [-2]
#define SyCf_k9                    0xFC18//--  [-1]
#define SyCf_kc                    0x0006//--  6
//XPrewit -->ID: 5
#define PxCf_k1                    0x03E8//--  [+1]
#define PxCf_k2                    0x0000//--  [+0]
#define PxCf_k3                    0xFC18//--  [-1]
#define PxCf_k4                    0x03E8//--  [+1]
#define PxCf_k5                    0x0000//--  [+0]
#define PxCf_k6                    0xFC18//--  [-1]
#define PxCf_k7                    0x03E8//--  [+1]
#define PxCf_k8                    0x0000//--  [+0]
#define PxCf_k9                    0xFC18//--  [-1]
#define PxCf_kc                    0x0005//--  5
//YPrewit -->ID: 6
#define PyCf_k1                    0x03E8//--  [+1]
#define PyCf_k2                    0x03E8//--  [+1]
#define PyCf_k3                    0x03E8//--  [+1]
#define PyCf_k4                    0x0000//--  [+0]
#define PyCf_k5                    0x0000//--  [+0]
#define PyCf_k6                    0x0000//--  [+0]
#define PyCf_k7                    0xFC18//--  [-1]
#define PyCf_k8                    0xFC18//--  [-1]
#define PyCf_k9                    0xFC18//--  [-1]
#define PyCf_kc                    0x0006//--  6
//Embross -->ID: 7
#define EmCf_k1                    0xFC18//-- -1
#define EmCf_k2                    0xFC18//-- -1
#define EmCf_k3                    0x0000//--  0
#define EmCf_k4                    0xFC18//-- -1
#define EmCf_k5                    0x0000//--  0
#define EmCf_k6                    0x03E8//--  1
#define EmCf_k7                    0x0000//--  0
#define EmCf_k8                    0x03E8//--  1
#define EmCf_k9                    0x03E8//--  1
#define EmCf_kc                     0x0007//--  7
//CGAIN -->ID: 2
#define Cg1Cf_k1                   0x05DC//--  1500  =  1.500
#define Cg1Cf_k2                   0xFF06//-- -250   = -0.250
#define Cg1Cf_k3                   0xFE0C//-- -500   = -0.500
#define Cg1Cf_k4                   0xFE0C//-- -500   = -0.500
#define Cg1Cf_k5                   0x05DC//--  1500  =  1.500
#define Cg1Cf_k6                   0xFF06//-- -250   = -0.250
#define Cg1Cf_k7                   0xFF06//-- -250   = -0.250
#define Cg1Cf_k8                   0xFE0C//-- -500   = -0.500
#define Cg1Cf_k9                   0x05DC//--  1500  =  1.500
#define Cg1Cf_kc                   0x0008//--  8
#endif // __KERNELS_DEFINES_H__
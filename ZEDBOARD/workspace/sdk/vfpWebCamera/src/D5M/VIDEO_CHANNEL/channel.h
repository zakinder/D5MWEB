// LAST TESTED : 02/05/2018
#ifndef __CHANNEL_H__
#define __CHANNEL_H__
#include <xil_types.h>
void sobel();
void colorFilterFixed();
void colorFilterA11(u16 Axx);
void colorFilterA12(u16 Axx);
void colorFilterA13(u16 Axx);
void colorFilterA21(u16 Axx);
void colorFilterA22(u16 Axx);
void colorFilterA23(u16 Axx);
void colorFilterA31(u16 Axx);
void colorFilterA32(u16 Axx);
void colorFilterA33(u16 Axx);
void colorFilterKc(u16 Axx);
void prewitt();
void computeBrightness();
void pRbrightness();
void selected_channel();
void edgeThreshold(u16 thresholdValue);
void videoFeatureSelect(u16 videoType);
void edgeType(u16 edgeTypeValue);
void cpuackgoagain(u16 valueIn);
void gridlock(u16 valueIn);
void readGData(u16 edgeTypeValue);
void color_correction(u16 videoType);
void ycbcrSelect(u16 videoType);
void deltaConfig(u16 videoType);
void framefifoMode(u16 fifoMode);
void point_Interest(u16 videoType);
void ReadDataByte(u16 Value);
void fifoStatus();
void readGDataContinueMode();
void readGDataStopMode();
void pointInterestFixed();
void framefifoFixed();
void d5mInit();
void d5mInitCall();
void d5mInitPrint();
u16 rColorFilterA11();
u16 rColorFilterA12();
u16 rColorFilterA13();
u16 rColorFilterA21();
u16 rColorFilterA22();
u16 rColorFilterA23();
u16 rColorFilterA31();
u16 rColorFilterA32();
u16 rColorFilterA33();
void readFifo();
void enableNextRead(u16 eValue);
void colorDetectRange(u16 fRgbCoordRL,u16 fRgbCoordRH,u16 fRgbCoordGL,u16 fRgbCoordGH,u16 fRgbCoordBL,u16 fRgbCoordBH);
#endif // __CHANNEL_H__
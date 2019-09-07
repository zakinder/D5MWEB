#ifndef __VIDEO_GENERATOR_H__
#define __VIDEO_GENERATOR_H__
#include "xvtc.h"
#include "xparameters.h"
int vgen_init(XVtc *pVtc, u16 VtcDeviceID);
int vgen_config(XVtc *pVtc, int ResolutionId, int bVerbose);
#endif // __VIDEO_GENERATOR_H__
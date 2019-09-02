#ifndef __VIDEO_RESOLUTION_H__
#define __VIDEO_RESOLUTION_H__
#include "xbasic_types.h"
struct struct_vres_timing_t
{
    char *pName;
    Xuint32 VActiveVideo;
    Xuint32 VFrontPorch;
    Xuint32 VSyncWidth;
    Xuint32 VBackPorch;
    Xuint32 VSyncPolarity;
    Xuint32 HActiveVideo;
    Xuint32 HFrontPorch;
    Xuint32 HSyncWidth;
    Xuint32 HBackPorch;
    Xuint32 HSyncPolarity;
};
typedef struct struct_vres_timing_t vres_timing_t;
char *  vres_get_name(Xuint32 resolutionId);
Xuint32 vres_get_width(Xuint32 resolutionId);
Xuint32 vres_get_height(Xuint32 resolutionId);
Xuint32 vres_get_timing(Xuint32 resolutionId, vres_timing_t *pTiming );
Xint32 vres_detect( Xuint32 width, Xuint32 height );
#endif // __VIDEO_RESOLUTION_H__

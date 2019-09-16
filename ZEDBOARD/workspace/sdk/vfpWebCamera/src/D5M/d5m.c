// LAST TESTED : 09/15/2019

#include "I2C_D5M/i2c_d5m.h"
#include "VIDEO_CHANNEL/channel.h"
#include "VIDEO_FILTERS/filters.h"

void d5m()
{
	camera_hdmi_config();
    KernelInit();
	d5mInit();
    d5mInitCall();
    d5mInitPrint();
}

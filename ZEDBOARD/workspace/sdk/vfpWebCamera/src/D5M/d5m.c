// LAST TESTED : 04/15/2019
#include <stdio.h>
#include <xparameters.h>
#include "HDMI_DISPLAY/hdmi_display.h"
#include "I2C_D5M/i2c_d5m.h"
#include "MENU_CALLS/menu_calls.h"
#include "SYSTEM_CONFIG_HEADER/system_config_header.h"
#include "VIDEO_CHANNEL/channel.h"
void d5m()
{
	camera_hdmi_config();
	d5mInit();
    d5mInitCall();
    d5mInitPrint();
}

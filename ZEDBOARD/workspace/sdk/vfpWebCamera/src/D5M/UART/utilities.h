#include <xbasic_types.h>
#ifndef __UTILITIES_H__
#define __UTILITIES_H__
#define clear  0x10ECC0
#define one_second 74067512
#define ONESECOND    0x13D92D3F
#define ONE_SECOND 3250000000
#define uart(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (u32)(RegOffset))
#define COUNTS_PER_USECOND  (XPAR_CPU_CORTEXA9_CORE_CLOCK_FREQ_HZ / (2U*1000000U))
void cmds_menu();
#endif // __UTILITIES_H__

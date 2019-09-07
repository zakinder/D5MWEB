// LAST TESTED : 12/16/2018
#include <xil_cache.h>
#ifdef STDOUT_IS_16550
 #include "xuartns550_l.h"
 #define UART_BAUD 9600
#endif
void enable_caches()
{
#ifdef __PPC__
    Xil_ICacheEnableRegion(CACHEABLE_REGION_MASK);
    Xil_DCacheEnableRegion(CACHEABLE_REGION_MASK);
#elif __MICROBLAZE__
#ifdef XPAR_MICROBLAZE_USE_ICACHE
    Xil_ICacheEnable();
#endif
#ifdef XPAR_MICROBLAZE_USE_DCACHE
    Xil_DCacheEnable();
#endif
#endif
}
void disable_caches()
{
    Xil_DCacheDisable();
    Xil_ICacheDisable();
}
void init_uart()
{
    #ifdef STDOUT_IS_16550
    XUartNs550_SetBaud(STDOUT_BASEADDR, XPAR_XUARTNS550_CLOCK_HZ, UART_BAUD);
    XUartNs550_SetLineControlReg(STDOUT_BASEADDR, XUN_LCR_8_DATA_BITS);
    #endif
}
//void init_platform()
//{
//    enable_caches();
//    init_uart();
//}
//
//void cleanup_platform()
//{
//    disable_caches();
//}
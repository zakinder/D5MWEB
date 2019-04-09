#include <lwip/err.h>
#include <lwip/ip_addr.h>
#include <lwip/netif.h>
#include <lwipopts.h>
#include <netif/xadapter.h>
#include <stdio.h>
#include <xil_io.h>
#include <xil_types.h>
#include <xparameters.h>
#include <xparameters_ps.h>
#include "../D5M/MENU_CALLS/menu_calls.h"
#include "../D5M/HDMI_DISPLAY/hdmi_display.h"
#include "eplatform/platform.h"
#include "eplatform/platform_config.h"

#ifndef __PPC__
#include "xil_printf.h"
#endif
#define D5MBASE XPAR_PS_VIDEO_D5M_VIDEOPROCESS_CONFIG_AXIS_BASEADDR

hdmi_display_start pvideo;
void print_headers();
int start_applications();
int transfer_data();
void platform_enable_interrupts();
void lwip_init(void);
void tcp_fasttmr(void);
void tcp_slowtmr(void);
#if LWIP_DHCP==1
extern volatile int dhcp_timoutcntr;
err_t dhcp_start(struct netif *netif);
#endif
extern volatile int TxPerfConnMonCntr;
extern volatile int TcpFastTmrFlag;
extern volatile int TcpSlowTmrFlag;
void print_ip(char *msg, struct ip_addr *ip)
{
    print(msg);
    xil_printf("%d.%d.%d.%d\r\n", ip4_addr1(ip), ip4_addr2(ip),
			ip4_addr3(ip), ip4_addr4(ip));
}
void print_ip_settings(struct ip_addr *ip, struct ip_addr *mask, struct ip_addr *gw)
{
    print_ip("Board IP:       ", ip);
    print_ip("Netmask :       ", mask);
    print_ip("Gateway :       ", gw);
}
int web()
{

	WRITE_SET0();
	struct netif *netif, server_netif;
	struct ip_addr ipaddr, netmask, gw;
	unsigned char mac_ethernet_address[] = { 0x00, 0x0a, 0x35, 0x00, 0x01, 0x02 };
	netif = &server_netif;
	if (init_platform() < 0) {
		xil_printf("ERROR initializing platform.\r\n");
		return -1;
	}
	xil_printf("\r\n\r\n");
	xil_printf("-----Web Application ------\r\n");
#if (LWIP_DHCP==0)
	IP4_ADDR(&ipaddr,  192, 168,   1, 10);
	IP4_ADDR(&netmask, 255, 255, 255,  0);
	IP4_ADDR(&gw,      192, 168,   1,  1);
    print_ip_settings(&ipaddr, &netmask, &gw);
#endif
	lwip_init();
#if (LWIP_DHCP==1)
	ipaddr.addr = 0;
	gw.addr = 0;
	netmask.addr = 0;
#endif
	if (!xemac_add(netif, &ipaddr, &netmask, &gw, mac_ethernet_address, PLATFORM_EMAC_BASEADDR)) {
		xil_printf("Error adding N/W interface\r\n");
		return -1;
	}
	netif_set_default(netif);
	netif_set_up(netif);
	platform_enable_interrupts();
#if (LWIP_DHCP==1)
	dhcp_start(netif);
	dhcp_timoutcntr = 24;
	TxPerfConnMonCntr = 0;
	while(((netif->ip_addr.addr) == 0) && (dhcp_timoutcntr > 0)) {
		xemacif_input(netif);
		if (TcpFastTmrFlag) {
			tcp_fasttmr();
			TcpFastTmrFlag = 0;
		}
		if (TcpSlowTmrFlag) {
			tcp_slowtmr();
			TcpSlowTmrFlag = 0;
		}
	}
	if (dhcp_timoutcntr <= 0) {
		if ((netif->ip_addr.addr) == 0) {
			xil_printf("DHCP Timeout\r\n");
			xil_printf("Configuring default IP of 192.168.1.10\r\n");
			IP4_ADDR(&(netif->ip_addr),  192, 168,   1, 10);
			IP4_ADDR(&(netif->netmask), 255, 255, 255,  0);
			IP4_ADDR(&(netif->gw),      192, 168,   1,  1);
		}
	}
	print_ip_settings(&(netif->ip_addr), &(netif->netmask), &(netif->gw));
#endif
	start_applications();
	print_headers();
	while (1) {
//		pvideo.time = (((0x0000ff& D5M_mReadReg(D5MBASE,REG32))<<16)|((D5M_mReadReg(D5MBASE,REG31) & 0x0000ff)<<8)|(0x0000ff & D5M_mReadReg(D5MBASE,REG30)));
//        if (pvideo.time != (((0x0000ff& D5M_mReadReg(D5MBASE,REG32))<<16)|((D5M_mReadReg(D5MBASE,REG31) & 0x0000ff)<<8)|(0x0000ff & D5M_mReadReg(D5MBASE,REG30))))
//        {
//        	printf("Powered On Time %d:%d:%d\n\r",(unsigned) ((pvideo.time & 0xff0000)>>16),(unsigned) ((pvideo.time & 0x00ff00)>>8),(unsigned) (pvideo.time & 0x0000ff));
//        	*(volatile unsigned int*)XPAR_LEDS_8BITS_BASEADDR=(unsigned) (pvideo.time & 0x0000ff);
//        }


//        if((pvideo.time & 0x0000ff) == 20){
//        	exposerCompansate();
//        }
		if (TcpFastTmrFlag) {
			tcp_fasttmr();
			TcpFastTmrFlag = 0;
		}
		if (TcpSlowTmrFlag) {
			tcp_slowtmr();
			TcpSlowTmrFlag = 0;
		}
		xemacif_input(netif);
		transfer_data();
	}
    cleanup_platform();
	return 0;
}

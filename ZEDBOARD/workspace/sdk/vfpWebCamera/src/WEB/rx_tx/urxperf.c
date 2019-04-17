#include <stdio.h>
#include <string.h>
#include "lwip/err.h"
#include "lwip/udp.h"
#ifndef __PPC__
#include "xil_printf.h"
#endif
static unsigned rxperf_port = 5001;
static unsigned rxperf_server_running = 0;
int
transfer_urxperf_data() {
	return 0;
}
void
urxperf_recv_callback(void *arg, struct udp_pcb *tpcb,
                               struct pbuf *p, struct ip_addr *addr, u16_t port)
{
	static int first = 1;
	static int expected_id = 0;
	static int n_dropped = 0;
	int recv_id;
	recv_id =  *((int *)(p->payload));
	if (first)
		expected_id = recv_id;
	else if (expected_id != recv_id)  {
		n_dropped += (recv_id - expected_id);
		expected_id = recv_id;
	}
	expected_id++;
	pbuf_free(p);
	first = 0;
}
int
start_urxperf_application()
{
	struct udp_pcb *pcb;
	err_t err;
	unsigned port = rxperf_port;	
	pcb = udp_new();
	if (!pcb) {
		xil_printf("Error creating PCB. Out of Memory\r\n");
		return -1;
	}
	err = udp_bind(pcb, IP_ADDR_ANY, port);
	if (err != ERR_OK) {
		xil_printf("Unable to bind to port %d: err = %d\r\n", port, err);
		return -2;
	}
	udp_recv(pcb, urxperf_recv_callback, NULL);
        rxperf_server_running = 1;
	return 0;
}
void print_urxperf_app_header()
{
    xil_printf("%20s %6d %10s %s\r\n", "rxperf server",
                        rxperf_port,
                        rxperf_server_running ? "RUNNING" : "INACTIVE",
                        "$ iperf -c <board ip> -i 5 -t 100 -u -b <bandwidth>");
}

#include <stdio.h>
#include <string.h>
#include "lwip/err.h"
#include "lwip/tcp.h"
#ifdef __arm__
#include "xil_printf.h"
#endif
static unsigned rxperf_port = 5001;	
static unsigned rxperf_server_running = 0;
int
transfer_rxperf_data() {
    return 0;
}
static err_t
rxperf_recv_callback(void *arg, struct tcp_pcb *tpcb, struct pbuf *p, err_t err)
{
    if (p == NULL) {
        tcp_close(tpcb);
        return ERR_OK;
    }
    tcp_recved(tpcb, p->tot_len);
    pbuf_free(p);
    return ERR_OK;
}
err_t
rxperf_accept_callback(void *arg, struct tcp_pcb *newpcb, err_t err)
{
    xil_printf("rxperf: Connection Accepted\r\n");
    tcp_recv(newpcb, rxperf_recv_callback);
    return ERR_OK;
}
int
start_rxperf_application()
{
    struct tcp_pcb *pcb;
    err_t err;
    pcb = tcp_new();
    if (!pcb) {
    	xil_printf("rxperf: Error creating PCB. Out of Memory\r\n");
    	return -1;
    }
    err = tcp_bind(pcb, IP_ADDR_ANY, rxperf_port);
    if (err != ERR_OK) {
    	xil_printf("rxperf: Unable to bind to port %d: err = %d\r\n", rxperf_port, err);
    	return -2;
    }
    tcp_arg(pcb, NULL);
    pcb = tcp_listen(pcb);
    if (!pcb) {
    	xil_printf("rxperf: Out of memory while tcp_listen\r\n");
    	return -3;
    }
    tcp_accept(pcb, rxperf_accept_callback);
    rxperf_server_running = 1;
    return 0;
}
void
print_rxperf_app_header()
{
    xil_printf("%20s %6d %s\r\n", "rxperf server",
                        rxperf_port,
                        "$ iperf -c <board ip> -i 5 -t 100");
}

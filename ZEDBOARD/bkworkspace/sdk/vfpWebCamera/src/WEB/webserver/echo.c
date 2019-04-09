#include <stdio.h>
#include <string.h>
#include "lwip/err.h"
#include "lwip/tcp.h"
#ifndef __PPC__
#include "xil_printf.h"
#endif
static unsigned echo_port = 7;
static unsigned echo_server_running = 0;
int
transfer_echo_data() {
    return 0;
}
void
print_echo_app_header()
{
    xil_printf("%20s %6d %s\r\n", "echo server",
                        echo_port,
                        "$ telnet <board_ip> 7");
}
static err_t
echo_recv_callback(void *arg, struct tcp_pcb *tpcb, struct pbuf *p, err_t err)
{
    if (!p) {
        tcp_close(tpcb);
        tcp_recv(tpcb, NULL);
        return ERR_OK;
    }
    tcp_recved(tpcb, p->len);
    if (tcp_sndbuf(tpcb) > p->len) {
        err = tcp_write(tpcb, p->payload, p->len, 1);
    }
    pbuf_free(p);
    return ERR_OK;
}
static err_t
echo_accept_callback(void *arg, struct tcp_pcb *newpcb, err_t err)
{
    static int connection = 1;
    tcp_recv(newpcb, echo_recv_callback);
    tcp_arg(newpcb, (void*)connection);
    connection++;
    return ERR_OK;
}
int
start_echo_application()
{
    struct tcp_pcb *pcb;
    err_t err;
    pcb = tcp_new();
    if (!pcb) {
        xil_printf("Error creating PCB. Out of Memory\r\n");
        return -1;
    }
    err = tcp_bind(pcb, IP_ADDR_ANY, echo_port);
    if (err != ERR_OK) {
        xil_printf("Unable to bind to port %d: err = %d\r\n", echo_port, err);
        return -2;
    }
    tcp_arg(pcb, NULL);
    pcb = tcp_listen(pcb);
    if (!pcb) {
        xil_printf("Out of memory while tcp_listen\r\n");
        return -3;
    }
    tcp_accept(pcb, echo_accept_callback);
    echo_server_running = 1;
    return 0;
}
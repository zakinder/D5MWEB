#include <stdio.h>
#include <string.h>
#include "lwip/err.h"
#include "lwip/tcp.h"
#include "webserver.h"
#ifndef __PPC__
#include "xil_printf.h"
#endif
#include "xilmfs.h"
static int g_webserver_debug = 0;
static unsigned http_port = 80;
static unsigned http_server_running = 0;
void platform_init_gpios();
int transfer_web_data() {
	return 0;
}
err_t http_sent_callback(void *arg, struct tcp_pcb *tpcb, u16_t len)
{
	int BUFSIZE = 1400, sndbuf, n;
	char buf[BUFSIZE];
	http_arg *a = (http_arg*)arg;
	if (g_webserver_debug)
		xil_printf("%d (%d): S%d..\r\n", a?a->count:0, tpcb->state, len);
	if (tpcb->state > ESTABLISHED) {
		if (a) {
			pfree_arg(a);
			a = NULL;
		}
		tcp_close(tpcb);
        return ERR_OK;
	}
	if (a->fd == -1 || a->fsize <= 0) 
		return ERR_OK;
        while (1) {
            sndbuf = tcp_sndbuf(tpcb);
            if (sndbuf < BUFSIZE)
                return ERR_OK;
            xil_printf("attempting to read %d bytes, left = %d bytes\r\n", BUFSIZE, a->fsize);
            n = mfs_file_read(a->fd, buf, BUFSIZE);
            tcp_write(tpcb, buf, n, 1);
            a->fsize -= n;
            if (a->fsize <= 0) {
                mfs_file_close(a->fd);
                a->fd = 0;
                break;
            }
        }
	return ERR_OK;
}
err_t http_recv_callback(void *arg, struct tcp_pcb *tpcb, struct pbuf *p, err_t err)
{
	http_arg *a = (http_arg*)arg;
		if (g_webserver_debug)
			xil_printf("%d (%d): R%d %d..\r\n", a?a->count:0, tpcb->state, p->len, p->tot_len);
		if (tpcb->state >= 5 && tpcb->state <= 8) {
			pbuf_free(p);
			return -1;
		} else if (tpcb->state > 8) {
			pbuf_free(p);
			return -1;
		}
		tcp_recved(tpcb, p->len);
		GENERATE_RESPONSE(tpcb, p->payload, p->len);//HTTP RESP ONCE PAGE IS LOADED @ http_sent_callback
		pbuf_free(p);
		return ERR_OK;
}

static err_t http_accept_callback(void *arg, struct tcp_pcb *newpcb, err_t err)
{
	tcp_arg(newpcb, (void*)palloc_arg());
	tcp_recv(newpcb, http_recv_callback);//HTTP RESP ONCE PAGE IS LOADED @ http_sent_callback
	tcp_sent(newpcb, http_sent_callback);//INIT PAGE LOAD
	return ERR_OK;
}

//START THE APP TYPE
int start_web_application()
{
	struct tcp_pcb *pcb;
	err_t err;
	platform_init_fs();
	platform_init_gpios();
	pcb = tcp_new();
	xil_printf("Setup TCP PCB(protocol control block) \r\n");
	if (!pcb) {
		xil_printf("Error creating PCB. Out of Memory\r\n");
		return -1;
	}
	xil_printf("Setup to bind to port 80\r\n");
	err = tcp_bind(pcb, IP_ADDR_ANY, http_port);
	if (err != ERR_OK) {
		xil_printf("Unable to bind to port 80: err = %d\r\n", err);
		return -2;
	}
	xil_printf("Binded to port 80\r\n");
	tcp_arg(pcb, NULL);
	xil_printf("TCP Listen \r\n");
	pcb = tcp_listen(pcb);
	if (!pcb) {
		xil_printf("Out of memory while tcp_listen\r\n");
		return -3;
	}
	xil_printf("TCP accept and http server is running\r\n");
	//INIT HTTP ON ACCEPT -->http_accept_callback
	tcp_accept(pcb, http_accept_callback);
        http_server_running = 1; // WEBSERVER IS ON
	return 0;
}
void print_web_app_header()
{
    xil_printf("%20s %6d %s\r\n", "http server",http_port,"Point your web browser to http://192.168.1.10");
}

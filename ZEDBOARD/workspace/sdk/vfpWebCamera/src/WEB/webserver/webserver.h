#ifndef __WEBSERVER_H__
#define __WEBSERVER_H__
#include <xbasic_types.h>
#include "../../D5M/HDMI_DISPLAY/hdmi_display.h"

#define MAX_FILENAME 256
#define INCLUDE_ECHO_SERVER    1
#define INCLUDE_WEB_SERVER     1
#define INCLUDE_TFTP_SERVER    0
#define INCLUDE_RXPERF_SERVER  0
#define INCLUDE_TXPERF_CLIENT  0
#define INCLUDE_TXUPERF_CLIENT 0
#define INCLUDE_RXUPERF_CLIENT 0

int platform_init_fs();
int http_init_devices();
void extract_file_name(char *filename, char *req, int rlen, int maxlen);
char *get_file_extension(char *buf);
int IS_CMD_LED(char *buf);
int IS_CMD_SWITCH(char *buf);
int CMD_PL_PS_STREAMER_LED_ON(char *buf);
int CMD_PL_PS_STREAMER_LED_PAT(char *buf);
int CMD_PL_PS_STREAMER_LED_OFF(char *buf);
int CMD_PS_FP_ADD(char *buf);
int CMD_PS_FP_SUB(char *buf);
int CMD_PS_FP_MUL(char *buf);
int CMD_PL_PS_STREAMER_ASSERT(char *buf);
int CMD_PL_PS_STREAMER_CORE(char *buf);
int GENERATE_RESPONSE(struct tcp_pcb *pcb, char *http_req, int http_req_len);

typedef struct {
	int count;
	int fd;
	int fsize;
} http_arg;

http_arg *palloc_arg();
void pfree_arg(http_arg *);
int start_web_application();
unsigned volatile char * CONVERT_CHAR_S(char *str);
void FLOATING_POINT_NUMBER_AFTERPOINT(float n, char *res, int afterpoint);
int platform_init_fs();
int fk1,fk2;
float f1,f2;

#endif

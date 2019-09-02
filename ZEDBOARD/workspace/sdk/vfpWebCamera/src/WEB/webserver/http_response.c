#include <lwip/err.h>
#include <lwip/tcp.h>
#include <stdio.h>
#include <string.h>
#include <xil_io.h>
#include <xil_printf.h>
#include <xil_types.h>
#include <xilmfs.h>
#include <xparameters_ps.h>

#include "../../D5M/I2C_D5M/i2c_d5m.h"
#include "../../D5M/SYSTEM_CONFIG_HEADER/system_config_header.h"
#include "../../D5M/SYSTEM_CONFIG_HEADER/system_config_defines.h"
#include "../../D5M/VIDEO_CHANNEL/channel.h"
#include "platform_gpio.h"
#include "webserver.h"

#define LEDS_TOGGLE XPAR_LEDS_8BITS_BASEADDR
#define D5MBASE XPAR_PS_VIDEO_D5M_VIDEOPROCESS_CONFIG_AXIS_BASEADDR
#define out_buf_size 4
int out_buf_i = 0 ;
static char bufVideo[out_buf_size];
static char dataVideo[12];
static char regPack[4];
static char registerPack[12];
static char *registe;
u32 address = 0x01000000 + 0x01000000;
    static u16 value;
    //static u32 exposer;
    static u16 g1_gain;
    static u16 g2_gain;
    static u16 b_gain;
    static u16 r_gain;
    static int y;
    static int x;
    char *notfound_header =
    "<html> \
    <head> \
    <title>404</title> \
    <style type=\"text/css\"> \
    div#request {background: #eeeeee} \
    </style> \
    </head> \
    <body> \
    <h1>404 Page Not Found</h1> \
    <div id=\"request\">";
    char *notfound_footer =
    "</div> \
    </body> \
    </html>";
void TOGGLE_TASK()
{
    *(volatile unsigned int*)LEDS_TOGGLE=0x03;
    *(volatile unsigned int*)LEDS_TOGGLE=0x0c;
    *(volatile unsigned int*)LEDS_TOGGLE=0x30;
    *(volatile unsigned int*)LEDS_TOGGLE=0xc0;
    *(volatile unsigned int*)LEDS_TOGGLE=0x30;
    *(volatile unsigned int*)LEDS_TOGGLE=0x0c;
    *(volatile unsigned int*)LEDS_TOGGLE=0x03;
}
void fetchPack(char *sample) {
	bufVideo[out_buf_i] = *sample;
	out_buf_i++;
	if (out_buf_i == out_buf_size) {
			//struct pbuf * p = pbuf_alloc(PBUF_TRANSPORT, out_buf_size * sizeof(int), PBUF_REF);
			//p->payload = buf;
			//xil_printf("sending %d bytes (printing in words) from buf @ %X:", p->len, p->payload);
			for (out_buf_i = 0 ; out_buf_i != out_buf_size ; out_buf_i++){
				xil_printf("%d,", bufVideo[out_buf_i]);
			}
			//pbuf_free(p);
			out_buf_i = 0;
	}
}
void dataPack(int sample) {
	out_buf_i++;
	snprintf(regPack, sizeof(regPack), "%d", sample);
	strcpy(dataVideo[out_buf_i*4], regPack);
	printf  ("%s\n", regPack);
	if (out_buf_i == out_buf_size) {
			for (out_buf_i = 0 ; out_buf_i != out_buf_size ; out_buf_i++){
				xil_printf("%d  %s\n\r",out_buf_i, dataVideo[out_buf_i*4]);
			}
			//pbuf_free(p);
			out_buf_i = 0;
	}
}
void HARDWARE_ETHERNETIO_CONTROL(char *p, int len)
{
int i;
for (i = 0; i < len; i+=16)
{
        value =p[i];
}
D5M_mWriteReg(D5M_BASE,w_threshold_reg_4,value);
if(value==0)
{
	camera_hdmi_config();
}
if(value==1){
//	exposer=0x800;
//    g1_gain=2;
//    g2_gain=2;
//    b_gain=3;
//    r_gain=3;
//	xil_printf("01.Set to RGB 444 Mode\n\r");
	videoFeatureSelect(0x0000);
}
if(value==2)
{
//    g1_gain=2;
//    g2_gain=2;
//    b_gain=3;
//    r_gain=3;
//	exposer=800;
//	xil_printf("02.Set to YCbCr 4:2:2 Mode\n\r");
	// 0 - Edge BLACK WHITE
	// 1 - Video-EDGE ALONG RGB
	// 2 - Detector-Video
	// 3 - Sharp Video
	// 4 - normal Video
	videoFeatureSelect(0x0004);
	d5mtestpattern(0x0004);
	xil_printf("normal Video\n\r");
}
if(value==3)
{
	videoFeatureSelect(0x0003);
	xil_printf("Sharp Video\n\r");
//	exposer = exposer + 0x32;
//	camera_exposer(exposer);
//	xil_printf("03.exposer+50 Mode %d\n\r", exposer);
}
if(value==4)
{
//	exposer = exposer - 0x32;
//	camera_exposer(exposer);
//	xil_printf("04.exposer-50 %d\n\r", exposer);
	videoFeatureSelect(0x0000);
	xil_printf("Edge BLACK WHITE\n\r");
}
if(value==5)
{
	g1_gain++;
	img_write_register(43,g1_gain);//Green1 Gain
	xil_printf("05.Updated g1_gain+1 %d\n\r", g1_gain);
}
if(value==6)
{
	b_gain++;
	img_write_register(44,b_gain);//Blue Gain
	xil_printf("06.Updated b_gain+1 %d\n\r", b_gain);
}
if(value==7)
{
	r_gain = r_gain + 0x1;
	img_write_register(45,r_gain);//Red Gain
	xil_printf("07.Updated r_gain+1 %d\n\r", r_gain);
}
if(value==8)
{
	g2_gain = g2_gain + 0x1;
	img_write_register(46,g2_gain);//Green2 Gain
	xil_printf("08.Updated g2_gain+1 %d\n\r", g2_gain);
}
if(value==9)
{
	g1_gain = g1_gain - 0x1;
	img_write_register(43,g1_gain);//Green1 Gain
	xil_printf("09.Updated g1_gain-1 %d\n\r", g1_gain);
}
if(value==10)
{
	b_gain = b_gain - 0x1;
	img_write_register(44,b_gain);//Blue Gain
	xil_printf("10.Updated b_gain-1 %d\n\r", b_gain);
}
if(value==11)
{
	r_gain = r_gain - 0x1;
	img_write_register(45,r_gain);//Red Gain
	xil_printf("11.Updated r_gain-1 %d\n\r", r_gain);
}
if(value==12)
{
	g2_gain = g2_gain - 0x1;
	img_write_register(46,g2_gain);//Green2 Gain
	xil_printf("12.Updated g2_gain-1 %d\n\r", g2_gain);
}
    xil_printf("\r\n");
}
int DO_404(struct tcp_pcb *pcb, char *req, int rlen)
{
    int len, hlen;
    int BUFSIZE = 1024;
    char buf[BUFSIZE];
    err_t err;
    len = strlen(notfound_header) + strlen(notfound_footer) + rlen;
    hlen = GENERATE_HTTP_HEADER((char *)buf, "html", len);
    if (tcp_sndbuf(pcb) < hlen)
    {
        xil_printf("cannot send 404 message, tcp_sndbuf = %d bytes, message length = %d bytes\r\n",
        tcp_sndbuf(pcb), hlen);
        return -1;
    }
    if ((err = tcp_write(pcb, buf, hlen, 1)) != ERR_OK)
    {
        xil_printf("%s: error (%d) writing 404 http header\r\n", __FUNCTION__, err);
        return -1;
    }
    tcp_write(pcb, notfound_header, strlen(notfound_header), 1);
    tcp_write(pcb, req, rlen, 1);
    tcp_write(pcb, notfound_footer, strlen(notfound_footer), 1);
    return 0;
}
int DO_HTTP_POST(struct tcp_pcb *pcb, char *req, int rlen)
{
    /*Locals*/
    unsigned int SWITCH_STATE = 0;
    int BUFSIZE = 1024;
    unsigned char buf[BUFSIZE];
    int n;
    int len;
    char *p;
    static char *txPixel;
    SWITCH_STATE = GET_SWITCH_STATE();
    if(SWITCH_STATE==0)
    {
            if(CMD_PL_PS_STREAMER_ASSERT(req+6))
            {
                y++;
    		    if(address > 0x23F47FF)//eof   end of frame if(y > SCREEN_HEIGHT_VERTICAL*SCREEN_WIDTH_HORIZONTAL*2)
    		    {
    		    	y = 0;//reset the line
    		    	address = 0x01000000 + 0x01000000;//sof
    		    	xil_printf("=======================================\n\r");
    		    }
                x++;
                if(x == 241)//value sync for zoom by [1920 /8 = 240]
                {// skiped line address jump 0x7800
                   address = address + 0x7800;//skip lines by [1920 * 16=30720(0x7800)]
                   x=0;
                }else{
                    address = address + 0x10;//2-bytes read per address location 16 bits 2 bytes increment
                }
                if(x < 239){
                    pvideo.pixelvalue = (Xil_In16(address) & 0xffff);//[mpeg444Y 8 bits only] [1byte read in given address][instead Xil_In16 for 2 bytes]
                }
                //duals
                	dataPack(pvideo.pixelvalue & 0x00ff);
                char *json_response = regPack;//pointer of buff_json_response
                len = GENERATE_HTTP_HEADER(buf, "js", strlen(regPack));//header infront of buff_json_response
                p = buf + len;//add buf and buff_json_response lenght size to pointer p char
                strcpy(p, json_response);//copy string to pointer p
                len += strlen(json_response);
            }
    }
    if(SWITCH_STATE==2)
    {          // RX REQUEST
            if(CMD_PL_PS_STREAMER_ASSERT(req+6))
            {
                y++;
            	int i;
                int Ptr;
                static char registerPacket[32];
                static int was[8];
                if(y == 1024){
                	y=0;
                }
      			for(i=0;i<9;i++)
      			{
      				was[i] = y;
      			}
      			sprintf(registerPacket,"%d", was[0]);
                xil_printf("%d\n\r",y);
                int *json_response = registerPacket;
                len = GENERATE_HTTP_HEADER(buf, "js", strlen(registerPacket));//should be since array point brown shit
                p = buf + len;
                strcpy(p, json_response);
                len += strlen(json_response);
            }
    }
    if(SWITCH_STATE==5)
    {          // RX REQUEST
            if(CMD_PL_PS_STREAMER_ASSERT(req+6))
            {
                y++;
    		    if(y == SCREEN_HEIGHT_VERTICAL*SCREEN_WIDTH_HORIZONTAL*2)
    		    {
    		    	y = 0;
    		    	address = XPAR_DDR_MEM_BASEADDR + 0x2000000;
    		    	xil_printf("=======================================\n\r");
    		    }
                pvideo.pixelvalue = (Xil_In16(address) & 0x00ff);//mpeg444Y 8 bits only
                address = address + 0x2;
                unsigned s = pvideo.pixelvalue;
                xil_printf("%d - pixeValue: %d\n\r", y, s);
                static char ress[8];
                sprintf(ress,"%d", s);
                char *json_response = ress;
                len = GENERATE_HTTP_HEADER(buf, "js", strlen(ress));//should be since array point brown shit
                p = buf + len;
                strcpy(p, json_response);
                len += strlen(json_response);
            }
    }
    /* CONTROLLING/OBTAINING/STATUS
       RAW ADC VALUES IN BINARY FORMAT
       SERVER_RESPONSE : CMD_PL_PS_STREAMER_ASSERT
    */
    if(SWITCH_STATE==2)
    {
        if(CMD_PL_PS_STREAMER_ASSERT(req+6))
        {
        unsigned s = rch00signal();
        int n_switches = 21;
        //char *json_response = "PL_PS_STREAMER_ASSERT";
        xil_printf("ADC_DATA: %d\n\r", s);
        len = GENERATE_HTTP_HEADER(buf, "js", n_switches);
        p = buf + len;
        #if 1
            for (n = 0; n < n_switches; n++, p++) {
            *p = '0' + (s & 0x1);
            s >>= 1;
        }
            *p = 0;
            len += n_switches;
        #else
            strcpy(p, json_response);
            len += strlen(json_response);
        #endif
        }
    }
    /* CONTROLLING/OBTAINING/STATUS
       ASSERT LEDS HIGH FROM CLIENT REQUEST
       SERVER_RESPONSE : CMD_PL_PS_STREAMER_LED_ON
    */
    if(CMD_PL_PS_STREAMER_LED_ON(req+6))
    {
        unsigned s = rch00signal();
        *(volatile unsigned int*)LEDS_TOGGLE=0xFF;
        char *json_response = "PL_PS_STREAMER_LED_ON";
        xil_printf("http POST: switch state: %x\n\r", s);
        /* Assert High Freq on SW-1 */
        //WRITE_FREQHIGH_SINE_WAVE();
        WRITE_SW1_SINE_WAVE();
        len = GENERATE_HTTP_HEADER(buf, "js", 21);
        p = buf + len;
        strcpy(p, json_response);
        len += strlen(json_response);
    }
    /* CONTROLLING/OBTAINING/STATUS
       ASSERT LEDS LOW FROM CLIENT REQUEST
       SERVER_RESPONSE : CMD_PL_PS_STREAMER_LED_OFF
    */
    if(CMD_PL_PS_STREAMER_LED_OFF(req+6))
    {
        unsigned s = rch00signal();
        *(volatile unsigned int*)LEDS_TOGGLE=0x0;
        char *json_response = "PL_PS_STREAMER_LED_OFF";
        xil_printf("http POST: switch state: %x\n\r", s);
        /*ASSERT LOW FREQ ON SW-0 */
        //WRITE_FREQLOW_SINE_WAVE();
        /* CONTROLLING/OBTAINING/STATUS
        TOGGLE LEDS FROM CLIENT REQUEST 
        SERVER_RESPONSE : CMD_PL_PS_STREAMER_LED_PAT
        */
        WRITE_SW0_SINE_WAVE();
        len = GENERATE_HTTP_HEADER(buf, "js", 22);
        p = buf + len;
        strcpy(p, json_response);
        len += strlen(json_response);
    }
    /* CONTROLLING/OBTAINING/STATUS
       TOGGLE LEDS FROM CLIENT REQUEST
       SERVER_RESPONSE : CMD_PL_PS_STREAMER_LED_PAT
    */
    if(CMD_PL_PS_STREAMER_LED_PAT(req+6))
    { 
        TOGGLE_TASK();
        char *json_response = "PL_PS_STREAMER_LED_PAT";
        xil_printf("PL_PS_STREAMER_LED_PAT\n\r");
        len = GENERATE_HTTP_HEADER(buf, "js", 22);
        p = buf + len;
        strcpy(p, json_response);
        len += strlen(json_response);
    }
    /* CONTROLLING/OBTAINING/STATUS
       ADD TWO GIVEN VALUES FROM CLIENT
       SERVER_RESPONSE : CMD_PL_LW_FEQ
    */
    if(CMD_PL_LW_FEQ(req+6))
    {
    	char num1[20]="\0";
    	char num2[20]="\0";
        char buf1[1400] __attribute__ ((unused)) __attribute__((optimize("O0")));
        static char temp[20];
        char str[100];
        strcpy(str,req+17);
        UNPACK(str);
        int fl=fk1;
        int fh=fk2;
        WRITE_FREQLOW(fl);//slv_reg2
        WRITE_FREQHIGH(fh);//slv_reg1
        xil_printf("CMD_PL_LW_FEQ =  %d\n\r",fl);
        xil_printf("CMD_PL_HI_FEQ =  %d\n\r",fh);
        xil_printf("-------------------\n\r");
        sprintf(temp,"%d", fl);
        char *json_response = temp;
        len = GENERATE_HTTP_HEADER(buf, "js", strlen(temp));
        p = buf + len;
        strcpy(p, json_response);
        len += strlen(json_response);
        strncpy(num1,"\0",20);
        strncpy(num2,"\0",20);
        strncpy(temp,"\0",20);
        //*(volatile unsigned int*)LEDS_TOGGLE=fh;
    }
    /* CONTROLLING/OBTAINING/STATUS
       ADD TWO GIVEN VALUES FROM CLIENT
       SERVER_RESPONSE : CMD_PS_FP_ADD
    */
    if(CMD_PS_FP_ADD(req+6))
    {
    	char num1[20]="\0";
    	char num2[20]="\0";
        char buf1[1400] __attribute__ ((unused)) __attribute__((optimize("O0")));
        char str[100];
        strcpy(str,req+17);
        CONVERT_CHAR_S(str);
        float add=f1+f2;
        FLOATING_POINT_NUMBER_AFTERPOINT(add, registerPack, 6);
        xil_printf("-------------------\n\r");
        xil_printf("CMD:CMD_PS_FP_ADD\n\r");
        xil_printf("-------------------\n\r");
        xil_printf("Value1 : %f\n\r",f1);
        xil_printf("Value1 : %f\n\r",f2);
        xil_printf("SUM Length : %d\n\r",strlen(registerPack));
        xil_printf("SUM %f\n\r",registerPack);
        char *json_response = registerPack;
        xil_printf("-------------------\n\r");
        len = GENERATE_HTTP_HEADER(buf, "js", strlen(registerPack));
        p = buf + len;
        strcpy(p, json_response);
        len += strlen(json_response);
        strncpy(num1,"\0",20);
        strncpy(num2,"\0",20);
        strncpy(registerPack,"\0",20);
    }
    /* CONTROLLING/OBTAINING/STATUS
       SUBTRACT TWO GIVEN VALUES FROM CLIENT
       SERVER_RESPONSE : CMD_PS_FP_SUB
    */
    if(CMD_PS_FP_SUB(req+6))
    {
    	char num1[20]="\0";
    	char num2[20]="\0";
        int min=0;;
        char tbuf[15],str[100];
        strcpy(str,req+17);
        CONVERT_CHAR_S(str);
        float sub=f1-f2;
        if(sub<0)
        {
            sub=-sub;
            min++;
        }
        FLOATING_POINT_NUMBER_AFTERPOINT(sub, registerPack, 6);
        if(min==1)
        {
            strcpy(tbuf,"-");
            strcat(tbuf,registerPack);
            min=0;
            memset(registerPack, 0, 20);
            strcpy(registerPack,tbuf);
        }
        char *json_response = registerPack;
        xil_printf("-------------------\n\r");
        xil_printf("CMD:CMD_PS_FP_SUB\n\r");
        xil_printf("-------------------\n\r");
        xil_printf("SUB Length : %d\n\r",strlen(registerPack));
        xil_printf("SUB %s\n\r",registerPack);
        len = GENERATE_HTTP_HEADER(buf, "js", strlen(registerPack));
        p = buf + len;
        strcpy(p, json_response);
        len += strlen(json_response);
        strncpy(num1,"\0",20);
        strncpy(num2,"\0",20);
        strncpy(registerPack,"\0",20);
    }
    /* CONTROLLING/OBTAINING/STATUS
       MULTIPLY TWO GIVEN VALUES FROM CLIENT
       SERVER_RESPONSE : CMD_PS_FP_MUL
    */
    if(CMD_PS_FP_MUL(req+6))
    {
    	char num1[20]="\0";
    	char num2[20]="\0";
        char str[100];
        strcpy(str,req+17);
        CONVERT_CHAR_S(str);
        float mul=f1*f2;
        FLOATING_POINT_NUMBER_AFTERPOINT(mul, registerPack, 6);
        char *json_response = registerPack;
        xil_printf("-------------------\n\r");
        xil_printf("CMD:CMD_PS_FP_MUL\n\r");
        xil_printf("-------------------\n\r");
        xil_printf("MUL Length : %d\n\r",strlen(registerPack));
        xil_printf("MUL %s\n\r",registerPack);
        len = GENERATE_HTTP_HEADER(buf, "js", strlen(registerPack));
        p = buf + len;
        strcpy(p, json_response);
        len += strlen(json_response);
        strncpy(num1,"\0",20);
        strncpy(num2,"\0",20);
        strncpy(registerPack,"\0",20);
    }
    /*Assert Error Print When there is a tcp write issue*/
    if (tcp_write(pcb, buf, len, 1) != ERR_OK)
    {
        xil_printf("error writing http POST response to socket\n\r");
        xil_printf("http header = %s\r\n", buf);
        return -1;
    }
    return 0;
}
int DO_HTTP_GET(struct tcp_pcb *pcb, char *req, int rlen)
{
    int BUFSIZE = 1400;
    char filename[MAX_FILENAME];
    unsigned char buf[BUFSIZE];
    signed int fsize, hlen, n;
    int fd;
    char *fext;
    err_t err;
    extract_file_name(filename, req, rlen, MAX_FILENAME);
    if (mfs_exists_file(filename) != 1)
    {
        xil_printf("requested file %s not found, returning 404\r\n", filename);
        DO_404(pcb, req, rlen);
        return -1;
    }
    xil_printf("Initializing DO_HTTP_GET \r\n");
    fext = get_file_extension(filename);
    fd = mfs_file_open(filename, MFS_MODE_READ);
    if (fd == -1)
    {
        platform_init_fs();
        extract_file_name(filename, req, rlen, MAX_FILENAME);
        if (mfs_exists_file(filename) != 1)
        {
            xil_printf("requested file %s not found, returning 404\r\n", filename);
            DO_404(pcb, req, rlen);
            return -1;
        }
        fext = get_file_extension(filename);
        fd = mfs_file_open(filename, MFS_MODE_READ);
        return -1;
    }
    fsize = mfs_file_lseek(fd, 0, MFS_SEEK_END);
    if (fsize == -1)
    {
        xil_printf("\r\nFile Read Error\r\n");
        return -1;
    }
    hlen = GENERATE_HTTP_HEADER((char *)buf, fext, fsize);
    if ((err = tcp_write(pcb, buf, hlen, 3)) != ERR_OK)
    {
        xil_printf("error (%d) writing http header to socket\r\n", err);
        xil_printf("attempted to write #bytes = %d, tcp_sndbuf = %d\r\n", hlen, tcp_sndbuf(pcb));
        xil_printf("http header = %s\r\n", buf);
        return -1;
    }
    tcp_output(pcb);
    while (fsize > 0)
    {
        int sndbuf;
        sndbuf = tcp_sndbuf(pcb);
        if (sndbuf < BUFSIZE)
        {
            http_arg *a = (http_arg *)pcb->callback_arg;
            a->fd = fd;
            a->fsize = fsize;
            return -1;
        }
        n = mfs_file_read(fd, (char *)buf, BUFSIZE);
        if ((err = tcp_write(pcb, buf, n, 3)) != ERR_OK)
        {
            xil_printf("error writing file (%s) to socket, remaining unwritten bytes = %d\r\n",
            filename, fsize - n);
            xil_printf("attempted to lwip_write %d bytes, tcp write error = %d\r\n", n, err);
            break;
        }
        tcp_output(pcb);
        if (fsize >= n)
            fsize -= n;
        else
            fsize = 0;
    }
    mfs_file_close(fd);
    return 0;
}
enum HTTP_REQ_TYPE { HTTP_GET, HTTP_POST, HTTP_UNKNOWN };
enum HTTP_REQ_TYPE decode_http_request(char *req, int l)
{
    char *get_str = "GET";
    char *post_str = "POST";
    if (!strncmp(req, get_str, strlen(get_str)))
    return HTTP_GET;
    if (!strncmp(req, post_str, strlen(post_str)))
    return HTTP_POST;
    return HTTP_UNKNOWN;
}
int GENERATE_RESPONSE(struct tcp_pcb *pcb, char *http_req, int http_req_len)
{
    enum HTTP_REQ_TYPE request_type = decode_http_request(http_req, http_req_len);
    switch(request_type)
    {
        case HTTP_GET:
        return DO_HTTP_GET(pcb, http_req, http_req_len);
        case HTTP_POST:
        return DO_HTTP_POST(pcb, http_req, http_req_len);
        default:
        	HARDWARE_ETHERNETIO_CONTROL(http_req, http_req_len);
        return DO_404(pcb, http_req, http_req_len);
    }
}

#include <stdio.h>
#include <string.h>
#include "webserver.h"
#include "mfs_config.h"
#include "xil_printf.h"
int IS_CMD_LED(char *buf)
{
    buf += 6;
    return (!strncmp(buf, "CMD", 3) && !strncmp(buf + 4, "LEDXHR", 6));
}
int IS_CMD_SWITCH(char *buf)
{
    buf += 6;
    return (!strncmp(buf, "CMD", 3) && !strncmp(buf + 4, "SWITCHXHR", 9));
}
int CMD_PL_PS_STREAMER_LED_ON(char *buf)
{
    return (!strncmp(buf,"CMD",3) && !strncmp(buf + 4,"PL_PS_STREAMER_LED_ON",21));
}
int CMD_PL_PS_STREAMER_LED_PAT(char *buf)
{
    return (!strncmp(buf,"CMD",3) && !strncmp(buf + 4,"PL_PS_STREAMER_LED_PAT",22));
}
int CMD_PL_PS_STREAMER_LED_OFF(char *buf)
{
    return (!strncmp(buf,"CMD",3) && !strncmp(buf + 4,"PL_PS_STREAMER_LED_OFF", 22));
}
int CMD_PS_FP_ADD(char *buf)
{
    return (!strncmp(buf,"CMD",3) && !strncmp(buf + 4,"FP_ADD", 6));
}
int CMD_PL_LW_FEQ(char *buf)
{
    return (!strncmp(buf,"CMD",3) && !strncmp(buf + 4,"LW_FEQ", 6));
}
int CMD_PL_HI_FEQ(char *buf)
{
    return (!strncmp(buf,"CMD",3) && !strncmp(buf + 4,"HI_FEQ", 6));
}
int CMD_PS_FP_SUB(char *buf)
{
    return (!strncmp(buf,"CMD",3) && !strncmp(buf + 4,"FP_SUB", 6));
}
int CMD_PS_FP_MUL(char *buf)
{
    return (!strncmp(buf,"CMD",3) && !strncmp(buf + 4,"FP_MUL", 6));
}
int CMD_PL_PS_STREAMER_ASSERT(char *buf)
{
    return (!strncmp(buf,"CMD",3) && !strncmp(buf + 4,"PL_PS_STREAMER_ASSERT", 21));
}
int CMD_PL_PS_STREAMER_CORE(char *buf)
{
    return (!strncmp(buf,"CMD",3) && !strncmp(buf + 4,"PL_PS_STREAMER_CORE", 19));
}
void extract_file_name(char *filename, char *req, int rlen, int maxlen)
{
    char *fstart, *fend;
    req += strlen("GET ");
    if (*req == '/')
        req++;
        fstart = req;
    while (*req != ' ')
        req++;
        fend = req-1;
    if (fend < fstart)
    {
        strcpy(filename, "index.html");
        return;
    }
    if (fend - fstart > maxlen)
    {
        *fend = 0;
        strcpy(filename, "404.html");
        printf("Request filename is too long\r\n");
        return;
    }
    strncpy(filename, fstart, fend-fstart+1);
    filename[fend-fstart+1] = 0;
    if (*fend == '/')
        strcat(filename, "index.html");
}
char *get_file_extension(char *fname)
{
    char *fext = fname + strlen(fname) - 1;
    while (fext > fname) {
    if (*fext == '.')
        return fext + 1;
    fext--;
    }
    return NULL;
}
int GENERATE_HTTP_HEADER(char *buf, char *fext, int fsize)
{
    char lbuf[40];
    strcpy(buf, "HTTP/1.1 200 OK\r\nContent-Type: ");
    if (fext == NULL)
        strcat(buf, "text/html");
    else if (!strncmp(fext, "htm", 3))
        strcat(buf, "text/html");
    else if (!strncmp(fext, "jpg", 3))
        strcat(buf, "image/jpeg");
    else if (!strncmp(fext, "gif", 3))
        strcat(buf, "image/gif");
    else if (!strncmp(fext, "json", 8))
        strcat(buf, "text/json");
    else if (!strncmp(fext, "js", fsize))
        strcat(buf, "application/javascript");
    else if (!strncmp(fext, "pdf", 2))
        strcat(buf, "application/pdf");
    else if (!strncmp(fext, "css", 2))
        strcat(buf, "text/css");
    else
        strcat(buf, "text/plain");
        strcat(buf, "\r\n");
        sprintf(lbuf, "Content-length: %d", fsize);
        strcat(buf, lbuf);
        strcat(buf, "\r\n");
        strcat(buf, "Connection: close\r\n");
        strcat(buf, "\r\n");
    return strlen(buf);
}
static int p_arg_count = 0;
static http_arg httpArgArray[1000];
static int httpArgArrayIndex = 0;
http_arg *palloc_arg()
{
    http_arg *a;
    a = &(httpArgArray[httpArgArrayIndex]);
    httpArgArrayIndex++;
    if (httpArgArrayIndex == 1000)
    httpArgArrayIndex = 0;
    a->count = p_arg_count++;
    a->fd = -1;
    a->fsize = 0;
    return a;
}
void pfree_arg(http_arg *arg)
{
;
}
void REVERSE(char *str, int len)
{
    int i=0, j=len-1, temp;
    while (i<j)
    {
        temp = str[i];
        str[i] = str[j];
        str[j] = temp;
        i++; j--;
    }
}
int INT_TO_STR(int x, char str[], int d)
{
   int i = 0;
   while (x)
   {
       str[i++] = (x%10) + '0';
       x = x/10;
   }
   while (i < d)
   str[i++] = '0';
   REVERSE(str, i);
   str[i] = '\0';
   return i;
}
void FLOATING_POINT_ASSERT(int n, char *res, int afterpoint)
{
   INT_TO_STR(n, res, 0);
}
void FLOATING_POINT_NUMBER_AFTERPOINT(float n, char *res, int afterpoint)
{
    int ipart = (int)n;
    float fpart = n - (float)ipart;
    int i = INT_TO_STR(ipart, res, 0);
    if (afterpoint != 0)
    {
        res[i] = '.';
        fpart = fpart * 10* 10*afterpoint;
        INT_TO_STR((int)fpart, res + i + 1, afterpoint);
    }
}
float STRING_TO_FLOATING_POINT_NUMBER(const char* s)
{
float rez = 0, fact = 1;
    /* ACTION: - ************************************/
    if (*s == '-')
    {
        s++;
        fact = -1;
    };
    /************************************************/
  int point_seen=0;
  /* AFTER REACTION: . ****************************/
  for (point_seen = 0; *s; s++)
  {
    if (*s == '.')
    {
        point_seen = 1;
        continue;
    };
    int d = *s - '0';
    if (d >= 0 && d <= 9)
    {
        if (point_seen) fact /= 10.0f;
        rez = rez * 10.0f + (float)d;
    };
  };
  /************************************************/
  return rez * fact;
}
int STRING_TO_NUMBERS(const char* s){
int rez = 0, fact = 1;
int point_seen=0;
  /* AFTER REACTION: . ****************************/
  for (point_seen = 0; *s; s++)
  {
        if (*s == '.')
        {
            point_seen = 1;
            continue;
        };
    int d = *s - '0';
    if (d >= 0 && d <= 9)
    {
        rez = rez + (int)d;
    };
  };
  /************************************************/
  return rez * fact;
}
int STRING_TO_NUMBER(const char* s){
    int rez = 0, fact = 1;
        /* ACTION: - ************************************/
        if (*s == '-')
        {
            s++;
            fact = -1;
        };
        /************************************************/
      int point_seen=0;
      /* AFTER REACTION: . ****************************/
      for (point_seen = 0; *s; s++)
      {
        if (*s == '.')
        {
            point_seen = 1;
            continue;
        };
        int d = *s - '0';
        if (d >= 0 && d <= 9)
        {
            rez = rez * 10 + (int)d;
        };
      };
      /************************************************/
      return rez * fact;
}
unsigned volatile char * CONVERT_CHAR_S(char *str)
{
    int i,j,cx=0,cnt=0;
    char num1[20]="\0";
    char num2[20]="\0";
    for(i=0;str[i];i++)
    {
        if(str[i]=='/')
        {
            for(j=i+1;str[j];j++)
            {
                num2[cx]=str[j];
                cx++;
                if(str[j]==' ')
                {
                    cx=1;
                    break;
                }
            }
            cnt++;
        }
        if(cnt>=1)
        {
            break;
        }
        num1[i]=str[i];
    }
f1=STRING_TO_FLOATING_POINT_NUMBER(num1);
f2=STRING_TO_FLOATING_POINT_NUMBER(num2);
}
unsigned volatile char * UNPACK(char *str)
{
    int i,j,cx=0,cnt=0;
    char num1[20]="\0";
    char num2[20]="\0";
    for(i=0;str[i];i++)
    {
        if(str[i]=='/')
        {
            for(j=i+1;str[j];j++)
            {
                num2[cx]=str[j];
                cx++;
                if(str[j]==' ')
                {
                    cx=1;
                    break;
                }
            }
            cnt++;
        }
        if(cnt>=1)
        {
            break;
        }
        num1[i]=str[i];
    }
fk1=STRING_TO_NUMBER(num1);
fk2=STRING_TO_NUMBER(num2);
}
void DUMP_PAYLOAD(char *p, int len)
{
    int i, j;
    for (i = 0; i < len; i+=16)
    {
        for (j = 0; j < 16; j++)
        xil_printf("%c ", p[i+j]);
        xil_printf("%d ", p[i+j]);
        xil_printf("%d ", p[i]);
        xil_printf("%d ", p[j]);
        xil_printf("\r\n");
    }

    xil_printf("total len = %d\r\n", len);

    //d5m();

}
int platform_init_fs()
{
	mfs_init_fs(MFS_NUMBYTES, (char *)(MFS_BASE_ADDRESS+4), MFS_INIT_TYPE);
	if (mfs_exists_file("index.html") == 0) {
		xil_printf("%s: ERROR: unable to locate index.html in MFS\r\n", __FUNCTION__);
		xil_printf("One of your applications requires a Memory File System to be loaded.\r\n");
                xil_printf("Please check if MFS has been loaded, "
				"and it has index.html file in root directory\r\n");
		return -1;
	}
	return 0;
}

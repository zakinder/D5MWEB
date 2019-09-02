#ifndef __TFTP_UTILS_H_
#define __TFTP_UTILS_H_
#include "tftpserver.h"
tftp_opcode tftp_decode_op(char *buf);
void tftp_extract_filename(char *fname, char *buf);
u16_t tftp_extract_block(char *buf);
void tftp_set_opcode(char *buf, tftp_opcode op);
void tftp_set_errorcode(char *buf, tftp_errorcode err);
void tftp_set_errormsg(char *buf, char *errormsg);
int tftp_is_correct_ack(char *buf, int block);
void tftp_set_data_message(char *packet, char *buf, int n);
void tftp_set_block(char *packet, int block);
#endif

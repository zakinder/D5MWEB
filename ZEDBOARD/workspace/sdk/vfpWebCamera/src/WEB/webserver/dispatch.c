#include "webserver.h"

void print_echo_app_header();
void print_rxperf_app_header();
void print_txperf_app_header();
void print_tftp_app_header();
void print_web_app_header();
void print_utxperf_app_header();
void print_urxperf_app_header();
void start_echo_application();
void start_rxperf_application();
void start_txperf_application();
void start_tftp_application();
void start_utxperf_application();
void start_urxperf_application();
void print_urxperf_app_header();
void transfer_echo_data();
void transfer_rxperf_data();
void transfer_txperf_data();
void transfer_tftp_data();
void transfer_web_data();
void transfer_utxperf_data();
void transfer_urxperf_data();
void print_headers()
{
    xil_printf("\r\n");
    xil_printf("%20s %6s %s\r\n", "Server", "Port", "Connect With..");
    xil_printf("%20s %6s %s\r\n", "--------------------", "------", "--------------------");
    if (INCLUDE_ECHO_SERVER)
        print_echo_app_header();
    if (INCLUDE_RXPERF_SERVER)
        print_rxperf_app_header();
    if (INCLUDE_TXPERF_CLIENT)
        print_txperf_app_header();
    if (INCLUDE_TFTP_SERVER)
        print_tftp_app_header();
    if (INCLUDE_WEB_SERVER)
        print_web_app_header();
    if (INCLUDE_TXUPERF_CLIENT)
    	print_utxperf_app_header();
    if (INCLUDE_RXUPERF_CLIENT)
    	print_urxperf_app_header();
    xil_printf("\r\n");
}
void start_applications()
{
    if (INCLUDE_ECHO_SERVER)
        start_echo_application();
    if (INCLUDE_RXPERF_SERVER)
        start_rxperf_application();
    if (INCLUDE_TXPERF_CLIENT)
        start_txperf_application();
    if (INCLUDE_TFTP_SERVER)
        start_tftp_application();
    if (INCLUDE_WEB_SERVER)
        start_web_application();
    if (INCLUDE_TXUPERF_CLIENT)
    	start_utxperf_application();
    if (INCLUDE_RXUPERF_CLIENT)
    	start_urxperf_application();
}
void transfer_data()
{
	if (INCLUDE_ECHO_SERVER)
        transfer_echo_data();
    if (INCLUDE_RXPERF_SERVER)
        transfer_rxperf_data();
    if (INCLUDE_TXPERF_CLIENT)
        transfer_txperf_data();
    if (INCLUDE_TFTP_SERVER)
        transfer_tftp_data();
    if (INCLUDE_WEB_SERVER)
        transfer_web_data();
    if (INCLUDE_TXUPERF_CLIENT)
    	transfer_utxperf_data();
    if (INCLUDE_RXUPERF_CLIENT)
    	transfer_urxperf_data();
}

// LAST TESTED : 04/15/2019
#include "menu_calls.h"
#include <stdio.h>
#include <xil_io.h>
#include "../HDMI_DISPLAY/hdmi_display.h"
#include "../I2C_D5M/i2c_d5m.h"
#include "../UART/uartio.h"
#include "../UART/utilities.h"
#include "../VIDEO_CHANNEL/channel.h"
hdmi_display_start pvideo;
d5m_rreg d5m_rreg_ptr;
void menu_calls(ON_OFF) {
    int menu_calls_enable = ON_OFF;
    unsigned int uart_io;
    u32 current_state = mainmenu;
    int ret;
    u32 cmd_status_value;
    u32 cmd_status_substate;
    u32 address;
    u32 value;
    u32 temp1Register;
    u32 temp2Register;
    u32 w_rh;
    u32 w_rl;
    u32 w_gh;
    u32 w_gl;
    u32 w_bh;
    u32 w_bl;
    u32 th_set;
    int i;
    u32 system_time;
    while (menu_calls_enable == TRUE)
    {
        switch (current_state)
        {
        case mainmenu:
            temp1Register =0x00000000;
            temp2Register =0x00000000;
            //exposerCompansate();
            cmds_menu();
            current_state = menu_select;
            break;
        case menu_select:
            uart_io = uart_prompt_io();
            if (uart_io == 0) {
                uart_Red_Text();
                printf("Unknown command entered %x\r\n",(unsigned) uart_io);
                printf("\r>>");
                uart_Default_Text();
                break;
            } else {
                uart_Default_Text();
                current_state = uart_io;
                break;
            }
            break;
        case clear:
            /*****************************************************************************************************************/
            menu_cls();
            current_state = mainmenu;break;
        case xbright:
            /*****************************************************************************************************************/
        	computeBrightness();
        	printf("Compute Brightness[%i]\n", (unsigned)pvideo.brightness);
            cmd_status_substate = enter_value_or_quit("xbright",xbright);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case genimage:
            /*****************************************************************************************************************/
            buffer_vdma_hdmi(&pvideo);
            cmd_status_substate = enter_value_or_quit("genimage",genimage);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case zoom:
            /*****************************************************************************************************************/
            d5m_config3();
            camerarUpdate();
            cmd_status_substate = enter_value_or_quit("zoom",zoom);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case cmds_exposer:
            /*****************************************************************************************************************/
            cmd_status_value = enter_value_or_quit("null",cmds_exposer);camera_exposer(cmd_status_value);
            cmd_status_substate = enter_value_or_quit("cmds_exposer",cmds_exposer);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case d5m_testpattern:
            /*****************************************************************************************************************/
            cmd_status_value = enter_value_or_quit("null",d5m_testpattern);d5mtestpattern(cmd_status_value);
            cmd_status_substate = enter_value_or_quit("d5m_testpattern",d5m_testpattern);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case d5m_colorgain:
            /*****************************************************************************************************************/
            d5mcolorgain();
            cmd_status_substate = enter_value_or_quit("d5m_colorgain",d5m_colorgain);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case cmds_readexposer:
            /*****************************************************************************************************************/
            read_exposer_register();
            cmd_status_substate = enter_value_or_quit("cmds_readexposer",cmds_readexposer);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case cmds_readd5m:
            /*****************************************************************************************************************/
            camera_set_registers();
            cmd_status_substate = enter_value_or_quit("cmds_readd5m",cmds_readd5m);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case cmds_displaytype:
            /*****************************************************************************************************************/
            cmd_status_value = enter_value_or_quit("null",cmds_displaytype);
            D5M_mWriteReg(D5M_BASE,w_videochannel_reg_5,cmd_status_value);
            cmd_status_substate = enter_value_or_quit("cmds_displaytype",cmds_displaytype);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case colorbars:
            /*****************************************************************************************************************/
            colorBars_vdma_hdmi(&pvideo);
            cmd_status_substate = enter_value_or_quit("colorbars",colorbars);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case rgb:
            /*****************************************************************************************************************/
        	videoFeatureSelect(7);
            cmd_status_substate = enter_value_or_quit("rgb",rgb);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case sharp:
            /*****************************************************************************************************************/
        	videoFeatureSelect(4);
            cmd_status_substate = enter_value_or_quit("sharp",sharp);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case blur:
            /*****************************************************************************************************************/
        	videoFeatureSelect(5);
            cmd_status_substate = enter_value_or_quit("blur",blur);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case hsv:
            /*****************************************************************************************************************/
        	sd_card();
        	videoFeatureSelect(6);
            cmd_status_substate = enter_value_or_quit("hsv",hsv);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
            /*****************************************************************************************************************/
        case parttern1:
            /*****************************************************************************************************************/
        	videoFeatureSelect(8);
            cmd_status_substate = enter_value_or_quit("parttern1",parttern1);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case parttern2:
            /*****************************************************************************************************************/
        	videoFeatureSelect(9);
            cmd_status_substate = enter_value_or_quit("parttern2",parttern2);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case parttern3:
            /*****************************************************************************************************************/
        	videoFeatureSelect(10);
            cmd_status_substate = enter_value_or_quit("parttern3",parttern3);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case parttern4:
            /*****************************************************************************************************************/
        	videoFeatureSelect(11);
            cmd_status_substate = enter_value_or_quit("parttern4",parttern4);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        //case parttern5:
            /*****************************************************************************************************************/
        	//videoFeatureSelect(12);
            //cmd_status_substate = enter_value_or_quit("parttern5",parttern5);current_state = cmd_status_substate;break;
        case cmds_printpixel:
            /*****************************************************************************************************************/
            printf("Enter row Address\n");
            menu_print_prompt();
            temp1Register = uart_prompt_io();
            printf("Enter coloum Address\n");
            menu_print_prompt();
            temp2Register = uart_prompt_io();
            uart_io = 1;
            int offset;
            u32 address = pvideo.video_address;
            if (uart_io == 1)
            {
            	int x,y;
                for ( y = 0; y < temp1Register; y++ )
                {
                   for ( x = 0; x < temp2Register*2; x++)
                   {
           				pvideo.pixelvalue = (Xil_In16(address) & 0xffff);
                    printf("address[%x]=%i\n",(unsigned) address,(unsigned) pvideo.pixelvalue);
                      address = address + 0x2;
                   }
                }
            }
            cmd_status_substate = enter_value_or_quit("cmds_printpixel",cmds_printpixel);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case cmds_gridpoint:
            /*****************************************************************************************************************/
            printf("Enter x,y location point\n");
            menu_print_prompt();
            value = uart_prompt_io();
            point_Interest(value);
            fifoStatus();
            readFifo();
            printf("Done with readFifo\n");
            current_state = mainmenu;
            break;
            /*****************************************************************************************************************/
        case cmds_griddelta:
            /*****************************************************************************************************************/
            printf("Enter x,y location point\n");
            menu_print_prompt();
            value = uart_prompt_io();
            point_Interest(value);
            fifoStatus();
            readFifov2();
            printf("Done with readFifov2\n");
            current_state = mainmenu;
            break;
            /*****************************************************************************************************************/
        case cmds_fifomode:
            /*****************************************************************************************************************/
            fifoStatus();
            printf("Enter '1' enableNextRead\n");
            menu_print_prompt();
            value = uart_prompt_io();
            enableNextRead(value);
            current_state = mainmenu;
            break;
            /*****************************************************************************************************************/
        case parttern5: // need to be decoded at terminal for colorgain*** and replace back to parttern5
            /*****************************************************************************************************************/
            printf("Enter Coef location[1-9] and 0 to quit\n");
            printf("\r>>");
            uart_io = uart_prompt_io();
            if (uart_io != 0) {
                if (uart_io == 1) {
                	printf("colorFilterA11 Gain Value\n");
                    menu_print_prompt();
                    value = uart_prompt_io();
                	colorFilterA11(value);
                    break;
                }
                if (uart_io == 2) {
                	printf("colorFilterA12 Gain Value\n");
                    menu_print_prompt();
                    value = uart_prompt_io();
                	colorFilterA12(value);
                    break;
                }
                if (uart_io == 3) {
                	printf("colorFilterA13 Gain Value\n");
                    menu_print_prompt();
                    value = uart_prompt_io();
                	colorFilterA13(value);
                    break;
                }
                if (uart_io == 4) {
                	printf("colorFilterA21 Gain Value\n");
                    menu_print_prompt();
                    value = uart_prompt_io();
                	colorFilterA21(value);
                    break;
                }
                if (uart_io == 5) {
                	printf("colorFilterA22 Gain Value\n");
                    menu_print_prompt();
                    value = uart_prompt_io();
                	colorFilterA22(value);
                    break;
                }
                if (uart_io == 6) {
                	printf("colorFilterA23 Gain Value\n");
                    menu_print_prompt();
                    value = uart_prompt_io();
                	colorFilterA23(value);
                    break;
                }
                if (uart_io == 7) {
                	printf("colorFilterA31 Gain Value\n");
                    menu_print_prompt();
                    value = uart_prompt_io();
                	colorFilterA31(value);
                    break;
                }
                if (uart_io == 8) {
                	printf("colorFilterA32 Gain Value\n");
                    menu_print_prompt();
                    value = uart_prompt_io();
                	colorFilterA32(value);
                    break;
                }
                if (uart_io == 9) {
                	printf("colorFilterA33 Gain Value\n");
                    menu_print_prompt();
                    value = uart_prompt_io();
                	colorFilterA33(value);
                    break;
                }
            }else {current_state = mainmenu;break;}
            /*****************************************************************************************************************/
        case cmds_readfifo:
            /*****************************************************************************************************************/
        	fifoStatus();
            printf("Enter gridlock 0 is disable else enable\n");
            menu_print_prompt();
            value = uart_prompt_io();
            gridlock(value);
            printf("Enter cpuackgoagain 0 is disable else enable\n");
            menu_print_prompt();
            value = uart_prompt_io();
            cpuackgoagain(value);
        	fifoStatus();
            printf("Enter cpuGridCont value for all read cmds_readfifo\n");
            menu_print_prompt();
            value = uart_prompt_io();
            for (i = 0; i < value; i++)
            {
            	ReadDataByte(i);
            }
            cmd_status_substate = enter_value_or_quit("cmds_readfifo",cmds_readfifo);current_state = cmd_status_substate;break;
//        case cmds_readfifo:
//            /*****************************************************************************************************************/
//        	//frameReadData();
//            printf("keyArrowSelect test\n");
//            keyArrowSelect();
//            cmd_status_substate = enter_value_or_quit("cmds_readfifo",cmds_readfifo);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case vga:
            /*****************************************************************************************************************/
            d5m_config2();
            camerarUpdate();
        	cmd_status_substate = enter_value_or_quit("vga",vga);current_state = cmd_status_substate;break;
        case cmds_updated5m:
            /*****************************************************************************************************************/
            D5mReg(&d5m_rreg_ptr);
            cameraread(&d5m_rreg_ptr);
            printf("CMD\n");
            printf("updated5m\n");
            printf("Enter Address and Value\n");
            menu_print_prompt();
            address = uart_prompt_io();
            if (address == cmds_quit || address == 0) {current_state = mainmenu;break;}
            menu_print_prompt();
            value = uart_prompt_io();
            if (value == cmds_quit || address == 0) {current_state = mainmenu;break;}
            printf("address[%x],value[%x]\n",(unsigned) address,(unsigned) value);
            printf("Confirm Enter To Send Else Quit\n");
            printf("\r>>");
            uart_io = uart_prompt_io();
            if (uart_io == 0)
            {
                ret = img_write_register(address,value);
                if (!ret)
                {printf("ERROR : XST_FAILURE: %d\n" ,ret);}
                camerarUpdate();
                break;
            }else {current_state = mainmenu;break;}
            /*****************************************************************************************************************/
        case cmds_configd5m:
            /*****************************************************************************************************************/
            printf("Config Num\n");
            printf("Enter 1 for Config1\n");
            printf("Enter 2 for Config2 VGA_640x480p60\n");
            printf("Enter 3 for Config3 VGA_640x480p60 iZOOM_MODE\n");
            menu_print_prompt();
            value = uart_prompt_io();
            if (value == cmds_quit) {current_state = mainmenu;break;}
            printf("Config Value[%d]\n",(unsigned) value);
            printf("Confirm Enter To Send Else Quit\n");
            printf("\r>>");
            uart_io = uart_prompt_io();
            if (uart_io == 0) {
                if (value == 1) {
                    d5m_config1();
                    camerarUpdate();
                    break;
                }
                if (value == 2) {
                    d5m_config2();
                    camerarUpdate();
                    break;
                }
                if (value == 3) {
                    d5m_config3();
                    camerarUpdate();
                    break;
                }
            }else {current_state = mainmenu;break;}
            /*****************************************************************************************************************/
            /*****************************************************************************************************************/
        case hdmi:
            /*****************************************************************************************************************/
            printf("Current State : camera_exposer\n");
            camera_hdmi_config();
            current_state = mainmenu;
            break;
            /*****************************************************************************************************************/
        case fullhdmi:
            /*****************************************************************************************************************/
            printf("Current State : camera_exposer\n");
            camera_set_registers();
            current_state = mainmenu;
            break;
            /*****************************************************************************************************************/
        case cmds_videochannel:
            /*****************************************************************************************************************/
            printf("Enter edgeType Value\n");
            printf("1-sobel 2-prewitt\n");
            menu_print_prompt();
            temp1Register = uart_prompt_io();
            if (temp1Register == clear) {
            	current_state = mainmenu;
                break;}
        	edgeType(temp1Register);
            /*****************************************************************************************************************/
            printf("Enter edgeThreshold Value\n");
            menu_print_prompt();
            temp1Register = uart_prompt_io();
            if (temp1Register == clear) {
            	current_state = mainmenu;
                break;}
        	edgeThreshold(temp1Register);
            /*****************************************************************************************************************/
            printf("Enter ycbcrSelect Value\n");
            menu_print_prompt();
            temp1Register = uart_prompt_io();
            if (temp1Register == clear) {
            	current_state = mainmenu;
                break;}
        	ycbcrSelect(temp1Register);
            /*****************************************************************************************************************/
            printf("Enter color_correction Value\n");
            menu_print_prompt();
            temp1Register = uart_prompt_io();
            if (temp1Register == clear) {
            	current_state = mainmenu;
                break;}
        	color_correction(temp1Register);
            /*****************************************************************************************************************/
            printf("Enter videoType Value\n");
            menu_print_prompt();
            temp2Register = uart_prompt_io();
            if (temp2Register == clear) {
            	current_state = mainmenu;
                break;}else{
            	videoFeatureSelect(temp2Register);
            	current_state = cmds_videochannel;break;}
            /*****************************************************************************************************************/
        case coord:
            /*****************************************************************************************************************/
            printf("Enter w_rh value\n");
            menu_print_prompt();
            w_rh = uart_prompt_io();
            printf("Enter w_rl value\n");
            menu_print_prompt();
            w_rl = uart_prompt_io();
            printf("Enter w_gh value\n");
            menu_print_prompt();
            w_gh = uart_prompt_io();
            printf("Enter w_gl value\n");
            menu_print_prompt();
            w_gl = uart_prompt_io();
            printf("Enter w_bh value\n");
            menu_print_prompt();
            w_bh = uart_prompt_io();
            printf("Enter w_bl value\n");
            menu_print_prompt();
            w_bl = uart_prompt_io();
        	D5M_mWriteReg(D5M_BASE,w_rh_reg_50,w_rh);
        	D5M_mWriteReg(D5M_BASE,w_rl_reg_51,w_rl);
        	D5M_mWriteReg(D5M_BASE,w_gh_reg_52,w_gh);
        	D5M_mWriteReg(D5M_BASE,w_gl_reg_53,w_gl);
        	D5M_mWriteReg(D5M_BASE,w_bh_reg_54,w_bh);
        	D5M_mWriteReg(D5M_BASE,w_bl_reg_55,w_bl);
            cmd_status_substate = enter_value_or_quit("coord",coord);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case threshold:
            /*****************************************************************************************************************/
        	th_set = 0x00000000;
        	cmd_status_value = 0x00000000;
            printf("Current State : threshold\n");
            cmd_status_value = enter_value_or_quit("null",threshold);
            th_set  = (((cmd_status_value & 0x000000ff)<<16) | 0x0000E61E);
            D5M_mWriteReg(D5M_BASE,w_threshold_reg_4,th_set);
            printf("th_set1[%x]\n",(unsigned) th_set);
            printf("th_set2[%x]\n",(unsigned) ((th_set & 0xffff0000)>>16));
            cmd_status_substate = enter_value_or_quit("threshold",threshold);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case timex:
            /*****************************************************************************************************************/
            pvideo.sec = D5M_mReadReg(D5M_BASE,r_sec_reg_60);
            pvideo.min = D5M_mReadReg(D5M_BASE,r_min_reg_61);
            pvideo.hr  = D5M_mReadReg(D5M_BASE,r_hour_reg_62);
            printf("%d:%d:%d\n\r",(unsigned) pvideo.hr,(unsigned) pvideo.min,(unsigned) pvideo.sec);
            system_time=(((0x0000ff& D5M_mReadReg(D5M_BASE,r_hour_reg_62))<<16)|((D5M_mReadReg(D5M_BASE,r_min_reg_61) & 0x0000ff)<<8)|(0x0000ff & D5M_mReadReg(D5M_BASE,r_sec_reg_60)));
            pvideo.time = (((0x0000ff& D5M_mReadReg(D5M_BASE,r_hour_reg_62))<<16)|((D5M_mReadReg(D5M_BASE,r_min_reg_61) & 0x0000ff)<<8)|(0x0000ff & D5M_mReadReg(D5M_BASE,r_sec_reg_60)));
            uart_Yellow_Text();
            uart_Default_Text();
            cmd_status_substate = enter_value_or_quit("timex",timex);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case quit:
        	menu_calls_enable = FALSE;
            break;
        case cmds_uart:
            uartvalue();
            current_state =uartcmd(mainmenu,cmds_uart);
            break;
        default:
            printf("\r\n");
            current_state = mainmenu;
            break;
        }
    }
    printf("Break\r\n");
    menu_calls_enable = TRUE;
}

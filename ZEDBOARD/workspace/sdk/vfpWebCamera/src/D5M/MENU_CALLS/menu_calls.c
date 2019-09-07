// LAST TESTED : 09/01/2019
#include "menu_calls.h"
#include <stdio.h>
#include <xil_io.h>
#include <xil_types.h>
#include "../HDMI_DISPLAY/hdmi_display.h"
#include "../I2C_D5M/i2c_d5m.h"
#include "../SYSTEM_CONFIG_HEADER/system_config_header.h"
#include "../SYSTEM_CONFIG_HEADER/system_config_defines.h"
#include "../UART/uartio.h"
#include "../VIDEO_CHANNEL/channel.h"
d5m_rreg d5m_rreg_ptr;
//unused functions
//sd_card();
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
    u32 t1Register;
    u32 t2Register;
    u32 t3Register;
    u32 t4Register;
    u32 t5Register;
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
            temp1Register = 0x00000000;
            temp2Register = 0x00000000;
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
            /*****************************************************************************************************************/
            /*****************************************************************************************************************/
            /*****************************************************************************************************************/
            /*****************************************************************************************************************/
            /*****************************************************************************************************************/
            //                                                  videoFeatureSelect
            /*****************************************************************************************************************/
        case video0://SOBLE
            /*****************************************************************************************************************/
        	videoFeatureSelect(selCgain);
            cmd_status_substate = enter_value_or_quit("video2",video2);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case video1://SOBLE
            /*****************************************************************************************************************/
        	videoFeatureSelect(selSharp);
            cmd_status_substate = enter_value_or_quit("video2",video2);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case video2://RGB RANGE DETECT TO SOBLE
            /*****************************************************************************************************************/
        	videoFeatureSelect(selBlur);
            cmd_status_substate = enter_value_or_quit("video3",video3);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case video3://POI RANGE TO SOBLE
            /*****************************************************************************************************************/
        	videoFeatureSelect(selHsl);
            cmd_status_substate = enter_value_or_quit("video4",video4);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case video4://BLUR 1X
            /*****************************************************************************************************************/
        	videoFeatureSelect(selHsv);
            cmd_status_substate = enter_value_or_quit("video5",video5);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case video5://BLUR 2X
            /*****************************************************************************************************************/
        	videoFeatureSelect(selRgb);
            cmd_status_substate = enter_value_or_quit("video6",video6);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case video6://SOBLE
            /*****************************************************************************************************************/
            printf("Enter edgeThreshold Value\n");
            menu_print_prompt();
            t2Register = uart_prompt_io();
            if (t2Register == clear) {
            	current_state = mainmenu;
                break;}
            edgeThresholdVal(t2Register);
            printf("Enter edgeColor 1-Enable Else Disabled\n");
            menu_print_prompt();
            t3Register = uart_prompt_io();
            if (t3Register == clear) {
            	current_state = mainmenu;
                break;}
            edgeColor(t3Register);
        	videoFeatureSelect(selSoble);
            cmd_status_substate = enter_value_or_quit("video1",video1);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case video7://BLUR 3X
            /*****************************************************************************************************************/
        	videoFeatureSelect(selEmboss);
            cmd_status_substate = enter_value_or_quit("video7",video7);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case video8://BLUR 4X
            /*****************************************************************************************************************/
        	videoFeatureSelect(selBlur4x);
            cmd_status_substate = enter_value_or_quit("video8",video8);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case video9://HSV
            /*****************************************************************************************************************/
        	videoFeatureSelect(selHsv);
            cmd_status_substate = enter_value_or_quit("video9",video9);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case video10://RGB
            /*****************************************************************************************************************/
        	videoFeatureSelect(selRgb);
            cmd_status_substate = enter_value_or_quit("video10",video10);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case video11://RGB RANGE
            /*****************************************************************************************************************/
        	videoFeatureSelect(selRgbRemix);
            cmd_status_substate = enter_value_or_quit("video11",video11);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case video12:
            /*****************************************************************************************************************/
        	videoFeatureSelect(selTPatter1);
            cmd_status_substate = enter_value_or_quit("video12",video12);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case video13:
            /*****************************************************************************************************************/
        	videoFeatureSelect(selTPatter2);
            cmd_status_substate = enter_value_or_quit("video13",video13);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case video14:
            /*****************************************************************************************************************/
        	videoFeatureSelect(selTPatter3);
            cmd_status_substate = enter_value_or_quit("video14",video14);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case video15:
            /*****************************************************************************************************************/
        	videoFeatureSelect(selTPatter4);
            cmd_status_substate = enter_value_or_quit("video15",video15);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case video16:
            /*****************************************************************************************************************/
        	videoFeatureSelect(selTPatter5);
            cmd_status_substate = enter_value_or_quit("video16",video16);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case video17://COLOR CORRECTION
            /*****************************************************************************************************************/
        	videoFeatureSelect(selRgbCorrect);
            cmd_status_substate = enter_value_or_quit("video17",video17);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case video18://HSL
            /*****************************************************************************************************************/
        	videoFeatureSelect(selHsl);
            cmd_status_substate = enter_value_or_quit("video18",video18);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case video19://HSV
            /*****************************************************************************************************************/
        	videoFeatureSelect(selHsvCcBl);
            cmd_status_substate = enter_value_or_quit("video19",video19);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case video20://COLOR TRM
            /*****************************************************************************************************************/
        	videoFeatureSelect(selColorTrm);
            cmd_status_substate = enter_value_or_quit("video20",video20);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case video21://COLOR LMP
            /*****************************************************************************************************************/
        	videoFeatureSelect(selColorLmp);
            cmd_status_substate = enter_value_or_quit("video21",video21);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case ycbcrenable:
            /*****************************************************************************************************************/
            ycbcr_Enable();
            cmd_status_substate = enter_value_or_quit("ycbcrenable",ycbcrenable);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case ycbcrdisable:
            /*****************************************************************************************************************/
            ycbcr_Disable();
            cmd_status_substate = enter_value_or_quit("ycbcrdisable",ycbcrdisable);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
            /*****************************************************************************************************************/
            /*****************************************************************************************************************/
            // WRITE KERNEL COEFs
            /*****************************************************************************************************************/
        case wsobel:
            /*****************************************************************************************************************/
            SobelCoefsUpdate();
        	videoFeatureSelect(selSoble);
            cmd_status_substate = enter_value_or_quit("wsobel",wsobel);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case wprewit:
            /*****************************************************************************************************************/
            PrewitCoefsUpdate();
        	videoFeatureSelect(selSoble);
            cmd_status_substate = enter_value_or_quit("wprewit",wprewit);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case wsharp:
            /*****************************************************************************************************************/
            SharpCoef();
        	videoFeatureSelect(selSharp);
            cmd_status_substate = enter_value_or_quit("wsharp",wsharp);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case wemboss:
            /*****************************************************************************************************************/
            EmbosCoef();
        	videoFeatureSelect(selSharp);
            cmd_status_substate = enter_value_or_quit("wemboss",wemboss);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case wblur:
            /*****************************************************************************************************************/
            BlureCoef();
        	videoFeatureSelect(selSharp);//Note:selBlur
            cmd_status_substate = enter_value_or_quit("wblur",wblur);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case wcgain1:
            /*****************************************************************************************************************/
        	Cgain1Coef();
        	videoFeatureSelect(selCgain);
            cmd_status_substate = enter_value_or_quit("wcgain1",wcgain1);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case wcgain2:
            /*****************************************************************************************************************/
        	Cgain2Coef();
        	videoFeatureSelect(selCgain);
            cmd_status_substate = enter_value_or_quit("wcgain2",wcgain2);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case wcgain3:
            /*****************************************************************************************************************/
        	Cgain3Coef();
        	videoFeatureSelect(selCgain);
            cmd_status_substate = enter_value_or_quit("wcgain3",wcgain3);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case wcgain4:
            /*****************************************************************************************************************/
        	Cgain4Coef();
        	videoFeatureSelect(selCgain);
            cmd_status_substate = enter_value_or_quit("wcgain4",wcgain4);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case wcgain5:
            /*****************************************************************************************************************/
        	Cgain5Coef();
        	videoFeatureSelect(selCgain);
            cmd_status_substate = enter_value_or_quit("wcgain5",wcgain5);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case wcgain6:
            /*****************************************************************************************************************/
        	Cgain6Coef();
        	videoFeatureSelect(selCgain);
            cmd_status_substate = enter_value_or_quit("wcgain6",wcgain6);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case wcgain7:
            /*****************************************************************************************************************/
        	Cgain7Coef();
        	videoFeatureSelect(selCgain);
            cmd_status_substate = enter_value_or_quit("wcgain7",wcgain7);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
            /*****************************************************************************************************************/
            // CHECK FILTER
            /*****************************************************************************************************************/
        case sobel:
            /*****************************************************************************************************************/
        	videoFeatureSelect(selSoble);
            cmd_status_substate = enter_value_or_quit("sobel",sobel);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case rgb:
            /*****************************************************************************************************************/
        	videoFeatureSelect(selRgb);
            cmd_status_substate = enter_value_or_quit("rgb",rgb);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case sharp:
            /*****************************************************************************************************************/
        	videoFeatureSelect(selSharp);
            cmd_status_substate = enter_value_or_quit("sharp",sharp);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case blur:
            /*****************************************************************************************************************/
        	videoFeatureSelect(selBlur);
            cmd_status_substate = enter_value_or_quit("blur",blur);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case emboss:
            /*****************************************************************************************************************/
        	videoFeatureSelect(selEmboss);
            cmd_status_substate = enter_value_or_quit("emboss",emboss);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case hsv:
            /*****************************************************************************************************************/
        	videoFeatureSelect(selHsv);
            cmd_status_substate = enter_value_or_quit("hsv",hsv);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case hsl:
            /*****************************************************************************************************************/
        	videoFeatureSelect(selHsl);
            cmd_status_substate = enter_value_or_quit("hsl",hsl);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case rgbremix:
            /*****************************************************************************************************************/
        	videoFeatureSelect(selRgbRemix);
            cmd_status_substate = enter_value_or_quit("rgbremix",rgbremix);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case rgbdetect:
            /*****************************************************************************************************************/
        	videoFeatureSelect(selRgbDetect);
            cmd_status_substate = enter_value_or_quit("rgbdetect",rgbdetect);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case rgbpoi:
            /*****************************************************************************************************************/
        	videoFeatureSelect(selRgbPoi);
            cmd_status_substate = enter_value_or_quit("rgbpoi",rgbpoi);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case ycbcr:
            /*****************************************************************************************************************/
        	videoFeatureSelect(selYcbcr);
            cmd_status_substate = enter_value_or_quit("hsl",hsl);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case cgain:
            /*****************************************************************************************************************/
        	videoFeatureSelect(selCgain);
            cmd_status_substate = enter_value_or_quit("cgain",cgain);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
            /*****************************************************************************************************************/
        case parttern1:
            /*****************************************************************************************************************/
        	videoFeatureSelect(selTPatter1);
            cmd_status_substate = enter_value_or_quit("parttern1",parttern1);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case parttern2:
            /*****************************************************************************************************************/
        	videoFeatureSelect(selTPatter2);
            cmd_status_substate = enter_value_or_quit("parttern2",parttern2);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case parttern3:
            /*****************************************************************************************************************/
        	videoFeatureSelect(selTPatter3);
            cmd_status_substate = enter_value_or_quit("parttern3",parttern3);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case parttern4:
            /*****************************************************************************************************************/
        	videoFeatureSelect(selTPatter4);
            cmd_status_substate = enter_value_or_quit("parttern4",parttern4);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case blur1x:
            /*****************************************************************************************************************/
        	videoFeatureSelect(wBlurv1);
            cmd_status_substate = enter_value_or_quit("blur1x",blur1x);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case blur2x:
            /*****************************************************************************************************************/
        	videoFeatureSelect(wBlurv2);
            cmd_status_substate = enter_value_or_quit("blur2x",blur2x);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case blur3x:
            /*****************************************************************************************************************/
        	videoFeatureSelect(wBlurv3);
            cmd_status_substate = enter_value_or_quit("blur3x",blur3x);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case blur4x:
            /*****************************************************************************************************************/
        	videoFeatureSelect(wBlurv4);
            cmd_status_substate = enter_value_or_quit("blur4x",blur4x);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case blur5x:
            /*****************************************************************************************************************/
        	videoFeatureSelect(wBlurv4);
            cmd_status_substate = enter_value_or_quit("blur5x",blur5x);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case prewitt:
            /*****************************************************************************************************************/
        	videoFeatureSelect(selSoble);
            cmd_status_substate = enter_value_or_quit("prewitt",prewitt);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case colorcorrection:
            /*****************************************************************************************************************/
        	videoFeatureSelect(selRgbCorrect);
            cmd_status_substate = enter_value_or_quit("colorcorrection",colorcorrection);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
            /*****************************************************************************************************************/
            /*****************************************************************************************************************/
            /*****************************************************************************************************************/
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
        case vga:
            /*****************************************************************************************************************/
            d5m_config2();
            camerarUpdate();
        	cmd_status_substate = enter_value_or_quit("vga",vga);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case hdmi:
            /*****************************************************************************************************************/
        	camera_hdmi_config();
            cmd_status_substate = enter_value_or_quit("hdmi",hdmi);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case fullhdmi:
            /*****************************************************************************************************************/
        	camera_set_registers();
            cmd_status_substate = enter_value_or_quit("fullhdmi",fullhdmi);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case edgethreshold:
            /*****************************************************************************************************************/
        	cmd_status_value    = enter_value_or_quit("null",edgethreshold);edgeThresholdVal(cmd_status_value);
            cmd_status_substate = enter_value_or_quit("edgethreshold",edgethreshold);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case version:
            /*****************************************************************************************************************/
            cmd_status_substate = enter_value_or_quit("version",version);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case cmds_gridpoint:
            /*****************************************************************************************************************/
            printf("Enter x,y location point\n");
            cmd_status_value = enter_value_or_quit("null",cmds_gridpoint);point_Interest(cmd_status_value);readFifo();
            cmd_status_substate = enter_value_or_quit("cmds_gridpoint",cmds_gridpoint);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case cmds_griddelta:
            /*****************************************************************************************************************/
            printf("Enter x,y location point\n");
            menu_print_prompt();
            value = uart_prompt_io();
            point_Interest(value);
            readFifo();
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
        case colorgain: // need to be decoded at terminal for colorgain*** and replace back to parttern5
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
        case cmds_videochannel:
            /*****************************************************************************************************************/
            printf("Enter edgeType Value\n");
            printf("1-sobel 2-prewitt\n");
            menu_print_prompt();
            t1Register = uart_prompt_io();
            if (t1Register == clear) {
            	current_state = mainmenu;
                break;}
        	edgeType(t1Register);
            /*****************************************************************************************************************/
            printf("Enter edgeThreshold Value\n");
            menu_print_prompt();
            t2Register = uart_prompt_io();
            if (t2Register == clear) {
            	current_state = mainmenu;
                break;}
            edgeThresholdVal(t2Register);
            /*****************************************************************************************************************/
            printf("Enter ycbcrSelect Value\n");
            menu_print_prompt();
            t3Register = uart_prompt_io();
            if (t3Register == clear) {
            	current_state = mainmenu;
                break;}
        	ycbcrSelect(t3Register);
            /*****************************************************************************************************************/
            printf("Enter color_correction Value\n");
            menu_print_prompt();
            t4Register = uart_prompt_io();
            if (t4Register == clear) {
            	current_state = mainmenu;
                break;}
        	color_correction(t4Register);
            /*****************************************************************************************************************/
            printf("Enter videoType Value\n");
            menu_print_prompt();
            t5Register = uart_prompt_io();
            if (t5Register == clear) {
            	current_state = mainmenu;
                break;}else{
            	videoFeatureSelect(t5Register);
                t1Register = 0x00000000;
                t2Register = 0x00000000;
                t3Register = 0x00000000;
                t4Register = 0x00000000;
                t5Register = 0x00000000;
            	current_state = cmds_videochannel;break;}
            /*****************************************************************************************************************/
        case coord: //new case name: colorDetectRange
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
            //---------------------
            colorDetectRange(w_rh,w_rl,w_gh,w_gl,w_bh,w_bl);
            //---------------------
            cmd_status_substate = enter_value_or_quit("coord",coord);current_state = cmd_status_substate;break;
            /*****************************************************************************************************************/
        case threshold:
            /*****************************************************************************************************************/
            printf("Enter edgeThreshold Value\n");
            menu_print_prompt();
            t2Register = uart_prompt_io();
            if (t2Register == clear) {
            	current_state = mainmenu;
                break;}
            edgeThresholdVal(t2Register);
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

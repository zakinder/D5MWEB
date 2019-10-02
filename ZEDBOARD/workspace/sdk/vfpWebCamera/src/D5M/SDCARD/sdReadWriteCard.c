#include <xil_printf.h>

#include "../../WEB/eplatform/platform.h"
#include "../SYSTEM_CONFIG_HEADER/system_config_header.h"

// This is just to test the SD card
#define MODE_NORMAL
#ifndef MODE_NORMAL
#define MODE_ANORMAL
#endif
#include <stdio.h>
#include "SD_interface.h"
#include <stdio.h>
#include "xil_types.h"
#include "xparameters.h"
#include "stdio.h"
#include "xil_io.h"
#include "xil_cache.h"
// libraries to read/write SD
#include "xsdps.h" // SD device driver
#include "ff.h" // FAT system module.
#include "xtra_func.h"
// Requirements:
// - It requires the inclusion of "xilffs_v3_3" in the BSP manually!
// - *NOTE: in ffconf.h we need to do: #define	_USE_STRFUNC 1 (it was 0 originally)
// - In 'Generate Linker Script', change the heap/stack size to allow for input, intermedidate data.
//   Also, place the code, and heap/stack in the largest memory (DDR).
//   work area (file system object) for logical drive
FATFS FatFs; 

int wSd(hdmi_display_start *pvideo) {
	static char regPack[4];
	int error_flag = 0;
	static FATFS FileSystem;
	FRESULT Res;
	char tab_recepetion[50]  = { 0 };
	char timeVal[20] = "toto0.txt";
	static char dataVideo[4];
	init_platform();
	Res = f_mount(&FileSystem, "0:", 1);
	snprintf(regPack, sizeof(regPack), "%d", (unsigned) pvideo->sec);
	strcpy(dataVideo[4], regPack);
	printf  ("%s\n", regPack);
	if (Res) {
		error_flag = 1;
	} else {
		xil_printf("SD card mounted successfully.\n");
		if (Res) {
			error_flag = 1;
		} else {
			printf("%d:\n\r",(unsigned) pvideo->sec);
			Res = sdReadWrite(timeVal, dataVideo, 40);
			if (Res != 0 && Res != 8) {
				error_flag = 1;
			}
		}
	}
	cleanup_platform();
	return error_flag;
}


int sd() {
	int error_flag = 0;
	static FATFS FileSystem;
	FRESULT Res;
	char tab_recepetion[50]        = { 0 };
	char tab_emmission[256]        = {"test1\n\r"};
	char NomFichierChargement[20]  = "settings.txt";
	char NomFichierSauvegarde0[20] = "toto0.txt";
	char NomFichierSauvegarde1[20] = "toto1.txt";
	char NomFichierSauvegarde2[20] = "toto2.txt";
	char NomFichierSauvegarde3[20] = "toto3.txt";
	char NomFichierSauvegarde4[20] = "toto4.txt";
	int i;
	int end = 0;
	init_platform();
	Res = f_mount(&FileSystem, "0:", 1);
	if (Res) {
		xil_printf("E1!!!\n");
		error_flag = 1;
	} else {
		xil_printf("SD card mounted successfully.\n");
		Res = sd_card_interface(NomFichierChargement, (void *) tab_recepetion, 7);
		xil_printf("Res : %d\n", Res);
		if (Res) {
			error_flag = 1;
		} else {
			xil_printf(tab_recepetion);
			Res = sdReadWrite(NomFichierSauvegarde0, tab_emmission, 40);
			if (Res != 0 && Res != 8) {
				error_flag = 1;
			} else {
				#ifdef MODE_ANORMAL
                    Res = f_mount(NULL, "0:", 1);//unmount
                    if (!Res){xil_printf("sdReadWrite SD succès.\n");}
                    Res = f_mount(&FileSystem, "0:", 1);//remount
                    if (!Res){xil_printf("sdReadWrite SD succès.\n");}
				#endif
				Res = sdReadWrite(NomFichierSauvegarde1, tab_emmission, 40);
				if (Res != 0 && Res != 8) {
					xil_printf("sdReadWrite : %d\n", Res);
					error_flag = 1;
				} else {
					Res = sd_card_interface(NomFichierChargement, (void *) tab_recepetion, 7);
					if (Res) {
						error_flag = 1;
					} else {
						xil_printf(tab_recepetion);
						Res = sdReadWrite(NomFichierSauvegarde2, tab_emmission, 40);
						if (Res != 0 && Res != 8) {
							error_flag = 1;
						} else {
							Res = sdReadWrite(NomFichierSauvegarde3, tab_emmission, 40);
							if (Res != 0 && Res != 8) {
								error_flag = 1;
							} else {
								Res = sdReadWrite(NomFichierSauvegarde4, tab_emmission, 40);
								if (Res != 0 && Res != 8) {
									error_flag = 1;
								} else {
									xil_printf("E15.\n");
								}
							}
						}
					}
				}
			}
		}
	}
	cleanup_platform();
	return error_flag;
}

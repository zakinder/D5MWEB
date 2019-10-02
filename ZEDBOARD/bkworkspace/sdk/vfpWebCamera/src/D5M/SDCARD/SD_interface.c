#include "SD_interface.h"
static UINT MIN_TAILLE_ECRIT = 256;
int sd_card_interface(char * nomFichier, void * bufferDonnees, UINT nbOctetsLecture){
	int sdInterface_error = 0;
	if (nomFichier == NULL || bufferDonnees == NULL || nbOctetsLecture < 1) {
		sdInterface_error = 1;
	} else {
		FRESULT Res;
		FIL fil;
		Res = f_open(&fil, nomFichier, FA_OPEN_EXISTING | FA_READ);
		if (Res) {
			sdInterface_error = 2;
		} else {
			Res = f_lseek(&fil, 0);
			if (Res) {
				sdInterface_error = 3;
			} else {
				UINT nbOctetsLu;
				Res = f_read(&fil, bufferDonnees, nbOctetsLecture, &nbOctetsLu);
				if (Res) {
					sdInterface_error = 4;
				} else {
					if (nbOctetsLu != nbOctetsLecture) {
						sdInterface_error = sdInterface_error | 0x8;
					}
				}
			}
			Res = f_close(&fil);
			if (Res) {
				sdInterface_error = sdInterface_error | 0x5;
			}
		}
	}
	return sdInterface_error;
}
int sdReadWrite(char * nomFichier, void * bufferDonnees, UINT nbOctetsEcriture) {
	int sdInterface_error = 0;
	if (nomFichier == NULL || bufferDonnees == NULL || nbOctetsEcriture < 1) {
		sdInterface_error = 1;
	} else {
		FRESULT Res;
		FIL fil;
		Res = f_open(&fil, nomFichier, FA_OPEN_ALWAYS | FA_WRITE | FA_READ);
		if (Res) {
			sdInterface_error = 2;
		} else {
			Res = f_lseek(&fil, 0);
			if (Res) {
				sdInterface_error = 3;
			} else {
				UINT nbOctetsEcrit;
				if (nbOctetsEcriture >= MIN_TAILLE_ECRIT) {
					Res = f_write(&fil, bufferDonnees, nbOctetsEcriture, &nbOctetsEcrit);
				} else {
					Res = f_write(&fil, bufferDonnees, MIN_TAILLE_ECRIT, &nbOctetsEcrit);
				}
				if (Res) {
					sdInterface_error = 4;
				} else {
					if (nbOctetsEcrit != nbOctetsEcriture) {
						sdInterface_error = sdInterface_error | 0x8;
					}
				}
			}
			Res = f_close(&fil);
			if (Res) {
				sdInterface_error = sdInterface_error | 0x5;
			}
		}
	}
	return sdInterface_error;
}


#ifndef SD_INTERFACE_H_
#define SD_INTERFACE_H_
#include "xparameters.h"
#include "xsdps.h"
#include "ff.h"
int sd_card_interface(char * nomFichier, void * bufferDonnees, UINT nbOctetsLecture);
int sdReadWrite(char * nomFichier, void * bufferDonnees, UINT nbOctetsEcriture);
#endif /* SD_INTERFACE_H_ */
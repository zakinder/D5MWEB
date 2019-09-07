// This is just to test the SD card
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
FATFS FatFs; // work area (file system object) for logical drive

int sd_card()
{
	u32 Status;
	FRESULT mystat;
    //u32 baseaddr = XPAR_MYPIXFULL_0_S00_AXI_BASEADDR; //  baseaddr = 0x7AA00000; // fixed in Vivado 2016.2!
	u32 *in_data;
  u32 *out_data;
  u32 DataLength;
  u32 i;
  u32 j;
  u32 NPROC;
  u32 FIFO_DEPTH;
  u32 nwords;
	char *in_txt;
  char *out_txt      = "This is a testing phrase to be stored in a text file!";
	static char wel[]  = "Write/Read on binary and text files\n";
	char *infile       = "droid.bif";
	char *outfile      = "droif.bof";
	char *infiletxt    = "test_in.txt";
	char *outfiletxt   = "test_out.txt";

    xil_printf ("\nSD Test: %s\n\r",wel);

    // Separating memory for input and output data:
       in_data = (u32 *) calloc (60000, sizeof(u32)); // 240000 bytes is the maximum size allocated
       if (in_data == NULL) {xil_printf("(main): not enough memory\r\n"); return -1;}

       out_data = (u32 *) calloc (60000, sizeof(u32)); // 240000 bytes is the maximum size allocated
       if (out_data == NULL) {xil_printf("(main): not enough memory\r\n"); return -1;}

       in_txt = (char *) calloc (20000, sizeof(char));
       if (in_txt == NULL) {xil_printf("(main): not enough memory\r\n"); return -1;}

    // Mounting SD Drive
       mystat = f_mount(&FatFs, "0:/", 1); // register work area to the default drive ("0:/")
       if (mystat != FR_OK) { xil_printf("f_mount: Error!\n"); return XST_FAILURE; };
       // Note: We can use the 'disk_status' function (see diskio.h) to find out the status of the disk:
       //    xil_printf ("DiskStatus=%d\n", disk_status(0));

    // Load binary data file from SD and place it in memory:
       xil_printf ("Loading binary file from SD into memory...\n");
       Status = load_sd_to_memory (infile, (u8*) in_data, &DataLength, 1); // (u8 *): typecasting. Little endianness: in a 32-bit word, the LSByte is the 1st byte.
       if (Status != XST_SUCCESS) { xil_printf ("(main) Error loading file from SD to memory!\n"); return -1; }

    // Processing data (streaming it through pixel processor). Here the data we get is the same as the data we input.
       xil_printf ("Processing data: %d bytes ...\n", DataLength);
       nwords = (DataLength-1)/4 + 1; // ceil(DataLength/4)
       FIFO_DEPTH = 512;
       NPROC = (nwords-1)/FIFO_DEPTH + 1; // ceil(nwords/FIFO_DEPTH)

       // First NPROC*FIFO_DEPTH words:
       for (i=0; i < NPROC-1; i++) {
    	   // Writing FIFO_DEPTH words on Pixel Processor IP:
    	   //for (j=0; j < FIFO_DEPTH; j++)
    		   //MYPIXFULL_mWriteMemory(baseaddr, in_data[i*FIFO_DEPTH + j]);

    	   // Reading FIFO_DEPTH words from Pixel Processor IP:
    	  // for (j=0; j < FIFO_DEPTH; j++)
    		   //out_data[i*FIFO_DEPTH + j] = MYPIXFULL_mReadMemory(baseaddr + j*4); // we read 32 bits, that's why we use out_data as u32*
       }

       // Last nwords - (NPROC-1)*FIFO_DEPTH words:
       for (j=0; j < nwords - (NPROC-1)*FIFO_DEPTH; j++)
    	   //MYPIXFULL_mWriteMemory(baseaddr, in_data[(NPROC-1)*FIFO_DEPTH + j]);
	   // Reading FIFO_DEPTH words from Pixel Processor IP:
	   for (j=0; j < nwords - (NPROC-1)*FIFO_DEPTH; j++)
		   //out_data[(NPROC-1)*FIFO_DEPTH + j] = MYPIXFULL_mReadMemory(baseaddr + j*4);

	   xil_printf ("Data processed!\n");
	   // Print input data and output data: Note that the processor is little-endian (last byte goes as the MSByte in a 32-bit word)
	   //for (i=0; i < nwords; i++) xil_printf ("%08X\t%08X\n", *(in_data + i), *(out_data + i)); // If DataLength is not multiple of 4, 1-3 bytes are invalid but shown

	   xil_printf ("Writing binary file onto SD...\n");
	// Write binary data to SD
	   Status = write_data_to_sd(outfile, (u8*) out_data, DataLength,1);// DataLength: same as the input (this is by chance because of the pixel processor, could've been different)
	   if (Status != XST_SUCCESS) { xil_printf ("(main) Error writing file to SD!\n"); return -1; }

	// TEXTFILES:
	// *********
	   xil_printf ("Reading/writing text files from/to SD...\n");

	// Reading a textfile from SD:
	   Status = load_sd_to_memory (infiletxt, (u8 *) in_txt, &DataLength, 2);
	   xil_printf ("Number of characters read (including end of character): %d\n",DataLength);
	   xil_printf ("Textdata: [%s]\n\r", in_txt); // We print data that we read

    // We write textfile data (loopback or our own data) to SD:
	   Status = write_data_to_sd(outfiletxt, (u8 *) out_txt, DataLength, 2); // DataLength is not considered here. What determines the size is the '\0' in 'out_txt'
	   if (Status != XST_SUCCESS) { xil_printf ("(main) Error writing file to SD!\n"); return -1; }
	   xil_printf ("Data written in text file!\n");

	// De-allocating memory:
	   free (in_data); free(out_data); free(in_txt);
	   return 0;
}


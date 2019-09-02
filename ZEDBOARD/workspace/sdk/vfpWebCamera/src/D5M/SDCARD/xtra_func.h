
#include <xparameters.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int load_sd_to_memory (char *filename, u8* dataPtr, u32 *DataLength, u32 filetype)
/* Loads a binary file (e.g. bitstream or data file) onto memory
 * INPUTS
 *    dataPtr		  Pointer to where the bitstream will be loaded in memory
 *    filename	      Pointer to a string with the partial bitstreams's file name.
 *    Data_length     Pointer to data length (in units of bytes)
 *    filetype        1: binary, 2: text
 * OUTPUTS
 *    Returns Status and an error string if error
 * REMARKS
 *    After the function operation is completed, a pointer to the binary file in
 *    memory is returned so that it can be used later.
 *    Note that for this to work, the HEAP need to be big enough to allocate 
 *    the pointer. Otherwise a "not enough memory" error will result.
 * HISTORY
 *   Created : August 18, 2016
 * AUTHOR 
 *   Daniel Llamocca
 */
{
	FIL test;
    UINT NumBytesRead;
    u32 filesize;
	FILINFO *fno;
	FRESULT myres;

	fno = (FILINFO *) calloc (1, sizeof (FILINFO));

	xil_printf ("(load_sd_to_memory): Loading '%s' to memory\n", filename);

	// Reading file from SD Drive:
	myres = f_open(&test, filename, FA_READ);  // Opening file to read it // created with write_cfgmem (this works!)
	if (myres != FR_OK) { xil_printf("f_open: Error!\n"); return XST_FAILURE; };

	myres = f_stat (filename, fno);
	if (myres != FR_OK) { xil_printf("f_stat: Error!: %d\n", myres); return XST_FAILURE; }

	filesize = fno->fsize; // (bytes). For 'dynpix' project, it is 59272 bytes;
	xil_printf ("(load_sd_to_memory) : File Size: %d bytes\n", filesize);

	myres = f_lseek (&test,0); // seek file r/w pointer
	if (myres != FR_OK) { xil_printf("f_lseek: Error!\n"); return XST_FAILURE; };

	if (filetype == 1) { // binary file
		myres = f_read (&test, (void*) (dataPtr), filesize, &NumBytesRead);
		if (NumBytesRead != filesize) { xil_printf ("Error!. Number of Bytes Read: %d != DataLength\n", NumBytesRead); return XST_FAILURE; }
	}
	else if (filetype == 2) { // text file
		TCHAR *LineTemp = (TCHAR *) NULL;
		LineTemp = (TCHAR *) f_gets ((char *)dataPtr, filesize, &test);
	}
	else
		{ xil_printf ("Error: 'filetype' is incorrect!"); return XST_FAILURE; }

	myres = f_close (&test); // Closing "filename"
	if (myres == FR_OK) xil_printf ("Close File: Success!\n\r"); else xil_printf ("Close file: Error!\n\r");

	*DataLength = filesize;

	return XST_SUCCESS;
}
/*******/


int write_data_to_sd(char *filename, u8* dataPtr, u32 DataLength, u32 filetype)
/* Writes data on a binary file
 * INPUTS
 *    dataPtr		  Pointer to where the data is in memory
 *    filename	      Pointer to a string with the filename
 *    DataLength      Length (in bytes) of data to be written
 *                    For textfiles, this parameter is not considered,
 *                    Instead, dataPtr must have a '\0' character at the end to signal
 *                    the end of the string. This will determine the # of bytes written.
 *    filetype        1: binary, 2: text *
 * OUTPUTS
 *    Returns Status and an error string if error
 * REMARKS
 *    After the function operation is completed, a file with name 'filename'
 *    will be stored in the SD card
 *    Note that for this to work, the HEAP need to be big enough to allocate
 *    the pointer. Otherwise a "not enough memory" error will result.
 * HISTORY
 *   Created : August 18, 2016
 * AUTHOR
 *   Daniel Llamocca
 */
{
	FIL test;
    UINT NumBytesWritten;
	FILINFO *fno;
	FRESULT myres;

	fno = (FILINFO *) calloc (1, sizeof (FILINFO));

	xil_printf ("(write_data_to_sd): Writing memory data to '%s'\n", filename);

	// Reading file from SD Drive:
	myres = f_open(&test, filename, FA_CREATE_ALWAYS | FA_WRITE | FA_READ);  // Opening file to read it
	if (myres != FR_OK) { xil_printf("f_open: Error!\n"); return XST_FAILURE; };

	myres = f_stat (filename, fno);
	if (myres != FR_OK) { xil_printf("f_stat: Error!: %d\n", myres); return XST_FAILURE; }

	xil_printf ("(write_data_to_sd) : File Size: %d bytes\n", DataLength);

	myres = f_lseek (&test,0);
	if (myres != FR_OK) { xil_printf("f_lseek: Error!\n"); return XST_FAILURE; };

	if (filetype == 1) { // binary file
		myres = f_write (&test, (void*) dataPtr, DataLength, &NumBytesWritten);
		if (myres == FR_OK) xil_printf ("f_write: Success!\n\r"); else xil_printf ("f_write: Failure\n\r");
		if (NumBytesWritten != DataLength) { xil_printf ("Error!. Number of Bytes Written: %d != DataLength\n", NumBytesWritten); return XST_FAILURE; }
	}
	else if (filetype == 2) {
		myres = f_puts ((char *) dataPtr, &test); // writing text. # of bytes: determined by dataPtr (until the end-of-string character is reached)
	}
	else
		{ xil_printf ("Error: 'filetype' is incorrect!"); return XST_FAILURE; }

	myres = f_close (&test); // Closing "filename"
	if (myres == FR_OK) xil_printf ("Close File: Success!\n\r"); else xil_printf ("Close file: Error!\n\r");

	return XST_SUCCESS;
}
/*******/



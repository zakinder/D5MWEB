// LAST TESTED : 12/16/2018
#include <xaxivdma.h>
#include <xaxivdma_hw.h>
#include <xil_cache.h>
#include <xil_printf.h>
#include <xil_types.h>
#include <xparameters.h>
#include <xstatus.h>
#include "hdmi_display.h"
#include "../SYSTEM_CONFIG_HEADER/system_config_header.h"
#include "../SYSTEM_CONFIG_HEADER/system_config_defines.h"
#ifdef XPAR_INTC_0_DEVICE_ID
#include "xintc.h"
#else
#include "xscugic.h"
#endif
#define NUM_BANK_BITS		XPAR_S6DDR_0_MEM_BANKADDR_WIDTH
#define NUM_ROW_BITS		XPAR_S6DDR_0_MEM_ADDR_WIDTH
#define NUM_COL_BITS		XPAR_S6DDR_0_MEM_NUM_COL_BITS
#define MEM_WIDTH		XPAR_S6DDR_0_NUM_DQ_PINS
#ifndef MEM_OFFSET
 #define MEM_OFFSET		0x00004000
#endif
/*
 * Bit masks for the tests that are to be done on the memory.
 */
#define S6_DDRX_TEST_0	0x0001 /* S6_DDRX_TEST_0 - Write all zeros and verify */
#define S6_DDRX_TEST_1	0x0002 /* S6_DDRX_TEST_1 - Write all ones and verify */
#define S6_DDRX_TEST_2	0x0004 /* S6_DDRX_TEST_2 - Test for stuck together
				  row/col bits*/
#define S6_DDRX_TEST_3	0x0008 /* S6_DDRX_TEST_3 - MAX BA/ROW/COL NOISE */
#define S6_DDRX_TEST_4	0x0010 /* S6_DDRX_TEST_4 - DATA = !ADDR test */
/*
 * Tests to be done. All the tests are enabled by default.
 */
#ifndef S6_DDRX_TEST
 #define S6_DDRX_TEST	(S6_DDRX_TEST_0 | S6_DDRX_TEST_1 | S6_DDRX_TEST_2 | \
			 S6_DDRX_TEST_3 | S6_DDRX_TEST_4)
#endif
/*
 * Cache options for the tests.
 */
#define S6_DDRX_CACHE_TEST_0	0x0001 /* ICache: ON , DCache: ON */
#define S6_DDRX_CACHE_TEST_1	0x0002 /* ICache: OFF, DCache: OFF */
#define S6_DDRX_CACHE_TEST_2	0x0004 /* ICache: ON, DCache: OFF */
#define S6_DDRX_CACHE_TEST_3	0x0008 /* ICache: OFF, DCache: ON */
/*
 * Cache options for the tests to be done.
 * S6_DDRX_CACHE_TEST_0 and S6_DDRX_CACHE_TEST_1 are enabled by default.
 */
#ifndef S6_DDRX_CACHE_TEST
 #define S6_DDRX_CACHE_TEST	(S6_DDRX_CACHE_TEST_0 | S6_DDRX_CACHE_TEST_1)
#endif
/*
 * Specifies how many passes of the test to run, -1 == infinite.
 */
#ifndef NUM_ITERATIONS
 #define NUM_ITERATIONS		1
#endif
/**************************** Type Definitions ********************************/
/*
 * This type is a word address ptr.
 */
typedef volatile u32 *U32Ptr;
/***************** Macros (Inline Functions) Definitions **********************/
/*
 * Macros to read and write words directly to memory.
 */
#define WR_WORD(ADDR, DATA)	(*(U32Ptr)(ADDR) = (DATA))
#define RD_WORD(ADDR, DATA)	((DATA) = *(U32Ptr)(ADDR))
/*
 * Macros to enable/disable caches.
 */
#define ENABLE_ICACHE()		Xil_ICacheEnable()
#define ENABLE_DCACHE()		Xil_DCacheEnable()
#define DISABLE_ICACHE()	Xil_ICacheDisable()
#define DISABLE_DCACHE()	Xil_DCacheDisable()
#define printf			xil_printf	/* Small foot print printf */
/******************** Constant Definitions **********************************/
/*
 * Device related constants. These need to defined as per the HW system.
 */
#define DMA_DEVICE_ID		XPAR_AXIVDMA_0_DEVICE_ID
#ifdef XPAR_V6DDR_0_S_AXI_BASEADDR
#define DDR_BASE_ADDR		XPAR_V6DDR_0_S_AXI_BASEADDR
#define DDR_HIGH_ADDR		XPAR_V6DDR_0_S_AXI_HIGHADDR
#elif XPAR_S6DDR_0_S0_AXI_BASEADDR
#define DDR_BASE_ADDR		XPAR_S6DDR_0_S0_AXI_BASEADDR
#define DDR_HIGH_ADDR		XPAR_S6DDR_0_S0_AXI_HIGHADDR
#elif XPAR_AXI_7SDDR_0_S_AXI_BASEADDR
#define DDR_BASE_ADDR		XPAR_AXI_7SDDR_0_S_AXI_BASEADDR
#define DDR_HIGH_ADDR		XPAR_AXI_7SDDR_0_S_AXI_HIGHADDR
#else
#warning CHECK FOR THE VALID DDR ADDRESS IN XPARAMETERS.H, \
			DEFAULT SET TO 0x01000000
#define DDR_BASE_ADDR		0x01000000
#define DDR_HIGH_ADDR		0x0F000000
#endif
/* Memory space for the frame buffers
 *
 * This example only needs one set of frame buffers, because one video IP is
 * to write to the frame buffers, and the other video IP is to read from the
 * frame buffers.
 *
 * For 16 frames of 1080p, it needs 0x07E90000 memory for frame buffers
 */
#define MEM_BASE_ADDR		(DDR_BASE_ADDR + 0x01000000)
#define MEM_HIGH_ADDR		DDR_HIGH_ADDR
#define MEM_SPACE		(MEM_HIGH_ADDR - MEM_BASE_ADDR)
/* Read channel and write channel start from the same place
 *
 * One video IP write to the memory region, the other video IP read from it
 */
#define READ_ADDRESS_BASE	MEM_BASE_ADDR
#define WRITE_ADDRESS_BASE	MEM_BASE_ADDR
#define XPAR_INTC_0_AXIVDMA_0_S2MM_INTROUT_VEC_ID  19 /* AXIVDMA write intr */
#define XPAR_INTC_0_AXIVDMA_0_MM2S_INTROUT_VEC_ID  20 /* AXIVDMA read intr */
/* Frame size related constants
 */
/* Subframe to be transferred by Video DMA
 *
 *|<----------------- FRAME_HORIZONTAL_LEN ---------------------->|
 * --------------------------------------------------------------------
 *|                                                                | ^
 *|                                                                | |
 *|               |<-SUBFRAME_HORIZONTAL_SIZE ->|                  | FRAME_
 *|               -----------------------------------              | VERTICAL_
 *|               |/////////////////////////////|  ^               | LEN
 *|               |/////////////////////////////|  |               | |
 *|               |/////////////////////////////|  |               | |
 *|               |/////////////////////////////| SUBFRAME_        | |
 *|               |/////////////////////////////| VERTICAL_        | |
 *|               |/////////////////////////////| SIZE             | |
 *|               |/////////////////////////////|  |               | |
 *|               |/////////////////////////////|  v               | |
 *|                ----------------------------------              | |
 *|                                                                | v
 *--------------------------------------------------------------------
 *
 * Note that SUBFRAME_HORIZONTAL_SIZE and SUBFRAME_VERTICAL_SIZE must ensure
 * to be inside the frame.
 */
#define SUBFRAME_START_OFFSET    (H_STRIDE * 5 + 32)
#define SUBFRAME_HORIZONTAL_SIZE 100
#define SUBFRAME_VERTICAL_SIZE   100
/* Number of frames to work on, this is to set the frame count threshold
 *
 * We multiply 15 to the num stores is to increase the intervals between
 * interrupts. If you are using fsync, then it is not necessary.
 */
#define NUMBER_OF_READ_FRAMES	3
#define NUMBER_OF_WRITE_FRAMES	3
/* Number of frames to transfer
 *
 * This is used to monitor the progress of the test, test purpose only
 */
#define NUM_TEST_FRAME_SETS	10
/* Delay timer counter
 *
 * WARNING: If you are using fsync, please increase the delay counter value
 * to be 255. Because with fsync, the inter-frame delay is long. If you do not
 * care about inactivity of the hardware, set this counter to be 0, which
 * disables delay interrupt.
 */
#define DELAY_TIMER_COUNTER	10
/*
 * Device instance definitions
 */
XAxiVdma AxiVdma;
#ifdef XPAR_INTC_0_DEVICE_ID
static XIntc Intc;	/* Instance of the Interrupt Controller */
#else
static XScuGic Intc;	/* Instance of the Interrupt Controller */
#endif
/* Data address
 *
 * Read and write sub-frame use the same settings
 */
static u32 ReadFrameAddr;
static u32 WriteFrameAddr;
static u32 BlockStartOffset;
static u32 BlockHoriz;
static u32 BlockVert;
/* DMA channel setup
 */
static XAxiVdma_DmaSetup ReadCfg;
static XAxiVdma_DmaSetup WriteCfg;
/* Transfer statics
 */
static int ReadDone;
static int ReadError;
static int WriteDone;
static int WriteError;
/******************* Function Prototypes ************************************/
static int ReadSetup(XAxiVdma *InstancePtr);
static int WriteSetup(XAxiVdma * InstancePtr);
static int StartTransfer(XAxiVdma *InstancePtr);
static int SetupIntrSystem(XAxiVdma *AxiVdmaPtr, u16 ReadIntrId,
				u16 WriteIntrId);
static void DisableIntrSystem(u16 ReadIntrId, u16 WriteIntrId);
/* Interrupt call back functions
 */
static void ReadCallBack(void *CallbackRef, u32 Mask);
static void ReadErrorCallBack(void *CallbackRef, u32 Mask);
static void WriteCallBack(void *CallbackRef, u32 Mask);
static void WriteErrorCallBack(void *CallbackRef, u32 Mask);
static int VdmaStart(void);
u16 frame[V_ACTIVE][H_STRIDE];
void VdmaInit()
{
	int status;
	ReadFrameAddr = READ_ADDRESS_BASE;
	WriteFrameAddr = WRITE_ADDRESS_BASE;
	BlockStartOffset = SUBFRAME_START_OFFSET;
	BlockHoriz = SUBFRAME_HORIZONTAL_SIZE;
	BlockVert = SUBFRAME_VERTICAL_SIZE;
	DISABLE_DCACHE();
	xil_printf("\r\n--- Entering main() --- \r\n");
	status = VdmaStart();
	if (status != XST_SUCCESS) {
		xil_printf("Configuration Initialization failed %d\r\n", status);
	}
}
int VdmaStart(void){
	int status;
	int i = 0;
	u16 *fptr2 = (void *) READ_ADDRESS_BASE;
	xil_printf("pointer to address %d\r\n", fptr2);
	xil_printf("value at init %d\r\n", *fptr2);
	u16 *fptr =&frame;
	fptr = fptr2;
	xil_printf("&frame %d\r\n", &frame);
	xil_printf("&frame %d\r\n", frame);
	xil_printf("pointer to address %d\r\n", fptr);
	xil_printf("value at init %d\r\n", *fptr);
	XAxiVdma_Config *VdmaConfig;
	XAxiVdma_FrameCounter FrameCfg;
	//Retrieve config
	//print("Getting Config\n\r");
	VdmaConfig = XAxiVdma_LookupConfig(XPAR_AXIVDMA_0_DEVICE_ID);
	if (!VdmaConfig) {
		xil_printf("No video DMA found for ID %d\r\n", XPAR_AXIVDMA_0_DEVICE_ID);
		return XST_FAILURE;
	}
	//print("Setting Config\n\r");
	//set config
	status = XAxiVdma_CfgInitialize(&AxiVdma, VdmaConfig, VdmaConfig->BaseAddress);
	if (status != XST_SUCCESS) {
		xil_printf("Configuration Initialization failed %d\r\n", status);
			return XST_FAILURE;
	}
	XAxiVdma_DmaStop(&AxiVdma, XAXIVDMA_READ);
	XAxiVdma_DmaStop(&AxiVdma, XAXIVDMA_WRITE);
	//set up frames store
	//print("Setting FrameStore\n\r");
	//set up read and write
	u32 Addr;
	ReadCfg.VertSizeInput = V_ACTIVE;
	ReadCfg.HoriSizeInput = H_STRIDE;
	ReadCfg.Stride = H_STRIDE;
	ReadCfg.FrameDelay = 0;  /* This example does not test frame delay */
	ReadCfg.EnableCircularBuf = 1;
	ReadCfg.EnableSync = 0;  /* No Gen-Lock */
	ReadCfg.PointNum = 0;    /* No Gen-Lock */
	ReadCfg.EnableFrameCounter = 0; /* Endless transfers */
	ReadCfg.FrameStoreStartAddr[0] = (u32)&frame; /* We are not doing parking */
	//ReadCfg.FixedFrameStoreAddr = READ_ADDRESS_BASE; /* We are not doing parking */
	//print("Setting Read Config\n\r");
	status = XAxiVdma_DmaConfig(&AxiVdma, XAXIVDMA_READ, &ReadCfg);
	if (status != XST_SUCCESS) {
		xil_printf("Read channel config failed %d\r\n", status);
		return XST_FAILURE;
	}
	Addr = READ_ADDRESS_BASE;
	for(i = 0; i < NUMBER_OF_READ_FRAMES; i++) {
			ReadCfg.FrameStoreStartAddr[i] = Addr;
			Addr += H_STRIDE * V_ACTIVE;
	}
	xil_printf("frame %d\r\n", frame[0][0]);
	status = XAxiVdma_DmaSetBufferAddr(&AxiVdma, XAXIVDMA_READ, ReadCfg.FrameStoreStartAddr);
	if (status != XST_SUCCESS) {
		xil_printf("Read channel set buffer address failed %d\r\n", status);
		return XST_FAILURE;
	}
	WriteCfg.VertSizeInput = V_ACTIVE;
	WriteCfg.HoriSizeInput = H_STRIDE;
	WriteCfg.Stride = H_STRIDE;
	WriteCfg.FrameDelay = 1;  /* This example does not test frame delay */
	WriteCfg.EnableCircularBuf = 1;
	WriteCfg.EnableSync = 0;  /* No Gen-Lock */
	WriteCfg.PointNum = 0;    /* No Gen-Lock */
	WriteCfg.EnableFrameCounter = 0; /* Endless transfers */
	WriteCfg.FixedFrameStoreAddr = 0; /* We are not doing parking */
	//print("Setting Write Config\n\r");
	status = XAxiVdma_DmaConfig(&AxiVdma, XAXIVDMA_WRITE, &WriteCfg);
	if (status != XST_SUCCESS) {
		xil_printf("Write channel config failed %d\r\n", status);
		return XST_FAILURE;
	}
	Addr = WRITE_ADDRESS_BASE;
	for(i = 0; i < NUMBER_OF_WRITE_FRAMES; i++) {
		WriteCfg.FrameStoreStartAddr[i] = Addr;
		Addr += H_STRIDE * V_ACTIVE;
	}
	xil_printf("WAddr %d\r\n", Addr);
	xil_printf("frame %d\r\n", frame[0][0]);
	status = XAxiVdma_DmaSetBufferAddr(&AxiVdma, XAXIVDMA_WRITE, WriteCfg.FrameStoreStartAddr);
	if (status != XST_SUCCESS) {
		xil_printf("Write channel set buffer address failed %d\r\n", status);
		return XST_FAILURE;
	}
	//start transfer
	//print("Starting Transfer\n\r");
	status =  XAxiVdma_DmaStart(&AxiVdma, XAXIVDMA_WRITE);
	if (status != XST_SUCCESS) {
		xil_printf("DMA write start failed %d\r\n", status);
		return XST_FAILURE;
	}
	status = XAxiVdma_StartReadFrame(&AxiVdma, &ReadCfg);
	status = XAxiVdma_StartWriteFrame(&AxiVdma, &WriteCfg);
//	for(i = 0; i < 50; i++) {
//		xil_printf("frame %d\r\n", frame[2][i]);
//	}
//	for(i = 0; i < 50; i++) {
//		xil_printf("frame %d\r\n", frame[i][2]);
//	}
	//XAxiVdma_DmaRegisterDump(&AxiVdma, XAXIVDMA_WRITE);
	print("Write channel dump\n\r");
	xil_printf("\tS2MM DMA Control Register: %x\r\n",XAxiVdma_ReadReg(AxiVdma.WriteChannel.ChanBase, XAXIVDMA_CR_OFFSET));
	xil_printf("\tS2MM DMA Status Register: %x\r\n",XAxiVdma_ReadReg(AxiVdma.WriteChannel.ChanBase, XAXIVDMA_SR_OFFSET));
	xil_printf("\tHI_FRMBUF Reg: %x\r\n",XAxiVdma_ReadReg(AxiVdma.WriteChannel.ChanBase, XAXIVDMA_HI_FRMBUF_OFFSET));
	xil_printf("\tFRMSTORE Reg: %d\r\n",XAxiVdma_ReadReg(AxiVdma.WriteChannel.ChanBase, XAXIVDMA_FRMSTORE_OFFSET));
	xil_printf("\tBUFTHRES Reg: %d\r\n",XAxiVdma_ReadReg(AxiVdma.WriteChannel.ChanBase, XAXIVDMA_BUFTHRES_OFFSET));
	xil_printf("\tS2MM Vertical Size Register: %d\r\n",XAxiVdma_ReadReg(AxiVdma.WriteChannel.ChanBase, XAXIVDMA_S2MM_ADDR_OFFSET + XAXIVDMA_VSIZE_OFFSET));
	xil_printf("\tS2MM Horizontal Size Register: %d\r\n",XAxiVdma_ReadReg(AxiVdma.WriteChannel.ChanBase, XAXIVDMA_S2MM_ADDR_OFFSET + XAXIVDMA_HSIZE_OFFSET));
	xil_printf("\tS2MM Frame Delay and Stride Register: %d\r\n",XAxiVdma_ReadReg(AxiVdma.WriteChannel.ChanBase, XAXIVDMA_S2MM_ADDR_OFFSET + XAXIVDMA_STRD_FRMDLY_OFFSET));
	xil_printf("\tS2MM Start Address 1: %x\r\n",XAxiVdma_ReadReg(AxiVdma.WriteChannel.ChanBase, XAXIVDMA_S2MM_ADDR_OFFSET + XAXIVDMA_START_ADDR_OFFSET));
	xil_printf("\n");
	print("Read channel dump\n\r");
	//XAxiVdma_DmaRegisterDump(&AxiVdma, XAXIVDMA_READ);
	xil_printf("\tMM2S DMA Control Register: %x\r\n",XAxiVdma_ReadReg(AxiVdma.ReadChannel.ChanBase, XAXIVDMA_CR_OFFSET));
	xil_printf("\tMM2S DMA Status Register: %x\r\n",XAxiVdma_ReadReg(AxiVdma.ReadChannel.ChanBase, XAXIVDMA_SR_OFFSET));
	xil_printf("\tMM2S HI_FRMBUF Reg: %x\r\n",XAxiVdma_ReadReg(AxiVdma.ReadChannel.ChanBase, XAXIVDMA_HI_FRMBUF_OFFSET));
	xil_printf("\tFRMSTORE Reg: %d\r\n",XAxiVdma_ReadReg(AxiVdma.ReadChannel.ChanBase, XAXIVDMA_FRMSTORE_OFFSET));
	xil_printf("\tBUFTHRES Reg: %d\r\n",XAxiVdma_ReadReg(AxiVdma.ReadChannel.ChanBase, XAXIVDMA_BUFTHRES_OFFSET));
	xil_printf("\tMM2S Vertical Size Register: %d\r\n",XAxiVdma_ReadReg(AxiVdma.ReadChannel.ChanBase, XAXIVDMA_MM2S_ADDR_OFFSET + XAXIVDMA_VSIZE_OFFSET));
	xil_printf("\tMM2S Horizontal Size Register: %d\r\n",XAxiVdma_ReadReg(AxiVdma.ReadChannel.ChanBase, XAXIVDMA_MM2S_ADDR_OFFSET + XAXIVDMA_HSIZE_OFFSET));
	xil_printf("\tMM2S Frame Delay and Stride Register: %d\r\n",XAxiVdma_ReadReg(AxiVdma.ReadChannel.ChanBase, XAXIVDMA_MM2S_ADDR_OFFSET + XAXIVDMA_STRD_FRMDLY_OFFSET));
	xil_printf("\tMM2S Start Address 1: %x\r\n",XAxiVdma_ReadReg(AxiVdma.ReadChannel.ChanBase, XAXIVDMA_MM2S_ADDR_OFFSET + XAXIVDMA_START_ADDR_OFFSET));
	xil_printf("pointer to address %d\r\n", fptr);
	xil_printf("value at init %d\r\n", *fptr);
	xil_printf("pointer to address %d\r\n", fptr2);
	xil_printf("value at init %d\r\n", *fptr2);
	/*
	status =  XAxiVdma_DmaStart(&AxiVdma, XAXIVDMA_READ);
	if (status != XST_SUCCESS) {
		xil_printf("DMA read start failed %d\r\n", status);
		return XST_FAILURE;
	}
	*/
	//print("Start transfer\n\r");
	return XST_SUCCESS;
}

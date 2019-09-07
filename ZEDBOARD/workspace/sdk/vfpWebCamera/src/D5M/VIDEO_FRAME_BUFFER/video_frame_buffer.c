// LAST TESTED : 12/16/2018
#include <xaxivdma.h>
#include <xaxivdma_hw.h>
#include <xbasic_types.h>
#include <xdebug.h>
#include <xil_printf.h>
#include <xil_types.h>
#include <xstatus.h>
#include "../VIDEO_RESOLUTION/video_resolution.h"
#define NUMBER_OF_READ_FRAMES    XPAR_AXIVDMA_0_NUM_FSTORES
#define NUMBER_OF_WRITE_FRAMES   XPAR_AXIVDMA_0_NUM_FSTORES
int vfb_common_init( u16 uDeviceId, XAxiVdma *pAxiVdma )
{
   int Status;
   XAxiVdma_Config *Config;
   Config = XAxiVdma_LookupConfig( uDeviceId );
   if (!Config)
   {
      xil_printf( "No video DMA found for ID %d\n\r", uDeviceId);
      return 1;
   }
   Status = XAxiVdma_CfgInitialize(pAxiVdma, Config, Config->BaseAddress);
   if (Status != XST_SUCCESS)
   {
      xil_printf( "Initialization failed %d\n\r", Status);
      return 1;
   }
   return 0;
}
int vfb_rx_init( XAxiVdma *pAxiVdma, XAxiVdma_DmaSetup *pWriteCfg, Xuint32 uVideoResolution, Xuint32 uStorageResolution, Xuint32 uMemAddr, Xuint32 uNumFrames )
{
   int Status;
   XAxiVdma_FrameCounter FrameCfg;
   u32 uBaseAddr;
   u32 uDMACR;
   Status = vfb_rx_setup(pAxiVdma,pWriteCfg,uVideoResolution,uStorageResolution,uMemAddr,uNumFrames);
   if (Status != XST_SUCCESS) {
           xdbg_printf(XDBG_DEBUG_ERROR,
               "Write channel setup failed %d\r\n", Status);
           return 1;
   }
   Status = vfb_rx_start(pAxiVdma);
   if (Status != XST_SUCCESS) {
		   return 1;
   }
	XAxiVdma_FsyncSrcSelect(pAxiVdma, XAXIVDMA_S2MM_TUSER_FSYNC, XAXIVDMA_WRITE);
}
int vfb_tx_init( XAxiVdma *pAxiVdma, XAxiVdma_DmaSetup *pReadCfg, Xuint32 uVideoResolution, Xuint32 uStorageResolution, Xuint32 uMemAddr, Xuint32 uNumFrames )
{
   int Status;
   XAxiVdma_FrameCounter FrameCfg;
   u32 uBaseAddr;
   u32 uDMACR;
   Status = vfb_tx_setup(pAxiVdma,pReadCfg,uVideoResolution,uStorageResolution,uMemAddr,uNumFrames);
   if (Status != XST_SUCCESS) {
		   xdbg_printf(XDBG_DEBUG_ERROR,
			   "Read channel setup failed %d\n\r", Status);
		   return 1;
   }
   Status = vfb_tx_start(pAxiVdma);
   if (Status != XST_SUCCESS) {
		   return 1;
   }
#if 0
#if 0
	XAxiVdma_GenLockSourceSelect(pAxiVdma, XAXIVDMA_INTERNAL_GENLOCK, XAXIVDMA_READ);
#else
	uBaseAddr = pAxiVdma->BaseAddr;
	uDMACR = *((volatile int *)(uBaseAddr+XAXIVDMA_TX_OFFSET+XAXIVDMA_CR_OFFSET ));
	uDMACR |= 0x00000080;
	*((volatile int *)(uBaseAddr+XAXIVDMA_TX_OFFSET+XAXIVDMA_CR_OFFSET )) = uDMACR;
#endif
#endif
}
int vfb_rx_setup(XAxiVdma *pAxiVdma, XAxiVdma_DmaSetup *pWriteCfg, Xuint32 uVideoResolution, Xuint32 uStorageResolution, Xuint32 uMemAddr, Xuint32 uNumFrames )
{
	int i;
	u32 Addr;
	int Status;
	Xuint32 video_width, video_height;
	Xuint32 storage_width, storage_height, storage_stride, storage_size, storage_offset;
	video_height = vres_get_height( uVideoResolution );
	video_width  = vres_get_width ( uVideoResolution ) << 2;
	storage_height = vres_get_height( uStorageResolution );
	storage_width  = vres_get_width ( uStorageResolution ) << 2;
	storage_stride = storage_width;
	storage_size   = storage_width * storage_height;
	storage_offset = ((storage_height-video_height)>>1)*storage_width + ((storage_width-video_width)>>1);
	pWriteCfg->VertSizeInput = video_height;
	pWriteCfg->HoriSizeInput = video_width;
	pWriteCfg->Stride        = storage_stride;
	pWriteCfg->FrameDelay = 0;
	pWriteCfg->EnableCircularBuf = 1;
	pWriteCfg->EnableSync = 1;
	pWriteCfg->PointNum = 1;
	pWriteCfg->EnableFrameCounter = 0;
	pWriteCfg->FixedFrameStoreAddr = 0;
	Status = XAxiVdma_DmaConfig(pAxiVdma, XAXIVDMA_WRITE, pWriteCfg);
	if (Status != XST_SUCCESS) {
			xdbg_printf(XDBG_DEBUG_ERROR,
				"Write channel config failed %d\r\n", Status);
			return XST_FAILURE;
	}
	Addr = uMemAddr + storage_offset;
	for(i = 0; i < uNumFrames; i++)
	{
		pWriteCfg->FrameStoreStartAddr[i] = Addr;
		Addr += storage_size;
	}
	Status = XAxiVdma_DmaSetBufferAddr(pAxiVdma, XAXIVDMA_WRITE,
			pWriteCfg->FrameStoreStartAddr);
	if (Status != XST_SUCCESS) {
			xdbg_printf(XDBG_DEBUG_ERROR,
				"Write channel set buffer address failed %d\r\n", Status);
			return XST_FAILURE;
	}
	return XST_SUCCESS;
}
int vfb_tx_setup(XAxiVdma *pAxiVdma, XAxiVdma_DmaSetup *pReadCfg, Xuint32 uVideoResolution, Xuint32 uStorageResolution, Xuint32 uMemAddr, Xuint32 uNumFrames )
{
	int i;
	u32 Addr;
	int Status;
	Xuint32 video_width, video_height;
	Xuint32 storage_width, storage_height, storage_stride, storage_size, storage_offset;
	video_height = vres_get_height( uVideoResolution );
	video_width  = vres_get_width ( uVideoResolution ) << 2;
	storage_height = vres_get_height( uStorageResolution );
	storage_width  = vres_get_width ( uStorageResolution ) << 2;
	storage_stride = storage_width;
	storage_size   = storage_width * storage_height;
	storage_offset = ((storage_height-video_height)>>1)*storage_width + ((storage_width-video_width)>>1);
	pReadCfg->VertSizeInput = video_height;
	pReadCfg->HoriSizeInput = video_width;
	pReadCfg->Stride        = storage_stride;
	pReadCfg->FrameDelay = 0;
	pReadCfg->EnableCircularBuf = 1;
	pReadCfg->EnableSync = 1;
	pReadCfg->PointNum = 1;
	pReadCfg->EnableFrameCounter = 0;
	pReadCfg->FixedFrameStoreAddr = 0;
	Status = XAxiVdma_DmaConfig(pAxiVdma, XAXIVDMA_READ, pReadCfg);
	if (Status != XST_SUCCESS) {
			xdbg_printf(XDBG_DEBUG_ERROR,
				"Read channel config failed %d\n\r", Status);
			return XST_FAILURE;
	}
	Addr = uMemAddr + storage_offset;
	for(i = 0; i < uNumFrames; i++)
	{
		pReadCfg->FrameStoreStartAddr[i] = Addr;
		Addr += storage_size;
	}
	Status = XAxiVdma_DmaSetBufferAddr(pAxiVdma, XAXIVDMA_READ,
			pReadCfg->FrameStoreStartAddr);
	if (Status != XST_SUCCESS) {
			xdbg_printf(XDBG_DEBUG_ERROR,
				"Read channel set buffer address failed %d\n\r", Status);
			return XST_FAILURE;
	}
	return XST_SUCCESS;
}
int vfb_rx_start(XAxiVdma *pAxiVdma)
{
   int Status;
   Status = XAxiVdma_DmaStart(pAxiVdma, XAXIVDMA_WRITE);
   if (Status != XST_SUCCESS)
   {
      xil_printf( "Start Write transfer failed %d\r\n", Status);
      return XST_FAILURE;
   }
   return XST_SUCCESS;
}
int vfb_tx_start(XAxiVdma *pAxiVdma)
{
   int Status;
   Status = XAxiVdma_DmaStart(pAxiVdma, XAXIVDMA_READ);
   if (Status != XST_SUCCESS)
   {
      xil_printf("Start read transfer failed %d\n\r", Status);
      return XST_FAILURE;
   }
   return XST_SUCCESS;
}
int vfb_rx_stop(XAxiVdma *pAxiVdma)
{
   XAxiVdma_DmaStop(pAxiVdma, XAXIVDMA_WRITE);
   return XST_SUCCESS;
}
int vfb_tx_stop(XAxiVdma *pAxiVdma)
{
   XAxiVdma_DmaStop(pAxiVdma, XAXIVDMA_READ);
   return XST_SUCCESS;
}
int vfb_dump_registers(XAxiVdma *pAxiVdma)
{
   u32 uBaseAddr = pAxiVdma->BaseAddr;
   xil_printf( "AXI_VDMA - Partial Register Dump (uBaseAddr = 0x%08X):\n\r", uBaseAddr );
   xil_printf( "\t PARKPTR          = 0x%08X\n\r", *((volatile int *)(uBaseAddr+XAXIVDMA_PARKPTR_OFFSET )) );
   xil_printf( "\t ----------------\n\r" );
   xil_printf( "\t S2MM_DMACR       = 0x%08X\n\r", *((volatile int *)(uBaseAddr+XAXIVDMA_RX_OFFSET+XAXIVDMA_CR_OFFSET )) );
   xil_printf( "\t S2MM_DMASR       = 0x%08X\n\r", *((volatile int *)(uBaseAddr+XAXIVDMA_RX_OFFSET+XAXIVDMA_SR_OFFSET )) );
   xil_printf( "\t S2MM_STRD_FRMDLY = 0x%08X\n\r", *((volatile int *)(uBaseAddr+XAXIVDMA_S2MM_ADDR_OFFSET+XAXIVDMA_STRD_FRMDLY_OFFSET)) );
   xil_printf( "\t S2MM_START_ADDR0 = 0x%08X\n\r", *((volatile int *)(uBaseAddr+XAXIVDMA_S2MM_ADDR_OFFSET+XAXIVDMA_START_ADDR_OFFSET+0)) );
   xil_printf( "\t S2MM_START_ADDR1 = 0x%08X\n\r", *((volatile int *)(uBaseAddr+XAXIVDMA_S2MM_ADDR_OFFSET+XAXIVDMA_START_ADDR_OFFSET+4)) );
   xil_printf( "\t S2MM_START_ADDR2 = 0x%08X\n\r", *((volatile int *)(uBaseAddr+XAXIVDMA_S2MM_ADDR_OFFSET+XAXIVDMA_START_ADDR_OFFSET+8)) );
   xil_printf( "\t S2MM_HSIZE       = 0x%08X\n\r", *((volatile int *)(uBaseAddr+XAXIVDMA_S2MM_ADDR_OFFSET+XAXIVDMA_HSIZE_OFFSET)) );
   xil_printf( "\t S2MM_VSIZE       = 0x%08X\n\r", *((volatile int *)(uBaseAddr+XAXIVDMA_S2MM_ADDR_OFFSET+XAXIVDMA_VSIZE_OFFSET)) );
   xil_printf( "\t ----------------\n\r" );
   xil_printf( "\t MM2S_DMACR       = 0x%08X\n\r", *((volatile int *)(uBaseAddr+XAXIVDMA_TX_OFFSET+XAXIVDMA_CR_OFFSET )) );
   xil_printf( "\t MM2S_DMASR       = 0x%08X\n\r", *((volatile int *)(uBaseAddr+XAXIVDMA_TX_OFFSET+XAXIVDMA_SR_OFFSET )) );
   xil_printf( "\t MM2S_STRD_FRMDLY = 0x%08X\n\r", *((volatile int *)(uBaseAddr+XAXIVDMA_MM2S_ADDR_OFFSET+XAXIVDMA_STRD_FRMDLY_OFFSET)) );
   xil_printf( "\t MM2S_START_ADDR0 = 0x%08X\n\r", *((volatile int *)(uBaseAddr+XAXIVDMA_MM2S_ADDR_OFFSET+XAXIVDMA_START_ADDR_OFFSET+0)) );
   xil_printf( "\t MM2S_START_ADDR1 = 0x%08X\n\r", *((volatile int *)(uBaseAddr+XAXIVDMA_MM2S_ADDR_OFFSET+XAXIVDMA_START_ADDR_OFFSET+4)) );
   xil_printf( "\t MM2S_START_ADDR2 = 0x%08X\n\r", *((volatile int *)(uBaseAddr+XAXIVDMA_MM2S_ADDR_OFFSET+XAXIVDMA_START_ADDR_OFFSET+8)) );
   xil_printf( "\t MM2S_HSIZE       = 0x%08X\n\r", *((volatile int *)(uBaseAddr+XAXIVDMA_MM2S_ADDR_OFFSET+XAXIVDMA_HSIZE_OFFSET)) );
   xil_printf( "\t MM2S_VSIZE       = 0x%08X\n\r", *((volatile int *)(uBaseAddr+XAXIVDMA_MM2S_ADDR_OFFSET+XAXIVDMA_VSIZE_OFFSET)) );
   xil_printf( "\t ----------------\n\r" );
   xil_printf( "\t S2MM_HSIZE_STATUS= 0x%08X\n\r", *((volatile int *)(uBaseAddr+0xF0 )) );
   xil_printf( "\t S2MM_VSIZE_STATUS= 0x%08X\n\r", *((volatile int *)(uBaseAddr+0xF4 )) );
   xil_printf( "\t ----------------\n\r" );
   return 0;
}
int vfb_check_errors(XAxiVdma *pAxiVdma, u8 bClearErrors )
{
   u32 uBaseAddr = pAxiVdma->BaseAddr;
   Xuint32 inErrors;
   Xuint32 outErrors;
   Xuint32 Errors;
   inErrors  = *((volatile int *)(uBaseAddr+XAXIVDMA_RX_OFFSET+XAXIVDMA_SR_OFFSET )) & 0x0000CFF0;
   outErrors = *((volatile int *)(uBaseAddr+XAXIVDMA_TX_OFFSET+XAXIVDMA_SR_OFFSET )) & 0x000046F0;
   xil_printf( "AXI_VDMA - Checking Error Flags\n\r" );
   Errors = (inErrors << 16) | (outErrors);
   if ( Errors )
   {
	   if ( inErrors & 0x00004000 )
	   {
          xil_printf( "\tS2MM_DMASR - ErrIrq\n\r" );
	   }
	   if ( inErrors & 0x00008000 )
	   {
          xil_printf( "\tS2MM_DMASR - EOLLateErr\n\r" );
	   }
	   if ( inErrors & 0x00000800 )
	   {
          xil_printf( "\tS2MM_DMASR - SOFLateErr\n\r" );
	   }
	   if ( inErrors & 0x00000400 )
	   {
          xil_printf( "\tS2MM_DMASR - SGDecErr\n\r" );
	   }
	   if ( inErrors & 0x00000200 )
	   {
          xil_printf( "\tS2MM_DMASR - SGSlvErr\n\r" );
	   }
	   if ( inErrors & 0x00000100 )
	   {
          xil_printf( "\tS2MM_DMASR - EOLEarlyErr\n\r" );
	   }
	   if ( inErrors & 0x00000080 )
	   {
          xil_printf( "\tS2MM_DMASR - SOFEarlyErr\n\r" );
	   }
	   if ( inErrors & 0x00000040 )
	   {
          xil_printf( "\tS2MM_DMASR - DMADecErr\n\r" );
	   }
	   if ( inErrors & 0x00000020 )
	   {
          xil_printf( "\tS2MM_DMASR - DMASlvErr\n\r" );
	   }
	   if ( inErrors & 0x00000010 )
	   {
          xil_printf( "\tS2MM_DMASR - DMAIntErr\n\r" );
	   }
	   if ( outErrors & 0x00004000 )
	   {
          xil_printf( "\tMM2S_DMASR - ErrIrq\n\r" );
	   }
	   if ( outErrors & 0x00000400 )
	   {
          xil_printf( "\tMM2S_DMASR - SGDecErr\n\r" );
	   }
	   if ( outErrors & 0x00000200 )
	   {
          xil_printf( "\tMM2S_DMASR - SGSlvErr\n\r" );
	   }
	   if ( outErrors & 0x00000080 )
	   {
          xil_printf( "\tMM2S_DMASR - SOFEarlyErr\n\r" );
	   }
	   if ( outErrors & 0x00000040 )
	   {
          xil_printf( "\tMM2S_DMASR - DMADecErr\n\r" );
	   }
	   if ( outErrors & 0x00000020 )
	   {
          xil_printf( "\tMM2S_DMASR - DMASlvErr\n\r" );
	   }
	   if ( outErrors & 0x00000010 )
	   {
          xil_printf( "\tMM2S_DMASR - DMAIntErr\n\r" );
	   }
	   xil_printf( "AXI_VDMA - Clearing Error Flags\n\r" );
	   *((volatile int *)(uBaseAddr+XAXIVDMA_RX_OFFSET+XAXIVDMA_SR_OFFSET )) = 0x0000CFF0;
	   *((volatile int *)(uBaseAddr+XAXIVDMA_TX_OFFSET+XAXIVDMA_SR_OFFSET )) = 0x000046F0;
   }
   return Errors;
}
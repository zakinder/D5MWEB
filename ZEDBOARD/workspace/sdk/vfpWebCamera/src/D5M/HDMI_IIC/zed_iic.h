#ifndef __ZED_IIC_H__
#define __ZED_IIC_H__
#include <stdio.h>
#include "xbasic_types.h"
#define ZED_IIC_CONTEXT_BUFFER_SIZE 32
struct struct_zed_iic_t
{
   // software library version
   Xuint32 uVersion;
   // instantiation-specific names
   char szName[32];
   // pointer to instantiation-specific data
   void *pContext;
   // context data (must be large enough to contain fmc_iic_axi_t or other implementations)
   unsigned char ContextBuffer[ZED_IIC_CONTEXT_BUFFER_SIZE];
   // function pointers to implementation-specific code
   int (*fpIicRead )(struct struct_zed_iic_t *, Xuint8 ChipAddress,
                                                Xuint8 RegAddress, 
                                                Xuint8 *pBuffer,
                                                Xuint8 ByteCount );
   int (*fpIicWrite)(struct struct_zed_iic_t *, Xuint8 ChipAddress,
                                                Xuint8 RegAddress, 
                                                Xuint8 *pBuffer,
                                                Xuint8 ByteCount );
};
typedef struct struct_zed_iic_t zed_iic_t;
// Initialization routine for AXI_IIC implementation
int zed_iic_axi_init( zed_iic_t *pIIC, char szName[], Xuint32 CoreAddress );
#endif // __ZED_IIC_H__
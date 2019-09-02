#ifndef __PROT_MALLOC_H_
#define __PROT_MALLOC_H_
#include "lwip/mem.h"
void *prot_mem_malloc(mem_size_t n);
void prot_mem_free(void *a);
#endif

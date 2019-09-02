#include "lwip/sys.h"
#include "prot_malloc.h"
void *prot_mem_malloc(mem_size_t n)
{
	void *p;
	SYS_ARCH_DECL_PROTECT(lev);
	SYS_ARCH_PROTECT(lev);
	p = mem_malloc(n);
	SYS_ARCH_UNPROTECT(lev);
	return p;
}
void prot_mem_free(void *a)
{
	SYS_ARCH_DECL_PROTECT(lev);
	SYS_ARCH_PROTECT(lev);
	mem_free(a);
	SYS_ARCH_UNPROTECT(lev);
}

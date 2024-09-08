#include <elysiumos/kmalloc.h>
#include <elysiumos/system.h>

void kernelInit(void);

void __attribute__((noreturn)) __kernel_entry(void)
{
    kernelInit();
    hangUpSystem(); //if ever...
}

void kernelInit(void)
{
    mallocInit();
    hangUpSystem(); //here until systems are built fully (until published to github)
}

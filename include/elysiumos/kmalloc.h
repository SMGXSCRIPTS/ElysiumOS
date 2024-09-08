#pragma once
#ifndef __ELYSIUMOS_KERNEL_MEMORY_HEAP_ALLOCATOR_H
#define __ELYSIUMOS_KERNEL_MEMORY_HEAP_ALLOCATOR_H 1

#include <elysiumos/memory.h>

#define MEMORY_MALLOC_BEGIN 0x20001

typedef struct {
    unsigned int iMemoryTotal;
    unsigned int iMemoryUsed;
    unsigned int iMemoryFree;
    unsigned int iMemoryReserved;
    unsigned int iMemoryKernelReserved; //end of kernel stack: 0x20000
} systemMemoryInfoBlock_t;

// Most systems here are private to prevent tampering with system memory

void  mallocInit(void);
void* kmalloc(unsigned int iMemorySize);
void  kfree(void* pMemoryPtr);

systemMemoryInfoBlock_t* returnSystemMemoryInfo(void);

#endif//__ELYSIUMOS_KERNEL_MEMORY_HEAP_ALLOCATOR_H

[bits 16]

MEMORY_REGION_COUNT  equ 0x5002
MEMORY_REGION_BUFFER equ 0x5003

memoryMap:
    pusha
    mov di, MEMORY_REGION_BUFFER
    mov edx, 0x534D4150
    xor eax, eax

memoryMapLoop:
    mov eax, 0x0000E820
    mov ecx, 0x00000018
    int 0x15

    cmp ebx, 0x00
    je memoryMapDone

    add di, 0x0018
    add [MEMORY_REGION_COUNT], byte 0x01
    jmp memoryMapLoop

memoryMapDone:
    popa
    ret

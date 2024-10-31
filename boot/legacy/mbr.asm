[bits 16]
[org 0x7C00]

MEMORY_KERNEL_OFFSET equ 0x8000
MEMORY_BOOT_DRIVE    equ 0x5001

__elysiumBootloaderEntry:
    mov byte [MEMORY_BOOT_DRIVE], dl

    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov fs, ax
    mov gs, ax
    mov bp, 0x7C00
    mov sp, bp
    sti

    call print16Clear
    call enableA20
    call loadKernel
    call memoryMap
    jmp  switch32

%include "switch64.asm"
%include "switch32.asm"
%include "print64.asm"
%include "print32.asm"
%include "print16.asm"
%include "paging.asm"
%include "cpuid.asm"
%include "mmap.asm"
%include "disk.asm"
%include "gdt.asm"

[bits 16]
enableA20:
    push ax
    mov ah, 0x92
    in  al, ah
    or  al, 0x02
    out ah, al
    pop ax
    ret

loadKernel:
    pusha
    mov bx, KERNEL_OFFSET
    mov dh, 0xFF
    mov dl, byte [MEMORY_BOOT_DRIVE]
    call diskLoad
    popa
    ret

[bits 64]
beginLong:
    mov rsi, LONG_MODE_ENABLED_MESSAGE
    call print64
    xor rsi, rsi
    jmp MEMORY_KERNEL_OFFSET

LONG_MODE_ENABLED_MESSAGE:
    db "Long Mode Enabled!", 0x00

times 510 - ($ - $$) db 0x00
dw 0xAA55

[bits 16]
[org 0x7C00]

KERNEL_MEMORY_OFFSET equ 0x8000

_start:
    mov [BOOT_DRIVE], dl ;save boot drive
    
    cli
    mov ax, 0x0000
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov bp, 0x7BFF ;bad idea but fuck it
    mov sp, bp
    sti
    
    call print16_clear
    
    call enableA20
    call loadKernel
    jmp  switch32 ;update to be 64bit long mode

%include "switch32.asm"
%include "print32.asm"
%include "print16.asm"
%include "disk.asm"
%include "gdt.asm"

[bits 16]
enableA20:
    pusha
    mov al, 0xD1
    out 0x64, al
    mov al, 0x02
    out 0x60, al
    popa
    ret

loadKernel:
    mov bx, KERNEL_MEMORY_OFFSET
    mov dh, 0x20
    mov dl, [BOOT_DRIVE]
    call diskLoad
    mov bx, KERNEL_LOADED_MSG
    call print16
    call print16_nl
    ret

[bits 32]
begin32:
    mov ebx, PROTECTED_MODE_MSG
    call print32
    jmp KERNEL_MEMORY_OFFSET

BOOT_DRIVE db 0x00

PROTECTED_MODE_MSG:
    db "[INFO] Landed In 32-Bit Land!", 0x00

KERNEL_LOADED_MSG:
    db "[INFO] Loaded Kernel Into 0x8000!", 0x00

times 510 - ($ - $$) db 0x00
dw 0xAA55

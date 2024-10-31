[bits 16]
switch32:
    cli
    lgdt [gdtDesc]
    mov eax, cr0
    or  eax, 0x00000001
    mov cr0, eax
    jmp CODE_SEG:initPM

[bits 32]
initPM:
    mov ax, DATA_SEG
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x00007C00
    mov esp, ebp

    jmp switch64

[bits 16]
switch32:
    cli ;fuck the 16bit bios interrupts, we dont need them
    lgdt [gdt_desc]
    mov eax, cr0
    or  eax, 0x1
    mov cr0, eax
    jmp CODE_SEG:init_pm

[bits 32]
init_pm:
    mov ax, DATA_SEG
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov fs, ax
    mov gs, ax
    
    mov ebp, 0x20000 ;i feel like this is gonna be a problem in the future...
    mov esp, ebp
    
    jmp begin32

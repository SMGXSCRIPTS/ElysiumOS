[bits 32]
switch64:
    pusha
    call checkCPUID
    call setupPaging

    mov eax, cr4
    or  eax, 0x00000010
    mov cr4, eax

    mov ecx, 0xC0000080
    rdmsr
    or eax, 0x00000080
    wrmsr

    mov eax, cr0
    or  eax, 0x40000000
    mov cr0, eax

    call gdtEdit
    call activateSSE

    popa
    jmp CODE_SEG:beginLong

[bits 64]
activateSSE:
    push rax
    mov rax, cr0
    and ax,  0x00FD
    or  ax,  0x0001
    mov cr0, rax
    pop rax
    ret

[bits 32]

PAGE_TABLE_ENTRIES equ 0x1000

setupPaging:
    pusha
    mov edi, PAGE_TABLE_ENTRIES
    mov cr3, edi

    mov dword [edi], 0x00002003
    add edi, 0x00001000
    mov dword [edi], 0x00003003
    add edi, 0x00001000
    mov dword [edi], 0x00004003
    add edi, 0x00001000

    mov ebx, 0x00000003
    mov ecx, 0x00000200

setupPagingLoop:
    cmp ecx, 0x00000000
    je setupPagingDone
    sub ecx, 0x00000001
    mov dword [edi], ebx
    add ebx, 0x00001000
    add edi, 0x00000008
    jmp setupPagingLoop

setupPagingDone:
    popa
    ret

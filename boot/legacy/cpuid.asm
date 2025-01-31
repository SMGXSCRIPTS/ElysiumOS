[bits 32]
checkCPUID:
    pusha
    pushfd
    pop eax

    mov ecx, eax
    xor eax, 0x00100000
    push eax
    popfd

    pushfd
    pop eax

    push ecx
    popfd

    xor eax, ecx
    jz unsupportedCPU

    call checkFeatures
    popa
    ret

checkFeatures:
    pusha
    mov eax, 0x80000001
    cpuid
    test edx, 0x10000000
    jz unsupportedCPU
    test edx, 0x01000000
    jz unsupportedCPU
    popa
    ret

unsupportedCPU:
    mov esi, CPU_NOT_SUPPORTED_MESSAGE
    call print32
    hlt

CPU_NOT_SUPPORTED_MESSAGE:
    db "CPU Not Supported!", 0x00

[bits 32]
print32:
    pusha
    mov ah, 0x0F
    mov edx, 0xB8000
    jmp print32_loop

print32_loop:
    mov al, [ebx]
    cmp al, 0x00
    je print32_done
    mov [edx], ax
    add ebx, 1
    add edx, 2
    jmp print32_loop

print32_done:
    popa
    ret

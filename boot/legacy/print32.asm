[bits 32]
print32:
    pusha
    mov ah,  0x0F
    mov ebx, 0x000B8000

print32Loop:
    mov al, [esi]
    cmp al, 0x00
    je print32Done
    mov [ebx], ax
    add esi, 0x00000001
    add ebx, 0x00000002
    jmp print32Loop

print32Done:
    popa
    ret

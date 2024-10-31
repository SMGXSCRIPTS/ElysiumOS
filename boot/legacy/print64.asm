[bits 64]
print64:
    pusha
    mov ah,  0x0F
    mov rbx, 0x00000000000B8000

print64Loop:
    mov al, [rsi]
    cmp al, 0x00
    je print64Done
    mov [rbx], ax
    add rsi, 0x0000000000000001
    add rbx, 0x0000000000000002
    jmp print64Loop

print64Done:
    popa
    ret

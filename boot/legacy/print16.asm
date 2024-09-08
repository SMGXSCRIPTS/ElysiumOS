[bits 16]
print16:
    pusha
    mov ah, 0x0E
    jmp print16_loop

print16_loop:
    mov al, [bx]
    cmp al, 0x00
    je print16_done
    int 0x10
    add bx, 1
    jmp print16_loop

print16_done:
    popa
    ret

print16_clear:
    pusha
    mov ah, 0x00
    mov al, 0x03
    int 0x10
    popa
    ret

print16_nl:
    pusha
    mov ah, 0x0E
    mov al, 0x0A
    int 0x10
    mov al, 0x0D
    int 0x10
    popa
    ret

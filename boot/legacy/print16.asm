[bits 16]
print16:
    push ax
    mov ah, 0x0E

print16Loop:
    mov al, [si]
    cmp al, 0x00
    je print16Done
    int 0x10
    add si, 0x01
    jmp print16Loop

print16Done:
    pop ax
    ret

print16Clear:
    push ax
    mov ah, 0x00
    mov al, 0x03
    int 0x10
    popa
    ret

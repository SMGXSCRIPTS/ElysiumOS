[bits 16]
diskLoad:
    pusha
    push dx

    mov ah, 0x02
    mov al, dh
    mov ch, 0x00
    mov cl, 0x02
    mov dh, 0x00

    int 0x13
    jc diskError

    pop dx
    cmp al, dh
    jne sectorError

    popa
    ret

diskError:
    mov si, DISK_ERROR_MESSAGE
    call print16
    hlt

sectorError:
    mov si, SECTOR_ERROR_MESSAGE
    call print16
    hlt

DISK_ERROR_MESSAGE:
    db "Disk Error!", 0x00

SECTOR_ERROR_MESSAGE:
    db "Disk Sector Error!", 0x00

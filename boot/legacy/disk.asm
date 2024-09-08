[bits 16]
diskLoad:
    pusha
    push dx ;we need to save dh
    
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
    mov bx, DISK_ERROR_MSG
    call print16
    hlt
    jmp $ ;if halt fails just sit here forever

sectorError:
    mov bx, SECTOR_ERROR_MSG
    call print16
    hlt
    jmp $ ;if halt fails just sit here forever

DISK_ERROR_MSG:
    db "[ERROR] Disk Failure!", 0x00

SECTOR_ERROR_MSG:
    db "[ERROR] Disk Sector Failure!", 0x00

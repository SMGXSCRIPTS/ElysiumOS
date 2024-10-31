[bits 32]
gdtStart:
    dd 0x00000000
    dd 0x00000000

gdtCode:
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 0x9A
    db 0xCF
    db 0x00

gdtData:
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 0x92
    db 0xCF
    db 0x00

gdtEnd:
    ; End Label

gdtDesc:
    dw gdtEnd - gdtStart - 1
    dd gdtStart

gdtModify:
    mov [gdtCode + 0x06], byte 0xAF
    mov [gdtData + 0x06], byte 0xAF
    ret

CODE_SEG equ gdtCode - gdtStart
DATA_SEG equ gdtData - gdtStart

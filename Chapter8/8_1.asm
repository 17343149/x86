    jmp start

section data1 align=16 vstart=0
    lba db 0x55, 0xf0

section data2 align=16 vstart=0
    lbb db 0x00, 0x90
    lbc dw 0xf000

section data3 align=16 
    lbd dw 0xfff0, 0xfffc

start:
    mov ax, lba
    mov ax, lbc
    mov ax, lbd

    times 0x1fd - 0x3c db 0x00
    dw 0xaa55
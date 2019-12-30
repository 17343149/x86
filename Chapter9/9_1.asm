; 检测点9.1
; 编写一个简单的程序(主引导记录)使用sti与cli观察IF标志位的变化

section start vstart=0
    mov ax, 0x07c0
    mov ds, ax
    sti
    cli

    times 510 - ($-$$) db 0x00
    dw 0xaa55
; @chapter 6, problem 2
; @brief: 声明一些有符号数, 计算正数和负数有多少

    jmp start

    data1 db 0x05, 0xff, 0x80, 0xf0, 0x97, 0x30
    data2 dw 0x90, 0xfff0, 0xa0, 0x1235, 0x2f, 0xc0, 0xc5bc
    res db 'p', 0x07, 'o', 0x07, 's', 0x07, ':', 0x07, '0', 0x04, 'n', 0x07, 'e', 0x07, 'g', 0x07, ':', 0x07, '0', 0x04

start: 
    mov ax, 0x7c0   ;初始化ds和es
    mov ds, ax

    mov ax, 0xb800
    mov es, ax

    mov bx, data1
    xor si, si
    mov cx, 6
judge_data1:
    xor ax, ax
    mov al, [bx + si]
    cmp al, 0
    mov di, 8
    jg inc_res
    mov di, 18
    jl inc_res
    condition inc si
    loop judge_data1

    mov bx, data2
    xor si, si
    mov cx, 7

judge_data2:
    mov ax, [bx + si]
    cmp ax, 0
    mov di, 8
    jg data2_inc_res
    mov di, 18
    jl data2_inc_res
    data2_condition add si, 2
    loop judge_data2

print_res:
    cld
    mov si, res
    mov di, 0
    mov cx, (start - res)
    rep movsb
    jmp $

inc_res:
    inc byte [res + di]
    jmp condition

data2_inc_res:
    inc byte [res + di]
    jmp data2_condition

    times 510-($-$$) db 0x00
    db 0x55, 0xaa

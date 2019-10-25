; 7_2
; 用16位寄存器实现32位加法
; program: 1 + 2 + ... + 1000
; 2019/10/25

; bochs显示41748 7
; 即ax = 41748, dx = 7
; num = 7 * 65536 + 41748 = 500500 = 1 + ... + 1000

    mov ax, 0x07c0
    mov ds, ax
    mov ax, 0xb800
    mov es, ax

    xor ax, ax      ; low 16-bit in ax
    xor dx, dx      ; high 16-bit in dx, 32-bit totally
    mov cx, 1000
summation:
    add ax, cx
    adc dx, 0
    loop summation

    xor bx, bx
    mov ss, bx
    mov sp, bx

    mov bx, dx      ; bx = dx
    mov si, 10
    xor cx, cx
cal_ax:
    inc cx
    xor dx, dx
    div si 
    add dl, 0x30    
    push dx
    cmp ax, 0
    jne cal_ax

    xor di, di
show_ax:
    pop ax
    mov [es:di], al
    inc di
    mov byte [es:di], 0x07
    inc di
    loop show_ax

    mov ax, bx
    mov byte [es:di], 0x0
    inc di
    mov byte [es:di], 0x07
    inc di
cal_dx:
    inc cx
    xor dx, dx
    div si
    add dl, 0x30
    push dx
    cmp ax, 0
    jne cal_dx

show_dx:
    pop ax
    mov [es:di], al
    inc di
    mov byte [es:di], 0x07
    inc di
    loop show_dx

    times 510-($-$$) db 0
    db 0x55, 0xAA
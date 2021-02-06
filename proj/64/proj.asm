; segment .data
;     counter:    dd  0


segment .text
    global AreaA

%define SET1 rsp
%define SET2 rsp + 16
%define counter rsp + 32
AreaA:
    sub rsp, 36
    ;rdi:   n
    ;rsi    list

    mov rax, 1

    xorpd xmm1, xmm1
    movupd xmm3, xmm1
    movupd xmm4, xmm3

    mov rcx, rdi
    dec rcx
    cmp rcx, 4
    jle one_iteration_loop
    four_iteration_loop:
        mov rax, [counter]
        inc rax
        mov rdx, 0
        div rdi
        movupd xmm0, [rsi + rdx * 4 + 4]
        movupd [SET1], xmm0

        mov rax, [counter]
        inc rax
        mov rdx, 0
        div rdi
        movupd xmm0, [rsi + rdx * 4]
        movupd [SET2], xmm0

        movupd xmm0, [SET1]
        mov rdx, [counter]
        mulpd xmm0, [rsi + rdx * 4]
        addpd xmm3, xmm0

        movupd xmm0, [SET2]
        mov rax, [counter]
        mulpd xmm0, [rsi + rax * 4 + 4]
        subpd xmm3, xmm0 ;end of op

        sub dword [counter], 4
        sub rcx, 4

        mov rax, rdi
        dec rax
        sub rax, 4
        sub rax, rcx
        ja four_iteration_loop

    one_iteration_loop:
        mov rax, [counter]
        inc rax
        mov rdx, 0
        div rdi
        movups xmm0, [rsi + rdx * 4 + 4]
        movups [SET1], xmm0

        mov rax, [counter]
        inc rax
        mov rdx, 0
        div rdi
        movups xmm0, [rsi + rdx * 4]
        movups [SET2], xmm0

        movups xmm0, [SET1]
        mov rax, [counter]
        mulps xmm0, [rsi + 4 * rax]
        addps xmm4, xmm0

        movups xmm0, [SET2]
        mov rax, [counter]
        mulps xmm0, [rsi + rax * 4 + 4]
        subps xmm4, xmm0 ;end of op

        sub dword [counter], 1
        sub rcx, 1

        mov rax, rdi
        dec rax
        sub rax, rcx
        ja one_iteration_loop

    end_of_one_iteration_loop:
        movupd [SET1], xmm3
        movsd xmm0, [SET1]
        addsd xmm0, [SET1 + 4]
        addsd xmm0, [SET1 + 8]
        addsd xmm0, [SET1 + 12]

        movupd [SET1], xmm3
        addsd xmm0, [SET1]
        addsd xmm0, [SET1 + 4]
        addsd xmm0, [SET1 + 8]
        addsd xmm0, [SET1 + 12]

        ret

section .data
align 16
minusone: dq -1.0
zero: dq 0.0
dtwo: dq 2.0


section .text
    global AreaA
%define COUNTER rbp - 40
%define SET1 rbp - 32
%define SET2 rbp - 16
AreaA:
    ;rdi:   n
    ;rsi    list
    ;rbp - 40 -> rbp - 33 counter
    ;rbp - 32 -> rbp - 17 SET1
    ;rbp - 16 -> rbp - 1 SET2
    push rbp
    mov rbp, rsp
    push rcx
    push rbx
    push rdx
    mov rax, 1

    xorps xmm0, xmm0
    xorps xmm1, xmm1
    xorps xmm2, xmm2
    xorps xmm3, xmm3
    xorps xmm4, xmm4


    mov rcx, rdi
    sub rcx, 1
    mov qword [COUNTER], 0
    loop1:
        mov rdx, 0
        mov rbx, [COUNTER]
        imul rbx, 2
        movupd xmm1, [rsi + 8 * rbx]

        mov rbx, [COUNTER]
        inc rbx
        imul rbx, 2

        movupd [SET2], xmm1
        mov rax, [SET2+8]
        mov [SET1], rax
        mov rax, [SET2]
        mov [SET1+8], rax
        movupd xmm1, [SET1]
        ;reverse xmm1

        mulpd xmm1, [rsi + 8 * rbx]

        movupd [SET1], xmm1
        movsd xmm2 ,[SET1 + 8]
        addsd xmm0, xmm2
        subsd xmm0, xmm1

        mov rax, [COUNTER]
        inc rax
        mov [COUNTER], rax
        loop loop1

    movsd xmm1, [dtwo]
    divsd xmm0, xmm1

    movsd xmm1, [minusone]
    movq [zero], xmm0
    cmp qword [zero], 0
    jl negative
    mulsd xmm0, xmm1
    negative:
    mulsd xmm0, xmm1
    pop rdx
    pop rbx
    pop rcx
    pop rbp
    ret

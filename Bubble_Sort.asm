%include "asm_io.inc"

segment .bss

    array: resd 1000

segment .text
    global  asm_main
asm_main:
    enter   0,0
    pusha

    call read_int
    mov ebx, eax

    mov ecx, 0

    input_loop:
        call read_int
        mov dword [4 * ecx + array], eax

        inc ecx
        cmp ecx, ebx
        jl input_loop
    
    ; -----------------------------------------------------

    mov ecx, 0 ; i = 0

    outer_loop:
        cmp ecx, ebx
        jge outer_loop_end

        mov edx, ecx
        inc edx ; j = i + 1

        inner_loop:
            cmp edx, ebx
            jge inner_loop_end

            mov esi, dword [ecx * 4 + array]
            mov edi, dword [edx * 4 + array]
            cmp esi, edi
            jle skip_swap
                mov dword [ecx * 4 + array], edi
                mov dword [edx * 4 + array], esi
            skip_swap:

            inc edx
            jmp inner_loop
        inner_loop_end:

        inc ecx
        jmp outer_loop
    outer_loop_end:

    ; -----------------------------------------------------

    mov ecx, 0
    output_loop:
        mov eax, dword [4 * ecx + array]

        call print_int
        call print_nl

        inc ecx
        cmp ecx, ebx
        jl output_loop

    popa
    leave
    ret
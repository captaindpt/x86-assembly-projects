
segment .text
global gcd

gcd:
    push ebp
    mov ebp, esp

    cmp dword [ebp+12], 0
    jne not_zero
    mov eax, [ebp+8]
    jmp gcd_end

    not_zero:
    mov eax, [ebp+8]
    xor edx, edx
    div dword [ebp+12]

    push edx
    push dword [ebp+12]
    call gcd
    add esp, 8

    gcd_end:
    pop ebp
    ret

segment .text
global lcm
extern gcd
lcm:
    push ebp
    mov ebp, esp

    push dword [ebp+8]
    push dword [ebp+12]
    call gcd
    add esp, 8
    mov ecx, eax

    mov eax, [ebp+12]
    xor edx, edx
    mul dword [ebp+8]

    xor edx, edx
    div ecx

    pop ebp
    ret

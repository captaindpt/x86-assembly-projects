%define N [ebp + 8]
%define ARRAY [ebp + 12]
segment .data
dtwo:       dq 2.0
dzero:      dq 0.0
area:       dq 0.0
counter:    dd 0
listi0:     dq 1.0
listi1:     dq 1.0
tomul0:     dq 1.0
tomul1:     dq 1.0
temp:       dq 0
segment .text

global AreaA

AreaA:
    push ebp
    mov ebp, esp
    push edx
    push ebx
    push esi
    push ecx

    cld
    fld qword [dzero]
    mov ecx, N
    dec ecx
    mov ebx, ARRAY
    loop1:
        mov edx, 0
        mov esi, 2
        mov eax, [counter]
        mul esi
        fld qword [ebx + 8 * eax]
        ;list[i][0]

        mov edx, 0
        mov esi, [counter]
        inc esi
        mov eax, esi
        mov esi, 2
        mul esi
        fld qword [ebx + 8 * eax + 8]
        ;list[(i+1)%n][1]

        fmulp ST1
        faddp ST1
        ;add first part to sum

        mov edx, 0
        mov esi, 2
        mov eax, [counter]
        mul esi
        fld qword [ebx + 8 * eax + 8]
        ;list[i][1]

        mov edx, 0
        mov esi, [counter]
        inc esi
        mov eax, esi
        mov esi, 2
        mul esi
        fld qword[ebx + 8 * eax]
        ;list[(i+1)%n][0]

        fmulp ST1
        fsubp ST1

        mov eax, [counter]
        inc eax
        mov [counter], eax
        dec ecx
        jnz loop1

    fcom qword [dzero]
    jle negative
    fchs
    negative:
    fld qword [dtwo]
    fdivp ST1
    fchs
    end:
    pop ecx
    pop esi
    pop ebx
    pop edx
    pop ebp
    ret

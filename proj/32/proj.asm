segment .data
dtwo:       dq 2.0
dzero:      dq 0.0
area:       dq 1.0
counter:    dq 0
listi0:     dq 1.0
listi1:     dq 1.0
tomul0:     dq 1.0
tomul1:     dq 1.0
temp:       dq 0
segment .text

global AreaA
%define ARRAY [ebp+8]
%define N [ebp+12]
AreaA:
    push ebp
    mov ebp, esp
    push edx
    push ebx
    push esi
    push ecx

    cld
    mov ecx, N
    dec ecx
    mov ebx, ARRAY
    loop1:
        mov eax, [counter]
        mov esi, N
        mov edx, 0
        mul esi
        FLD qword [ebx + 8 * eax]
        FSTP qword [listi0] ;list[i][0]

        mov ebx, N
        inc ebx
        mov eax, [counter]
        inc eax
        mov edx, 0
        div ebx

        mov ebx, ARRAY
        mov esi, N
        FLD qword [ebx + 8 * edx + 8]
        FSTP qword [tomul0] ;list[(i+1)%n][1]

        mov edx, [counter]
        FLD qword [ebx + 8 * edx + 8]
        FSTP qword [listi1] ;list[i][1]

        mov esi, [counter]
        inc esi
        mov eax, esi
        mov edx, 0
        mov esi, N
        div esi
        mov ebx, ARRAY
        mov eax, N
        FLD qword [ebx + 8 * eax]
        FSTP qword [tomul1] ;list[(i+1)%n][0]

        ;multiplying the elements
        FLD qword [listi0]
        FLD qword [tomul0]
        FMUL ST1 ;is ST2 after below operation

        FLD qword [listi1]
        FLD qword [tomul1]
        FMUL ST1

        ;subtracting the elements
        FSUBR ST2

        FADD qword [area]
        FST qword [area]

        inc dword [counter]
        dec ecx
        jnz loop1

    FLD qword [dzero]
    FLD qword [area]
    FCOMI ST1
    ja isabove

    FLD qword [area]
    FDIV qword [dtwo]
    FCHS
    jmp end

    isabove:
    FLD qword [area]
    FDIV qword [dtwo]

    end:
    pop ecx
    pop esi
    pop ebx
    pop edx
    pop ebp
    ret

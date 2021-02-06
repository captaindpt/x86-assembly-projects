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

global AreaC
%define ARRAY [ebp+8]
%define N [ebp+12]
AreaC:
    push ebp
    mov ebp, esp
    push edx
    push ebx
    push esi

    mov ecx, N
    mov ebx, ARRAY
    loop1:
        mov edx, N
        FLD qword [ebx+counter*4*edx]
        FSTP qword [listi0]

        mov ebx, N
        inc ebx
        mov eax, [counter]
        inc eax
        mov edx, 0
        div ebx

        mov ebx, ARRAY
        mov esi, N
        FLD qword [ebx+edx*4+4]
        FSTP qword [tomul0]

        mov edx, [counter]
        FLD qword [ebx+edx*4+4]
        FSTP qword [listi1]

        mov esi, [counter]
        inc esi
        mov eax, esi
        mov edx, 0
        mov esi, N
        div esi
        mov ebx, ARRAY
        mov eax, N
        FLD qword [ebx+4*eax]
        FSTP qword [tomul1]

        FLD qword [listi0]
        FLD qword [tomul0]
        FMUL ST1 ;is ST2 after below operation

        FLD qword [listi1]
        FLD qword [tomul1]
        FMUL ST1

        FSUBR ST2

        FADD qword [area]
        FST qword [area]

        inc dword [counter]
        loop loop1

    FLD [dzero]
    FLD [area]
    FCOMI ST1
    ja isabove

    FLD [area]
    FDIV [dtwo]
    FCHS
    jmp end

    isabove:
    FLD [area]
    FDIV [dtwo]

    end:
    pop esi
    pop ebx
    pop edx
    pop ebp
    ret

%include "asm_io.inc"

segment .data
asc:     db "Ascending", 10, 0
not_asc: db "Not", 10, 0

segment .text

global asm_main

asm_main:
enter 0, 0
pusha

call read_int
mov ebx, eax
mov ecx, 0
mov edx, 1
mov esi, 10

loop:
cmp ebx, 10
jl is_asc
sub ebx, 10
inc ecx
cmp ebx, 10
jle loop1
jmp loop
    
loop1:
cmp ebx, esi
jge isnot_asc

mov esi, ebx
mov ebx, ecx
mov ecx, 0 
jmp loop


isnot_asc:
mov eax, not_asc
mov edx, 4
jmp finish

is_asc:
mov eax, asc
mov edx, 10
jmp finish

finish:
call print_string

popa
leave 
ret


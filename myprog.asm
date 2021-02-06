%include "asm_io.inc"

segment .text

global asm_main

asm_main:
	enter 0, 0
	pusha
	
	call read_int
	add eax, 78
	add eax, eax
	add eax, eax
	add eax, eax
	mov ebx, eax
	call read_int
	sub eax, 102
	add eax, eax
	sub ebx, eax
	mov eax, ebx
	call print_int
	call print_nl
	
	popa
	leave 
	ret

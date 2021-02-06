%include "asm_io.inc"
segment .data
sequence: times 1000 db 0
size_of_arr: dw 0, 0
bin_pattern: db 00011000b
seq_sum: dw 0, 0
error_msg: db "error", 10, 0
counter: dw 0, 0
cmp_byte: db 0, 0

segment .text
global asm_main
asm_main:
	enter 0, 0
	pusha
	call input
	call check_seq
	call print_result
	call print_arr
end:
	popa
	leave
	ret


input: ;this func works
	enter 0, 0
	push ecx
	push edx
	mov ecx, 1000
	mov edx, sequence
	l1:
		call read_char
		cmp eax, 48
		je add_zero
		cmp eax, 49
		je add_one
		stop_input:
			pop edx
			pop ecx
			leave
			ret
		add_one:
			mov byte [edx], 0xff
			add edx, 4
			inc DWORD [size_of_arr]
			loop l1
		add_zero:
			mov byte [edx], 0x00
			add edx, 4
			inc DWORD [size_of_arr]
			loop l1

	pop edx
	pop ecx
	leave
	ret


check_seq:
	enter 0, 0
	push ecx
	push eax

	mov ecx, [size_of_arr]
	sub ecx, 8
	mov DWORD [counter], 0x00
	l4:
		mov byte [cmp_byte], 0x00
		call gen_cmp_byte
		mov al, cmp_byte
		mov ah, bin_pattern
		xor al, ah
		cmp al, 0x00
		je add_to_sum
		;if not equal then
		inc DWORD [counter]
		loop l4

		pop eax
		pop ecx
		leave
		ret
		add_to_sum:
			inc DWORD [seq_sum]
			inc DWORD [counter]
			loop l4
	pop eax
	pop ecx
	leave
	ret

gen_cmp_byte:
	enter 0, 0
	push ecx
	push edx
	mov byte [cmp_byte], 0x00
	cmp DWORD [counter], 0x00
	je l3

	mov ecx, [counter]
	mov edx, sequence
	l2:
		add edx, 4
		loop l2
	mov ecx, 8
	l3:
		cmp BYTE [edx], 0xff
		je add_bin_one
		cmp BYTE [edx], 0x00
		je add_bin_zero
		jmp func3_end

		add_bin_one:
			inc byte [cmp_byte]
			shl byte [cmp_byte], 1
			add edx, 4
			loop l3
		add_bin_zero:
			shl byte [cmp_byte], 1
			add edx, 4
			loop l3

	func3_end:
	pop edx
	pop ecx
	leave
	ret

print_result:
	enter 0, 0

	mov eax, [seq_sum]
	call print_int

	leave
	ret


print_error: ;this func works
	enter 0, 0
	mov eax, error_msg
	call print_string
	leave
	ret

print_arr: ;this func works
	enter 0, 0
	push ecx
	push ebx

	mov eax, [size_of_arr]
	call print_int
	call print_nl

	mov ebx, sequence
	mov ecx, [size_of_arr]
	lo1:
		mov eax, [ebx]
		call print_int
		call print_nl
		add ebx, 4
		loop lo1

	pop ebx
	pop ecx
	leave
	ret

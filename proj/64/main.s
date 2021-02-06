	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%lf%lf"
.LC2:
	.string	"%lf\n"
.LC3:
	.string	"%ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 88
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -56[rbp], rax
	xor	eax, eax
	mov	rax, rsp
	mov	rbx, rax
	lea	rax, -128[rbp]
	mov	rsi, rax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -128[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -120[rbp], rdx
	movsx	rdx, eax
	mov	r14, rdx
	mov	r15d, 0
	movsx	rdx, eax
	mov	r12, rdx
	mov	r13d, 0
	cdqe
	sal	rax, 4
	mov	rdx, rax
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	ecx, 16
	mov	edx, 0
	div	rcx
	imul	rax, rax, 16
	mov	rdx, rax
	and	rdx, -4096
	mov	rcx, rsp
	sub	rcx, rdx
	mov	rdx, rcx
.L2:
	cmp	rsp, rdx
	je	.L3
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L2
.L3:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L4
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L4:
	mov	rax, rsp
	add	rax, 7
	shr	rax, 3
	sal	rax, 3
	mov	QWORD PTR -112[rbp], rax
	mov	DWORD PTR -124[rbp], 0
	jmp	.L5
.L6:
	mov	eax, DWORD PTR -124[rbp]
	cdqe
	sal	rax, 4
	lea	rdx, 8[rax]
	mov	rax, QWORD PTR -112[rbp]
	add	rdx, rax
	mov	eax, DWORD PTR -124[rbp]
	cdqe
	sal	rax, 4
	mov	rcx, rax
	mov	rax, QWORD PTR -112[rbp]
	add	rax, rcx
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	DWORD PTR -124[rbp], 1
.L5:
	mov	eax, DWORD PTR -128[rbp]
	cmp	DWORD PTR -124[rbp], eax
	jl	.L6
	lea	rax, -96[rbp]
	mov	rsi, rax
	mov	edi, 0
	call	clock_gettime@PLT
	mov	eax, DWORD PTR -128[rbp]
	mov	rdx, QWORD PTR -112[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	AreaA@PLT
	movq	rax, xmm0
	mov	QWORD PTR -104[rbp], rax
	lea	rax, -80[rbp]
	mov	rsi, rax
	mov	edi, 0
	call	clock_gettime@PLT
	mov	rax, QWORD PTR -104[rbp]
	movq	xmm0, rax
	lea	rdi, .LC2[rip]
	mov	eax, 1
	call	printf@PLT
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -88[rbp]
	sub	rdx, rax
	mov	rax, rdx
	mov	rsi, rax
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	mov	rsp, rbx
	mov	rbx, QWORD PTR -56[rbp]
	xor	rbx, QWORD PTR fs:40
	je	.L8
	call	__stack_chk_fail@PLT
.L8:
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	AreaC
	.type	AreaC, @function
AreaC:
.LFB1:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -32[rbp], rsi
	pxor	xmm0, xmm0
	movsd	QWORD PTR -8[rbp], xmm0
	mov	DWORD PTR -12[rbp], 0
	jmp	.L10
.L11:
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	sal	rax, 4
	mov	rdx, rax
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	movsd	xmm1, QWORD PTR [rax]
	mov	eax, DWORD PTR -12[rbp]
	add	eax, 1
	cdq
	idiv	DWORD PTR -20[rbp]
	mov	eax, edx
	cdqe
	sal	rax, 4
	mov	rdx, rax
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	movsd	xmm0, QWORD PTR 8[rax]
	mulsd	xmm0, xmm1
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	sal	rax, 4
	mov	rdx, rax
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	movsd	xmm2, QWORD PTR 8[rax]
	mov	eax, DWORD PTR -12[rbp]
	add	eax, 1
	cdq
	idiv	DWORD PTR -20[rbp]
	mov	eax, edx
	cdqe
	sal	rax, 4
	mov	rdx, rax
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	movsd	xmm1, QWORD PTR [rax]
	mulsd	xmm1, xmm2
	subsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR -8[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	add	DWORD PTR -12[rbp], 1
.L10:
	mov	eax, DWORD PTR -20[rbp]
	sub	eax, 1
	cmp	DWORD PTR -12[rbp], eax
	jl	.L11
	movsd	xmm0, QWORD PTR -8[rbp]
	pxor	xmm1, xmm1
	comisd	xmm0, xmm1
	jbe	.L17
	movsd	xmm0, QWORD PTR -8[rbp]
	movsd	xmm1, QWORD PTR .LC5[rip]
	divsd	xmm0, xmm1
	jmp	.L15
.L17:
	movsd	xmm0, QWORD PTR -8[rbp]
	movq	xmm1, QWORD PTR .LC6[rip]
	xorpd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC5[rip]
	divsd	xmm0, xmm1
.L15:
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	AreaC, .-AreaC
	.section	.rodata
	.align 8
.LC5:
	.long	0
	.long	1073741824
	.align 16
.LC6:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:

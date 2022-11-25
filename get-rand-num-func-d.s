	.file	"get-rand-num-func.c"
	.intel_syntax noprefix
	.text
	.globl	Rand
	.type	Rand, @function
Rand:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	DWORD PTR -4[rbp], 0
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR -4[rbp]
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	cdq
	idiv	DWORD PTR -28[rbp]
	mov	eax, edx
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	movsd	xmm0, QWORD PTR .LC0[rip]
	mulsd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	leave
	ret
	.size	Rand, .-Rand
	.section	.rodata
	.align 8
.LC0:
	.long	-1998362383
	.long	1055193269
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:

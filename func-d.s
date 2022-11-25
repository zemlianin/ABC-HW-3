	.file	"func.c"
	.intel_syntax noprefix
	.text
	.globl	Task
	.type	Task, @function
Task:
	endbr64
	push	rbp
	mov	rbp, rsp
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	mulsd	xmm0, xmm0
	mulsd	xmm0, QWORD PTR -24[rbp]
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	movapd	xmm1, xmm0
	addsd	xmm1, QWORD PTR -24[rbp]
	movsd	xmm2, QWORD PTR -24[rbp]
	movsd	xmm0, QWORD PTR .LC1[rip]
	mulsd	xmm0, xmm2
	mulsd	xmm0, QWORD PTR -24[rbp]
	mulsd	xmm0, QWORD PTR -24[rbp]
	mulsd	xmm0, QWORD PTR -24[rbp]
	mulsd	xmm0, QWORD PTR -24[rbp]
	movsd	xmm2, QWORD PTR .LC2[rip]
	divsd	xmm0, xmm2
	addsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC3[rip]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR -8[rbp]
	movq	rax, xmm0
	movq	xmm0, rax
	pop	rbp
	ret
	.size	Task, .-Task
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1075314688
	.align 8
.LC1:
	.long	0
	.long	1074266112
	.align 8
.LC2:
	.long	0
	.long	1078198272
	.align 8
.LC3:
	.long	-57999238
	.long	1073291770
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

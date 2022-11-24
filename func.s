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

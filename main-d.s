	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"input amount of itertion: "
.LC1:
	.string	"%d"
	.align 8
.LC2:
	.string	"input command: \n 1 - read from file \n 2 - Random\n 0 - Testing"
.LC3:
	.string	"%s"
.LC4:
	.string	"r"
.LC5:
	.string	"files/input.txt"
.LC6:
	.string	"%lf"
.LC9:
	.string	"uncorrect input"
.LC10:
	.string	"0"
.LC11:
	.string	"files/tests.txt"
.LC12:
	.string	"w"
.LC13:
	.string	"files/output.txt"
.LC14:
	.string	"Sum of Time in ms: "
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	add	rsp, -128
	mov	DWORD PTR -116[rbp], edi
	mov	QWORD PTR -128[rbp], rsi
	mov	DWORD PTR -20[rbp], 0
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, -96[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	lea	rax, .LC2[rip]
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, -92[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -92[rbp]
	cmp	eax, 1
	jne	.L2
	lea	rax, .LC4[rip]
	mov	rsi, rax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax
	lea	rdx, -104[rbp]
	mov	rax, QWORD PTR -32[rbp]
	lea	rcx, .LC6[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	movsd	xmm0, QWORD PTR -104[rbp]
	movsd	xmm1, QWORD PTR .LC7[rip]
	comisd	xmm0, xmm1
	ja	.L3
	movsd	xmm1, QWORD PTR -104[rbp]
	movsd	xmm0, QWORD PTR .LC8[rip]
	comisd	xmm0, xmm1
	jbe	.L2
.L3:
	lea	rax, .LC9[rip]
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L14
.L2:
	mov	eax, DWORD PTR -92[rbp]
	cmp	eax, 2
	jne	.L6
	mov	DWORD PTR -36[rbp], 10000
	cmp	DWORD PTR -116[rbp], 1
	jg	.L7
	lea	rax, .LC10[rip]
	mov	QWORD PTR -16[rbp], rax
	jmp	.L8
.L7:
	mov	rax, QWORD PTR -128[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -16[rbp], rax
.L8:
	mov	edx, DWORD PTR -36[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	Rand@PLT
	movq	rax, xmm0
	mov	QWORD PTR -104[rbp], rax
.L6:
	mov	eax, DWORD PTR -92[rbp]
	test	eax, eax
	jne	.L9
	lea	rax, .LC4[rip]
	mov	rsi, rax
	lea	rax, .LC11[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax
	lea	rax, .LC12[rip]
	mov	rsi, rax
	lea	rax, .LC13[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -72[rbp], rax
	call	clock@PLT
	mov	QWORD PTR -80[rbp], rax
	mov	DWORD PTR -4[rbp], 0
	jmp	.L10
.L11:
	lea	rdx, -104[rbp]
	mov	rax, QWORD PTR -32[rbp]
	lea	rcx, .LC6[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	rax, QWORD PTR -104[rbp]
	movq	xmm0, rax
	call	Task@PLT
	mov	rdx, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR -72[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC6[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rsi, rax
	mov	edi, 10
	call	fputc@PLT
	add	DWORD PTR -4[rbp], 1
.L10:
	mov	eax, DWORD PTR -96[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L11
	call	clock@PLT
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR -104[rbp]
	movq	xmm0, rax
	call	Task@PLT
	movq	rax, xmm0
	mov	rdx, QWORD PTR -72[rbp]
	movq	xmm0, rax
	lea	rax, .LC6[rip]
	mov	rsi, rax
	mov	rdi, rdx
	mov	eax, 1
	call	fprintf@PLT
	mov	rax, QWORD PTR -88[rbp]
	mov	edx, eax
	mov	rax, QWORD PTR -80[rbp]
	mov	ecx, eax
	mov	eax, edx
	sub	eax, ecx
	mov	DWORD PTR -20[rbp], eax
	lea	rax, .LC14[rip]
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -20[rbp]
	mov	esi, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L14
.L9:
	call	clock@PLT
	mov	QWORD PTR -48[rbp], rax
	mov	DWORD PTR -4[rbp], 0
	jmp	.L12
.L13:
	mov	rax, QWORD PTR -104[rbp]
	movq	xmm0, rax
	call	Task@PLT
	add	DWORD PTR -4[rbp], 1
.L12:
	mov	eax, DWORD PTR -96[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L13
	call	clock@PLT
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -104[rbp]
	movq	xmm0, rax
	call	Task@PLT
	movq	rax, xmm0
	mov	QWORD PTR -64[rbp], rax
	lea	rax, .LC12[rip]
	mov	rsi, rax
	lea	rax, .LC13[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -72[rbp], rax
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -72[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC6[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	lea	rax, .LC14[rip]
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -56[rbp]
	mov	edx, eax
	mov	rax, QWORD PTR -48[rbp]
	mov	ecx, eax
	mov	eax, edx
	sub	eax, ecx
	mov	esi, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
.L14:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC7:
	.long	0
	.long	1072693248
	.align 8
.LC8:
	.long	0
	.long	-1074790400
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

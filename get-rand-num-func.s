	.intel_syntax noprefix
	.text
	.globl	Rand
	.type	Rand, @function		# Объявление функции
Rand:
	endbr64
	push	rbp			# Начало функции
	mov	rbp, rsp
	sub	rsp, 32
	
	mov	QWORD PTR -24[rbp], rdi	# Запись переменной арг в стек
	mov	DWORD PTR -28[rbp], esi # Запись рэнч в стек
	mov	DWORD PTR -4[rbp], 0	# переменная н = 0
	mov	rdi, QWORD PTR -24[rbp] # Запись арг в регистр
	call	atoi@PLT 		# Запуск  функции
	mov	DWORD PTR -4[rbp], eax # Запись результата обратно в эн
	mov	edi, DWORD PTR -4[rbp] #  Запись эн в регситр
	call	srand@PLT		#  Запуск ранд и сранд
	call	rand@PLT
	idiv	DWORD PTR -28[rbp]	#  Деление результата на рэндж
	mov	eax, edx	#  Перевод инта в дабл
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax	
	movsd	xmm0, QWORD PTR .LC0[rip]	#  Запись 0.00001 в регистр
	mulsd	xmm0, xmm1			#  Перемножение
	movq	rax, xmm0			#  Запись результата 
	leave					#  Конец
	ret
	.size	Rand, .-Rand
	.section	.rodata
	.align 8
.LC0:
	.long	-1998362383
	.long	1055193269

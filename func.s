	.intel_syntax noprefix
	.text
	.globl	Task
	.type	Task, @function
Task:
	push	rbp
	mov	rbp, rsp # Начало функции, перемещение регистров
	
	movsd	QWORD PTR -24[rbp], xmm0 # Запись х в стек
	 
	mulsd	xmm0, xmm0 		# Возведение х в квадрат 
	mulsd	xmm0, QWORD PTR -24[rbp]	# Возведение в куб
	movsd	xmm1, QWORD PTR .LC0[rip] 	# Запись чила 6 в регситр
	divsd	xmm0, xmm1			# Деление х куб на 6
	movapd	xmm1, xmm0
	addsd	xmm1, QWORD PTR -24[rbp] 	# Прибавление к предыдущему резуьтату х
	movsd	xmm2, QWORD PTR -24[rbp]	
	movsd	xmm0, QWORD PTR .LC1[rip]	# Запись 3 в регистр
	
	mulsd	xmm0, xmm2		# Возведение х в 5ую степень
	mulsd	xmm0, QWORD PTR -24[rbp]
	mulsd	xmm0, QWORD PTR -24[rbp]
	mulsd	xmm0, QWORD PTR -24[rbp]
	mulsd	xmm0, QWORD PTR -24[rbp]
	
	movsd	xmm2, QWORD PTR .LC2[rip]
	divsd	xmm0, xmm2			# Деление х в пятой на 40
	addsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC3[rip]	# Запись пи/2 в регистр
	
	subsd	xmm0, xmm1			# Нахождение разности
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR -8[rbp]
	
	movq	rax, xmm0	# Запись результатат в регистр рах
	movq	xmm0, rax
	
	pop	rbp		# Завершение функции
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

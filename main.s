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
	.type	main, @function			#  Объявление мэйн
main:
	push	rbp				#  Начало метода
	mov	rbp, rsp
	add	rsp, -128
	
	mov	DWORD PTR -116[rbp], edi	# Запись арк в стек
	mov	QWORD PTR -128[rbp], rsi	#  Запись указателя на аргв в стек
	mov	DWORD PTR -20[rbp], 0
	lea	rdi, .LC0[rip]			# Запись стркои в регистр
	call	puts@PLT			# Вызов принт
	lea	rsi, -96[rbp]			# Вызов метода скан
	lea	rdi, .LC1[rip]	
	mov	eax, 0
	call	__isoc99_scanf@PLT
	
	lea	rsi, .LC2[rip]			# Запуск метода принт
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT
	
	lea	rsi, -92[rbp]			# Вызов метода скан
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	
	mov	eax, DWORD PTR -92[rbp]		# Сравненеи переменной команд с 1
	cmp	eax, 1
	jne	.L2
	lea	rsi, .LC4[rip]			# Запуск метода открытия потока
	lea	rdi, .LC5[rip]
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax		# Запсиь результата инпут
	lea	rdx, -104[rbp]			# Запуск метода скан из файла
	mov	rdi, QWORD PTR -32[rbp]
	lea	rsi, .LC6[rip]
	mov	eax, 0
	call	__isoc99_fscanf@PLT		
	
	movsd	xmm0, QWORD PTR -104[rbp]	# Сравнение эн с 1
	movsd	xmm1, QWORD PTR .LC7[rip]
	comisd	xmm0, xmm1
	ja	.L3
	movsd	xmm1, QWORD PTR -104[rbp]	# Сравнение эн с -1
	movsd	xmm0, QWORD PTR .LC8[rip]
	comisd	xmm0, xmm1
	jbe	.L2
.L3:
	lea	rsi, .LC9[rip]			# Запуск метода принт с сообщением о некорректном вводе
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L14				#  В конец программы
.L2:
	mov	eax, DWORD PTR -92[rbp]		#  Сравниваем комманд с цифрой 2
	cmp	eax, 2
	jne	.L6
	mov	DWORD PTR -36[rbp], 10000	#  Рэндж = 10000
	cmp	DWORD PTR -116[rbp], 1		#  Сравниваем кол=во аргументов командной строки с 1
	jg	.L7
	lea	rax, .LC10[rip]			#  Запись строки в парам_рандом
	mov	QWORD PTR -16[rbp], rax
	jmp	.L8
.L7:
	mov	rax, QWORD PTR -128[rbp]	#  Запись второгоэлемента массива аргументов в парам_рандом
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -16[rbp], rax
.L8:
	mov	esi, DWORD PTR -36[rbp]		#  Запись строк в регистр и вызов метода ранд
	mov	rdi, QWORD PTR -16[rbp]
	call	Rand@PLT
	movq	rax, xmm0			#  Запись результата в регистр
	mov	QWORD PTR -104[rbp], rax	#  Запись результата в стек
.L6:
	mov	eax, DWORD PTR -92[rbp]		#  Сравнение переменной команд с 0
	test	eax, eax
	jne	.L9
	lea	rsi, .LC4[rip]			#  Метод открытия потока 
	lea	rdi, .LC11[rip]
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax		#  Запись результата в инпут
	lea	rsi, .LC12[rip]			#  Открытие потока вывода
	lea	rdi, .LC13[rip]			
	call	fopen@PLT
	mov	QWORD PTR -72[rbp], rax		#  ЗАпись результата в аутпут
	call	clock@PLT			#  Вызов клок
	mov	QWORD PTR -80[rbp], rax		#  Запись результата в переменную бегин
	mov	DWORD PTR -4[rbp], 0
	jmp	.L10
.L11:
	lea	rdx, -104[rbp]			# Запуск метода скан
	mov	rdi, QWORD PTR -32[rbp]
	lea	rsi, .LC6[rip]
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	
	mov	rax, QWORD PTR -104[rbp]	# Запуск метода  Таск
	movq	xmm0, rax
	call	Task@PLT
	
	mov	rdx, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR -72[rbp]
	movq	xmm0, rdx			# Запись результата в регистр
	
	lea	rsi, .LC6[rip]			# Запуск метода принт
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT		
	
	mov	rsi, QWORD PTR -72[rbp]		#  Вызов принт с выводом числа и переноса строки
	mov	edi, 10
	call	fputc@PLT
	add	DWORD PTR -4[rbp], 1		#  Параметр цикла++
.L10:
	mov	eax, DWORD PTR -96[rbp]		#  Сравнение параметра цикла с переменной Нлуп
	cmp	DWORD PTR -4[rbp], eax
	jl	.L11
	
	call	clock@PLT			#  Вызов клок и запись результатат в енд
	mov	QWORD PTR -88[rbp], rax
	
	mov	rax, QWORD PTR -104[rbp]	#  Вызов метода Таск и запись результата в регистр
	movq	xmm0, rax
	call	Task@PLT
	movq	rax, xmm0
	
	mov	rdi, QWORD PTR -72[rbp]		# Вызов метода принт в файл с результатом работы Таск
	lea	rsi, .LC6[rip]
	mov	eax, 1
	call	fprintf@PLT
	
	mov	rax, QWORD PTR -88[rbp]		#  Запись енд и бегин в регистр
	mov	edx, eax
	mov	rax, QWORD PTR -80[rbp]
	mov	ecx, eax
	mov	eax, edx
	sub	eax, ecx			#  Нахождение разности энд и бегин
	mov	DWORD PTR -20[rbp], eax		#  Запись результата в стек
	
	lea	rsi, .LC14[rip]			# Вызов принт с пояснением о сумме
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT
	
	mov	esi, DWORD PTR -20[rbp]		# Вызов принт с суммой времени работы
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L14				#  Прыжок в конец программы
.L9:
	call	clock@PLT			#  Вызов метода клок и вывод результата в бегин
	mov	QWORD PTR -48[rbp], rax
	mov	DWORD PTR -4[rbp], 0		#  Параметр цикла = 0
	jmp	.L12
.L13:
	mov	rax, QWORD PTR -104[rbp]	# Запись эн в регситр и вызов таск
	movq	xmm0, rax
	call	Task@PLT
	add	DWORD PTR -4[rbp], 1		#  Параметр цикла++
.L12:
	mov	eax, DWORD PTR -96[rbp]		#  Сравнение параметра цикла с переменной Нлуп
	cmp	DWORD PTR -4[rbp], eax
	jl	.L13
	call	clock@PLT			# Вызов клок и запись результата в енд
	mov	QWORD PTR -56[rbp], rax
	
	mov	rax, QWORD PTR -104[rbp]	#  Запись эн в регистр и вызов Таск
	movq	xmm0, rax
	call	Task@PLT
	movq	rax, xmm0			#  Запись результатат в стек
	mov	QWORD PTR -64[rbp], rax		# Открытие потока и запись результата в аутпут
	lea	rsi, .LC12[rip]
	lea	rdi, .LC13[rip]
	call	fopen@PLT
	mov	QWORD PTR -72[rbp], rax	
	
	mov	rdx, QWORD PTR -64[rbp]		# Вызов метода записи результатат в файл
	mov	rdi, QWORD PTR -72[rbp]
	movq	xmm0, rdx
	lea	rsi, .LC6[rip]
	mov	eax, 1
	call	fprintf@PLT
	
	lea	rsi, .LC14[rip]			# Вызов принт с пояснением о сумме
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT
	
	mov	rax, QWORD PTR -56[rbp]		# Нахождение разности между бегин и енд и приведение типов
	mov	edx, eax
	mov	rax, QWORD PTR -48[rbp]
	mov	ecx, eax
	mov	eax, edx
	sub	eax, ecx
	mov	esi, eax
	lea	rax, .LC1[rip]			# Вызов метода принт 
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

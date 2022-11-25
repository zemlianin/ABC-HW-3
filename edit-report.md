# Отчет по изменениям
#### Для сравнения:
Первоначальные assembly файлы: func-d.s, main-d.s, get-rand-num-func-d.s

Файлы с ручными модификациями: func.s, main.s, get-rand-num-func.s

Exe собраный из C, без модификаций  solution-deff

Exe собранный с модификациями solution-edit
### 1. Удаление ненужных перезаписываний регистров, и вставка записи напрямую в конечный регситр, например:

```
lea	rax, -96[rbp]
mov	rsi, rax
```
```
lea	rax, .LC2[rip]
mov	rsi, rax
```
```
lea	rax, -92[rbp]
mov	rsi, rax
```
```
lea	rax, .LC4[rip]
mov	rsi, rax
lea	rax, .LC5[rip]
mov	rdi, rax
```

```
lea	rax, .LC9[rip]
mov	rsi, rax
lea	rax, .LC3[rip]
mov	rdi, rax
```
```
lea	rax, .LC4[rip]
mov	rsi, rax
lea	rax, .LC11[rip]
mov	rdi, rax
  ```

```
mov	rax, QWORD PTR -72[rbp]
mov	rsi, rax
```

и.т.п.


 ### 2. Удаление кода сгенерированного GCC
 ```
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
```
### 3. Повсеместное удаление макросов cdqe, cdq
### 4. Удаление макроса endbr64
Добавлены коментарии, полностью сопровождающие переменные и соответствуюшие им регистры (Операции, передача в функцию, запись результата)
Примеры:

```
mov	rax, QWORD PTR -88[rbp]		#  Запись енд и бегин в регистр
```
```
mov	esi, DWORD PTR -20[rbp]		# Вызов принт с суммой времени работы
lea	rdi, .LC1[rip]
```
```
movq	rax, xmm0			#  Запись результатат в стек
mov	QWORD PTR -64[rbp], rax		# Открытие потока и запись результата в аутпут
```
```
mov	rax, QWORD PTR -104[rbp]	#  Вызов метода Таск и запись результата в регистр
movq	xmm0, rax
call	Task@PLT
movq	rax, xmm0
```
```
mov	QWORD PTR -24[rbp], rdi	# Запись переменной арг в стек
```
```
mov	DWORD PTR -28[rbp], esi # Запись рэнч в стек
```
```
mov	DWORD PTR -4[rbp], 0	# переменная н = 0
```
```
mov	rdi, QWORD PTR -24[rbp] # Запись арг в регистр
```
и.т.п.

### 5. Переменная х, их функции Task() перенесена из стека в регистр xmm3
### 6. Добавлены файловые ввод, вывод
### 7. Добавлены секундомер и рандомайзер, программа разделена на 3 единицы компиляции
 

# Отчет к Домашней работе 3 по архитектуре вычислительных систем
## Журнал изменений можно найти по ссылке [список изменений](https://github.com/zemlianin/ABC-HW-3/blob/master/edit-report.md)
## Отчет на 4 былла
- Приведен код на С, реализован ввод-вывод количества повторений и времени работы в консоль,  
результат и начальное значение вводятся-выводятся в файл (в пукте на оценку 7 сказано - не делать через консоль)
- Представлено полное тестовое покрытие, запуск тестов происходит через соответстввующую команду в консоли, тесты содержаться в файле tests.txt
- Удалены лишние макросы, это можно увидеть в [списке изменений](https://github.com/zemlianin/ABC-HW-3/blob/master/edit-report.md)
- Модифицированная программа откомпилирована отдельно
- Добавлены комментарии о представлении переменных, примеры: 

```
mov	DWORD PTR -36[rbp], 10000	#  Рэндж = 10000
cmp	DWORD PTR -116[rbp], 1		#  Сравниваем кол-во аргументов командной строки с 1
  ```
  
  ```
movsd	xmm1, QWORD PTR -104[rbp]	# Сравнение эн с -1
movsd	xmm0, QWORD PTR .LC8[rip]
comisd	xmm0, xmm1
  
  ```
  
  ```
mov	DWORD PTR -116[rbp], edi	# Запись арк в стек
mov	QWORD PTR -128[rbp], rsi	#  Запись указателя на аргв в стек
  ```
- Список преобразований ассемблерной программы можно увидеть в [списке изменений](https://github.com/zemlianin/ABC-HW-3/blob/master/edit-report.md)
## Отчет на 5 баллов
- Применены определенные мной функции Task, Rand
```
extern double Task(double x);
extern double Rand(char *arg, int range);
```
- Использованы локальные перемнные
- Добавлены комментарии поясняющие передачу параметров, примеры:

```
mov	DWORD PTR -116[rbp], edi	# Запись арк в стек
mov	QWORD PTR -128[rbp], rsi	#  Запись указателя на аргв в стек
```
```
movsd	QWORD PTR -24[rbp], xmm0 # Запись х в стек
```
```
mov	QWORD PTR -72[rbp], rax		#  ЗАпись результата в аутпут
```

- Добавлены комментарии для каждого формального параметра

## Отчет на 6 баллов

- В функции Task (Именно ее работа и замеряется) Была произведена замена 
QWORD PTR -24[rbp] на регистр xmm3, что является аналогом переменной x, от которой берется функция
Дальнейшие преобразования не производились, тк остальные переменные, внутри этой функции, уже находятся в регистрах 
- Добавлено множество комментариев, поясняющих аналогию работы регистров и переменных
- Сравнение программ:

| Параметр | Программа скомпилированная по умолчанию |  Модифицированная программа |
|--|--------|------------|
|Средне время затраченное на выполнение тестов 100000 раз|84499ms|84200ms|
|Объем в памяти после компиляции| 16528 byte | 16304 byte |

## Отчет на 7 баллов

- Исходные данные выводятся и вводятся в файлы, выбор файла происходит за счет режима работы: 
Тестирование - tests.txt
Нормальный - input.txt, output.txt
Аргументы командной строки применяются для ввода числа - аргумента рандома, по умолчанию 0
- Командная строка проверяется на корректность числа аргуентов
```
if(argc < 2) {
...
```
- В программе присутствует 3 единицы компиляции, которые реализованы мной
1. get-rand-num-func
2. func
3. main

Каждая из них модифицированна в соответствии с предыдущими требованиями

- Представлен файл tests.txt содержащий тестовое покрытие программы

## Отчет на  8 баллов

- Применен генератор случайных данных, режим генерации включется в меню через консоль
- Реализовано взятие числа повторений операций у пользователя, выбирается в меню
- Производлятся замеры времени, которые выводятся в консоль по завершении работы программы
- Произведены тесты:

| Параметр | Программа скомпилированная по умолчанию |  Модифицированная программа |
|--|--------|------------|
|Средне время затраченное на выполнение тестов 100000 раз|84499ms|84200ms|
|Средне время затраченное на выполнение тестов 10000 раз|8015ms|8100ms|
|Средне время затраченное на выполнение тестов 1000 раз|1022ms|1080ms|
|Объем в памяти после компиляции| 16528 byte | 16304 byte |

## Отчет на 9 баллов
|программа|время 10000кратного выполнения тестов| размер exe файла|
|--|--|--|
|Ручные модификации|81072ms|16304 byte|
|C|80421ms|16528 byte|
|-O0| 81004ms |16724 byte|
|-O1|73179ms|15547 byte|
|-O2|24391ms|16264 byte|
|-O3|21293ms|18435 byte|
|-Os|72461ms|13456 byte|

Вывод: Флаги компиляции очень сильно влияют скорочть исполнения, при этом слабо изменяя объем занимаемой памяти в сравнении с ассемблером, к которому были применены ручные модификации

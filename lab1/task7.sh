#!/bin/bash


#1 вариант 
#egrep -w -h -o "\b[A-Za-z0-9]+@[A-Za-z0-9.-]+.[A-Za-z]{2,6}\b" /etc/* | tr "\n" "," > lab1/emails.lst

#2вариант
p="\b[A-Za-z0-9]+@[A-Za-z0-9.-]+.[A-Za-z]{2,6}\b" #p=pattern
egrep -w -h -o $p /etc/* | tr "\n" "," > lab1/emails.lst

#grep - многоцелевая поисковая утилита
# ключ -E рассматривает каждый шаблон, как расширенное вырожение = egrep
#ключ -w рекурсивный поиск в каталогах
#ключ -h не выводить имя файла в результатах поиска внутри файлов Linux
# "\b .... \b" \b - придает ограниченность поступающего паттерна
# {2,6} размерность от 2 до 6 символов 
#при помощи | мы передаем вывод grep в файл emails.lst
#tr - заменяет одни символы на другие
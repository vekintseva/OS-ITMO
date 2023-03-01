\
#!/bin/bash
ps x -o pid,cmd | awk '{ print $1 ":" $2 }' | head -n -2 | wc -l > out.txt
ps x -o pid,cmd | awk '{ print $1 ":" $2 }' | head -n -2 >> out.txt
cat out.txt

#ps x - вывод процессов без управляющего теринала или с управляющим терминалом, но отл-ся от исп-ого вами
#-о позволяет определить свой формат вывода
#awk - утилита контекстного поиска
#head -выводит начальные строки из файла (-n -2 мы самостоятельно ставим границы на кол-во)
#wc -l отвечает за вывод кол-ва, а в данном случае за кол-во процессов
#cat out.txt открываем файл, в который производили вывод
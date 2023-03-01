#!/bin/bash
> task4.txt
for pid in $(ps uax | awk 'FNR > 1 {print $2}')
do
if [-r /proc/$pid/ ] && [-r /proc/$pid/status ] && [-r /proc/$pid/sched ]
then
ppid=$(grep "PPid" "/proc/$pid/status" | awk '{print $2}')
sum_exec_runtime=$(grep "sum_exec_runtime" "/proc/$pid/sched" | awk '{print $3}')
nr_switches=$(grep "nr_switches" "/proc/$pid/sched" | awk '{print $3}')
art=$(echo "$sum_exec_runtime $nr_switches" | awk '{print $1 / $2}' )
echo "$pid $ppid $art" >> task4.txt
fi
done

echo "$(sort "task4.txt" -k2 -n |
awk '{print "ProcessID=$1 : Parent_ProcessID=$2 : Average_Running_Time=$3""}')" >> task4.txt
cat task4.txt

#в цикле рассматриваем: (запускаем ps с часто используемыми параметрами
#awk 'FNR > 1 отвечает за поиск НОМЕРА ОБРАБАТЫВАЮЩЕЙ СТРОКИ В ФАЙЛЕ > 1, тк в первой строке наименования содержимого в столбцах
#в условии [-r директория]
#-r отвечает за проверку подлинности директории, те если файл exists and readable, то все супер и мы можем работать дальше
#поиск значения среднего времени art нам дан в условии
#для sort -k указывает на поле по которому сортируем строки
#-n по числовому значению
#

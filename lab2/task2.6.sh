#!/bin/bash

max="0"
for pid in $(ps uax |awk 'FNR > 1 {print $2}');
do
if [[ -r /proc/$pid/status ]]; then
x="$(grep -i "VmRSS" /proc/$pid/status | awk '{print $2}' )"
if [[ "$x" -ne "" ]]; then
if [[ "$x" -gt "$max" ]]; then
answer=$pid
max=$x
fi
fi
fi
done
echo "Pid: " $answer "Memory: " $max
#вывод команды топ, сравнение результата
#top-программа, используемая для наблюдения за процессами в режиме реального времени
top -o RES | head -8 | tail -n+8 | awk '{print "Pid: "$2" Memory: "$7""}'


#awk 'FNR > 1 отвечает за поиск НОМЕРА ОБРАБАТЫВАЮЩЕЙ СТРОКИ В ФАЙЛЕ > 1, тк в первой строке наименования содержимого в столбцах
#"VmRSS"- память, занятая процессором
#grep -i игнорирует регистр символов при сравнениях
#для числовых значений: -ne не равно;  -gt больше
#top -o фильтрация процессов по условию RES (RES-$7, PID-$2)
#head -8 выводим первые 8, а tail -n+8 выводит восьмую необходимую строку
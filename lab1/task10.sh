#!/bin/bash

man bash | grep -o -i "[A-Za-z]\{4,\}" | tr "[A-Z]" "[a-z]" | sort | uniq -c | sort -n -r | head -3


#grep - поисковая утилита для работы с большими объектами 
#grep -i ищем шаблон без учета регистра
#tr заменяет одни символы на другие (делаем для сортировки)
#sort пишем перед uniq, для его качественной работы, потому что uniq рассматривает только соседние одинаковые строки
#uniq -c выводит число, обозначающее количество повторов строки
# -n - сортировка строк linux по числовому значению (от 0 до +inf)
#-r - сортировать в обратном порядке (+inf до 0)
#head -3 выведет три начальные строки из потока (уже из верного - отсортированного)

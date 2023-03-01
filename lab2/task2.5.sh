prev_ppid=-1
full_art=0
count=0

while read line
do
	ppid=$(echo $line | cut -d ":" -f 2 | awk -F "=" '{print $2}')
	art=$(echo $line | cut -d ":" -f 3 | awk -F "=" '{print $2}')

#сделаем цикл для выявления одинаковых идентификаторов ppid
	if [[ $prev_ppid != -1 && $ppid != $prev_ppid ]]
	then
		echo Average_Running_Children_of_ParentID=$prev_ppid is $(echo  "scale=2; x=$full_art / $count; if(x<1&&x!=0) print 0; x" | bc)
		full_art=0
		count=0
	fi

	echo $line

	full_art=$(echo "scale=2; x=$full_art+$art; if(x<1&&x!=0) print 0; x" | bc)
	((count+=1))
	prev_ppid=$ppid
done < task4.txt > task5.txt

echo Average_Running_Children_of_ParentID=$prev_ppid is $(echo "scale=2; x=$full_art /  $count; if(x<1&&x!=0) print 0; x" | bc) >> task5.txt

#while read line и done < task4.txt мы читаем и пользуемся информацией из файла
#сut -d устанавливает разделитель
#-f перечень полей для вырезания
#awk -F для разбиения текста на разные поля через знак =
#full_art подсчитывает все процессы родителя
#count - счетчик для подсчета этих процессов
#bc для конвертации между системами при совершении вычислений
#if(x<1&&x!=0) проверка корректности х
#scale=2 отвечает за точность вычисление(знаки после плавающей точки)
#В последней строке реализация того, что от нас требуется

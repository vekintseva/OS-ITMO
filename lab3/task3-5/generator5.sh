while true;
do
read line

echo $line > task5

if [[ $line == "QUIT" ]]
then
exit 0 #плановая ошибка
fi

if [[ $line != "+" && $line != "*" && ! $line =~ [0-9]+ ]] #+ за одно или более вхождений символа
then
exit 1 #ошибка входных данных
fi

done
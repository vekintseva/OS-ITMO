#!/bin/ban
trash=$HOME/.trash
trashlog=$HOME/.trash.log
file_name=$1
vers=0
if [ ! $# -eq 1 ] #для выявления возникающих ошибок
then
echo "the wrong count of arguments"
	exit 1
fi

if [ ! -d $trash ] #проверка, создан ли скрытый каталог
then
	mkdir $trash #если не создан, то создаем
fi

if [ ! -f $trashlog ] #проверка, создан ли скрытый файл
then
	touch $trashlog #создаем скрытый файл
fi

trash_name=$file_name-$vers
while [ -f $trash/$trash_name ] #создание уникального имени для файла
do
	(( vers++ ))
	trash_name=$file_name-$vers
done

ln $file_name $trash/$trash_name # сначала файл, на который передаем ссылку, потом куда передаем ссылку 
rm $file_name && echo $(realpath $file_name) $trash_name >> $trashlog

# -eq не равно
# $# номер команды аргумента, который пришел при запуске скрипта
# ln - создание ссылок
#rm -удаление файла
#realpath - разворачивает ссылку, возвращает ее имя
#

trash=$HOME/.trash
trashlog=$HOME/.trash.log
file_n=$1

restore() {
	path=$1
	file=$2
	ln $trash/$file $path # сначала файл, на который передаем ссылку, потом куда передаем ссылку 
}

if  [ ! $# -eq 1 ] #! -eq не равно
then
	echo "There is incorrect argument "
	exit 1
fi

if [ ! -d $trash ]
then
	echo "directory trash wasn't created"
	exit 1

if [ ! -f $trashlog ]
then
	echo "file trash.log wasn't created"
	exit 1
fi

if [-z $(grep $1 $trash) ]
then
	echo "file $1 doesn't exist"
	exit 1
fi

grep $file_n $trashlog |
while read file_path
do
	file=$(echo $file_path | cut -d " " -f 1)
	trashN=$(echo $filepath | cut -d " " -f 2)
	echo "Restore $trashN ? [y/n]"  #ответ на подтверждение: у-положительно; n-отрицательно
	read  answer < /dev/tty 

	if [ $answer == "y" ] #если ответ положительный
	then
		dir=$(dir_name $file) &&

		if [ -d $dir ]; #если директория обнаружена
		then
			$(restore $file $trashN)
		else #иначе, если не существует, то файл восстанавливается в $HOME
			$(restore $HOME/$file_name $trashN) &&
			echo  "Restored in $HOME!"
		fi &&

		rm $trash/$trashN && {
			sed -i "#$file_path#d" $trashlog #при невозможности создания жесткой ссылки изменяем имя восттанавливаемого файла
			echo "Restored $file!"
		}
	fi
done

#restore восстанавливает файлы из резервной копии в их исходных каталогах.
#ln -создание ссылок
#cut - извлекать отдельные поля из текстовых файлов
# -d устанавливает разделитель; -f показывает перечень полей
#grep - поисковая утилита 
#rm - удаление файла
#sed - интерактивный потоковый редактор, выводит результат в файл
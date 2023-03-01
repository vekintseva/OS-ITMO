#!/bin/bash

if [[ ! -d "$HOME/source" ]]; then
echo "directory source is absence"
exit 1
fi

if [[ ! -f "$HOME/backup-report" ]]; then
touch $HOME/backup-report
fi

nowDate=$(date +"%Y-%m-%d") #актуальная дата

#в строках приведенных ниже мы как бы прописываем пути, которые будем использовать далее
lastBackupDate=$(ls ~ | grep -E "^Backup-" | sort -n | tail -1 | sed "s/Backup-//")
lastBackupName="$HOME/Backup-$lastBackupDate"

timeDif=$(echo "($(date -d "$nowDate" + "%s")- $(date -d "$lastBackupDate" + "%s"))/60/60/24")

if [[ -z "$lastBackupDate" ]] || [[ $timeDif > 7 ]]; then #если нет каталогас именем, соответств дате, отстоящей от текущей менее чем на 7 дней
mkdir $HOME/Backup-$nowDate #тогда создаем каталог
for file in $(ls $HOME/source); do
cp "$HOME/source/$file" "$HOME/Backup-$nowDate" #копируем все файлы из каталога в новый каталог
done
echo -e "The reserve copy Backup-$nowDate has: \n$(ls $HOME/source)" >>
else 
echo -e "In the reserve copy there are: " >> $HOME/backup-report
newFiles="New files has been created:"
replaces="Files were replaced:"

for file in $(ls $HOME/source); do
if [[ -f "$lastBackupName/$file" ]]; then
#для сравнения размеров одноименных файлов
size1=$(wc -c "$HOME/source/$file" | awk '{print $1}')
size2=$(wc -c "$lastBackupName/$file" | awk '{print $1}')

if [[ ! $(echo "$size1 - $size2" | bc) -eq 0 ]]; then #если размеры не равны
cp "$HOME/source/$file" "$lastBackupName/$file.$nowDate" #то файл копируется с автоматическим созданием версионной копии
replaces=$(echo -e "$replaces\n$file $file.$nowDate")
fi
else
cp "$HOME/source/$file" "$lastBackupName/$file"
newFiles=$(echo -e "newFiles\n$file")
fi
done
echo -e "$newFiles\n$replaces\n" >> $HOME/backup-report  #вывод необходимых параметров
fi

#sed - текстовый редактор для замены: исходного текста/заменяемый текст
#sort -n сортировка по числовому значению (для того, чтобы взять самый последний по дате файлик)
#cp - для копирования файлов и каталогов |что копируем|  |куда копируем|
#awk '{print ... }' для вывода
#-eq равно
#
#
#
#
#!/bin/ban
lastBackupDate=$( ls ~ | egrep "^Backup-" | sort -nr | head -1 | sed "s/^Backup-//" )
lastBackup=$HOME/Backup-$lastBackupDate #путь последнего бэкапа
restore=$HOME/restore
if [ ! -z $lastBackupDate ]
then
	if [ ! -d $restore ] #если директории нет
	then
		mkdir $restore
	fi
	for file in $(ls $lastBackup | grep -Ev "[0-9]{4}-[0-9]{2}-[0-9]{2}")
	do
		cp $lastBackup/$file $restore/$file
	done
fi

#sort -nr сортировка по числовы в обратном порядке
#sed - текстовый редактор для замены: исходного текста/заменяемый текст
#grep -v Выдает все строки, за исключением содержащих образец "[0-9]{4}-[0-9]{2}-[0-9]{2}" - год-месяц-день.
#



#!/bin/bash
while true
do
read line
	case $line in
		"+")
			kill -USR1 $1
		;;

		".")
			kill -USR2 $1
		;;

		"TERM")
		kill -SIGTERM $1
		exit 0
		;;
	esac
done

#работаем в бесконечном цикле
#если +, то посылает процессу "Обработчик" USR1
#если *, то посылает процессу "Обработчик" USR2
#если TERM, то посылает процессу "Обработчик" сигнал SIGTERM
#kill отправка сигнала

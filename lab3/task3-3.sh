#Задайте запуск скрипта из пункта 1 в каждую пятую минут каждого часа в день недели, в который вы
#будете выполнять работу.

#!/bin/bash
echo "*/5 * * * 5 ./task3-1" | crontab

#crontab для указания команд, которые выполняются периодически
#*/5 * * * 5 ./task3-1 
#*/5 каждую 5ую минуту * * * 5-день недели, нам нужна пятница
#звездочки в середине отвечают за  *-час *-день по календарю *-номер месяца
# https://crontab.guru/#*/5_*_*_*_5 тут можно смотреть кодировку
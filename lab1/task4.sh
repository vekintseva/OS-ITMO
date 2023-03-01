#!/bin/bash

if [[ "$HOME" == "$PWD" ]]
then echo "$HOME"
exit 0
fi

if [[ "$HOME" != "$PWD" ]]
then echo "Error"
exit 1
fi

# $HOME - домашний каталог пользователя 
# $PWD - рабочий каталог
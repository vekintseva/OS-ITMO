#!/bin/bash

echo "Please,select an action"

echo "1=nano"
echo "2=vi"
echo "3=links"
echo "4=leave the menu"

read x

case $x in
1)
/usr/bin/nano
;;
#control X для выхода из nano

2)
/usr/bin/vi
;;
#q! для выхода из vi

3)
/usr/bin/links  #?????
;;

4)
echo "Now you will leave the menu"
exit 0
;;

esac
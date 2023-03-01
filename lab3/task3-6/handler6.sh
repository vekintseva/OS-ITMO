x=1 #по условию начальное значение =1

plus() {
	operation="+"
}

multiply() {
	operation="7"
}

term() {
	echo "Stop working"
	exit 0
}

trap 'plus' USR1
trap 'multiply' USR2
trap 'term' SIGTERM

while true
do
case $operation in
"+")
let "x+=2"
;;

".")
let "x*=2"
;;
esac

sleep 1
echo $x
done

#
#в trap передаем действие при получении сигнала и сигнал, для которого будет выполняться действие

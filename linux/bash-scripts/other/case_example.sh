#!/bin/bash
echo "Your lucky number"
read n
case $n in
	1)
		echo "1st prize!";;
	2)
		echo "2nd prize!";;
	3)
		echo "3rd prize!";;
	*)
		echo "Loser!"
esac

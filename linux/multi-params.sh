#!/bin/bash


echo "all params: $*"
echo "number of params provided: $#"

echo "user $1"
echo "group $2"


for param in $*
 do
	 if [ -d "$param" ]
	 then
		echo "executing scripts in the config folder"
		ls -l "$param"
	 fi
	 echo $param
 done



sum=0
while true
do
	read -p "enter score: " score

	if [ "$score" == "q" ]
	then
		break
	fi	
	sum=$(($sum+$score))
	echo "total score: $sum"

done



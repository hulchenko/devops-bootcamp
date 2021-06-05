#!/bin/bash


# echo "all params: $*"
# echo "number of params provided: $#"

# $1 - first param
# $2 - second param, etc.

# echo "user $1"
# echo "group $2"


for param in $*
 do
	 if [ -d "$param" ]
	 then
		echo "executing scripts in the config folder"
		ls -l "$param"
	 fi
	 echo $param
 done

function score_sum {
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
}

score_sum


function create_file() {
file_name=$1
is_shell_script=$2
touch $file_name
echo "file $file_name created"
if [ "$is_shell_script" = true ]
then
	chmod u+x $file_name
	echo "added exec permissions"
fi
}

create_file argument1_test.txt

create_file argument2_test.yaml

# argument3_test.sh first param, true is second

create_file argument3_test.sh true



function sum(){
total=$(($1+$2))
return $total
}

# result=$(sum 2 10)


sum 2 10
result=$?

echo "sum of 2 and 10 is $result" 







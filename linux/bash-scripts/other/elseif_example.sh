#!/bin/bash

echo "Enter a number"
read n

if [[ $n -eq 3 ]];
then
	echo "1st place!"
elif [[ $n -eq 7 ]];
then
	echo "2nd place!"
else
	echo "You lost!"
fi



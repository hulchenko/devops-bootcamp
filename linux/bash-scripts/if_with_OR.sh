#!/bin/bash

echo "Guess the number"
read n

if [[ ( $n -eq 15 || $n -eq 45 ) ]]
then
	echo "Yay!"
else
	echo "You lost! :((((("
fi

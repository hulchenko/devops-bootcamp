#!/bin/bash

read number

n=$number

if [ $n -lt 10 ]
then
	echo "$n is less than 10"
else
	echo "$n is more than 10"
fi

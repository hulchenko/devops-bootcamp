#!/bin/bash
test=true
count=1
while [ $test ]
do
echo $count
if [ $count -eq 5 ];
then
break
fi
((count++))
done

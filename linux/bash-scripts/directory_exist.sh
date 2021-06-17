#!/bin/bash

echo "Create new directory"
read newdir
if [ -d "$newdir" ]
then
	echo "Directory exists!"
else
mkdir $newdir
	echo "Directory has been created"
fi	

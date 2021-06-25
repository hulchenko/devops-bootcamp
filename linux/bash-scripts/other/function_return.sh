#!/bin/bash

function greeting(){
	str="Hello, $name"
	echo $str
}

echo "Enter your name"
read name

val=$(greeting) # name + function value gets appended to val
echo "Return value is $val"

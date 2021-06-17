#!/bin/bash

echo "Enter username"
read username
echo "Enter password"
read password

if [[ ( $username == "admin" && $password == "secret" ) ]]; then
	echo "hey, I know you, you're ADMIN!"
else
	echo "invalid user"
fi

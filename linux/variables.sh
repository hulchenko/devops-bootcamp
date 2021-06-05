#!/bin/bash

echo "Setup and configure a server"

test_variable=config.yaml

config_dir=$1

if [ -d "$config_dir" ]
then
	echo "Reading config directory: "
	config_files=$(ls "$config_dir")
else
	echo "Config directory is not found. Creating a new one..."
	mkdir "$config_dir"
	touch "$config_dir/config.sh"
fi

echo ""
user_group=$2
echo ""

if [ "$user_group" == "hulchenko" ]
then
	echo "Vadym, configure the server"
elif [ "$user_group" == "admin" ]
then
	echo "Administrator, configure the server"
else
	echo "No permissions to configure the server"
fi

echo "Here's my test_variable: $test_variable"

echo "Here's the list of all config files: $config_files"

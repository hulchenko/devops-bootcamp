#!/usr/bin/env bash
name=$1
path=$2
tar -czvf "$name.tar.gz" "$path" # archive
gpg -c "$name.tar.gz" # encrypt with gpg extension
rm -rf "$name.tar.gz" # remove archived file
#!/bin/bash
# echo 1 -> clear the PageCache only
# echo 2 -> clear dentries and inodes
# echo 3 -> clear PageCache, dentries and inodes

echo "echo 1 > /proc/sys/vm/drop_caches"
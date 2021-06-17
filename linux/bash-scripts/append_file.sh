#!/bin/bash

echo "Before appending"
cat test.txt

echo "Some extra text bla-bla-bla-bla" >> test.txt
echo "After appending"
cat test.txt

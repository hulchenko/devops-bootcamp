#!/bin/bash

echo "Wait!" 
process_id=$!
wait $process_id
echo "Exited with status $?"

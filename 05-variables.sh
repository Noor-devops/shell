#!/bin/bash

# TIMESTAMP=$(date)  -- running a command inside the shell script and take output in timestamp variable.
# echo "Time is: $TIMESTAMP"

START_TIME=$(date +%s)

sleep 10

END_TIME=$(date +%s)

TOTAL_TIME=$(($END_TIME-$START_TIME))

echo "Script executed in $TOTAL_TIME seconds" #testing
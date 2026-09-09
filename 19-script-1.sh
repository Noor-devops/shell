#!/bin/bash

COUNTRY=INDIA

echo "Country : $COUNTRY"
echo "PID of script-1: $$"

#sh 20-script-2.sh # it run the script but not able to access the variables and PID is diiferent

source ./20-script-2.sh # here able to access the variables and PID is same.
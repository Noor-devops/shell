#!/bin/bash

# NUMBER=$1

# # gt - greater than
# # lt - less than
# # eq - equal
# # ne - not equal
# # ge - greater than or equal
# # le - less than or equal

# if [ $NUMBER -gt 20 ]; then
#     echo "Given number $NUMBER is greater to 20"
# elif [ $NUMBER -eq 20 ]; then
#     echo "Given number $NUMBER is equal to 20"
# else
#     echo "Given number $NUMBER is less than 20"
# fi

num1=$1
num2=$2

if [ $num1 -ge $num2]; then
    echo "given number $num1 is grater or equl to $num2"
else   
    echo "given number $num1 is less to $num2"
fi
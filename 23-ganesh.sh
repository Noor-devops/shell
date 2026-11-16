#!/bin/bash
USERID=$(id -u)
#echo "User ID is: $USERID"
if [ $USERID -eq 0 ]; then
    echo "please run this script with root access"
    echo "Installing nginx"
fi
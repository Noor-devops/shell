#!/bin/bash
USERID=$(id -u)
#echo "User ID is: $USERID"
if [ $USERID -eq 0 ]; then
    echo "You are root user"
    echo "Installing nginx"
    else
    echo "You are not root user"
fi
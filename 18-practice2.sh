#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root access"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "Installing $2 is.....Failed"
    else
        echo "Installing $2 is.....Success"
    fi
}

for package in $@
do
    echo "Installing $package"
    dnf list installed $package
    dnf install $package
    VALIDATE $? "Installing $package"

done



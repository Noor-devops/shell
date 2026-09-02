#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

if [ $USERID -ne 0 ]; then
    echo "$TIMESTAMP [INFO] Please run this script with root access"
    exit 1
fi

VALIDATE(){
    if [ $2 -ne 0 ]; then
        echo "$TIMESTAMP [ERROR] Installing $1 is.....Failed" | tee -a $LOGS_FILE
    else
        echo "$TIMESTAMP [INFO] Installing $1 is.....Success" | tee -a $LOGS_FILE
    fi
}

for package in $@
do
    echo "Installing $package"
    dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ]; then
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE "Installing $package" $?
    else
        echo "$TIMESTAMP [INFO] $package already installed ... SKIPPING"
    fi
done




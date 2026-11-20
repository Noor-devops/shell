#!/bin/bash
# checking sudo user or not
USERID=$(id -u)
#echo "User ID is: $USERID"
if [ $USERID -ne 0 ]; then
    echo "please run this script with root access"
    exit 1
fi
dnf list installed nginx
if [ $? -eq 0 ]; then
    echo "nginx is already installed"
    exit 0
fi
echo "Installing nginx"
dnf install nginx -y
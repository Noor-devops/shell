#!/bin/bash
userid=$(id -u)
if [ $userid -eq 0 ]; then
	echo " yes user have root access"
else 
	echo "please try to install with root access"
fi
validate(){
    if [ $2 -ne 0 ]; then
        echo "Installing $1 is ....FAILED"
        exit 1
    else
        echo "Installing $1 is ....SUCCESS"
    fi
}
dnf list installed nginx
if [ $? -eq 0 ]; then
    echo "nginx is already installed.. SKIPPING"
else 
    echo "Installing nginx..."
    dnf install nginx -y 
    validate nginx $?
fi

dnf list installed mysql
if [ $? -eq 0 ]; then
    echo "mysql is already installed.. SKIPPING"
else 
    echo "Installing mysql..."
    dnf install mysql -y 
    validate mysql $?
fi
dnf list installed git
if [ $? -eq 0 ]; then
    echo "git is already installed.. SKIPPING"
else 
    echo "Installing git..."
    dnf install git -y 
    validate git $?
fi
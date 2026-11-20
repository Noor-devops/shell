#!/bin/bash
# checking sudo user or not
USERID=$(id -u)
#echo "User ID is: $USERID"
if [ $USERID -ne 0 ]; then
    echo "please run this script with root access"
    exit 1
fi
# first arg-> what are u trying to install, second arg-> exit code
VALIDATE(){
    if [ $2 -ne 0 ]; then
        echo "Installing $1 is ....FAILID"
        exit 1
    else
        echo "Installing $1 is ....SUCCESS"
    fi
}
dnf list installed nginx
if [ $? -eq 0 ]; then
    echo "nginx is already installed..SKIPPING"
else 
    echo "Installing nginx"
    dnf install nginx -y
    VALIDATE nginx $?
fi



# dnf list installed mysql
# if [ $? -eq 0 ]; then
#     echo "mysql is already installed"
#     #exit 0
# fi
# echo "Installing mysql"
# dnf install mysql -y

# dnf list installed git
# if [ $? -eq 0 ]; then
#     echo "git is already installed"
#     #exit 0
# fi
# echo "Installing git"
# dnf install git -y
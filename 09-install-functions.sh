#!/bin/bash

# install mysql command through shell script
# 1. user should have root access or run script with root access
# 2. if root allow, otherwise exit the script with proper reason
# 3. install the command
# 4. check exit status, if 0 show success
# 5. if not 0 show failure

# it is our responsibility to check everytime whether the previous command is succes or not

# add another thing, check if package is already installed or not, if installed show already installed, otherwise install

# functions
# =========
# keep the repeated code in a function, call that function when required. pass the inputs required for that function

# 1. less lines of code
# 2. less time
# 3. less resources

# FUNC_NAME(){
# 	$1 $2
# 	keep the code here
# }

# FUNC_NAME arg-1 arg-2

# redirections
# ============
# < -> inputs
# > -> output
# >> -> append to output

# 1 -> success
# 2 ->  failure
# & -> succes/failure


USERID=$(id -u)
#echo "Please run this script with $USERID root access"

#Check root access or not
if [ $USERID -ne 0 ]; then
    echo "Please run this script with root access"
    exit 1
fi

VALIDATE(){
    if [ $2 -ne 0 ]; then
        echo "Installing $1 is ... FAILED"
        exit 1
    else
        echo "Installing $1 is ... SUCCESS"
    fi
}

dnf list installed mysql

if [ $? -eq 0 ]; then
    echo "Mysql is already installed.. SKIPPING"
else 
    echo "Install MySQL..."
    dnf install mysql -y
    VALIDATE mysql $?
    
fi

# dnf list installed nginx

# if [ $? -eq 0 ]; then
#     echo "nginx is already installed.. SKIPPING"
# else 
#     echo "Install nginx..."
#     dnf install nginx -y

#     if [ $? -ne 0 ]; then
#         echo "Installing ngnix is ... FAILED"
#         exit 1
#     else
#         echo "Installing ngnix is ... SUCCESS"
#     fi
# fi

# dnf list installed git

# if [ $? -eq 0 ]; then
#     echo "git is already installed.. SKIPPING"
# else 
#     echo "Install git..."
#     dnf install git -y

#     if [ $? -ne 0 ]; then
#         echo "Installing git is ... FAILED"
#         exit 1
#     else
#         echo "Installing git is ... SUCCESS"
#     fi
# fi
# first arg -> what are you trying to install
# second arg -> exit code
# VALIDATE(){
#     if [ $2 -ne 0 ]; then
#         echo "Installing $1 is ... FAILED"
#         exit 1
#     else
#         echo "Installing $1 is ... SUCCESS"
#     fi
# }

# echo "I am continuing..."
# echo "Install MySQL..."
# dnf install mysql -y

# if [ $? -ne 0 ]; then
#         echo "Installing mysql is ... FAILED"
#         exit 1
#     else
#         echo "Installing mysql is ... SUCCESS"
#     fi


# if [ $? -eq 0 ]; then
#     echo "MySQL is already installed ... SKIPPING"
# else
#     echo "Installing MySQL"
#     dnf install mysql -y
#     VALIDATE MySQL $?
# fi

# dnf list installed nginx
# if [ $? -eq 0 ]; then
#     echo "nginx is already installed ... SKIPPING"
# else
#     echo "Installing nginx"
#     dnf install nginx -y
#     VALIDATE nginx $?
# fi
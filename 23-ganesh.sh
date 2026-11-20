#!/bin/bash
# checking sudo user or not
# USERID=$(id -u)
# LOGS_FOLDER="/var/log/roboshop"
# sudo mkdir -p $LOGS_FOLDER
# sudo chown -R ec2-user:ec2-user $LOGS_FOLDER
# sudo chmod -R 755 $LOGS_FOLDER
# LOGS_FILE="$LOGS_FOLDER/$0.log"
# #echo "User ID is: $USERID"
# if [ $USERID -ne 0 ]; then
#     echo "please run this script with root access"
#     exit 1
# fi
# # first arg-> what are u trying to install, second arg-> exit code
# VALIDATE(){
#     if [ $2 -ne 0 ]; then
#         echo "Installing $1 is ....FAILID" | tee -a $LOGS_FILE
#         exit 1
#     else
#         echo "Installing $1 is ....SUCCESS" | tee -a $LOGS_FILE
#     fi
# }
# dnf list installed nginx &>> $LOGS_FILE
# if [ $? -eq 0 ]; then
#     echo "nginx is already installed..SKIPPING" | tee -a $LOGS_FILE
# else 
#     echo "Installing nginx"
#     dnf install nginx -y &>> $LOGS_FILE
#     VALIDATE nginx $?
# fi

# dnf list installed mysql &>> $LOGS_FILE
# if [ $? -eq 0 ]; then
#     echo "mysql is already installed..SKIPPING" | tee -a $LOGS_FILE
# else 
#     echo "Installing mysql"
#     dnf install mysql -y &>> $LOGS_FILE
#     VALIDATE mysql $?
# fi


USERID=$(id -u)
LOGS_FOLDER="/var/log/roboshop"
sudo mkdir -p $LOGS_FOLDER
sudo chown -R ec2-user:ec2-user $LOGS_FOLDER
sudo chmod -R 755 $LOGS_FOLDER
LOGS_FILE="$LOGS_FOLDER/$0.log"
#echo "User ID is: $USERID"
if [ $USERID -ne 0 ]; then
    echo "please run this script with root access"
    exit 1
fi
# first arg-> what are u trying to install, second arg-> exit code
VALIDATE(){
    if [ $2 -ne 0 ]; then
        echo "Installing $1 is ....FAILID" | tee -a $LOGS_FILE
        exit 1
    else
        echo "Installing $1 is ....SUCCESS" | tee -a $LOGS_FILE
    fi
}
for package in $@
do
    echo "Installing $package"
    dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ]; then
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE $package $?
    else
        echo "$package is already installed..SKIPPING" | tee -a $LOGS_FILE
    fi 
done
# dnf list installed nginx &>> $LOGS_FILE
# if [ $? -eq 0 ]; then
#     echo "nginx is already installed..SKIPPING" | tee -a $LOGS_FILE
# else 
#     echo "Installing nginx"
#     dnf install nginx -y &>> $LOGS_FILE
#     VALIDATE nginx $?
# fi

# dnf list installed mysql &>> $LOGS_FILE
# if [ $? -eq 0 ]; then
#     echo "mysql is already installed..SKIPPING" | tee -a $LOGS_FILE
# else 
#     echo "Installing mysql"
#     dnf install mysql -y &>> $LOGS_FILE
#     VALIDATE mysql $?
# fi
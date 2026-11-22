#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/roboshop"
sudo mkdir -p $LOGS_FOLDER
sudo chown -R ec2-user:ec2-user $LOGS_FOLDER
sudo chmod -R 755 $LOGS_FOLDER
LOGS_FILE="$LOGS_FOLDER/$0.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
#echo "User ID is: $USERID"
if [ $USERID -ne 0 ]; then
    echo "please run this script with root access"
    exit 1
fi
# first arg-> what are u trying to install, second arg-> exit code
VALIDATE(){
    if [ $2 -ne 0 ]; then
        echo -e "$TIMESTAMP: [ERROR] $1 is ....$R FAILED $N" | tee -a $LOGS_FILE
        exit 1
    else
        echo -e "$TIMESTAMP: [INFO] $1 is ....$G SUCCESS $N" | tee -a $LOGS_FILE
    fi
}

cp mongo.repo /etc/yum.repos.d/mongo.repo
VALIDATE "Adding Mongo repo" $?

dnf install mongodb-org -y 
VALIDATE "Installing Mongo DB" $?
 
systemctl start mongod 
VALIDATE "Starting Mongo DB" $?

systemctl enable mongod
VALIDATE "Enabling Mongo DB" $?

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf
VALIDATE "Allowing remote connections to MongoDB" $?

stsystemctl restart mongod
VALIDATE "Restarting the mondodb server" $?
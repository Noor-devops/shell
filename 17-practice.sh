# userid=$(id -u)
# #echo "this is root user $userid"

# if [ $userid -ne 0 ]; then
#     echo "please try to install with root access"
#     exit 1
# fi

# dnf list installed mysql

# if [ $? -eq 0 ]; then
#     echo "mysql is already installed....SKIPPING"
#     exit 1
# else
#     echo "installing mysql"
#     dnf install mysql -y
#     if [ $? -ne 0 ]; then
#         echo "mysql installation failed."
#         exit 1
#     else 
#         echo "mysql installation successfull"
#     fi
# fi

# userid=$(id -u)
# #echo "this is root user $userid"

# if [ $userid -ne 0 ]; then
#     echo "please try to install with root access"
#     exit 1
# fi

# VALIDATE(){
#     if [ $2 -ne 0 ]; then
#         echo "$1 installation failed."
#         exit 1
#     else 
#         echo "$1 installation successfull"
#     fi
# }

# dnf list installed mysql

# if [ $? -eq 0 ]; then
#     echo "mysql is already installed....SKIPPING"
#     #exit 1
# else
#     echo "installing mysql"
#     dnf install mysql -y
#     VALIDATE mysql $?
# fi

# dnf list installed nginx

# if [ $? -eq 0 ]; then
#     echo "nginx is already installed....SKIPPING"
#     #exit 1
# else
#     echo "installing nginx"
#     dnf install nginx -y
#     VALIDATE nginx $?
# fi



userid=$(id -u)
#echo "this is root user $userid"
LOGS_DIR=/home/ec2-user/shell-logs
LOGS_FILE="$LOGS_DIR/$0.log"

if [ $userid -ne 0 ]; then
    echo "please try to install with root access"
    exit 1
fi

VALIDATE(){
    if [ $2 -ne 0 ]; then
        echo "$1 installation failed."
        exit 1
    else 
        echo "$1 installation successfull"
    fi
}

dnf list installed mysql &>> $LOGS_FILE

if [ $? -eq 0 ]; then
    echo "mysql is already installed....SKIPPING"
    #exit 1
else
    echo "installing mysql" 
    dnf install mysql -y &>> $LOGS_FILE
    VALIDATE mysql $?
fi

dnf list installed nginx &>> $LOGS_FILE

if [ $? -eq 0 ]; then
    echo "nginx is already installed....SKIPPING"
    #exit 1
else
    echo "installing nginx"
    dnf install nginx -y &>> $LOGS_FILE
    VALIDATE nginx $?
fi

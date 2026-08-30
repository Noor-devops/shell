userid=$(id -u)
#echo "this is root user $userid"

if [ $userid -ne 0 ]; then
    echo "please try to install with root access"
    exit 1
fi

dnf list installed mysql

if [ $? -eq 0 ]; then
    echo "mysql is already installed....SKIPPING"
    exit 1
else
    echo "installing mysql"
    dnf install mysql -y
    if [ $? -ne 0 ]; then
        echo "mysql installation failed."
        exit 1
    else 
        echo "mysql installation successfull"
    fi
fi
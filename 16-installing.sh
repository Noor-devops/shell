USERID=$(id -u)
echo "$USERID"

if [ $USERID -ne 0 ]; then
    echo "please run the script with root access"
    exit 1 # edi manam tesukuntunna precration
fi


dnf list installed mysql

if [ $? -eq 0 ]; then
    echo "mysql already installed ... skipping"
    exit 1
else
    echo "installing mysql"
    dnf install mysql -y

    if [ $? -ne 0 ]; then
        echo "installimg is ...failed"
        exit 1
    else
        echo "installing is success"
    fi
fi    


dnf list installed nginx

if [ $? -eq 0 ]; then
    echo "ngnix already installed ... skipping"
    exit 1
else
    echo "installing nginx"
    dnf install ngnix -y

    if [ $? -ne 0 ]; then
        echo "installimg is ...failed"
        exit 1
    else
        echo "installing is success"
    fi
fi    
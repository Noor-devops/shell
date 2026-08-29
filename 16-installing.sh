USERID=$(id -u)
echo "$USERID"

if [ $USERID -ne 0 ]; then
    echo "please run the script with root access"
    exit 1 # edi manam tesukuntunna precration
fi

VALIDATE(){
    if [ $2 -ne 0 ]; then
        echo "installimg is $1 ...failed"
        exit 1
    else
        echo "installing is $1 success"
    fi
}
dnf list installed mysql

if [ $? -eq 0 ]; then
    echo "mysql already installed ... skipping"
    exit 1
else
    echo "installing mysql"
    dnf install mysql -y
    VALIDATE mysql $?
fi    

echo "installing nginx"
dnf list installed nginx

if [ $? -eq 0 ]; then
    echo "ngnix already installed ... skipping"
    exit 1
else
    echo "installing nginx"
    dnf install nginx -y
     VALIDATE nginx $?
fi    
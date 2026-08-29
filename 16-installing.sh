USERID=$(id -u)
echo "$USERID"

if [ $USERID -ne 0 ]; then
    echo "please run the script with root access"
    exit 1 # edi manam tesukuntunna precration
fi

echo "installing mysql"
dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "installimg is ...failed"
    exit 1
else
    echo "installing is success"
fi
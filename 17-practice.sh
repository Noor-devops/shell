userid=$(id -u)
#echo "this is root user $userid"

if [ $userid -ne 0 ]; then
    echo "please try to install with root access"
    exit 1
fi

echo "installing nodejs"

dnf install nodejs -y

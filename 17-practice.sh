userid=$(id -u)
#echo "this is root user $userid"

if [ $userid -ne 0 ]; then
    echo "please try to install with root access"
    exit 1
fi

dnf list installed nodejs

if [$? -eq 0]; then
    echo "nodejs is already installed....SKIPPING"
else
    echo "installing nodejs"
    dnf install nodejs -y
    if [ $? -ne 0 ]; then
        echo "nodejs installation failed."
        exit 1
    else 
        echo "nodejs installation successfull"
    fi
fi
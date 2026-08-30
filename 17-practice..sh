userid=$(id -u)
#echo "this is root user $userid"

if [ $? -ne 0]; then
    echo "please try to install with root access"
    exit 1
fi
echo "love"
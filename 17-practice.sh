userid=$(id -u)
echo "$userid"
#echo "this is root user $userid"

if [ $userid -ne 0 ]; then
    echo "please try to install with root access"
    exit 1
fi
echo "love"
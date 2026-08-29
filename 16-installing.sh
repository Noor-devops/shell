USERID=$(id -u)
echo "$USERID"

if [ $USERID -ne 0]; then
    echo "please run the script with root access"
fi

echo "im relaxing"
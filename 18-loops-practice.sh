USERID=(id-u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root access"
    exit 1
fi

for package in $@
do
    echo "installing $package"
done
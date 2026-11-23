#!/bin/bash
userid=$(id -u)
if [ $userid -eq 0 ]; then
	echo " yes user have root access"
else 
	echo "please try to install with root access"
fi
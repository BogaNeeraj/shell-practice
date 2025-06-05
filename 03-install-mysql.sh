#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
  echo "error:: please run as root user"
  exit 1 # You can give other than 0
else 
  echo "you are running with the root user"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
 echo " my sql is not installed, it is going to install"
 dnf install mysql -y
 if [ $? -eq 0 ]
 then 
  echo " installing mysql is success"
 else
  echo " installing my sql is ... Failure"
  exit 1
else
 echo "my sql is installed"
 exit 1
fi

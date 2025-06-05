#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
  echo "error:: please run as root user"
  exit 1 # You can give other than 0
else 
  echo "you are running with the root user"
fi

VALIDATION() {
    if [ $1 -eq 0 ]
    then 
      echo "$2...Sucessful"    
    else
      echo "$2...failed"
      exit 1
    fi
}
dnf list installed mysql

if [ $? -ne 0 ]
then 
 echo " my sql is not installed, it is going to install"
 dnf install mysql -y
 VALIDATION $? "MYSQL"


else
 echo "my sql is installed"

fi

dnf list installed python3

if [ $? -ne 0 ]
then 
 echo " my python3 is not installed, it is going to install"
 dnf install python -y
VALIDATION $? "python"

else
 echo "python3 is installed"

fi

dnf list installed nginx

if [ $? -ne 0 ]
then 
 echo " nginx is not installed, it is going to install"
 dnf install nginx -y
 VALIDATION $? "nginx"

else
 echo "nginx is installed"

fi
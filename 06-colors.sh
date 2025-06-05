#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
  echo -e "$R error:: please run as root user $N"
  exit 1 # You can give other than 0
else 
  echo -e "$G you are running with the root user $N"
fi

VALIDATION() {
    if [ $1 -eq 0 ]
    then 
      echo -e "$G $2...Sucessful $N"    
    else
      echo -e "$R $2...failed $N"
      exit 1
    fi
}
dnf list installed mysql

if [ $? -ne 0 ]
then 
 echo -e " $Y my sql is not installed, it is going to install $N"
 dnf install mysql -y
 VALIDATION $? "MYSQL"


else
 echo -e " $G my sql is installed $N"

fi

dnf list installed python3

if [ $? -ne 0 ]
then 
 echo -e " $Y my python3 is not installed, it is going to install $N"
 dnf install python -y
VALIDATION $? "python"

else
 echo -e "$G python3 is installed $N"

fi

dnf list installed nginx

if [ $? -ne 0 ]
then 
 echo -e "$Y nginx is not installed, it is going to install $N"
 dnf install nginx -y
 VALIDATION $? "nginx"

else
 echo -e "$G nginx is installed $N"

fi
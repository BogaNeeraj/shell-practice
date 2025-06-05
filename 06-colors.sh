#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/logs/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
TIMESTAMP=$(data + %F-%H-%M-%S)

mkdir -p $LOGS_FOLDER
echo "script staterted executing at $TIMESTAMP" &>>  | tee -a $LOG_FILE #to print on the console
if [ $USERID -ne 0 ]
then
  echo -e "$R error:: please run as root user $N" | tee -a $LOG_FILE
  exit 1 # You can give other than 0
else 
  echo -e "$G you are running with the root user $N" | tee -a $LOG_FILE
fi

VALIDATION() {
    if [ $1 -eq 0 ]
    then 
      echo -e "$G $2...Sucessful $N" &>> $LOG_FILE 
    else
      echo -e "$R $2...failed $N" &>> $LOG_FILE
      exit 1
    fi
}
dnf list installed mysql

if [ $? -ne 0 ]
then 
 echo -e " $Y my sql is not installed, it is going to install $N" | tee -a $LOG_FILE
 dnf install mysql -y
 VALIDATION $? "MYSQL" &>> $LOG_FILE


else
 echo -e " $G my sql is installed $N" | tee -a $LOG_FILE

fi

dnf list installed python3

if [ $? -ne 0 ]
then 
 echo -e " $Y my python3 is not installed, it is going to install $N" | tee -a $LOG_FILE
 dnf install python -y
VALIDATION $? "python" &>> $LOG_FILE

else
 echo -e "$G python3 is installed $N" | tee -a $LOG_FILE

fi

dnf list installed nginx

if [ $? -ne 0 ]
then 
 echo -e "$Y nginx is not installed, it is going to install $N" | tee -a $LOG_FILE
 dnf install nginx -y
 VALIDATION $? "nginx" &>> $LOG_FILE

else
 echo -e "$G nginx is installed $N" | tee -a $LOG_FILE

fi
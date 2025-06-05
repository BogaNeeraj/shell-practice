#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "python" "nginx" "httpd")

mkdir -p $LOGS_FOLDER
echo "Script started executing at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: Please run this script with root access $N" | tee -a $LOG_FILE
    exit 1 #give other than 0 upto 127
else
    echo "You are running with root access" | tee -a $LOG_FILE
fi

# validate functions takes input as exit status, what command they tried to install
VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "Installing $2 is ... $G SUCCESS $N" | tee -a $LOG_FILE
    else
        echo -e "Installing $2 is ... $R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    fi
 }

#for package in ${PACKAGES[@]}
for package in $@
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo "$package is not installed... going to install it" | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package"
    else
        echo -e "Nothing to do $package... $Y already installed $N" | tee -a $LOG_FILE
    fi
done 
# #!/bin/bash

# USERID=$(id -u)

# R="\e[31m"
# G="\e[32m"
# Y="\e[33m"
# N="\e[0m"

# LOGS_FOLDER="/var/log/shellscript1.logs"
# SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
# LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
# TIMESTAMP=$(date +%F-%H-%M-%S)
# #PACKAGES=("mysql", "nginx")

# mkdir -p $LOGS_FOLDER
# echo "script execution started at $TIMESTAMP" &>> $LOG_FILE

# if [ $USERID -ne 0 ]
# then 
#  echo "$R Error::you are not running with the root user $N" >> $LOG_FILE
# else
#  echo "$G you are running with the root user $N" >> $LOG_FILE

# VALIDATE() {
#     if [ $1 -ne 0 ]
#     then 
#      echo " $2 is successfull "
#     else 
#      echo " $2 is Failure"
#      exit 1
#     fi

# }

# #for packages in ${PACKAGES[@]}
# for package in $@
# do
#  dnf list installed $package &>> $LOG_FILE
#  if [ $? -ne 0 ]
#  then 
#   echo "package is going to installed "
#   dnf install $package -y &>> $LOG_FILE
#   VALIDATE $? "$package"
#  else 
#   echo "package is already installed"
#  fi

# done

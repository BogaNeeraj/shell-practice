#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
  echo "error:: please run as root user"
  exit 1 # You can give other than 0
else 
  echo "you are running with the root user"
fi #Reverse of if indicates ending of condition.
#Shell script won't stop if it faces errors, al other languages will stop. 
#So we use exit status command to check previous command is success or not.
#Shell script will store the command output in exit status and Command for exit status is $?

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
fi
else
 echo "my sql is installed"
 exit 1
fi

dnf install git -y

if [ $? -ne 0 ]
then 
 echo "the installation is failed"
 exit 1
else 
 echo "installation is successfull"
fi

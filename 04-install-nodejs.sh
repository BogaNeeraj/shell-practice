#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
 echo " error:: please run with the root user"
 exit 1
else
 echo " you are running with root user"
fi

dnf install nodejs -y

if [ $? -ne 0 ]
then 
 echo "installing nodejs is successfull"
else 
 echo "installing nodejs is ..Failure"
 exit 1
fi
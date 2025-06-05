#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
 echo " error:: please run with the root user"
 exit 1
else
 echo " you are running with root user"
fi

dnf install nodejs:20 -y
#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
 echo " please run with the root user"
else
 echo " you are running with root user"
fi

dnf install nodejs:20 -y
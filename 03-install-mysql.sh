#!/bin/bash

$USERID=$(id -u)

if [ $USERID -ne 0 ]
then
  echo "error:: please run as root user"
  #exit 1 # You can give other than 0
else 
  echo "you are running with the root user"
fi
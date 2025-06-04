#!/bin/bash

echo "all variables passed to the script: $@"
echo "number of variables: $#"
echo "script name : $0"
echo "present working directort :$PWD"
echo "home directory of the user :$HOME"
echo "user running :$USER"
echo "present pid of the server :$$"
sleep 10
echo "last command running background :$!"



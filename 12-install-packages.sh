#!/bin/bash

ID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ $ID -ne 0 ]
then
    echo -e " $R Please run the script with root access $N"
    exit 1
else
    echo "$G you are root user $N"
fi

echo "All arguments passed :: $@"


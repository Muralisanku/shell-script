#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e  "$2 .... $R FAILED $N"
    else
        echo -e  "$2 .... $G SUCCESS $N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: Please run this script with Root access $N"
    exit 1
else
    echo "You are Root user"
fi

#echo "All Args passed: $@"

for package in $@
do
    yum list installed $package &>> $LOGFILE
    if [ $? -ne 0 ]
    then
    yum install $package -y &>> $LOGFILE
    VALIDATE $? "Installation of $package"
    else
    echo -e "$package is already installed... $Y SKIPPING $N"
    fi
done

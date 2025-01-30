#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGFILE="/tmp/$0-$TIMESTAMP.log"
VALIDATE(){
        if [ $1 -ne 0 ]
    then
        echo "$2 ... $R failed $N "
        exit 1
    else
        echo "$2 ... $G SUCCESS $N "
    fi
}
if [ $ID -ne 0 ]
then
    echo " $R ERROR:: Please run this script with Root access $N "
    exit 1
else
    echo "You are Root user"
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "Installing MySQL"

yum install git -y &>> $LOGFILE

VALIDATE $? "Installing GIT"

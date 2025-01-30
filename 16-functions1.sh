#!/bin/bash

ID=$(id -u)

VALIDATE(){
        if [ $1 -ne 0 ]
    then
        echo "$2 ... failed"
        exit 1
    else
        echo "$2 ... SUCCESS"
    fi
}
if [ $ID -ne 0 ]
then
    echo "ERROR:: Please run this script with Root access"
    exit 1
else
    echo "You are Root user"
fi

yum install mysql -y

VALIDATE $? "Installing MySQL"

yum install git -y

VALIDATE $? "Installing GIT"

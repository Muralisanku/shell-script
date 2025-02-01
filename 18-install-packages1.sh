#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e  "$2 .... $R FAILED $N"
    else
        echo -e  "$2 .... $G FAILED $N"
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
    yum list installed $package
    if [ $? -ne 0 ]
    then
    yum install $package -y
    VALIDATE $? "Installation of $package"

done

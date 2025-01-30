#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "ERROR:: Please run this script with Root access"
    exit 1
else
    echo "You are Root user"
fi

yum install mysql -y
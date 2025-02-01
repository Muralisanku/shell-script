#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: Please run this script with Root access $N"
    exit 1
else
    echo "You are Root user"
fi

echo "All Args passed: $@"


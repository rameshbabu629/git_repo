#!/bin/bash
echo -n "Enter first number:"
read x
echo -n "Enter second number:"
read y
(( sum=x+y ))
echo "The result of addition=$sum"

var="MCU_VERSION";
destdir=/f/𝖎𝖓𝖕𝖚𝖙𝖘/926DevOps_Android Build Engineer/first_git_practice/testfile2.txt

if [ -f "$destdir" ]
then
    echo "$var" > "$destdir"
fi

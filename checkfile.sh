#!/bin/bash

read -p "Enter your file/directory: " f_d

if [ -e "${f_d}" ]
then

if [ -f "${f_d}" ]
then
   echo "you entered file path"

else 
   echo "you entered directory path"
fi

else 
   echo "you give file/directory is not exist"
fi

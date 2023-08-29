#!/bin/bash

read -p "Enter service name: " ser_name
read -p "Enter action to the service(start/stop/restart/status): " act_for_ser

echo -e "Service name is: ${ser_name} \n action is: ${act_for_ser}"
status=` systemctl status httpd | grep -i active | awk '{ print $2 }'

if [ "${act_for_ser}" == "start" ]
then
  if [ "${status}" == "inactive" ]
  then
    echo "Please wait we are starting service : ${ser_name}"
    systemctl start ${ser_name}
  else
    echo "Service is already in running state"
  fi
fi

if ["${act_for_ser}" == "stop" ]
then
  if [ "${status}" == "active" ]
  then
    echo "Please wait service is stoping"
    systemctl stop ${ser_name}
  else
    echo "service: ${act_for_ser} is alreday in stoped state"
  fi
fi

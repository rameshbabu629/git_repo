#!/bin/bash

read -p "Enter service name: " ser_name
read -p "Enter action to the service(start/stop/restart/status): " act_for_ser
act_for_ser=`echo "${act_for_ser}" | tr A-Z a-z`

check_act="startstoprestartstatus"
valid_invalid=`echo "${check_act}" | grep ${act_for_ser} | wc -l`
if [ ${valid_invalid} -eq 0 ]
then
  echo " Entered invalid action"
  echo "Please select action in start/stop/restart/status"
  exit
fi

echo -e "Service name is: ${ser_name} \n action is: ${act_for_ser}"
status=` systemctl status httpd | grep -i active | awk '{ print $2 }'`

if [ "${act_for_ser}" == "start" ]
then
  if [ "${status}" == "inactive" ]
  then
    echo "Please wait we are starting service : ${ser_name}"
    systemctl start ${ser_name}
  else
    echo "Service is already in running state"
  fi
elif ["${act_for_ser}" == "stop" ]
then
  if [ "${status}" == "active" ]
  then
    echo "Please wait service is stoping"
    systemctl stop ${ser_name}
  else
    echo "service: ${act_for_ser} is alreday in stoped state"
  fi
elif [ "${act_for_ser}" == "status" ]
then
  echo " The current status of ${ser_name} is ${satus} "
elif [ "${act_for_ser}" == "restart" ]
then
  echo "please wait restarting service ${ser_name}"
  systemctl restart ${ser_name}
fi

#!/usr/bin/env bash

#USAGE:This script can start,stop,restart,to know the status, of any service you want



#read -p "Enter the service you want to apply with docker (start,stop,restart,status):" servicename
#sudo systemctl $servicename docker

#read -p "Enter the service that you want to execute: " servicename
#read -p "Enter the action that you want to execute $servicename:"  action
#sudo systemctl $action ${serviceName}



if [[ $# -ne 2 ]]
then
    echo "you cannot run the script without mentioning along service and action in which you want to execute as shown below"
    echo " $0 <servicename> <action to execute on service> " 
    exit 1
fi


servicename=$1
action=$2
sudo systemctl $action ${servicename}

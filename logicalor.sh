#/usr/bin/env bash

read -p "proceed the confirmation before starting docker: (yes/no)" cnf
#if [[ $cnf == yes || $cnf == y ]]
if [[ $cnf =~ yes|y ]] 
then
    echo "starting the docker service.."
    sleep 1
    sudo systemctl start docker
    echo "docker service have started sucessfully"
else
    if [[ $cnf == no ]] || [[ $cnf == n ]]
    then
    echo "ok cancelled the conformation"
    fi
fi



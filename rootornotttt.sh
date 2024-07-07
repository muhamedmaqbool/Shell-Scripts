#!/usr/bin/env bash
#userID=$(id -u)
#         [[ userID -eq 0 ]] && { echo "your are a root user" ; echo "thanks" ; } 





#[[ $(id -u) -eq 0 ]] && { echo "you are a root user" ; echo "so are you happy mr $(hostname)" ; } || echo "you are not a root user"


<< maqqu
if [[ $(id -u) -eq 0 ]] 2>&1 1>/dev/null
then
    echo "you are a root user"
    echo "hurray"
else
    echo "you are not a root user"
    echo "so sad"
fi





if [[ $(sudo -v) -eq 0 ]] 2>1 1>/dev/null 
then
    echo "you have sudo permission"
    echo "hurray"
else
    echo "you have no sudo permission"
    echo "sorry"
fi
maqqu

[[ $(sudo -v) -eq 0 ]] && { echo "you have sudo permission" ; echo "congrats" ; } || echo "you dont have sudo permission"

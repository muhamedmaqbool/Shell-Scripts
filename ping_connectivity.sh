#!/bin/bash

iplist="/home/maqbool/SHELLSCRIPTS/IMP_SHELL/iplist"
if [ ! -e "${iplist}" ]
    then
      echo "unable to run the script"
      echo "create a file named iplist in the path (/home/maqbool/SHELLSCRIPTS/IMP_SHELL) and mention the ips that needed to ping in that file so, then retry"
      exit 2
fi

for ip in $(cat $iplist)
do
	ping -c1 $ip &> /dev/null               #c1 means to ping once (c1 means count1)
        if [ $? -eq 0 ]
        then
           echo "$ip has internet connectivity"
        else
           echo "$ip has no internet connectivity"
        fi
done


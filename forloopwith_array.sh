#/usr/bin/env bash
#usage: this script to send mail alert when services are not working

#for maqbool in docker nginx
#do
#  echo "the service is $maqbool"
#done


service=(docker nginx)
for maqbool in ${service[@]}
do
  systemctl status $maqbool 1>/dev/null 2>/dev/null
  if [[ $? -ne 0 ]]
  then
     echo "The service $maqbool is not running"
     echo "The service $maqbool is not running in the host $(hostname -s)" | /usr/bin/mail -s "service error" "muhamedmaqbool412@gmail.com"
  fi
done

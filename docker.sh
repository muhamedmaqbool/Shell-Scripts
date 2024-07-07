#/usr/bin/env bash
<< maqqu
if [[ $(id -u) -eq 0 ]]
then
   if systemctl status docker 1>/dev/null 2>/dev/null
   then
      echo "docker is already started and running"
   else
      echo "docker is starting..."
      systemctl start docker
      sleep 1
      echo "docker is sucessfully started"
   fi
else
    echo "docker service could not be started because you are not a root user"
fi
maqqu



#/usr/bin/env bash
if [[ $(id -u) -eq 0 ]]
then
   if systemctl status docker 1>/dev/null 2>/dev/null
   then
      echo "docker is already started and running"
   else
      echo "docker is starting..."
      systemctl start docker
      sleep 1
      echo "docker is sucessfully started"
   fi
else
   if [[ $(sudo -v) -eq 0 ]]
then
    if systemctl status docker 1>/dev/null 2>/dev/null
    then
       echo "docker is already started and running"
    else
       echo "docker is starting..."
       sudo systemctl start docker
       sleep 1
       echo "docker is sucessfully started"
    fi
else
       echo "docker could not be started because you have no sudo previleges awkwards you are not a root user"
    fi
fi


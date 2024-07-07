#/usr/bin/env bash

if [[ $(id -u) -ne 0 ]]
then
   echo "you cannot run this script as a user , so the script has been exitted.........."
   exit 1
fi




<< maqqu
echo "enter any one of the below option that you want to perform with the docker"
read -p "The options are: (start,stop,restart,version,status):" opt
if [[ $opt == start ]]
then
    echo "starting the docker..."
    systemctl start docker
    sleep 1
    echo "sucessfully started docker"
elif [[ $opt == stop ]]
    then
    echo "stoping the docker..."
    systemctl stop docker.socket
    systemctl stop docker.service 
    sleep 1
    echo "sucessfully stopped docker"
elif [[ $opt == restart ]]
    then
    echo "restarting the docker..."
    systemctl restart docker
    sleep 1
    echo "sucessfully restarted docker"
elif [[ $opt == version ]]
     then
     docker=$(docker -v | cut -d " " -f 3 | tr -d ",")
     echo "the version of docker is:" $docker
elif [[ $opt == status ]]
     then
     docker=$( systemctl status docker | grep Active | cut -d ":" -f 2)
     echo "the status of docker is:" $docker
else
    echo "the entered option is invalid"
fi
maqqu







read -p "Enter the option for the docker service(1.start,2.stop,3.restart,4.version,5.status):" opt
case $opt in
          1)
             echo "starting the docker..."
             systemctl start docker
             sleep 1
             echo "sucessfully started docker"
             ;;
          2)
            echo "stopping the docker..."
            systemctl stop docker.socket
            systemctl stop docker
            echo "sucessfully stopped docker"
            ;;
          3)
            echo "restarting the docker..."
            systemctl restart docker
            echo "sucessfully restarted docker"
            ;;
          4)
            docker=$(docker -v | cut -d " " -f 3 | tr -d ",")
            echo "the version of docker is :" $docker
            ;;
          5)
            docker=$( systemctl status docker | grep Active | cut -d ":" -f 2)
            echo "the status of docker is :" $docker
            ;;
          *)
            echo "you entered an invalid option"
            echo "select from the given option either 1,2,3,4,5"
            ;;
esac

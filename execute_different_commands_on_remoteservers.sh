#/usr/bin/env bash

print_header(){
      printf "#%0.s" $(seq 1 $(tput cols))              #this function is to show # in total columns of your os
      printf "\n"                                    #to start next line on new column
}

center_msg(){
   msg=$1                                           #declare an command line argument as $1
   terminalcol=$(tput cols)                         #finding total number of columns
   msg_length=$(echo ${#1})                         #to know the total number of line which have inserted in $1 on command line argument
   pre_space=$(($((terminalcol-msg_length))/2))     #substracting total terminal columns with total number of line which have inserted in $1 and dividing them with 2

   print_header                                     #declared earlier function as for showing # in total columns
   printf " %0.s" $(seq 1 $pre_space)               #putting space before and after on $1 which have inserted in.
   printf "%s" "$1"                                 #here showing the $1 in teminal
   printf "\n"                                      #to begin ### in next line after $1
   print_header                                     #declared earlier function as for showing # in total columns
}

check_remotepass(){
     if [ ! -e "remotepass" ]                       #checking remotepass file is exist or not
     then
        center_msg "WARNING!!! unable to run the script. please store your servers password in >>remotepass<< file and retry"
        exit 1
     fi
}


check_remoteuser(){
     if [ ! -e "remoteuser" ]                       #checking remoteuser file is exist or not
     then
        center_msg "WARNING!!! unable to run the script. please store your servers username in >>remoteuser<< file and retry"
        exit 2
     fi
}

check_list_of_servers(){
      if [ ! -e "list_of_servers" ]                 #checking list_of_servers file is exist or not
      then
          center_msg "WARNING!!! unable to run the script. please store your servers ip list in >>list_of_servers<< file and retry"
          exit 3
      fi
}


center_msg "welcome to the script"
check_remotepass
check_remoteuser
check_list_of_servers
ssh_opt=" sshpass -f remotepass ssh -n -o StrictHostKeyChecking=No -o pubkeyAuthentication=No maqbool"

echo "server_name,OS_type,OS_version,ARCH_type,CPU_type" > serverinformation.csv
while read server
do
  echo "working on $server"
  OS_TYPE=$($ssh_opt@$server "cat /etc/os-release" | grep -w "NAME" | awk -F "=" '{print $2}' | tr '"' " ")
  ARCH_TYPE=$($ssh_opt@$server "uname -p")
  echo  "$OS_TYPE" | grep -i "ubuntu" 1>/dev/null 2>/dev/null          #in here are we are declaring that if OS_TYPE is ubuntu, then redirecting output to /dev/null
    if [ $? -eq 0 ]
    then
       OS_VERSION=$($ssh_opt@$server "cat /etc/os-release" | grep "VERSION_ID" | awk -F "VERSION_ID=" '{print $2}' | tr '"' " ")
       CPU_TYPE=$($ssh_opt@$server "cat /proc/cpuinfo" | grep "model name" | head -n 1 | awk -F ":" '{print $2}')
    else
       OS_VERSION=$($ssh_opt@$server "cat /etc/redhat-release" | awk -F "release" '{print $2}'| awk '{print $1}')
       CPU_TYPE=$($ssh_opt@$server "lscpu" | grep "Model name")
    fi
     echo "The OS type is=$OS_TYPE"
     echo "The OS version is=${OS_VERSION}"
     echo "The Architecture type is= $ARCH_TYPE"
     echo "The CPU type is=$CPU_TYPE"
done < list_of_servers
echo "$server,$OS_TYPE,$OS_VERSION,$ARCH_TYPE,$CPU_TYPE" >> serverinformation.csv

center_msg "Thankyou for using this shell script"

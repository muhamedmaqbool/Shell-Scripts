#!/usr/bin/env bash

TO="muhamedmaqbool412@gmail.com"
TH_L=2800
Free_RAM=$(free -mt | grep Total | awk  '{print $4}')

if [[ $Free_RAM -lt TH_L ]] 
then
   echo -e "Server is running with low RAM size\nAvailable RAM is: $Free_RAM" | /usr/bin/mail -s "RAM INFO $(date)" $TO
fi

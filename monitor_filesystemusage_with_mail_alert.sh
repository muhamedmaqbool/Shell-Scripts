#!/bin/bash
file_usage_limit=60
rm -rf file_system_info.txt
df -Ph | grep -vE "Filesystem|tmpfs|/dev/loop" | while read line
do
  file_name=$(echo $line | awk '{print $1}')
  file_usage=$(echo $line | awk '{print $5}' | sed 's/%//g')
  echo "file system name: $file_name"
  echo "file system usage: $file_usage"
  if [ $file_usage -gt $file_usage_limit ]
  then
    echo "$file_name: $file_usage" >> file_system_info.txt
  fi
done

count=$(cat file_system_info.txt | wc -l)
if [ $count -gt 0 ]
then
   echo "some file system usage is more than the threshhold:"
   echo -e "SUBJECT:ALERT!!\n\n $(cat file_system_info.txt)\n" | /usr/sbin/sendmail "muhamedmaqbool412@gmail.com"
fi


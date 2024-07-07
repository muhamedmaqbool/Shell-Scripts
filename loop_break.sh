#/bin/bash

<< com
for loop in $(ls /home/maqbool | grep .txt)
do
   echo "$loop"
done
com

<< com
cnt=1
for loop in $(ls *.txt)
do
   if [[ $cnt -eq 1 ]]
   then
      echo "$loop"
      ((cnt++))
    fi
done
com


echo "hii goodmorning!!!"
cnt=1
for loop in $(ls *.txt)
do
   if [[ $cnt -eq 1 ]]
   then
      echo "$loop"
      break
    fi
done
echo "good night"

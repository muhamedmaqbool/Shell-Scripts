#/bin/bash
<< com
for((;;))
do
  echo "infinity"
  echo "----------"
done


while true
do
  echo "infinity"
  echo "----------"
done


while date
do
  echo "date command is executing with while loop"
done


while [[ 4 -gt 1 ]]
do
  echo "executing while loop"
  echo "--------------------"
done


start=1
while [[ $start -le 20 ]]
do
  echo "$start"
  ((start++))
done


maqqu=test.txt
while read maqbool
do
  echo "$maqbool"
done < $maqqu
com


ls -lrth | while read maqbool
do
  echo "$maqbool"
  echo "----------"
done

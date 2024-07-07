#/bin/bash
#first method using echo command
<< com
COLUMNS=$(tput cols)
for((i=1;i<COLUMNS;i++))
do
  if [[ $i -eq $COLUMNS ]]
  then
     echo "-"
     break
  fi
  echo -n "-"
done
com

#COLUMNS=$(tput cols)
#printf "%${COLUMNS}s\n" " " | tr " " "-"


#to write the title in the middle of your line
title="THIS IS LINUX SYSTEM!!!!!"
COLUMNS=$(tput cols)
title_size=${#title}
span=$((($COLUMNS + $title_size) / 2))
printf "%${COLUMNS}s" " " | tr " " "*"
printf "%${COLUMNS}s" " " | tr " " "*"
printf "%${COLUMNS}s" " " | tr " " "*"
printf "%${span}s\n" "$title"
printf "%${COLUMNS}s" " " | tr " " "*"
printf "%${COLUMNS}s" " " | tr " " "*"
printf "%${COLUMNS}s" " " | tr " " "*"


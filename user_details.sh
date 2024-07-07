#/usr/bin/env bash

<< m
alluser=$(cat /etc/passwd | awk -F ":" '{print $1}')
currentuser=$(id -u -n)
uidofuser=$(id -u)
echo "the all users in this system are: $alluser"
echo "current user is $currentuser"
echo "the uid of current user: $uidofuser"
m




read -p "Enter the service in the list(1.all_users,2.current_user,3.uid_of_current_user):" opt
case $opt in
          1)
             x=$(cat /etc/passwd | awk -F ":" '{print $1}')
             echo "The all users in your system are listed below:"
             echo "$x"
             ;;
          2)
             y=$(cat /etc/passwd | grep $(id -u -n))
             echo "the current user is:" $(id -u -n)
             echo "The current userinfo is:" $y
             ;;
          3)
             z=$(id -u)
             echo "the uid of current user $(id -u -n) is:" $z
             ;;
          *)
            echo "you entered an invalid option"
            echo "select from the given option either 1,2,3"
esac

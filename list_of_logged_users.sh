#/bin/bash

echo "enter the day (e.g Mon)"
read a
echo "enter the month (e.g Aug)"
read b
echo "enter the date (e.g 28)"
read c

last | grep "$a $b $c" | awk '{print $1}'

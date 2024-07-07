#/bin/bash

maqbool()
{
read -p "enter first number:" sum1
read -p "enter second number:" sum2
}

addition()
{
total1=$((sum1+sum2))
echo "adding $sum1 and $sum2 is $total1"
}

function substraction
{
total2=$((sum1-sum2))
echo "substarcting $sum1 and $sum2 is $total2"
}


maqbool
addition
substraction

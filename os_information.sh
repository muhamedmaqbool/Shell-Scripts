#/bin/sh
server_name=$(uname -n)
ip_adress=$(ifconfig | grep inet | awk 'NR==3{print $2}')
os_type=$(uname)
up_time=$(uptime | awk '{print $3,$4}' | tr -d ",")

#creating header in csv file
echo "S_no,Server_name,Ip_adress,Os_type,Up_time" >> server.csv
echo "1,$server_name,$ip_adress,$os_type,$up_time" >> server.csv

echo "The os information sucessfully stored in server.csv file"

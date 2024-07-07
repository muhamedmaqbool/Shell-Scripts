#/usr/bin/env bash
which wget 1>/dev/null 2>/dev/null
if [ $? -ne 0 ]
then
    echo "install wget and retry the script"
    exit 1
fi

if [ -e "index.html" ]
then
   echo "index.html file is already exist in system, hence we are removing this file for downloading git versions with wget command"
   rm -rf index.html
fi

git_versions_url="https://mirrors.edge.kernel.org/pub/software/scm/git/"
wget $git_versions_url

if  [ $? -eq 0 ]
then
    echo "you are downloading all git versions into your system, and it is stored in a file named index.html"
else
   echo "unable to download git version from $git_versions_url"
   exit 2
fi

declare -a git_vers          #declaring a variable named git_vers
echo "****************Collecting all git versions from the official GIT_SCM*************"
while read line
do
  git_vers+=($(echo $line | sed -n '/git-\([0-9]\+\.\)\+tar.gz/p' | awk -F '"' '{print $2}' | cut -c 5- | awk -F ".tar.gz" '{print $1}'))  #this command is used to vettichurukkal gitversions to version number
done < index.html   #index.html is the file which created earlier by wget command

echo "The all available git versions are:"
cnt=0
no_gitversion=${#git_vers[@]}  
WIDTH=30
for each_var in ${git_vers[@]}
do
 #echo -e "\t\t ${git_vers[cnt]} \\t ${git_vers[$((cnt+1))]} \\t ${git_vers[$((cnt+2))]}"
 printf "%-*s %-*s %-*s %-*s %-*s\n" $WIDTH ${git_vers[cnt]} $WIDTH ${git_vers[$((cnt+1))]} $WIDTH ${git_vers[$((cnt+2))]} $WIDTH ${git_vers[$((cnt+3))]} $WIDTH ${git_vers[$((cnt+4))]} 
 cnt=$((cnt+5))
  if [ $cnt -ge $no_gitversion ]
  then
    break
  fi
done

#!/bin/bash

if [ $# -lt 1 ] 
then
  echo 'please input group file and passwd file'
  exit 1
fi

group_path='group_tmp'
path_to_tmp='pass_tmp'

sed -e 's/:/ /g' -e '/^ *$/d' $1 > ${group_path}
sed -e 's/ /-/g' -e 's/:/ /g' -e '/^ *$/d' $2 > ${path_to_tmp}

while read line
do
  arr=(`echo $line`)  
  groupmod  ${arr[0]}
  if [ $? -ne 0 ]
  then
    groupadd -g ${arr[2]} ${arr[0]}
  fi
done <${group_path}

while read line
do
  arr=(`echo $line`)
  mkdir -p `echo ${arr[5]} | sed -e 's/\/[^\/]*$//g'`
  userdel ${arr[0]}
  useradd -u ${arr[2]} -g ${arr[3]} -c "`echo ${arr[4]} | sed -e 's/-/ /g'`" -md ${arr[5]} -s ${arr[6]} ${arr[0]}
  echo ${arr[0]}
done <${path_to_tmp}

rm -f ${group_path}
rm -f ${path_to_tmp}

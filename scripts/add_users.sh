#!/bin/bash

if [ $# -lt 1 ]
then
  echo 'please input group file and passwd file'
  exit 1
fi

group_path='group_tmp'
passwd_tmp='passwd_tmp'

sed -e 's/:/ /g' -e '/^ *$/d' $1 > ${group_path}
sed -e 's/ /-/g' -e 's/:/ /g' -e '/^ *$/d' $2 > ${passwd_tmp}

while read line
do
  arr=(`echo $line`)
  groupmod  ${arr[0]} > /dev/null
  if [ $? -ne 0 ]
  then
    groupadd -g ${arr[2]} ${arr[0]}
  fi
done <${group_path}

while read line
do
  arr=(`echo $line`)
  mkdir -p `echo ${arr[5]} | sed -e 's/\/[^\/]*$//g'`
  id ${arr[0]} > /dev/null
  if [ $? -ne 0 ]
  then
      useradd -u ${arr[2]} -g ${arr[3]} -c "`echo ${arr[4]} | sed -e 's/-/ /g'`" -md ${arr[5]} -s ${arr[6]} ${arr[0]}
  fi
  echo ${arr[0]}
done <${passwd_tmp}

rm -f ${group_path}
rm -f ${passwd_tmp}

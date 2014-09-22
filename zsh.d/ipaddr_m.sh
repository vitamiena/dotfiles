#!/bin/sh

ifconfig | grep en2 > /dev/null

if [ $? -eq 0 ]
then
    ifconfig en2 | grep -v inet6 | grep inet | cut -f 2 -d':\' | cut -d' \' -f 2
else
    ifconfig en0 | grep -v inet6 | grep inet | cut -f 2 -d':\' | cut -d' \' -f 2
fi

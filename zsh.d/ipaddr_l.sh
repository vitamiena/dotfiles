#!/bin/bash

/sbin/ifconfig | grep eth1 > /dev/null

if [ $? -eq 0 ]; then
    /sbin/ifconfig eth1 | grep inet | grep -v inet6 | cut -f 2 -d':' | cut -d' ' -f 1
else
    /sbin/ifconfig eth0 | grep inet | grep -v inet6 | cut -f 2 -d':' | cut -d' ' -f 1
fi

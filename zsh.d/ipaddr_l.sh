#!/bin/bash

/sbin/ifconfig eth0 | grep inet > /dev/null

if [ $? -eq 0 ]; then
    /sbin/ifconfig eth0 | grep inet | grep -v inet6 | cut -f 2 -d':' | cut -d' ' -f 1
else
    /sbin/ifconfig eth1 | grep inet | grep -v inet6 | cut -f 2 -d':' | cut -d' ' -f 1
fi

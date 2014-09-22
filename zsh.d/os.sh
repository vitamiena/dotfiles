#!/bin/sh

relative_dir=`dirname $0`
zsh_dir=`(cd $relative_dir; pwd)`

if [ `uname` = "Darwin" ]
then
    $zsh_dir/ipaddr_m.sh
elif [ `uname` = "Linux" ]
then
    $zsh_dir/ipaddr_l.sh
fi

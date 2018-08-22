#!/bin/bash 

if [ $# -gt 2 ]
then
    vim $*
elif [ $# -le 2 ]
then
    vim -O $*
else
    echo 'ERROR'
fi


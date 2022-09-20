#!/bin/bash

# This script is used to find instance ids terminated by a particular user
# Append file name after this script in terminal

if [[ $# -ne 1 ]]
then
        echo "Usage is $0 name_of_file"
        exit 1
fi
filename=$1
cat $filename | grep -i "Serdar" | grep TerminateInstances | grep -Eo "i-[a-zA-Z0-9]{17}" | sort | uniq > result.txt
#!/bin/bash

list=`multipass list | awk '{print $1}'|sed -n '1!p'`

for name in $list 
do
    multipass delete $name
done

multipass purge

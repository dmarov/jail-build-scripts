#!/bin/sh

IFs=$(ifconfig -l | xargs);
for IF in $IFs
do

    if echo $IF | grep -Eq "^epair[0-9]+b\$";
    then
        sysrc "ifconfig_$IF=SYNCDHCP";
    fi;
done;


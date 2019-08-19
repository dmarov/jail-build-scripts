#!/bin/sh

IFs=$(ifconfig -l | xargs);
for IF in $IFs
do

    if echo $IF | grep -Eq "^epair[0-9]+b\$";
    then
        RES=$(ifconfig $IF | grep "status: active");
        if [ -n "$RES" ] ;
        then
            dhclient $IF;
        fi;
    fi;
done;


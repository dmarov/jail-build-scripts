#!/bin/sh

SCRIPTFULLPATH=$(realpath $0);
BASEDIR=$(dirname $SCRIPTFULLPATH);

pkg install -y \
    apache24 \
    mod_php73

sysrc apache24_enable=YES

cp $BASEDIR/assets/httpd.conf /usr/local/etc/apache24/httpd.conf

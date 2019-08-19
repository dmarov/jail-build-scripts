#!/bin/sh

SCRIPTFULLPATH=$(realpath $0);
BASEDIR=$(dirname $SCRIPTFULLPATH);
ASSETSDIR="$BASEDIR/../assets";

pw useradd user -m -s /usr/local/bin/zsh -u 1001

cp $ASSETSDIR/sudoers /usr/local/etc/sudoers
chmod 440 /usr/local/etc/sudoers

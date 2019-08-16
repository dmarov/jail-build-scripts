#!/bin/sh

SCRIPTFULLPATH=$(realpath $0);
BASEDIR=$(dirname $SCRIPTFULLPATH);

pw useradd user -m -s /usr/local/bin/zsh -u 1001

cp $BASEDIR/assets/sudoers /usr/local/etc/sudoers

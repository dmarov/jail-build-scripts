#!/bin/sh # install packages

SCRIPTFULLPATH=$(realpath $0);
BASEDIR=$(dirname $SCRIPTFULLPATH);

export ASSUME_ALWAYS_YES=yes

$BASEDIR/../scripts/install-zsh.sh
$BASEDIR/../scripts/install-php73.sh
$BASEDIR/../scripts/install-apache24.sh
$BASEDIR/../scripts/install-git.sh

pkg install -y \
    memcached \
    redis \
    ffmpeg

sysrc redis_enable=YES
sysrc memcached_enable=YES

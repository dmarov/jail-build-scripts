#!/bin/sh

##
# builds web server based on apache24 + php73
#
#

SCRIPTFULLPATH=$(realpath $0);
BASEDIR=$(dirname $SCRIPTFULLPATH);
SCRDIR="$BASEDIR/../scripts"

export ASSUME_ALWAYS_YES="YES"

$SCRDIR/install-zsh.sh
$SCRDIR/create-user.sh
$SCRDIR/install-php73.sh
$SCRDIR/install-apache24.sh
$SCRDIR/install-redis.sh
$SCRDIR/install-memcached.sh
$SCRDIR/install-video-worker.sh
$SCRDIR/install-git.sh
$SCRDIR/install-sudo.sh
$SCRDIR/install-rsync.sh


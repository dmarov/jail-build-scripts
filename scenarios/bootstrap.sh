#!/bin/sh

##
# configures network and ssh
#

SCRIPTFULLPATH=$(realpath $0);
BASEDIR=$(dirname $SCRIPTFULLPATH);
SCRDIR="$BASEDIR/../scripts"

export ASSUME_ALWAYS_YES="YES"

$SCRDIR/set-dhcp-autostart.sh
$SCRDIR/get-ip-if-none.sh
$SCRDIR/install-zsh.sh
$SCRDIR/install-sudo.sh
$SCRDIR/create-user.sh


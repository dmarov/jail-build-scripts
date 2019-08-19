#!/bin/sh

pkg install -y \
    memcached

sysrc memcached_enable=YES

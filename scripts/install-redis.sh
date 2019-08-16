#!/bin/sh

pkg install -y \
    redis

sysrc redis_enable=YES

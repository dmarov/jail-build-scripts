#!/bin/sh # install packages

export ASSUME_ALWAYS_YES=yes

pkg install -y \
    apache24 \
    mod_php73 \
    php73 \
    php73-extensions \
    php73-openssl \
    memcached \
    redis \
    php73-pecl-imagick \
    php73-pecl-memcached \
    php73-pecl-redis \
    ffmpeg \
    php73-zip \
    php73-fileinfo \
    php73-mbstring \
    php73-pdo \
    php73-pdo_mysql \
    php73-pdo_sqlite \
    php73-pear-Mail_Mime \
    php73-pear-Mail \
    php73-curl \
    consul

# to /usl/local/etc/apache24/httpd.conf
#<FilesMatch "\.php$">
#    SetHandler application/x-httpd-php
#</FilesMatch>
#<FilesMatch "\.phps$">
#    SetHandler application/x-httpd-php-source
#</FilesMatch>

sysrc apache24_enable=YES
sysrc redis_enable=YES
sysrc memcached_enable=YES
sysrc consul_enable=YES

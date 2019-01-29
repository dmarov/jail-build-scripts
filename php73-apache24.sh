# install packages
pkg install -y \
    nginx \
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
    php73-pear-Mail

sysrc nginx_enable=YES
sysrc redis_enable=YES
sysrc memcached_enable=YES

mkdir -p /usr/locat/www/project

cat > /usr/local/etc/nginx/nginx.conf <<- EOF
worker_processes  1;

events {
    worker_connections  1024;
}

http {
    include       mime.types;
    default_type  application/octet-stream;
    sendfile        on;
    keepalive_timeout  65;

    server {

        listen       30001;
        root   /usr/local/www/project/public;

        location /admin {
            index  index.php index.html;
            try_files $uri $uri/ /admin/index.php;
        }

        location / {
            index  index.php index.html;
            try_files $uri $uri/ /index.php;
        }

        location ~ \.php$ {
            fastcgi_pass unix:/var/run/php-fpm.sock;
            fastcgi_index index.php;
 
            fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
            include fastcgi_params;
        }

        location ~ /\.ht {
            deny  all;
        }
    }
}
EOF

echo 'listen = /var/run/php-fpm.sock' >> '/usr/local/etc/php-fpm.d/www.conf'
echo 'listen.owner=www' >> '/usr/local/etc/php-fpm.d/www.conf'
echo 'listen.group=www' >> '/usr/local/etc/php-fpm.d/www.conf'
echo 'listen.mode=0660' >> '/usr/local/etc/php-fpm.d/www.conf'

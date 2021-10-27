#!/bin/bash

echo building config started;

envsubst '\$NGINX_HOST \$NGINX_SSL_PORT' < /nginx.conf > /etc/nginx/sites-available/host.conf 

echo building config end;


rm /etc/nginx/sites-enabled/default 
ln -s /etc/nginx/sites-available/host.conf /etc/nginx/sites-enabled/host

ls -l /etc/nginx/sites-available

nginx -g 'daemon off;'
#!/bin/bash

envsubst < /nginx.conf > /etc/nginx/nginx.conf

exec "$@"
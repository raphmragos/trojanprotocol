#!/bin/sh
set -e

# Simulan ang Xray
xray run -c /etc/xray.json &

# Maghintay ng 3 segundo
sleep 3

# I-test muna kung gumagana ang Nginx bago tumakbo
nginx -t

# Simulan ang Nginx
exec nginx -g 'daemon off;'

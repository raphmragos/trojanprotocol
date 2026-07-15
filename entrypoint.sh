#!/bin/sh
set -e

# Simulan ang Xray sa background
xray run -c /etc/xray.json &

# Maghintay ng 2 segundo para masiguradong handa na ang Xray
sleep 2

# Simulan ang Nginx sa foreground
exec nginx -g 'daemon off;'

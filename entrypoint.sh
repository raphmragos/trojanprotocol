#!/bin/sh

# Simulan ang Xray sa likod
/usr/local/bin/xray/xray -config /etc/xray/config.json &

# Simulan ang Nginx sa harap (pang-maintain ng container na bukas)
nginx -g 'daemon off;'

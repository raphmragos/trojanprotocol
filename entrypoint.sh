#!/bin/sh
/usr/local/bin/xray/xray -config /etc/xray/config.json &
nginx -g 'daemon off;'

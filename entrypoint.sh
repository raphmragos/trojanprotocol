#!/bin/sh
xray run -c /etc/xray.json &
exec nginx -g 'daemon off;'


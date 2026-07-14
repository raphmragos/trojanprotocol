#!/bin/sh
/usr/local/bin/xray run -c /etc/xray.json &
exec /usr/local/openresty/bin/openresty -g 'daemon off;'

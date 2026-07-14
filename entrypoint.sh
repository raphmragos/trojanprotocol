#!/bin/sh
/usr/local/openresty/bin/openresty -g 'daemon off;' &
exec /usr/local/bin/xray run -c /etc/xray.json

#!/bin/sh
set -e

# I-set ang port para sa Nginx
export PORT=${PORT:-8080}
sed -i "s/\${PORT:-8080}/$PORT/g" /usr/local/openresty/nginx/conf/nginx.conf

# Simulan ang Xray sa likod
/usr/local/bin/xray run -c /etc/xray.json &

# Simulan ang OpenResty (naka-foreground)
exec /usr/local/openresty/bin/openresty -g 'daemon off;'

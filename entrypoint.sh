#!/bin/sh
set -e

# Simulan muna ang Xray sa background
echo "🔧 Sinisimulan ang Xray..."
/usr/local/bin/xray run -c /etc/xray.json &

# I-set ang port ng Nginx base sa Cloud Run
export NGINX_PORT=${PORT:-8080}
sed -i "s/\${PORT:-8080}/$NGINX_PORT/g" /usr/local/openresty/nginx/conf/nginx.conf

# Simulan ang OpenResty/Nginx
echo "🌐 Sinisimulan ang OpenResty sa port $NGINX_PORT..."
exec /usr/local/openresty/bin/openresty -g 'daemon off;'

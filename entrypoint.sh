#!/bin/sh

# Simulan ang Xray sa background
echo "Nagsisimula ng Xray..."
/usr/local/bin/xray run -c /etc/xray.json &

# Simulan ang OpenResty/Nginx sa foreground
echo "Nagsisimula ng OpenResty..."
exec /usr/local/openresty/bin/openresty -g 'daemon off;'


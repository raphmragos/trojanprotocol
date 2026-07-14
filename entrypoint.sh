#!/bin/sh
set -e

# Simulan ang Xray sa likod
/usr/local/bin/xray run -c /etc/xray.json &

# Hintayin nang kaunti para masiguradong nakabukas na ang Xray
sleep 2

# Simulan ang OpenResty sa harap
exec /usr/local/openresty/bin/openresty -g 'daemon off;'

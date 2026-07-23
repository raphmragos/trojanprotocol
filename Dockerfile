FROM teddysun/xray:latest AS xray-bin
FROM openresty/openresty:alpine-fat

# Kopyahin ang Xray binary
COPY --from=xray-bin /usr/bin/xray /usr/local/bin/xray

# Kopyahin ang mga config files
COPY config.json /etc/xray.json
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY entrypoint.sh /entrypoint.sh

# Bigyan ng pahintulot ang script
RUN chmod +x /entrypoint.sh

EXPOSE 8080

# Gamitin ang entrypoint script para simulan ang lahat
CMD ["/entrypoint.sh"]

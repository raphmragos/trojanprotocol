FROM teddysun/xray:latest AS xray-bin
FROM openresty/openresty:alpine-fat

# Kopyahin ang files
COPY --from=xray-bin /usr/bin/xray /usr/local/bin/xray
COPY config.json /etc/xray.json
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY entrypoint.sh /entrypoint.sh

# Mag-install ng maliit na tool para sa health check
RUN apk add --no-cache curl && chmod +x /entrypoint.sh

EXPOSE 8080

CMD ["/entrypoint.sh"]

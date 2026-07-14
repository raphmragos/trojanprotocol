FROM teddysun/xray:latest AS xray-bin
FROM openresty/openresty:alpine-fat

COPY --from=xray-bin /usr/bin/xray /usr/local/bin/xray
COPY --from=xray-bin /usr/share/xray/ /usr/share/xray/

COPY config.json /etc/xray.json
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 8080

CMD ["/entrypoint.sh"]

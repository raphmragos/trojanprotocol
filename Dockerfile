FROM alpine:3.18

# I-install ang Xray at Nginx
RUN apk add --no-cache wget nginx && \
    wget -O- https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip | unzip - && \
    mv xray /usr/bin/ && chmod +x /usr/bin/xray

COPY config.json /etc/xray.json
COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh && mkdir -p /run/nginx

EXPOSE 8080

CMD ["/entrypoint.sh"]

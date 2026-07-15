FROM alpine:3.18

# I-install ang lahat ng kailangan
RUN apk add --no-cache wget unzip nginx

# I-download at i-setup ang Xray
RUN wget -O /tmp/Xray-linux-64.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip /tmp/Xray-linux-64.zip -d /tmp/xray && \
    mv /tmp/xray/xray /usr/bin/ && chmod +x /usr/bin/xray && \
    rm -rf /tmp/*

# Kopyahin ang mga config files
COPY config.json /etc/xray.json
COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /entrypoint.sh

# I-set ang permissions
RUN chmod +x /entrypoint.sh && mkdir -p /run/nginx

# Gamitin ang port 8080 na kailangan ng Cloud Run
EXPOSE 8080

CMD ["/entrypoint.sh"]

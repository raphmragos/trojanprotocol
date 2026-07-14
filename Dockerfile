# Base image: Alpine Linux (maliit at mabilis)
FROM alpine:latest

# I-install ang Nginx at Xray
RUN apk update && apk add --no-cache nginx wget unzip

# I-download at i-install ang Xray
RUN wget https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip -O /tmp/xray.zip && \
    unzip /tmp/xray.zip -d /usr/local/bin/xray && \
    chmod +x /usr/local/bin/xray/xray && \
    rm /tmp/xray.zip

# Gumawa ng mga folder
RUN mkdir -p /etc/xray /run/nginx

# Kopyahin ang config files papasok sa container
COPY nginx.conf /etc/nginx/nginx.conf
COPY xray.json /etc/xray/config.json
COPY entrypoint.sh /entrypoint.sh

# Bigyan ng pahintulot ang entrypoint
RUN chmod +x /entrypoint.sh

# Port na gagamitin (Cloud Run default: 8080)
EXPOSE 8080

# Simulan ang serbisyo
ENTRYPOINT ["/entrypoint.sh"]

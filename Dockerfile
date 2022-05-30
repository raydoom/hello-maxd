FROM v2fly/v2fly-core
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add nginx
ADD auto-generate-cert.sh /opt/sh/
ADD start.sh /opt/sh/
ADD nginx/default.conf /etc/nginx/http.d/
ADD nginx/html /etc/nginx/html
ADD v2ray/config.json /etc/v2ray/config.json
CMD sh /opt/sh/start.sh
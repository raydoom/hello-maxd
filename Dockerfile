FROM teddysun/xray:26.3.27
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add nginx
ADD auto-generate-cert.sh /opt/sh/
ADD start.sh /opt/sh/
ADD nginx/default.conf /etc/nginx/http.d/
ADD nginx/html /etc/nginx/html
ADD xray/config.json /etc/xray/config.json
EXPOSE 80
EXPOSE 443
CMD sh /opt/sh/start.sh

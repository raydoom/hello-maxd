# generate and copy cert
cd /opt/sh
sh /opt/sh/auto-generate-cert.sh
mkdir /etc/nginx/http.d/certs
cp -r /opt/sh/localhost.localdomain/* /etc/nginx/http.d/certs

# start nginx
nginx

# start xray
sed -i "s/uuid/${UUID}/g" /etc/xray/config.json
nohup xray --config /etc/xray/config.json > /var/log/xray.log 2>&1 &
touch /var/log/xray.log
tail -f /var/log/xray.log

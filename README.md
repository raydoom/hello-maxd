## xray-xhttp

### 项目简介

使用docker，一键部署v2ray服务器

- 自动生成自签名证书（在容器启动阶段）
- 从上游`teddysun/xray`构建
- 使用nginx服务器
- 内置首页（演示博客，使用hexo的静态页面，用于......）

### 使用方式

访问uuidgenerator生成uuid

```
https://www.uuidgenerator.net/
```

启动容器（没有默认的uuid，必须填入uuid）

```
docker run -d --restart=unless-stopped --name xray-xhttp -p 443:443 -p 80:80 -e UUID=[UUID] raydoom/xray-xhttp
```

客户端配置

```
地址：服务器ip地址或域名
端口：443
协议：vless
UUID：
udp: true
tls: true
network: xhttp
xhttp-opts:
  path: "/l"
  host: localhost.localdomain
  mode: packet-up
  client-fingerprint: chrome
```


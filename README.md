## v2ray-ws-docker

### 项目简介

使用docker，一键部署v2ray服务器

- 自动生成自签名证书（在容器启动阶段）
- 从上游`v2fly/v2fly-core`构建
- 使用nginx服务器
- 内置首页（演示博客，使用hexo的静态页面，用于......）

### 使用方式

访问uuidgenerator生成uuid

```
https://www.uuidgenerator.net/
```

启动容器（没有默认的uuid，必须填入uuid）

```
docker run -d --name v2ray-ws-docker -p 443:443 -p 80:80 -e uuid=[UUID] raydoom/v2ray-ws-docker
```

客户端配置

```
地址：服务器ip地址或域名
端口：443
协议：vless 或 vmess
UUID：
额外ID(alterId): 0
传输协议：WebSocket 或 ws
WebSocket 路径：/vless 或 /vmess
伪装域名(host): localhost.localdomain
传输层安全：tls
skip-cert-verify: true
跳过证书验证(allowInsecure): true
```


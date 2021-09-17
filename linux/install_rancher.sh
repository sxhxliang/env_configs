#如果您使用的 Rancher 2.5.x 及更新版本，需要开启特权模式安装 Rancher，请执行以下命令：
docker run -d --privileged --restart=unless-stopped \
  -p 9080:80 -p 9443:443 \
  rancher/rancher:latest
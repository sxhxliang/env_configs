sudo cp frp_0.31.0_linux_amd64/systemd/frpc.service /lib/systemd/system/
sudo cp frp_0.31.0_linux_amd64/frpc /usr/bin/
sudo mkdir /etc/frp/
sudo cp frp_0.31.0_linux_amd64/frpc.ini  /etc/frp/frpc.ini

# 更新服务文件
sudo systemctl daemon-reload

# 开启
sudo systemctl start frpc

# 关闭
# sudo systemctl stop frpc

# 重启
# sudo systemctl restart frpc

# 查看状态
sudo systemctl status frpc

# 设置开机启动
sudo systemctl enable frpc

# 设置开机不启动
# sudo systemctl disable frpc
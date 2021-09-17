

# https://zhuanlan.zhihu.com/p/77504641
# 1.首先卸载阿里云安骑士（阿里云的一个安全（jiandie）软件）
wget http://update.aegis.aliyun.com/download/uninstall.sh
chmod +x uninstall.sh
./uninstall.sh
wget http://update.aegis.aliyun.com/download/quartz_uninstall.sh
chmod +x quartz_uninstall.sh
./quartz_uninstall.sh

# 2.删除安骑士残留文件
pkill aliyun-service
rm -fr /etc/init.d/agentwatch /usr/sbin/aliyun-service
rm -rf /usr/local/aegis*


# 3.屏蔽安骑士IP
iptables -I INPUT -s 140.205.201.0/28 -j DROP
iptables -I INPUT -s 140.205.201.16/29 -j DROP
iptables -I INPUT -s 140.205.201.32/28 -j DROP
iptables -I INPUT -s 140.205.225.192/29 -j DROP
iptables -I INPUT -s 140.205.225.200/30 -j DROP
iptables -I INPUT -s 140.205.225.184/29 -j DROP
iptables -I INPUT -s 140.205.225.183/32 -j DROP
iptables -I INPUT -s 140.205.225.206/32 -j DROP
iptables -I INPUT -s 140.205.225.205/32 -j DROP
iptables -I INPUT -s 140.205.225.195/32 -j DROP
iptables -I INPUT -s 140.205.225.204/32 -j DROP

# 4.安装魔改BBR+（BBR是Google推出的一个TCP反堵塞程序，能大幅提升服务器的速度）
# echo "安装魔改BBR+（BBR是Google推出的一个TCP反堵塞程序，能大幅提升服务器的速度）"
wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh"
chmod +x tcp.sh
echo "选2，安装重启后再次运行./tcp.sh命令，然后选7，完成BBR+的安装，此时提速明显！"
./tcp.sh


# 选2，安装重启后再次运行./tcp.sh命令，然后选7，完成BBR+的安装，此时提速明显！
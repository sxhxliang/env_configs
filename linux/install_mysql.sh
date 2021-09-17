sudo apt-get install mysql-server


# 修改 build ip
sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf

skip-ssl             # 跳过ssl

systemctl restart mysql

sudo mysql -u root -p
# 输入密码 Liang123.mysql

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'Liang123.mysql' WITH GRANT OPTION;

# 刷新权限
flush privileges;
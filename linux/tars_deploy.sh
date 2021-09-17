



docker pull mysql:5.7
docker run --name mysql --rm --net=host -e MYSQL_ROOT_PASSWORD='tars123456' -d -p 3306:3306 \
        -v /etc/localtime:/etc/localtime \
        -v /data/my.cnf:/etc/mysql/my.cnf \
        -v /data/mysql-data:/var/lib/mysql mysql


# 下载框架源码
git clone https://github.com/TarsCloud/TarsFramework.git --recursive

# 编译
cd TarsFramework
git submodule update --remote --recursive
cd build
cmake ..
make -j16

# 安装（需要root，先创建2个目录，用于保存安装项）
sudo mkdir -p /usr/local/tars/app

cd build # 刚才编译时的目录
make install
# 默认的安装包路径:/usr/local/tars/cpp, 即编译完成的框架&安装脚本在这个目录


# 下载并重命名为web
git clone https://github.com/TarsCloud/TarsWeb.git
cp -rf TarsWeb /usr/local/tars/cpp/deploy/web


# 此处仅一键部署主节点，其他部署方式请参考文档
# chmod a+x linux-install.sh
# ./linux-install.sh MYSQL_HOST MYSQL_ROOT_PASSWORD INET REBUILD(false[default]/true) SLAVE(false[default]/true) MYSQL_USER MYSQL_PORT
./linux-install.sh 127.0.0.1 mysql.pwd enp0s3 false false root 3306 # 耗时较长，如果出错可以重复执行(一般是下载资源出错)


./linux-install.sh 8.210.32.172 tars123456 enp4s0 false false root 3306

# 本地单机部署
# enp4s0 是网卡 通过网卡获取ip地址
sudo ./linux-install.sh 127.0.0.1 tars123456 enp4s0 false false root 3306
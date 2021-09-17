

#阿里云 http://mirrors.aliyun.com/pypi/simple/
#中国科技大学 https://pypi.mirrors.ustc.edu.cn/simple/
#豆瓣(douban) http://pypi.douban.com/simple/ pypi.douban.com
#清华大学 https://pypi.tuna.tsinghua.edu.cn/simple/

pip config set global.trusted-host mirrors.aliyun.com
pip config set global.index-url https://mirrors.aliyun.com/pypi/simple



=== From deadsnakes repo === 
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.7
sudo apt install python3-pip
sudo apt install python3.7-dev

=== OR compiling from source ===

sudo apt update
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget libsqlite3-dev python-openssl bzip2
cd /tmp
wget https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tar.xz
tar -xf Python-3.7.2.tar.xz
cd Python-3.7.2
./configure --enable-loadable-sqlite-extensions 
make
sudo make altinstall
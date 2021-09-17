git clone https://github.com/google/glog

sudo apt-get install autoconf automake libtool


# 进入源码根目录（glog文件夹）
# ./autogen.sh
# ./configure
# make -j 24
# sudo make install

mkdir build
cd build

cmake ..
make -j 16

make install
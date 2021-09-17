

# https://davidchan0519.github.io/2019/05/13/protocol-buffer-base/
# https://github.com/protocolbuffers/protobuf/releases/tag/v3.11.0



# 删除
sudo rm -rf /usr/local/protobuf/
sudo rm /usr/local/protobuf/bin/protoc
sudo rm /usr/local/lib/libproto*


# 第一种
git clone https://github.com/protocolbuffers/protobuf.git
cd protobuf
mkdir build && cd build
cmake ../cmake/ -DBUILD_SHARED_LIBS=ON -Dprotobuf_BUILD_TESTS=OFF



# 或者
cd protobuf
git submodule update --init --recursive
./autogen.sh

# 默认情况下，编译结果会安装到 /usr/local目录下
# ./configure --prefix=/usr
./configure
make -j 16
make check
sudo make install
sudo ldconfig # refresh shared library cache.

protoc --version

# cmake --help-module FindProtobuf
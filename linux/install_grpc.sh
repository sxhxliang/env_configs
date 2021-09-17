# install_grpc.sh

# https://github.com/grpc/grpc/blob/master/BUILDING.md

git clone -b RELEASE_TAG_HERE https://github.com/grpc/grpc
cd grpc
git submodule update --init


mkdir -p cmake/build
cd cmake/build
cmake ../..
make -j 16

sudo make install


cd boost_1_71_0

./bootstrap.sh --with-libraries=all --with-toolset=gcc

./b2 toolset=gcc

sudo ./b2 install --prefix=/usr
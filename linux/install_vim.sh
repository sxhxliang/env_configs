# /bin/bash
###
 # @Descripttion: https://github.com/AaronLeong/env_configs
 # @version: 0.0.1
 # @Author: Shihua Liang (sxhx.liang@gmail.com)
 # @FilePath: /env_config/install_vim.sh
 # @Create: 2020-03-18 18:07:41
 # @LastAuthor: Shihua Liang
 # @lastTime: 2020-03-27 16:56:02
 ###

cd /tmp && git clone https://github.com/vim/vim.git --dept 1 && cd vim
./configure --enable-pythoninterp --prefix=/usr
make && sudo make install


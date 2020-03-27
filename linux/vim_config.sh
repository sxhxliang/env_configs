###
 # @Descripttion: https://github.com/AaronLeong/env_configs
 # @version: 0.0.1
 # @Author: Shihua Liang (sxhx.liang@gmail.com)
 # @FilePath: /env_config/linux/vim_config.sh
 # @Create: 2020-03-27 16:56:31
 # @LastAuthor: Shihua Liang
 # @lastTime: 2020-03-27 17:24:01
 ###

# https://github.com/tracyone/vinux
# git clone https://github.com/tracyone/vinux --dept 1
# cd vinux 
# bash install.sh

bash -c "$(curl -fsSL https://git.io/vNDOQ)"

cp  ~/.vim/local.vim ~/.vim/local.vim.bak
cp ../configs/vinux_local.vim  ~/.vim/local.vim



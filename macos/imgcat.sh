###
 # @Descripttion: https://github.com/AaronLeong/HoloCV
 # @version: 0.0.1
 # @Author: Shihua Liang (sxhx.liang@gmail.com)
 # @FilePath: /env_config/macos/imgcat.sh
 # @Create: 2020-03-27 17:20:55
 # @LastAuthor: Shihua Liang
 # @lastTime: 2020-03-27 17:21:25
 ###

cd /usr/local/bin
wget https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/imgcat
chmod +x imgcat

# oh-my-zsh ，“zsh: command not found: 
# http://blog.csdn.net/yianemail/article/details/51693583

# 解决办法
# 既然是.zshrc 没有配置相关环境变量设置，把 bash 中.bash_profile 全部环境变量加入就好
# open .zshrc

# 然后找到# User configuration部分，添加
# source ~/.bash_profile
# source .zshrc
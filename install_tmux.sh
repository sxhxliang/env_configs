# /bin/bash
###
 # @Descripttion: https://github.com/AaronLeong/env_configs
 # @version: 0.0.1
 # @Author: Shihua Liang (sxhx.liang@gmail.com)
 # @FilePath: /stnmask/install_tmux.sh
 # @Create: 2020-03-18 18:07:41
 # @LastAuthor: Shihua Liang
 # @lastTime: 2020-03-18 18:28:08
 ###


# download tmxu, libevent, /ncurses
wget https://github.com/tmux/tmux/releases/download/3.1/tmux-3.1-rc2.tar.gz
wget https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz
wget https://github.com/mirror/ncurses/archive/v6.2.zip

# move all files to path
mkdir -p $HOME/tmux $HOME/tmux_tmp
mv tmux-3.1-rc2.tar.gz $HOME/tmux_tmp
mv libevent-2.1.8-stable.tar.gz  $HOME/tmux_tmp
mv v6.2.zip $HOME/tmux_tmp

# 
cd $HOME/tmux_tmp
tar xvzf libevent-2.1.8-stable.tar.gz
tar xvzf tmux-3.1-rc2.tar.gz
unzip v6.2.zip

# configure libevent and compile, then install to $HOME/tmux
cd libevent-2.1.8-stable
./configure --prefix=$HOME/tmux --disable-shared
make & make install
cd - 

# configure ncurses and compile, then install to $HOME/tmux
cd ncurses-6.2/
./configure --prefix=$HOME/tmux
make & make install
cd -

# configure tmux and compile, then install to $HOME/tmux
cd tmux-3.1-rc2
./configure CFLAGS="-I$HOME/tmux/include -I$HOME/tmux/include/ncurses" \
    LDFLAGS="-L$HOME/tmux/lib -L$HOME/tmux/include/ncurses -L$HOME/tmux/include" \
    CPPFLAGS="-I$HOME/tmux/include -I$HOME/tmux/include/ncurses" \
    LDFLAGS="-static -L$HOME/tmux/include -L$HOME/tmux/include/ncurses -L$HOME/tmux/lib"
make & make install
# cp the tmux bin file
cp tmux $HOME/tmux/bin

rm -rf $HOME/tmux_tmp

# configure environment path
export PATH=$PATH:$HOME/tmux/bin


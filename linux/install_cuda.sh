###
 # @Descripttion: https://github.com/AaronLeong/env_configs
 # @version: 0.0.1
 # @Author: Shihua Liang (sxhx.liang@gmail.com)
 # @FilePath: /env_config/install_cuda.sh
 # @Create: 2020-03-27 17:04:04
 # @LastAuthor: Shihua Liang
 # @lastTime: 2020-03-27 17:05:14
 ###
sudo service gdm stop
sudo service lightdm stop

sudo dpkg -i cuda-repo-ubuntu1804–10–0-local-10.0.130–410.48_1.0–1_amd64.deb
sudo apt-key add /var/cuda-repo-10–0-local-10.0.130–410.48/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda

# Cudnn:
# https://docs.nvidia.com/deeplearning/sdk/cudnn-install/index.html#installlinux

# Nccl:

# http://blog.fcj.one/ubuntu-nccl2.html

# https://sausheong.github.io/posts/space-invaders-with-go/

# sudo sed -i "s/ppa\.launchpad\.net/lanuchpad.moruy.cn/g" /etc/apt/sources.list.d/*.list
# sudo sed -i "s/ppa\.launchpad\.net/launchpad.proxy.ustclug.org/g" /etc/apt/sources.list.d/*.list
# sudo sed -i "s/lanuchpad\.moruy\.cn/ppa.launchpad.net/g" /etc/apt/sources.list.d/*.list
# sudo sed -i "s/launchpad.proxy.ustclug.org/lanuchpad.moruy.cn/g" /etc/apt/sources.list.d/*.list
# sudo sed -i "s/ppa\.launchpad\.net/launchpad.proxy.ustclug.org/g" /etc/apt/sources.list.d/*.list
# sudo sed -i "s/lanuchpad\.moruy\.cn/ppa.launchpad.proxy.lsh.pub/g" /etc/apt/sources.list.d/*.list
# sudo sed -i "s/ppa.launchpad.proxy.lsh.pub/ppa\.launchpad\.net/g" /etc/apt/sources.list.d/*.list
# sudo find /etc/apt/sources.list.d/ -type f -name "*.list" -exec  sed  -i.bak -r  's#deb(-src)?\s*http(s)?:///lanuchpad.moruy.cn#deb\1 http\2://launchpad.proxy.ustclug.org#ig' {} \;
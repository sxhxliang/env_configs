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

# # Method 1

# CUDA 10.0
# sudo dpkg -i cuda-repo-ubuntu1804–10–0-local-10.0.130–410.48_1.0–1_amd64.deb
# sudo apt-key add /var/cuda-repo-10–0-local-10.0.130–410.48/7fa2af80.pub
# sudo apt-get update
# sudo apt-get install cuda

# CUDA 10.1
sudo dpkg -i cuda-repo-ubuntu1804-10-1-local-10.1.168-418.67_1.0-1_amd64.deb
sudo apt-key add /var/cuda-repo-10-1-local-10.1.168-418.67/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda

export CPATH=/usr/local/cuda-10.1/targets/x86_64-linux/include:$CPATH
export CPATH=/usr/local/cuda-10.1/targets/x86_64-linux/include:$CPATH

export LD_LIBRARY_PATH=/usr/local/cuda-10.1/targets/x86_64-linux/lib:$LD_LIBRARY_PATH

export PATH=/usr/local/cuda-10.1/bin:$PATH

# /usr/bin/ld: 找不到  cannot find -lnppc
# /usr/bin/ld: 找不到 -lnppi
# /usr/bin/ld: 找不到 -lnpps
# /usr/bin/ld: 找不到 -lcufft

sudo ln -s /usr/local/cuda/lib64/libcudart.so /usr/lib/libcudart.so
sudo ln -s /usr/local/cuda/lib64/libnppc.so /usr/lib/libnppc.so
sudo ln -s /usr/local/cuda/lib64/libnppi.so /usr/lib/libnppi.so
sudo ln -s /usr/local/cuda/lib64/libnpps.so /usr/lib/libnpps.so
sudo ln -s /usr/local/cuda/lib64/libcufft.so /usr/lib/libcufft.so

# cuda 11.0
wget https://developer.download.nvidia.com/compute/cuda/11.1.0/local_installers/cuda-repo-ubuntu1804-11-1-local_11.1.0-455.23.05-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804-11-1-local_11.1.0-455.23.05-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu1804-11-1-local/7fa2af80.pub

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64

# cuda 11.2
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.2.1/local_installers/cuda-repo-ubuntu1804-11-2-local_11.2.1-460.32.03-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804-11-2-local_11.2.1-460.32.03-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu1804-11-2-local/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda

# Method 2
# 如果cuda 缺少组件 用方法二
# 比如出现 fatal error: cuda_runtime.h: No such file or directory  这种 气死人了

# wget http://developer.download.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda_10.1.243_418.87.00_linux.run
# sudo sh cuda_10.1.243_418.87.00_linux.run

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
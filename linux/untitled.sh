# https://www.cnblogs.com/aacirq/p/9694951.html

sudo apt-get install build-essential
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff5-dev libdc1394-22-dev         # 处理图像所需的包
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev liblapacke-dev
sudo apt-get install libxvidcore-dev libx264-dev         # 处理视频所需的包
sudo apt-get install libatlas-base-dev gfortran          # 优化opencv功能
sudo apt-get install ffmpeg


cd opencv  # 进入到opencv所在文件夹
mkdir build
cd build  # 新建并进入build文件夹
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local .. # 此处/usr/local为安装目录，可以自己改，改了之后后面加环境变量也要同时改
sudo make -j4  # 使用四个核同时编译(我的电脑是四核的)，这一步需要耗时比较长
sudo make install



# 然后添加库路径

sudo touch /etc/ld.so.conf.d/opencv.conf
#在里面写入（注意如果安装目录更改的话，这里需要更改，是安装目录下的lib目录，可以添加前查看是否有此目录）

echo /usr/local/lib > /etc/ld.so.conf.d/opencv.conf

# 使配置生效
sudo ldconfig

#然后配置环境变量

sudo vim /etc/profile 
#添加内容

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig  
  

sudo ldconfig 

source /etc/bash.bashrc
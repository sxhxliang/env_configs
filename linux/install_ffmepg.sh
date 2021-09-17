


# Install ffnvcodec
# 在有ffmpeg解压好的文件夹的前提下，我们还需要进入ffmpeg文件夹下拉取NVIDIA的nvidia codec头文件，这是ffmpeg开启GPU必不可少的一个文件库，我们需要拉取下来并进行编译：
git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git
make
sudo make install


sudo apt install libfdk-aac-dev libmp3lame-dev libx264-dev libx265-dev libsdl2-dev yasm




# gpu
FFMPEG_VERSION = '4.1.6'
wget https://github.com/FFmpeg/FFmpeg/archive/n${FFMPEG_VERSION}.zip

unzip n${FFMPEG_VERSION}.zip && rm n${FFMPEG_VERSION}.zip\
cd FFmpeg-n${FFMPEG_VERSION} && \
./configure --enable-nonfree --enable-pic --enable-shared && \
make -j$(nproc) && \
make install && \
cd -

# ffmpeg with CUDA
git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git --dept 1
cd nv-codec-headers/
make 
make install

# ./configure --enable-shared --enable-libx264 --enable-gpl

export LD_LIBRARY_PATH=/usr/local/lib/
./configure --enable-cuda --enable-cuvid  --enable-nvenc --enable-shared --extra-libs=-lpthread --extra-libs=-lm --enable-gpl --enable-libx264 --extra-cflags=-I/usr/local/cuda/include --extra-ldflags=-L/usr/local/cuda/lib64 --enable-nonfree --enable-pic --enable-shared
make -j$(nproc) && \
make install && \
cd -





ffmpeg -hwaccels

# 查看硬解码器
ffmpeg -codecs | grep cuvid

# 查看硬编码器
ffmpeg -codecs | grep nvenc


# 测试

ffmpeg -hwaccel cuvid -c:v h264_cuvid -rtsp_transport tcp -i "rtsp://admin:admin@127.0。0.1:1935/H264?channel=1&subtype=0&unicast=true&proto=Onvif/video
" -c:v h264_nvenc -b:v 2048k -vf scale_npp=1280:-1 -y /home/2.mp4

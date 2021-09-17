# 先设置环境变量
export PATH_TO_SDK=/home/ubuntu/workshop/libs/Video_Codec_SDK_10.0.26
export PATH_TO_FFMPEG=/usr/local/ffmpeg
# 上一篇的绝对路径

# cannot find -lcuda
sudo ln -s /usr/lib/x86_64-linux-gnu/libcuda.so.1 /usr/local/cuda/lib64/libcuda.so

git clone https://github.com/NVIDIA/VideoProcessingFramework.git

# 进入VideoProcessingFramework设置当前路径下的install为安装路径
export INSTALL_PREFIX=$(pwd)/install

mkdir -p install
mkdir -p build


# 开始编译
# python version
# https://github.com/NVIDIA/VideoProcessingFramework/issues/113
cd build
cmake .. \
  -DFFMPEG_DIR:PATH="$PATH_TO_FFMPEG" \
  -DVIDEO_CODEC_SDK_DIR:PATH="$PATH_TO_SDK" \
  -DCMAKE_INSTALL_PREFIX:PATH="$INSTALL_PREFIX" \
  -DGENERATE_PYTHON_BINDINGS:BOOL="1" \
  -DGENERATE_PYTORCH_EXTENSION:BOOL="1" \
  -DPYBIND11_PYTHON_VERSION=3.8 \
  -DPYTHON_LIBRARY=/home/ubuntu/anaconda3/lib/libpython3.8.so \
  -DPYTHON_EXECUTABLE=/home/ubuntu/anaconda3/bin/python3.8 \
  -DPYTHON_INCLUDE_DIR=/home/ubuntu/anaconda3/include/python3.8



make && make install



# docker run --gpus all --network host -it --rm -v $(pwd)/VideoProcessingFramework:/VideoProcessingFramework cuda_trt_cv4:0.0.1
# 先设置环境变量
export PATH_TO_SDK=/VideoProcessingFramework/Video_Codec_SDK_10.0.26
export PATH_TO_FFMPEG=/usr/local/bin/ffmpeg
export PYTHON_LIBRARIES=
export PYTHON_INCLUDE_DIRS=
# 上一篇的绝对路径

# cannot find -lcuda
sudo ln -s /usr/lib/x86_64-linux-gnu/libcuda.so.1 /usr/local/cuda/lib64/libcuda.so

git clone https://github.com/NVIDIA/VideoProcessingFramework.git

# 进入VideoProcessingFramework设置当前路径下的install为安装路径
export INSTALL_PREFIX=$(pwd)/install

mkdir -p install
mkdir -p build



export PATH_TO_SDK=/home/ubuntu/workshop/libs/Video_Codec_SDK_10.0.26
export PATH_TO_FFMPEG=/usr/local/ffmpeg
export INSTALL_PREFIX=/home/ubuntu/workshop/vpf2/install

# 开始编译
# python version
# https://github.com/NVIDIA/VideoProcessingFramework/issues/113
cd build
cmake .. \
  -DFFMPEG_DIR:PATH="$PATH_TO_FFMPEG" \
  -DVIDEO_CODEC_SDK_INCLUDE_DIR:PATH="$PATH_TO_SDK" \
  -DVIDEO_CODEC_SDK_DIR:PATH="$PATH_TO_SDK" \
  -DCMAKE_INSTALL_PREFIX:PATH="$INSTALL_PREFIX" \
  -DGENERATE_PYTHON_BINDINGS:BOOL="1" \
  -DGENERATE_PYTORCH_EXTENSION:BOOL="1" \
  -DPYBIND11_PYTHON_VERSION=3.6 \
  -DPYTHON_LIBRARY=/home/ubuntu/anaconda3/lib/libpython3.8.so \
  -DPYTHON_EXECUTABLE=/home/ubuntu/anaconda3/bin/python3.8 \
  -DPYTHON_INCLUDE_DIR=/home/ubuntu/anaconda3/include/python3.8



make && make install
export INSTALL_PREFIX=$(pwd)/install
export PATH_TO_SDK=/home/ubuntu/libs/Video_Codec_SDK_10.0.26
export PATH_TO_FFMPEG=/usr/local/bin/ffmpeg
export PYTHON_LIBRARIES=
export PYTHON_INCLUDE_DIRS=

# 三院本地

export PATH_TO_SDK=/home/ubuntu/libs/Video_Codec_SDK_10.0.26
export PATH_TO_FFMPEG=/usr/local/ffmpeg
export INSTALL_PREFIX=/home/ubuntu/workshop/vpf3/install

# 开始编译
# python version
# https://github.com/NVIDIA/VideoProcessingFramework/issues/113
cd build
cmake .. \
  -DFFMPEG_DIR:PATH="$PATH_TO_FFMPEG" \
  -DVIDEO_CODEC_SDK_DIR:PATH="$PATH_TO_SDK" \
  -DCMAKE_INSTALL_PREFIX:PATH="$INSTALL_PREFIX" \
  -DGENERATE_PYTHON_BINDINGS:BOOL="1" \
  -DGENERATE_PYTORCH_EXTENSION:BOOL="1" \
  -DPYBIND11_PYTHON_VERSION=3.8 \
  -DPYTHON_LIBRARY=/home/ubuntu/anaconda3/lib/libpython3.8.so \
  -DPYTHON_EXECUTABLE=/home/ubuntu/anaconda3/bin/python3.8 \
  -DPYTHON_INCLUDE_DIR=/home/ubuntu/anaconda3/include/python3.8


  

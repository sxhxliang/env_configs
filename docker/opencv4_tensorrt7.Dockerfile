FROM nvcr.io/nvidia/tensorrt:20.07-py3

ENV DEBIAN_FRONTEND noninteractive

ARG OPENCV_VERSION='4.4.0'
ARG FFMPEG_VERSION='4.2.4'
ARG GFLAGS_VERSION='2.2.2'
ARG GPU_ARCH='7.5'
WORKDIR /opt

# Build tools
RUN apt update && \
    apt install -y \
    sudo \
    tzdata \
    git \
    cmake \
    wget \
    unzip \
    build-essential

# gstreamer 1.16
#RUN apt-get install gstreamer1.16* \
#    ubuntu-restricted-extras \
#    libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev

# Media I/O:
RUN sudo apt install -y \
    zlib1g-dev \
    libjpeg-dev \
    libwebp-dev \
    libpng-dev \
    libtiff5-dev \
    libopenexr-dev \
    libgdal-dev \
    libgtk2.0-dev

# Video I/O:
RUN sudo apt install -y \
    libdc1394-22-dev \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libtheora-dev \
    libvorbis-dev \
    libxvidcore-dev \
    libx264-dev \
    yasm \
    libopencore-amrnb-dev \
    libopencore-amrwb-dev \
    libv4l-dev \
    libxine2-dev \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    ffmpeg

# gflags
RUN wget https://github.com/schuhschuh/gflags/archive/v2.2.2.tar.gz && \
    tar -xvzf v${GFLAGS_VERSION}.tar.gz  && rm v${GFLAGS_VERSION}.tar.gz && \
    mkdir gflags-${GFLAGS_VERSION}/build && \
    cd gflags-${GFLAGS_VERSION}/build && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_SHARED_LIBS=ON -DGFLAGS_NAMESPACE=google -G "Unix Makefiles" ../ && \
    make -j$(nproc) && \
    make install && \
    ldconfig && \
    cd -

# FFmpeg with CUDA
RUN git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git --dept 1 && \
    cd nv-codec-headers/ && \
    make && \
    make install

# FFMPEG
# RUN wget https://github.com/FFmpeg/FFmpeg/archive/n${FFMPEG_VERSION}.zip && \
COPY n${FFMPEG_VERSION}.zip ./
RUN unzip n${FFMPEG_VERSION}.zip && rm n${FFMPEG_VERSION}.zip &&\
    cd FFmpeg-n${FFMPEG_VERSION} && \
    #./configure --enable-nonfree --enable-pic --enable-shared && \
    ./configure --enable-cuda --enable-cuvid  --enable-nvenc --extra-libs=-lpthread --extra-libs=-lm --enable-gpl --enable-libx264 --extra-cflags=-I/usr/local/cuda/include --extra-ldflags=-L/usr/local/cuda/lib64 --enable-nonfree --enable-pic --enable-shared && \
    make -j$(nproc) && \
    make install && \
    cd -

# Install libv4l-dev
RUN apt install -y \
    libv4l-dev

# link videodev.h
RUN cd /usr/include/linux && \
    ln -s -f ../libv4l1-videodev.h videodev.h && \
    cd -

# Parallelism and linear algebra libraries:
RUN sudo apt install -y \
    libtbb-dev \
    libeigen3-dev

# Python:
RUN sudo apt install -y \
    python3-dev \
    python3-tk \
    python3-numpy

# Build OpenCV
#COPY opencv-${OPENCV_VERSION}.zip ./
#COPY opencv_contrib-${OPENCV_VERSION}.zip ./
COPY opencv-${OPENCV_VERSION} ./opencv-${OPENCV_VERSION}
COPY opencv_contrib-${OPENCV_VERSION} ./opencv_contrib-${OPENCV_VERSION}

# Download opencv and opencv contrib
#RUN wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip && \     
#    wget https://github.com/opencv/opencv_contrib/archive/${OPENCV_VERSION}.zip

# 
#RUN unzip opencv-${OPENCV_VERSION}.zip && rm opencv-${OPENCV_VERSION}.zip && \
#    unzip opencv_contrib-${OPENCV_VERSION}.zip && rm opencv_contrib-${OPENCV_VERSION}.zip

# Build OpenCV
RUN cd opencv-${OPENCV_VERSION} && \
    mkdir build && cd build && \
    cmake \
     -D WITH_TBB=ON \
      -D CMAKE_BUILD_TYPE=RELEASE \
      -D BUILD_EXAMPLES=ON \
      -D WITH_FFMPEG=ON \
      -D WITH_V4L=ON \
      -D WITH_OPENGL=ON \
      -D WITH_CUDA=ON \
      -D CUDA_ARCH_BIN=${GPU_ARCH} \
      -D CUDA_ARCH_PTX=${GPU_ARCH} \
      -D WITH_CUBLAS=ON \
      -D WITH_CUFFT=ON \
      -D WITH_EIGEN=ON \
      -D EIGEN_INCLUDE_PATH=/usr/include/eigen3 \
      -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-${OPENCV_VERSION}/modules/ \
      .. && \
    make all -j$(nproc) && \
    make install

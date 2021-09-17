# syntax=docker/dockerfile:experimental
FROM nvcr.io/nvidia/tensorrt:20.07-py3

ARG opencv_ver=4.4.0
ARG opencv_url=https://github.com/opencv/opencv.git
ARG opencv_contrib_url=https://github.com/opencv/opencv_contrib.git

# COPY sources.list /etc/apt/

ENV CUDA_HOME /usr/local/cuda

RUN mv /etc/apt/sources.list.d/*.list /home/ \
 && apt update && apt install -y build-essential cmake git libgtk-3-dev \
 \
 && mkdir -p /codes && cd /codes/ \
 \
 && git clone -b ${opencv_ver} --depth 1 ${opencv_url} \
 && git clone -b ${opencv_ver} --depth 1 ${opencv_contrib_url} \
 \
 && cd /codes/opencv/ \
 && mkdir _build && cd _build/ \
 && cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/home/opencv-${opencv_ver} \
    -DOPENCV_EXTRA_MODULES_PATH=/codes/opencv_contrib/modules \
    \
    -DWITH_CUDA=ON \
    \
    -DBUILD_DOCS=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_TESTS=OFF \
    .. \
 && make -j$(nproc) \
 && make install \
 \
 && rm -rf /codes/ \
 && mv /home/*.list /etc/apt/sources.list.d/ \
 \
 && apt remove -y cmake git && apt autoremove -y \
 && rm -rf /var/lib/apt/lists/*

ENV OpenCV_DIR /home/opencv-${opencv_ver}/lib/cmake

CMD ["/bin/bash"]
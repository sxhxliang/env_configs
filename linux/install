sudo apt-get install gstreamer1.0*
sudo apt install ubuntu-restricted-extras
sudo apt install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev


cd /usr/include/linux 
sudo ln -s -f ../libv4l1-videodev.h videodev.h



# FFMPEG
./configure
make
make install

sudo apt-get install gstreamer1.0*
sudo apt install ubuntu-restricted-extras
sudo apt install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev

# I had to recompile FFMPEG with 
./configure --enable-nonfree --enable-pic --enable-shared


# gflags

wget https://github.com/schuhschuh/gflags/archive/v2.2.1.tar.gz
mkdir build 
cd build 
cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_SHARED_LIBS=ON -DGFLAGS_NAMESPACE=google -G "Unix Makefiles" ../ 
make
sudo make install 
sudo ldconfig 

cmake   -D CMAKE_BUILD_TYPE=RELEASE   -D CMAKE_INSTALL_PREFIX=/usr/local   -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.1.0/modules   -D CUDA_ARCH_PTX=""   -D WITH_CUDA=ON   -D CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-11.0   -D WITH_TBB=ON   -D BUILD_opencv_python3=ON   -D BUILD_TESTS=OFF   -D BUILD_PERF_TESTS=OFF   -D WITH_V4L=ON   -D WITH_LIBV4L=ON   -D BUILD_EXAMPLES=OFF   -D WITH_OPENGL=ON   -D ENABLE_FAST_MATH=ON   -D CUDA_FAST_MATH=ON   -D WITH_CUBLAS=ON   -D WITH_NVCUVID=ON   -D WITH_GSTREAMER=ON   -D WITH_OPENCL=ON -D BUILD_opencv_cudacodec=OFF -DCUDA_ARCH_BIN=5.3,6.0,6.1,7.0,7.5 -DCUDA_ARCH_PTX=7.5 ..

cmake   -D CMAKE_BUILD_TYPE=RELEASE   -D CMAKE_INSTALL_PREFIX=/usr/local   -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.1.2/modules   -D CUDA_ARCH_PTX=""   -D WITH_CUDA=ON   -D CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-11.0   -D WITH_TBB=ON   -D BUILD_opencv_python3=ON   -D BUILD_TESTS=OFF   -D BUILD_PERF_TESTS=OFF   -D WITH_V4L=ON   -D WITH_LIBV4L=ON   -D BUILD_EXAMPLES=OFF   -D WITH_OPENGL=ON   -D ENABLE_FAST_MATH=ON   -D CUDA_FAST_MATH=ON   -D WITH_CUBLAS=ON   -D WITH_NVCUVID=ON   -D WITH_GSTREAMER=ON   -D WITH_OPENCL=ON -D BUILD_opencv_cudacodec=OFF -DCUDA_ARCH_BIN=5.3,6.0,6.1,7.0,7.5 -DCUDA_ARCH_PTX=7.5 ..


cmake \
  -D CMAKE_BUILD_TYPE=RELEASE \
  -D CMAKE_INSTALL_PREFIX=/usr/local \
  -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.1.2/modules \
  -D CUDA_ARCH_BIN=7.5 \
  -D CUDA_ARCH_BIN=5.3,6.0,6.1,7.0,7.5 -DCUDA_ARCH_PTX=7.5
  -D CUDA_ARCH_PTX="" \
  -D WITH_CUDA=ON \
  -D CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-11.0 \
  -D WITH_TBB=ON \
  -D BUILD_opencv_python3=ON \
  -D BUILD_TESTS=OFF \
  -D BUILD_PERF_TESTS=OFF \
  -D WITH_V4L=ON \
  -D WITH_LIBV4L=ON \
  -D BUILD_EXAMPLES=OFF \
  -D WITH_OPENGL=ON \
  -D ENABLE_FAST_MATH=ON \
  -D CUDA_FAST_MATH=ON \
  -D WITH_CUBLAS=ON \
  -D WITH_NVCUVID=ON \
  -D WITH_GSTREAMER=ON \
  -D WITH_OPENCL=ON ..


cmake . ..  \
	-DUSE_OCV_BGFG=ON \
	-DUSE_OCV_KCF=ON \
	-DUSE_OCV_UKF=ON \
	-DBUILD_YOLO_LIB=OFF \
	-DBUILD_YOLO_TENSORRT=ON \
	-DBUILD_ASYNC_DETECTOR=ON \
	-DBUILD_CARS_COUNTING=ON \
	-DSILENT_WORK=ON

# cmake \
#   -D CMAKE_BUILD_TYPE=RELEASE \
#   -D CMAKE_INSTALL_PREFIX=/usr/local \
#   -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.4.0/modules \
#   -D CUDA_ARCH_BIN=7.5 \
#   -D CUDA_ARCH_PTX="" \
#   -D WITH_CUDA=ON \
#   -D CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-11.0 \
#   -D WITH_TBB=ON \
#   -D BUILD_opencv_python3=ON \
#   -D BUILD_TESTS=OFF \
#   -D BUILD_PERF_TESTS=OFF \
#   -D WITH_V4L=ON \
#   -D WITH_LIBV4L=ON \
#   -D BUILD_EXAMPLES=OFF \
#   -D WITH_OPENGL=ON \
#   -D ENABLE_FAST_MATH=ON \
#   -D CUDA_FAST_MATH=ON \
#   -D WITH_CUBLAS=ON \
#   -D WITH_NVCUVID=ON \
#   -D WITH_GSTREAMER=ON \
#   -D WITH_OPENCL=ON ..


# cmake -D CMAKE_BUILD_TYPE=RELEASE \
# -D CMAKE_C_COMPILER=/usr/bin/gcc-9 \
# -D CMAKE_INSTALL_PREFIX=/usr/local \
# -D INSTALL_PYTHON_EXAMPLES=ON \
# -D INSTALL_C_EXAMPLES=OFF \
# -D WITH_TBB=ON \
# -D BUILD_opencv_cudacodec=OFF \
# -D ENABLE_FAST_MATH=1 \
# -D CUDA_FAST_MATH=1 \
# -D WITH_CUDA=ON \
# -D WITH_CUBLAS=1 \
# -D WITH_V4L=ON \
# -D WITH_QT=OFF \
# -D WITH_OPENGL=ON \
# -D WITH_GSTREAMER=ON \
# -D OPENCV_GENERATE_PKGCONFIG=ON \
# -D OPENCV_PC_FILE_NAME=opencv.pc \
# -D OPENCV_ENABLE_NONFREE=ON \
# -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-4.4.0/modules \
# -D PYTHON_EXECUTABLE=/usr/bin/python3 \
# -D BUILD_EXAMPLES=ON \
# -D WITH_CUDNN=ON \
# -D OPENCV_DNN_CUDA=ON \
# -D CUDA_ARCH_BIN=7.5 ..
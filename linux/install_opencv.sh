
sudo apt-get install gstreamer1.0*
sudo apt install ubuntu-restricted-extras
sudo apt install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev


# The imported target "vtkRenderingPythonTkWidgets" references the file
#    "/usr/lib/x86_64-linux-gnu/libvtkRenderingPythonTkWidgets.so"
# https://blog.csdn.net/weixin_45617478/article/details/104513572
sudo ln -s /usr/lib/python2.7/dist-packages/vtk/libvtkRenderingPythonTkWidgets.x86_64-linux-gnu.so /usr/lib/x86_64-linux-gnu/libvtkRenderingPythonTkWidgets.so
sudo ln -s /usr/bin/vtk6 /usr/bin/vtk 

export http_proxy=http://127.0.0.1:8889;export https_proxy=http://127.0.0.1:8889;
export http_proxy=http://host.docker.internal:8889;export https_proxy=http://host.docker.internal:8889;


# ffmpeg
# I had to recompile FFMPEG with 
./configure --enable-nonfree --enable-pic --enable-shared



# ffmpeg with CUDA
git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git --dept 1
cd nv-codec-headers/
make 
make install
cd -
cd ./FFmpeg-n4.1.6
./configure --enable-nonfree --enable-pic --enable-shared --enable-cuda --enable-cuvid --enable-nvenc --enable-libnpp --extra-cflags=-I/usr/local/cuda/include --extra-ldflags=-L/usr/local/cuda/lib64



make -j16
make install




mkdir build & cd build
cmake  \
 -D CMAKE_BUILD_TYPE=RELEASE  \
 -D CMAKE_INSTALL_PREFIX=/usr/local  \
 -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.4.0/modules  \
 -D CUDA_ARCH_PTX=""  \
 -D WITH_CUDA=ON  \
 -D CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-11.0  \
 -D WITH_TBB=ON  \
 -D BUILD_opencv_python3=ON  \
 -D BUILD_TESTS=OFF  \
 -D BUILD_PERF_TESTS=OFF  \
 -D WITH_V4L=ON  \
 -D WITH_LIBV4L=ON  \
 -D BUILD_EXAMPLES=OFF  \
 -D WITH_OPENGL=ON  \
 -D ENABLE_FAST_MATH=ON  \
 -D CUDA_FAST_MATH=ON  \
 -D WITH_CUBLAS=ON  \
 -D WITH_NVCUVID=ON  \
 -D WITH_GSTREAMER=ON  \
 -D WITH_OPENCL=ON .. \
 -D CUDA_ARCH_BIN=5.3,6.0,6.1,7.0,7.5 \
 -D CUDA_ARCH_PTX=7.5 ..



cmake  \
 -D CMAKE_BUILD_TYPE=RELEASE  \
 -D CMAKE_INSTALL_PREFIX=/usr/local  \
 -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.4.0/modules  \
 -D CUDA_ARCH_PTX=""  \
 -D WITH_CUDA=ON  \
 -D CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-11.1  \
 -D WITH_TBB=ON  \
 -D BUILD_opencv_python3=ON  \
 -D BUILD_TESTS=OFF  \
 -D BUILD_PERF_TESTS=OFF  \
 -D WITH_V4L=ON  \
 -D WITH_LIBV4L=ON  \
 -D BUILD_EXAMPLES=OFF  \
 -D WITH_OPENGL=ON  \
 -D ENABLE_FAST_MATH=ON  \
 -D CUDA_FAST_MATH=ON  \
 -D WITH_CUBLAS=ON  \
 -D WITH_NVCUVID=ON  \
 -D WITH_GSTREAMER=ON  \
 -D WITH_OPENCL=ON .. \
 -D CUDA_ARCH_BIN=7.0,7.5 \
 -D CUDA_ARCH_PTX=7.5 ..




# https://github.com/opencv/opencv/pull/17499/files
# https://blog.csdn.net/ipanda_huanhuan/article/details/107341173
# 用cmake编译OpenCV的时候，出现错误“CUDA_nppicom_LIBRARY (ADVANCED)”,如这个链接(https://gitlab.kitware.com/cmake/cmake/-/commit/1d9f2f9714af3cd9f43975456c4be03c2df463ad)
# 所述：在CUDA 11.0中，移除了这个库。但是CMAKE好像没及时更新。因此，信息不同步，导致报错。
# 我用CMAKE里最新版的FindCUDA.cmake替换掉原先的FindCUDA.cmake，还是报错。或许只替换这一个文件不能完全起作用，
# 需要下载最新版的CMAKE.但是我担心OpenCV的文件可能也要修改，并且最新版的CMAKE也不一定解决了这个问题，所以就没尝试这种方法。
# 我把CUDA 11.0卸载了，安装了CUDA 10.2(起初重新安装的是CUDA10.0，但是VS2019版本过高，
# 虽然据说可以通过修改 host_config.h 来解决这个问题，但是我还是选择了安装CUDA 10.2), 之后原先的那个错误果然就没再出现，顺利通过编译。

 cmake  \
 -D CMAKE_BUILD_TYPE=RELEASE  \
 -D CMAKE_INSTALL_PREFIX=/usr/local  \
 -D CUDA_nppicom_LIBRARY=ON \
 -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-3.4.1/modules  \
 -D CUDA_ARCH_PTX=""  \
 -D WITH_CUDA=ON  \
 -D CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-10.1  \
 -D WITH_TBB=ON  \
 -D BUILD_opencv_python3=ON  \
 -D BUILD_TESTS=OFF  \
 -D BUILD_PERF_TESTS=OFF  \
 -D WITH_V4L=ON  \
 -D WITH_LIBV4L=ON  \
 -D BUILD_EXAMPLES=OFF  \
 -D WITH_OPENGL=ON  \
 -D ENABLE_FAST_MATH=ON  \
 -D CUDA_FAST_MATH=ON  \
 -D WITH_CUBLAS=ON  \
 -D WITH_NVCUVID=ON  \
 -D WITH_GSTREAMER=ON  \
 -D WITH_OPENCL=ON .. \
 -D CUDA_ARCH_BIN=5.3,6.0,6.1,7.0,7.5 \
 -D CUDA_ARCH_PTX=7.5 ..

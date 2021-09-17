export http_proxy=http://127.0.0.1:8889;export https_proxy=http://127.0.0.1:8889;

export http_proxy=http://127.0.0.1:8889;export https_proxy=http://127.0.0.1:8889;


# https://github.com/dreamrover/v2ray-deb
# ubuntu 安装
export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087;


export http_proxy=http://host.docker.internal:8889;export https_proxy=http://host.docker.internal:8889;

export http_proxy=http://172.17.0.1:8118
export https_proxy=http://172.17.0.1:8118
export ftp_proxy=http://172.17.0.1:8118



cmake \
      -D WITH_TBB=ON \
      -D CMAKE_BUILD_TYPE=RELEASE \
      -D BUILD_EXAMPLES=ON \
      -D WITH_FFMPEG=ON \
      -D WITH_V4L=ON \
      -D WITH_OPENGL=ON \
      -D WITH_CUDA=ON \
      -D CUDA_ARCH_BIN=7.5 \
      -D CUDA_ARCH_PTX=7.5 \
      -D WITH_CUBLAS=ON \
      -D WITH_CUFFT=ON \
      -D WITH_EIGEN=ON \
      -D EIGEN_INCLUDE_PATH=/usr/include/eigen3 \
      -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib-4.4.0/modules/ \
      ..


{
	"proxies":
	{
		"default":
		{
			"httpProxy": "http://127.0.0.1:8889",
			"httpsProxy": "http://127.0.0.1:8889",
			"noProxy": "localhost"
		}
	}
}
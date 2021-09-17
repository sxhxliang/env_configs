# 下载按需求下载cudnn的安装文件：https://developer.nvidia.com/rdp/cudnn-archive
# https://zhuanlan.zhihu.com/p/339062791
# 解压
tar -xvf cudnn-10.1-linux-x64-v7.6.5.32.tgz

echo "复制文件到 /usr/local/cuda"
sudo cp cuda/include/cudnn.h /usr/local/cuda/include/
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64/

echo "chmod a+r cudnn"
sudo chmod a+r /usr/local/cuda/include/cudnn.h
sudo chmod a+r /usr/local/cuda/lib64/libcudnn*

echo "查看cudnn版本"
cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2


sudo cp cuda/targets/ppc64le-linux/include/cudnn*.h /usr/local/cuda/include
sudo cp cuda/targets/ppc64le-linux/lib/libcudnn* /usr/local/cuda/lib64/



sudo cp cuda/include/cudnn* /usr/local/cuda-11.0/include/
sudo cp cuda/lib64/libcudnn* /usr/local/cuda-11.0/lib64/
sudo chmod a+r /usr/local/cuda-11.0/include/cudnn*
sudo chmod a+r /usr/local/cuda-11.0/lib64/libcudnn*


sudo cp cudnn-11.1-linux-x64-v8.0.4.30.solitairetheme8 cudnn-11.1-linux-x64-v8.0.4.30.tgz
tar -xzvf cudnn-11.1-linux-x64-v8.0.4.30.tgz
sudo cp cuda/include/* /usr/local/cuda/include/
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64/
sudo chmod a+r /usr/local/cuda/include/cudnn.h
sudo chmod a+r /usr/local/cuda/lib64/libcudnn*

docker run --gpus all -it --rm -v $(pwd)/yolov4-triton-tensorrt:/yolov4-triton-tensorrt nvcr.io/nvidia/tensorrt:20.06-py3
cd /yolov4-triton-tensorrt/opencv-4.1.2/build

cd /yolov4-triton-tensorrt/tensorrtx
cd /yolov4-triton-tensorrt/tensorrtx/yolov5/build/

cmake ..
make
./yolov5 -s
/workspace/tensorrt/bin/trtexec --loadEngine=yolov5s.engine --plugins=./libmyplugins.so



# copy tensorrtx-v2/yolov5/gen_wts.py into yolov5

cp tensorrtx-v2/yolov5/gen_wts.py yolov5-v2-traffic/
cd yolov5-v2-traffic/




# https://www.bzblog.online/wordpress/index.php/2020/03/09/opencvdownload/#comment-29


DOCKER_WORKSHOP_DIR="yolov5-triton"

mkdir 

wget https://www.bzblog.online/opencv/opencv-3.4.11/opencv-3.4.11.zip



# docker run --gpus all -it --rm -v $(pwd)/yolov4-triton-tensorrt:/yolov4-triton-tensorrt nvcr.io/nvidia/tensorrt:20.06-py3

docker run --gpus all -it --rm -v $(pwd)/yolov5-triton:/yolov5-triton nvcr.io/nvidia/tensorrt:20.06-py3
cd yolov5-triton

docker run --gpus all -it --rm -v $(pwd)/VideoProcessingFramework:/VideoProcessingFramework nvcr.io/nvidia/tensorrt:20.07-py3


# 测试
# docker run -it --ipc=host --net=host nvcr.io/nvidia/tritonserver:20.09-py3-clientsdk /bin/bash
# cd install/bin
# ./perf_client (...argumentshere)
# # Example
# ./perf_client -m yolov4 -u 127.0.0.1:8001 -i grpc --shared-memory system --concurrency-range 4

./perf_client -m yolov5 -u 192.168.1.183:8001 -i grpc --shared-memory system --concurrency-range 4

docker run --gpus all -it --network=host -v $(pwd)/yolov5-triton:/yolov5-triton nvcr.io/nvidia/tensorrt:20.09-py3


docker run --gpus all -it --rm -v $(pwd)/yolov5-triton:/yolov5-triton nvcr.io/nvidia/tensorrt:20.06-py3



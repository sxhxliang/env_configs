
#!/bin/bash

echo "build docker !"

DOCKER_WORKSHOP_DIR="yolov5-triton"
OPENCV_FILE="opencv-3.4.11.zip"
TENSORRT_DOCKER_NAME="tensorrt_for_build_engine"

#如果文件夹不存在，创建文件夹
if [ ! -d "$DOCKER_WORKSHOP_DIR" ]; then
  # mkdir $DOCKER_WORKSHOP_DIR
  mkdir -p $DOCKER_WORKSHOP_DIR/libs
fi

cd $DOCKER_WORKSHOP_DIR


if [ ! -f "libs/$OPENCV_FILE" ]; then
  cd libs
  wget https://www.bzblog.online/opencv/opencv-3.4.11/opencv-3.4.11.zip
  unzip opencv-3.4.11.zip
fi

cd -

container_id=$(docker ps -a | grep -v grep | grep $TENSORRT_DOCKER_NAME | awk '{print $1}')

if [ -n "$container_id" ]; then
	echo "删除容器"
	docker stop $container_id
	docker rm -f $container_id
fi

# 在docker 里面

echo "测试写文件"
cat>$DOCKER_WORKSHOP_DIR/mask_ensorrtx.sh<<EOF

echo "编译opencv "
cd /$DOCKER_WORKSHOP_DIR/libs/opencv-3.4.11
mkdir build & cd build
cmake ..
echo "安装 opencv 到容器中"
make & make install


echo "编译 yolov5x.engine "
cd /$DOCKER_WORKSHOP_DIR/tensorrtx/yolov5/
mkdir build & cd build
cmake ..
make
echo "序列化yolov5x 导出yolov5x.engine "

/$DOCKER_WORKSHOP_DIR/tensorrtx/yolov5/build/yolov5 -s 

/workspace/tensorrt/bin/trtexec --loadEngine=/$DOCKER_WORKSHOP_DIR/tensorrtx/yolov5/build/yolov5x.engine --plugins=/$DOCKER_WORKSHOP_DIR/tensorrtx/yolov5/build/libmyplugins.so

EOF

/workspace/tensorrt/bin/trtexec --loadEngine=/yolov5-triton/tensorrtx/yolov5_coco/build/yolov5x.engine --plugins=/yolov5-triton/tensorrtx/yolov5_coco/build/libmyplugins.so
# 启动yolov5  engine编译环境 
# example docker run --gpus all -it --rm -v $(pwd)/yolov5-triton:/yolov5-triton nvcr.io/nvidia/tensorrt:20.06-py3

docker run --gpus all --name $TENSORRT_DOCKER_NAME -it --rm  -v $(pwd)/$DOCKER_WORKSHOP_DIR:/$DOCKER_WORKSHOP_DIR nvcr.io/nvidia/tensorrt:20.06-py3 /bin/bash /$DOCKER_WORKSHOP_DIR/mask_ensorrtx.sh
# docker run --gpus all -it --rm -v $(pwd)/yolov4-triton-tensorrt:/yolov4-triton-tensorrt nvcr.io/nvidia/tensorrt:20.06-py3
# docker run --gpus all -it --rm  -v $(pwd)/yolov5-triton:/yolov5-triton nvcr.io/nvidia/tensorrt:20.06-py3 
# docker run --gpus all -it --rm  -v $(pwd)/yolov5-triton:/yolov5-triton nvcr.io/nvidia/tensorrt:20.07-py3


# https://github.com/isarsoft/yolov4-triton-tensorrt
# https://github.com/NVIDIA/triton-inference-server
# https://github.com/wang-xinyu/tensorrtx
# https://github.com/Tianxiaomo/pytorch-YOLOv4#5-onnx2tensorrt-evolving
# https://zhuanlan.zhihu.com/p/149384346
# https://github.com/ultralytics/yolov5
# https://github.com/layerism/TensorRT-Inference-Server-Tutorial


# echo "测试写文件"
# cat>$DOCKER_WORKSHOP_DIR/trtexec_tensorrtx.sh<<EOF

# # cd /workspace/tensorrt/bin
# echo "benchmark测试 yolov5x 性能"
# # ./trtexec --loadEngine=/y$DOCKER_WORKSHOP_DIR/build/yolov5x.engine --plugins=/$DOCKER_WORKSHOP_DIR/build/liblayerplugin.so
# # ./trtexec --loadEngine=/yolov5-triton/build/yolov5x.engine --plugins=/yolov5-triton/build/liblayerplugin.so
# # ./trtexec --loadEngine=/yolov5-triton/yolov5_2.0-TensorRt/yolov5x/build/yolov5x.engine --plugins=/yolov5-triton/yolov5_2.0-TensorRt/yolov5x/build/libyololayer.so

# # /workspace/tensorrt/bin/trtexec --loadEngine=./yolov5x.engine --plugins=./libyololayer.so
# /workspace/tensorrt/bin/trtexec --loadEngine=/$DOCKER_WORKSHOP_DIR/tensorrtx/yolov5/yolov5x.engine --plugins=/$DOCKER_WORKSHOP_DIR/tensorrtx/yolov5/libmyplugins.so
# # Deploy to Triton Inference Server
# EOF

echo "启动 tritonserver clientsdk 客户端 "
docker run -it --ipc=host --net=host --rm -v  $(pwd)/$DOCKER_WORKSHOP_DIR:/$DOCKER_WORKSHOP_DIR nvcr.io/nvidia/tritonserver:20.06-py3-clientsdk /bin/bash /$DOCKER_WORKSHOP_DIR/trtexec_tensorrtx.sh


# # Create model repository
# cd yolo
# mkdir -p triton-deploy/model_repository/yolov4/1/
# mkdir triton-deploy/plugins

# # Copy engine and plugins
# cp yolov4-triton-tensorrt/build/yolov4.engine triton-deploy/models/yolov4/1/model.plan
# cp yolov4-triton-tensorrt/build/liblayerplugin.so triton-deploy/plugins/



# mkdir -p triton-deploy/model_repository/yolov4/1/
# mkdir triton-deploy/plugins
# # cp yolov4-triton-tensorrt/tensorrtx/yolov5/build/yolov5x.engine triton-deploy/models/yolov5/1/model.plan
# cp yolov4-triton-tensorrt/tensorrtx/yolov5/build/yolov5x.engine triton-deploy/model_repository/yolov5/1/
# cp yolov4-triton-tensorrt/tensorrtx/yolov5/build/libmyplugins.so triton-deploy/plugins/
# docker run --gpus all --rm --shm-size=1g --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 -p8000:8000 -p8001:8001 -p8002:8002 -v$(pwd)/r608x608/model_repository:/models -v$(pwd)/r608x608/plugins:/plugins --env LD_PRELOAD=/plugins/libmyplugins.so nvcr.io/nvidia/tritonserver:20.06-py3 tritonserver --model-repository=/models --strict-model-config=false --grpc-infer-allocation-pool-size=16 --log-verbose 1
# docker run --gpus all --rm --shm-size=1g --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 -p8000:8000 -p8001:8001 -p8002:8002 -v$(pwd)/r768x448/model_repository:/models -v$(pwd)/r768x448/plugins:/plugins --env LD_PRELOAD=/plugins/libmyplugins.so nvcr.io/nvidia/tritonserver:20.06-py3 tritonserver --model-repository=/models --strict-model-config=false --grpc-infer-allocation-pool-size=16 --log-verbose 1



# docker run --gpus all --rm --shm-size=1g --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 -p8000:8000 -p8001:8001 -p8002:8002 -v$(pwd)/triton-deploy/model_repository:/models -v$(pwd)/triton-deploy/plugins:/plugins --env LD_PRELOAD=/plugins/libmyplugins.so nvcr.io/nvidia/tritonserver:20.06-py3 tritonserver --model-repository=/models --strict-model-config=false --grpc-infer-allocation-pool-size=16 --log-verbose 1
# docker run --gpus all --rm --shm-size=1g --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 -p8010:8000 -p8011:8001 -p8012:8002 -v$(pwd)/triton-deploy/r608x608/model_repository:/models -v$(pwd)/triton-deploy/r608x608/plugins:/plugins --env LD_PRELOAD=/plugins/libmyplugins.so nvcr.io/nvidia/tritonserver:20.06-py3  tritonserver --model-repository=/models --strict-model-config=false --grpc-infer-allocation-pool-size=16 --log-verbose 1

echo "启动 tritonserver 服务端 "
# 8000
docker run --gpus all --rm --shm-size=1g --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 -p8000:8000 -p8001:8001 -p8002:8002 -v$(pwd)/yolov5-triton/triton-deploy/r768x448/model_repository:/models -v$(pwd)/yolov5-triton/triton-deploy/r768x448/plugins:/plugins --env LD_PRELOAD=/plugins/libmyplugins.so nvcr.io/nvidia/tritonserver:20.07-py3 tritonserver --model-repository=/models --strict-model-config=false --grpc-infer-allocation-pool-size=16 --log-verbose 1
# 8010
docker run --gpus all --rm --shm-size=1g --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 -p8010:8000 -p8011:8001 -p8012:8002 -v$(pwd)/yolov5-triton/triton-deploy/r768x448/model_repository:/models -v$(pwd)/yolov5-triton/triton-deploy/r768x448/plugins:/plugins --env LD_PRELOAD=/plugins/libmyplugins.so nvcr.io/nvidia/tritonserver:20.07-py3 tritonserver --model-repository=/models --strict-model-config=false --grpc-infer-allocation-pool-size=16 --log-verbose 1


# 20.09
docker run --gpus all --rm --shm-size=1g --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 -p8000:8000 -p8001:8001 -p8002:8002 -v$(pwd)/yolov5-triton/triton-deploy-20.09/r768x448/model_repository:/models -v$(pwd)/yolov5-triton/triton-deploy-20.09/r768x448/plugins:/plugins --env LD_PRELOAD=/plugins/libmyplugins.so nvcr.io/nvidia/tritonserver:20.09-py3 tritonserver --model-repository=/models --strict-model-config=false --grpc-infer-allocation-pool-size=16 --log-verbose 1


docker run --gpus all --rm --shm-size=1g --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 -p8000:8000 -p8001:8001 -p8002:8002 -v$(pwd)/yolov5-triton/triton-deploy-20.09/r768x448/model_repository:/models -v$(pwd)/yolov5-triton/triton-deploy-20.09/r768x448/plugins:/plugins --env LD_PRELOAD=/plugins/libmyplugins.so 43e4bb96dad0 tritonserver --model-repository=/models --strict-model-config=false --grpc-infer-allocation-pool-size=16 --log-verbose 1
docker run --gpus all --rm --shm-size=1g --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 -p9000:8000 -p9001:8001 -p9002:8002 -v$(pwd)/yolov5-triton/triton-deploy-20.09/r768x448/model_repository:/models -v$(pwd)/yolov5-triton/triton-deploy-20.09/r768x448/plugins:/plugins --env LD_PRELOAD=/plugins/libmyplugins.so nvcr.io/nvidia/tritonserver:20.09-py3 tritonserver --model-repository=/models --strict-model-config=false --grpc-infer-allocation-pool-size=16 --log-verbose 1


# docker run -it --ipc=host --net=host nvcr.io/nvidia/tritonserver:20.06-py3-clientsdk /bin/bash
# cd install/bin
# ./perf_client (...argumentshere)
# # Example
# ./perf_client -m yolov5 -u 127.0.0.1:8001 -i grpc --shared-memory system --concurrency-range 4

./perf_client -m yolov5 -u 192.168.1.183:8001 -i grpc --shared-memory system --concurrency-range 4

curl -v 192.168.1.183:8000/v2/models/yolov5


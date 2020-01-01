cmake_minimum_required(VERSION 3.13)

project(darknet)

#set(vs_version vs2013)
# set(vc_version vc12)

set (SRC_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
message(${SRC_ROOT_PATH})

set (PTHREAD_BASE_PATH "D:/Pre-built.2")

set(INCLUDE_PATH "include" "src" "${PTHREAD_BASE_PATH}/include")
include_directories(${INCLUDE_PATH})

add_definitions(-D_CRT_SECURE_NO_WARNINGS)

SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wno-unused-result -Wno-unknown-pragmas -Wfatal-errors -Ofast")

SET(CMAKE_LD_FLAGS "${CMAKE_LD_FLAGS} -lstdc++ -lm -pthread")

set(CPU_LIB_FILE_LIST 
	src/gemm.c 
	src/gemm.h
	src/utils.c
	src/utils.h
	src/cuda.c
	src/cuda.h
	src/deconvolutional_layer.c
	src/deconvolutional_layer.h
	src/convolutional_layer.c
	src/convolutional_layer.h
	src/list.c
	src/list.h
	src/image.c
	src/image.h
	src/activations.c
	src/activations.h
	src/im2col.c
	src/im2col.h
	src/col2im.c
	src/col2im.h
	src/blas.c
	src/blas.h
	src/crop_layer.c
	src/crop_layer.h
	src/dropout_layer.c
	src/dropout_layer.h
	src/maxpool_layer.c
	src/maxpool_layer.h
	src/softmax_layer.c
	src/softmax_layer.h
	src/data.c
	src/data.h
	src/matrix.c
	src/matrix.h
	src/network.c
	src/network.h
	src/connected_layer.c
	src/connected_layer.h
	src/cost_layer.c
	src/cost_layer.h
	src/parser.c
	src/parser.h
	src/option_list.c
	src/option_list.h
	src/detection_layer.c
	src/detection_layer.h
	src/route_layer.c
	src/route_layer.h
	src/upsample_layer.c
	src/upsample_layer.h
	src/box.c
	src/box.h
	src/normalization_layer.c
	src/normalization_layer.h
	src/avgpool_layer.c
	src/avgpool_layer.h
	src/layer.c
	src/layer.h
	src/local_layer.c
	src/local_layer.h
	src/shortcut_layer.c
	src/shortcut_layer.h
	src/logistic_layer.c
	src/logistic_layer.h
	src/activation_layer.c
	src/activation_layer.h
	src/rnn_layer.c
	src/rnn_layer.h
	src/gru_layer.c
	src/gru_layer.h
	src/crnn_layer.c
	src/crnn_layer.h
	src/demo.c
	src/demo.h
	src/batchnorm_layer.c
	src/batchnorm_layer.h
	src/region_layer.c
	src/region_layer.h
	src/reorg_layer.c
	src/reorg_layer.h
	src/tree.c
	src/tree.h
	src/lstm_layer.c
	src/lstm_layer.h
	src/l2norm_layer.c
	src/l2norm_layer.h
	src/yolo_layer.c
	src/yolo_layer.h
	src/iseg_layer.c
	src/iseg_layer.h
	
	src/classifier.h
	src/compare.c
	src/image_opencv.cpp
	src/stb_image.h
	src/stb_image_write.h
)

set(GPU_LIB_FILE_LIST
	src/convolutional_kernels.cu 
	src/deconvolutional_kernels.cu 
	src/activation_kernels.cu 
	src/im2col_kernels.cu 
	src/col2im_kernels.cu 
	src/blas_kernels.cu 
	src/crop_layer_kernels.cu 
	src/dropout_layer_kernels.cu 
	src/maxpool_layer_kernels.cu 
	src/avgpool_layer_kernels.cu
)

set(EXE_FILE_LIST
	examples/captcha.c
	examples/lsd.c
	examples/super.c
	examples/art.c
	examples/tag.c
	examples/cifar.c
	examples/go.c
	examples/rnn.c
	examples/segmenter.c
	examples/regressor.c
	examples/classifier.c
	examples/coco.c
	examples/yolo.c
	examples/detector.c
	examples/nightmare.c
	examples/instance-segmenter.c
	examples/darknet.c
	
	examples/attention.c
	examples/dice.c
	examples/rnn_vid.c
	examples/swag.c
	examples/voxel.c
	examples/writing.c
	
	include/darknet.h
)


add_library(darknet ${CPU_LIB_FILE_LIST})

add_executable(yolo ${EXE_FILE_LIST})


target_link_directories(yolo PRIVATE "${PTHREAD_BASE_PATH}/lib/x64")

target_link_libraries(yolo pthreadVC2.lib ws2_32.lib darknet)



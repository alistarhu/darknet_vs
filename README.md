# darknet_vs

This project is base on [darknet](http://pjreddie.com/darknet/) from **pjreddie** and aims to make more easy to play with darknet both on windows and linux.

For more details: 
* [yolov2](https://pjreddie.com/darknet/yolov2/)
* [yolov3](https://pjreddie.com/darknet/yolo/) 
* [darknet](https://github.com/pjreddie/darknet) 
* [darknet_AlexeyAB](https://github.com/AlexeyAB/darknet)


## Prepare
- Weight download
    * [yolov1](https://pjreddie.com/media/files/yolov1.weights)
    * [yolov2](https://pjreddie.com/media/files/yolov2.weights)
    * [yolov3](https://pjreddie.com/media/files/yolov3.weights)

- Pre-train model (optional)
    * [darknet19](https://pjreddie.com/media/files/darknet19.weights)
    * [darknet19_448](https://pjreddie.com/media/files/darknet19_448.weights)


## Build on linux
- Compile
```
$ cd darknet_vs
$ vim Makefile
// edit first 5 lines according to your pc
$ make
```

- Run test
```
./darknet detect cfg/yolov2.cfg XXX/yolov2.weights data/dog.jpg -out dog_res
```

## Build on windows
We fix some bugs and edit code to make it run compatitably on windows platform. Here we test the project on vs2013 with pthread. But CUDA and OpenCV on Visual Studio is not supported now.

- Edit config in CMakeLists

you need to set the pthread install path in line 11.

- Compile use cmake

```
$ cd build_vs
$ .\gen_vs.bat
```
You can click **darknet.sln** in `build_vs2013x64` folder to open the vs project.

- Run test
```
$ .\build_vs\build_vs2013x64\Release\yolo.exe detect .\cfg\yolov2.cfg ..\weight\yolov2.weights .\data\dog.jpg -out dog_res
```


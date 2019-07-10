Face Detection Algorithm Sample
===============================

General Description
-------------------

This folder contains a sample that runs CVA Face Detector
algorithm for an input image and shows detection preview.

Building the Sample on Linux* OS
--------------------------------

Requirements:

* OpenVINO™ 2018 R1.1 toolkit or newer
* Pre-built Inference Engine CPU extensions library (See Getting Started Guide
  for details)
* Ubuntu* 16.04 LTS 64-bit or CentOS* 7.4 64-bit
* GCC* 5.4.0 (for Ubuntu* 16.04) or GCC* 4.8.5 (for CentOS* 7.4)
* CMake* 2.8.12 or higher
* OpenCV* 3.3 or higher 


OpenVINO toolkit is installed to <OPENVINO_DIR>.
By default, for Linux* OS, <OPENVINO_DIR> is /opt/intel/computer_vision_sdk_<version>.

To build the sample on Linux OS, follow the steps:

1. Set up environment variables:
   
   source <OPENVINO_DIR>/bin/setupvars.sh
   

2. Create a sample build directory:
   
   mkdir cva-face-detector-build
   

3. Go to the build directory:
   
   cd cva-face-detector-build
   

4. Configure the build with CMake:
   
   cmake \
     -DCMAKE_BUILD_TYPE=Release \
     -DCMAKE_PREFIX_PATH=<OPENVINO_DIR>/deployment_tools/computer_vision_algorithms \
     <OPENVINO_DIR>/deployment_tools/computer_vision_algorithms/share/cva/FaceDetection/doc/examples/main/
   

4. Build the sample:
   
   cmake --build . --config Release
   

Building the Sample on Windows* OS
-----------------------------------

Requirements:

* OpenVINO™ 2018 R1.1 toolkit or newer
* Pre-built Inference Engine CPU extensions library (See Getting Started Guide
  for details)
* Microsoft Windows* 10
* Microsoft Visual Studio* 2015
* CMake* 2.8.12 or higher
* OpenCV* 3.3 or higher

OpenVINO toolkit is installed to <OPENVINO_DIR>.
For Windows* OS, <OPENVINO_DIR> is C:\Intel\computer_vision_sdk_<version> by default.

To build the sample on Windows* OS, follow the steps:

1. Set up the environment variables:
   
   <OPENVINO_DIR>\bin\setupvars.bat
   

2. Create a sample build directory:
   
   mkdir cva-face-detector-build
   

3. Go to the build directory:
   
   cd cva-face-detector-build
   

4. Configure the build with CMake:
   
   cmake ^
     -G "Visual Studio 14 2015 Win64" ^
     -DCMAKE_PREFIX_PATH=<OPENVINO_DIR>\deployment_tools\computer_vision_algorithms ^
     <OPENVINO_DIR>\deployment_tools\computer_vision_algorithms\share\cva\FaceDetection\doc\examples\main
   

4. Build the sample:
   
   cmake --build . --config Release
   

Running the Sample
------------------

If the building was successful, you can run the sample from
the build folder as follows:

	 ./cva_fd_example_main \
	--image=<path_to_image> \
	--model=<OPENVINO_DIR>/deployment_tools/computer_vision_algorithms/share/cva/FaceDetection/models/dlsdk/cnn_fd_004_sq_light_ssd.xml \
	--weights=<OPENVINO_DIR>/deployment_tools/computer_vision_algorithms/share/cva/FaceDetection/models/dlsdk/cnn_fd_004_sq_light_ssd.bin \
	--show-gui=true


As a result, you will see the input image with a green
rectangle pointing the face bounding box.

Legal information
=================

OpenVINO is a trademark of Intel Corporation or its subsidiaries in the U.S.
and/or other countries.

* Other names and brands may be claimed as the property of others.

Copyright © 2018, Intel Corporation. All rights reserved.

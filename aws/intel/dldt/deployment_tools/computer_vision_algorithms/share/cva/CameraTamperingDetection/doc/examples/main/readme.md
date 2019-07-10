# Camera Tampering Detection Algorithm Sample

## General Description

This folder contains a sample that runs Camera Tampering Detector and
identifies the type of tampering on a video.

## Building the Sample on Linux* OS

### Requirements

* OpenVINO&trade; 2018 R1.1 toolkit or newer
* Ubuntu* 16.04 LTS 64-bit or CentOS* 7.4 64-bit
* GCC* 5.4.0 (for Ubuntu* 16.04) or GCC* 4.8.5 (for CentOS* 7.4)
* CMake* 2.8.12 or higher
* OpenCV* 3.3 or higher 

### Building the Sample

OpenVINO toolkit is installed to `<OPENVINO_DIR>`.
By default, for Linux* OS, `<OPENVINO_DIR>` is `/opt/intel/computer_vision_sdk_<version>`.

To build the sample on Linux OS, follow the steps:

1. Set up the environment variables:
   ```sh
   source <OPENVINO_DIR>/bin/setupvars.sh
   ```

2. Create a sample build directory:
   ```sh
   mkdir cva-camera-tampering-detector-build
   ```

3. Go to the build directory:
   ```sh
   cd cva-camera-tampering-detector-build
   ```

4. Configure the build with CMake:
   ```sh
   cmake \
     -DCMAKE_BUILD_TYPE=Release \
     -DCMAKE_PREFIX_PATH=<OPENVINO_DIR>/deployment_tools/computer_vision_algorithms \
     <OPENVINO_DIR>/deployment_tools/computer_vision_algorithms/share/cva/CameraTamperingDetection/doc/examples/main/
   ```

5. Build the sample:
   ```sh
   cmake --build . --config Release
   ```

## Building the Sample on Windows* OS

### Requirements

* OpenVINO&trade; 2018 R1.1 toolkit or newer
* Microsoft Windows* 10
* Microsoft Visual Studio* 2015
* CMake* 2.8.12 or higher
* OpenCV* 3.3 or higher

### Building the Sample

OpenVINO toolkit is installed to `<OPENVINO_DIR>`.
For Windows* OS, `<OPENVINO_DIR>` is `C:\Intel\computer_vision_sdk_<version>` by default.

To build the sample on Windows* OS, follow the steps:

1. Set up the environment variables:
   ```bat
   <OPENVINO_DIR>\bin\setupvars.bat
   ```

2. Create a sample build directory:
   ```bat
   mkdir cva-camera-tampering-detector-build
   ```

3. Go to the build directory:
   ```bat
   cd cva-camera-tampering-detector-build
   ```

4. Configure the build with CMake:
   ```bat
      cmake ^
        -G "Visual Studio 14 2015 Win64" ^
        -DCMAKE_PREFIX_PATH=<OPENVINO_DIR>\deployment_tools\computer_vision_algorithms ^
        <OPENVINO_DIR>\deployment_tools\computer_vision_algorithms\share\cva\CameraTamperingDetection\doc\examples\main
   ```
   **Note**: If you use a different version of Microsoft Visual Studio* IDE, replace the value of the `-G` option to match your version.

5. Build the sample:
   ```bat
   cmake --build . --config Release
   ```

## Running the Sample

If the building was successful, you can run the sample from
the build folder as follows:

```sh
./cva_ctd_example_main <path_to_input video> 
```
If `<path_to_input video>` is not specified, camera device with id 0 is used.

As a result, you will see a type of the tampering on the current video.

# Legal information

OpenVINO is a trademark of Intel Corporation or its subsidiaries in the U.S.
and/or other countries.

\* Other names and brands may be claimed as the property of others.

Copyright &copy; 2018, Intel Corporation. All rights reserved.

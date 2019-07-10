# License Plate Recognition Algorithm Sample

## General Description

This folder contains a sample that runs the License Plate Recognition algorithm
on an image of a Chinese license plate and prints the decoded characters to the
terminal.

## Building the Sample on Linux* OS

### Requirements

* OpenVINO&trade; 2018 R5 toolkit or newer
* Pre-built Inference Engine CPU extensions library (See Getting Started Guide
  for details)
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
   mkdir license-plate-recognition-build
   ```

3. Go to the build directory:
   ```sh
   cd license-plate-recognition-build
   ```

4. Configure the build with CMake:
   ```sh
   cmake \
     -DCMAKE_BUILD_TYPE=Release \
     -DCMAKE_PREFIX_PATH=<OPENVINO_DIR>/deployment_tools/computer_vision_algorithms \
     <OPENVINO_DIR>/deployment_tools/computer_vision_algorithms/share/cva/LicensePlateRecognition/doc/examples/main/
   ```

5. Build the sample:
   ```sh
   cmake --build . --config Release
   ```

## Building the Sample on Windows* OS

### Requirements

* OpenVINO&trade; 2018 R5 toolkit or newer
* Pre-built Inference Engine CPU extensions library (See Getting Started Guide
  for details)
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
   mkdir license-plate-recognition-build
   ```

3. Go to the build directory:
   ```bat
   cd license-plate-recognition-build
   ```

4. Configure the build with CMake:
   ```bat
   cmake ^
     -G "Visual Studio 14 2015 Win64" ^
     -DCMAKE_PREFIX_PATH=<OPENVINO_DIR>\deployment_tools\computer_vision_algorithms ^
     <OPENVINO_DIR>\deployment_tools\computer_vision_algorithms\share\cva\LicensePlateRecognition\doc\examples\main
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
./cva_lpr_example_main \
  --image=<path_to_image> \
  --model=<OPENVINO_DIR>/deployment_tools/computer_vision_algorithms/share/cva/LicensePlateRecognition/models/LPRNet.xml \
  --weights=<OPENVINO_DIR>/deployment_tools/computer_vision_algorithms/share/cva/LicensePlateRecognition/models/LPRNet.bin \
  --dict=<OPENVINO_DIR>/deployment_tools/computer_vision_algorithms/share/cva/LicensePlateRecognition/models/dict
```

As a result, you will see the decoded license plate characters in the terminal.

# Legal information

OpenVINO is a trademark of Intel Corporation or its subsidiaries in the U.S.
and/or other countries.

\* Other names and brands may be claimed as the property of others.

Copyright &copy; 2018, Intel Corporation. All rights reserved.

Person Reidentification Algorithm Sample
========================================

General Description
-------------------

This directory contains samples for the Person Reidentification algorithm. The following
samples are available:

* calc_embd - takes an image as input and prints calculated embedding for a person on the image.
* calc_embd_many - takes a list of images as inputs and prints calculated embedding for a person on each image.

For more information about each sample, refer to the readme.txt files in the
"calc_embd" and "calc_embd_many" directories.

Building a Sample
-------------------

To build any of the samples, use the instructions for your operating system. The instructions use
the following placeholders:

* <OPENVINO_DIR> - installation directory of the OpenVINO™ toolkit
* <CVA_DIR> - path to computer vision algorithms: <OPENVINO_DIR>/deployment_tools/computer_vision_algorithms
* <SAMPLE_NAME> - a name of a sample (the same as the name of its directory)
* <WORK_DIR> - a directory where you want to build a sample

Building a Sample on Linux* OS
--------------------------------

Requirements:

* OpenVINO™ 2018 R3 toolkit or newer
* Ubuntu* 16.04 LTS 64-bit or CentOS* 7.4 64-bit
* GCC* 5.4.0 (for Ubuntu* 16.04) or GCC* 4.8.5 (for CentOS* 7.4)
* CMake* 2.8.12 or higher
* OpenCV* 3.3 or higher 

To build a sample on Linux* OS, follow the steps:

1. Set up the environment variable:
   
   source "<OPENVINO_DIR>/bin/setupvars.sh"
   

2. Go to the directory where you want to build the sample:
   
   cd <WORK_DIR>
   
	
3. Create a build directory for the sample:
   
   mkdir <SAMPLE_NAME>-build
   
	
4. Go to the build directory:
   
   cd <SAMPLE_NAME>-build
   

5. Configure the build with CMake:
   
   cmake -D CMAKE_PREFIX_PATH="<CVA_DIR>" \
	   "<CVA_DIR>/share/cva/PersonReidentification/doc/examples/<SAMPLE_NAME>"
   

4. Build the sample:
   
   cmake --build .
   

The build system will place the built application as cva_reid_example_<SAMPLE_NAME> 
in the specified build directory.

Building a Sample on Windows* OS
----------------------------------

Requirements:

* OpenVINO™ 2018 R3 toolkit or newer
* Microsoft Windows* 10
* Microsoft Visual Studio* 2015
* CMake* 2.8.12 or higher
* OpenCV* 3.3 or higher

Use x64 Native Tools Command Prompt for your version of Microsoft Visual Studio* IDE
for entering the commands.

1. Prepare the environment for using the OpenVINO™ toolkit:
   
   "<OPENVINO_DIR>\bin\setupvars.bat"
   set PATH=<CVA_DIR>\bin;%PATH%
   

2. Go to the directory where you want to build a sample:
   
   cd <WORK_DIR>
   
	
3. Create a build directory for the sample:
   
   mkdir <SAMPLE_NAME>-build
   
	
4. Go to the build directory:
   
   cd <SAMPLE_NAME>-build
   

5. Configure the build with CMake:
   
   cmake -G "Visual Studio 14 2015 Win64" -D CMAKE_PREFIX_PATH="<CVA_DIR>" ^
	   "<CVA_DIR>\share\cva\PersonReidentification\doc\examples\<SAMPLE_NAME>"
   
   If you use a different version of Microsoft Visual Studio* IDE, replace the value of the 
   -G option to match your version.

6. Build the sample:
   
   cmake --build . --config Release
   

The build system will place the built application  as
Release\cva_reid_example_<SAMPLE_NAME>.exe in the specified build directory.

Legal Information
=================

OpenVINO is a trademark of Intel Corporation or its subsidiaries in the U.S.
and/or other countries.

* Other names and brands may be claimed as the property of others.

Copyright © 2018, Intel Corporation. All rights reserved.

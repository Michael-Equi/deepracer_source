------------------------------------------------------------------------
OpenVINO(TM) for Windows*

Components and their licenses:
* Intel(R) Deep Learning Deployment Toolkit
    * Model Optimizer (Apache 2.0): <install_root>/deployment_tools/model_optimizer/*
    * Inference Engine (EULA): <install_root>/deployment_tools/inference_engine/*
        * Inference Engine Headers (Apache 2.0): <install_root>/deployment_tools/inference_engine/include/*
        * Inference Engine Samples (Apache 2.0): <install_root>/deployment_tools/inference_engine/samples/*
        * GNA library (GNA SOFTWARE LICENSE AGREEMENT): <install_root>/deployment_tools/inference_engine/bin/intel64/<Release|Debug>/gna.dll
        * Intel(R) Movidius(TM) Neural Compute SDK (Movidius Default License v1.00):
            <install_root>/deployment_tools/inference_engine/bin/intel64/<Release;Debug>/mvnc/MvNCAPI-ma<version>.mvcmd
    * intel_models (Apache 2.0): <install_root>/deployment_tools/intel_models/*
    * computer_vision_algorithms (ISSL): <install_root>/deployment_tools/computer_vision_algorithms/*
* OpenCV (BSD): <install_root>/opencv/*
    * PVL library for OpenCV (EULA): <install_root>/opencv/<arch>/<platform>/bin/libopencv_pvl<version>*.dll
* OpenVX* (EULA): <install_root>/openvx/*

------------------------------------------------------------------------
OpenVINO(TM) for Linux*

Components and their licenses:
* Intel(R) Deep Learning Deployment Toolkit
    * Model Optimizer (Apache 2.0): <install_root>/deployment_tools/model_optimizer/*
    * Inference Engine (EULA): <install_root>/deployment_tools/inference_engine/*
        * Inference Engine Headers (Apache 2.0): <install_root>/deployment_tools/inference_engine/include/*
        * Inference Engine Samples (Apache 2.0): <install_root>/deployment_tools/inference_engine/samples/*
        * GNA library (GNA SOFTWARE LICENSE AGREEMENT): <install_root>/deployment_tools/inference_engine/external/gna/lib/<libgna_api.so;libgna_kernel.so>
        * Intel(R) Movidius(TM) Neural Compute SDK (Movidius Default License v1.00):
            <install_root>/deployment_tools/inference_engine/lib/<centos_7.3;centos_7.4;ubuntu_16.04>/intel64/mvnc/MvNCAPI-ma<version>.mvcmd
    * intel_models (Apache 2.0): <install_root>/deployment_tools/intel_models/*
    * computer_vision_algorithms (ISSL): <install_root>/deployment_tools/computer_vision_algorithms/*
* OpenCV (BSD): <install_root>/opencv/*
    * PVL library for OpenCV (EULA): <install_root>/opencv/lib/libopencv_pvl.so.<version>
* OpenVX* (EULA): <install_root>/openvx/*
* Intel(R) Graphics Compute Runtime for OpenCL(TM) (MIT): <install_root>/install_dependencies/*
    intel-opencl_2018ww15-010713_amd64.deb - driver for Ubuntu*
    intel-opencl-2018ww15-010713.x86_64-igdrcl.rpm - driver for CentOS*
* Intel(R) Media SDK for CV (MIT): <install_root>/../mediasdk/*
    * Intel(R) Media Driver for VAAPI (MIT and BSD)

------------------------------------------------------------------------
OpenVINO(TM) for Linux* with FPGA support

Components and their licenses:
* Intel(R) FPGA Deep Learning Acceleration Suite (Intel OBL FPGA SDK 17.0):
    * <install_root>/a10_devkit_bitstreams/*
    * <install_root>/rush_creek_bitstreams/*
* Intel(R) FPGA SDK for OpenCL(TM) software technology (Intel OBL FPGA SDK 17.1): /opt/altera/aocl-pro-rte/*
* Intel(R) Deep Learning Deployment Toolkit
    * Model Optimizer (Apache 2.0): <install_root>/deployment_tools/model_optimizer/*
    * Inference Engine (EULA): <install_root>/deployment_tools/inference_engine/*
        * Inference Engine Headers (Apache 2.0): <install_root>/deployment_tools/inference_engine/include/*
        * Inference Engine Samples (Apache 2.0): <install_root>/deployment_tools/inference_engine/samples/*
        * GNA library (GNA SOFTWARE LICENSE AGREEMENT): <install_root>/deployment_tools/inference_engine/external/gna/lib/<libgna_api.so;libgna_kernel.so>
        * Intel(R) Movidius(TM) Neural Compute SDK (Movidius Default License v1.00):
            <install_root>/deployment_tools/inference_engine/lib/<centos_7.3;centos_7.4;ubuntu_16.04>/intel64/mvnc/MvNCAPI-ma<version>.mvcmd
    * intel_models (Apache 2.0): <install_root>/deployment_tools/intel_models/*
    * computer_vision_algorithms (ISSL): <install_root>/deployment_tools/computer_vision_algorithms/*
* OpenCV (BSD): <install_root>/opencv/*
    * PVL library for OpenCV (EULA): <install_root>/opencv/lib/libopencv_pvl.so.<version>
* OpenVX* (EULA): <install_root>/openvx/*
* Intel(R) Graphics Compute Runtime for OpenCL(TM) (MIT): <install_root>/install_dependencies/*
    intel-opencl_2018ww15-010713_amd64.deb - driver for Ubuntu*
    intel-opencl-2018ww15-010713.x86_64-igdrcl.rpm - driver for CentOS*
* Intel(R) Media SDK for CV (MIT): <install_root>/../mediasdk/*
    * Intel(R) Media Driver for VAAPI (MIT and BSD)

------------------------------------------------------------------------
Licenses:
 * EULA: End User License Agreement for the Intel(R) Software Development Products (Version May 2018) <install_root>/licensing/EULA.rtf or EULA.txt
 * ISSL: Intel Simplified Software License <install_root>/licensing/deployment_tools/ISSL.txt
 * Apache 2.0 <install_root>/licensing/deployment_tools/Apache_license.txt
 * BSD: License Agreement For Open Source Computer Vision Library (3-clause BSD License) <install_root>/licensing/opencv/BSD_license.txt
 * Movidius Default License v1.00 <install_root>/licensing/deployment_tools/Movidius_license.txt
 * Intel(R) FPGA SDK for OpenCL(TM) Version 17.0 License <install_root>/licensing/deployment_tools/Intel(R) FPGA SDK for OpenCL(TM) Version 17.0 License.txt
 * Intel(R) FPGA SDK for OpenCL(TM) Version 17.1 License <install_root>/licensing/deployment_tools/Intel(R) FPGA SDK for OpenCL(TM) Version 17.1 License.txt
 * MIT: The MIT License <install_root>/licensing/install_dependencies/MIT_license.txt
 * GNA SOFTWARE LICENSE AGREEMENT <install_root>/licensing/deployment_tools/GNA SOFTWARE LICENSE AGREEMENT.txt

------------------------------------------------------------------------
Third party programs:
* Intel(R) Deep Learning Deployment Toolkit: <install_root>/licensing/deployment_tools/third-party-programs.txt
* OpenCV: <install_root>/licensing/opencv/third-party-programs.txt
    * <install_root>/opencv/ffmpeg-download.ps1
        FFMPEG wrappers for Windows are not supplied with the distribution.
        If you need to read and write video files on Windows via FFMPEG, please, download the following files (for 64-bit and 32-bit Windows, respectively), put them into the same directory as OpenCV DLLs and rename to opencv_ffmpeg341_64.dll and opencv_ffmpeg341.dll. There is no need to recompile OpenCV.
        https://github.com/opencv/opencv_3rdparty/blob/ffmpeg/master_20180220/ffmpeg/opencv_ffmpeg_64.dll
        https://github.com/opencv/opencv_3rdparty/blob/ffmpeg/master_20180220/ffmpeg/opencv_ffmpeg.dll
        Note, that these wrappers are subjects to LGPL license. The full source code is available at the same repository at github:
        https://github.com/opencv/opencv_3rdparty/tree/ffmpeg/master_20180220_src
* OpenVX*: <install_root>/licensing/openvx/third-party-programs.txt

------------------------------------------------------------------------
Redistributable content:
* Intel(R) Deep Learning Deployment Toolkit: <install_root>/licensing/deployment_tools/redist.txt
* OpenCV: <install_root>/licensing/opencv/redist.txt
* OpenVX*: <install_root>/licensing/openvx/redist.txt
* install_dependencies: <install_root>/licensing/install_dependencies/redist.txt


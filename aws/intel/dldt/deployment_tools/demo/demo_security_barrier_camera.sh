#!/bin/bash

# Copyright (c) 2018 Intel Corporation
# 
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
# 
#       http://www.apache.org/licenses/LICENSE-2.0
# 
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

usage() {
    echo "Security barrier camera demo that showcases three models coming with the product"
    echo "-d name     specify the target device to infer on; CPU, GPU, FPGA or MYRIAD are acceptable. Sample will look for a suitable plugin for device specified"
    echo "-help            print help message"
    exit 1
}

error() {
    local code="${3:-1}"
    if [[ -n "$2" ]];then
        echo "Error on or near line $1: $2; exiting with status ${code}"
    else
        echo "Error on or near line $1; exiting with status ${code}"
    fi
    exit "${code}" 
}
trap 'error ${LINENO}' ERR

target="CPU"

# parse command line options
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -h | -help | --help)
    usage
    ;;
    -d)
    target="$2"
    echo target = "${target}"
    shift
    ;;
    -sample-options)
    sampleoptions="$2 $3 $4 $5 $6"
    echo sample-options = "${sampleoptions}"
    shift
    ;;
    *)
    # unknown option
    ;;
esac
shift
done

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

target_image_path="$ROOT_DIR/car_1.bmp"

if [ "$target" = "MYRIAD" ]; then
    # MYRIAD supports networks with FP16 format only
    target_precision="FP16"
else
    target_precision="FP32"
fi
printf "target_precision = ${target_precision}\n"

run_again="Then run the script again\n\n"
dashes="\n\n###################################################\n\n"

if [[ -f /etc/centos-release ]]; then
    DISTRO="centos"
elif [[ -f /etc/lsb-release ]]; then
    DISTRO="ubuntu"
fi

if [[ $DISTRO == "centos" ]]; then
    sudo -E yum install -y centos-release-scl epel-release
    sudo -E yum install -y gcc gcc-c++ make glibc-static glibc-devel libstdc++-static libstdc++-devel libstdc++ libgcc \
                           glibc-static.i686 glibc-devel.i686 libstdc++-static.i686 libstdc++.i686 libgcc.i686 cmake

    sudo -E rpm -Uvh --force http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-1.el7.nux.noarch.rpm || true
    sudo -E yum install -y epel-release
    sudo -E yum install -y cmake ffmpeg gstreamer1 gstreamer1-plugins-base libusbx-devel
elif [[ $DISTRO == "ubuntu" ]]; then
    printf "Run sudo -E apt -y install build-essential cmake libcairo2-dev libpango1.0-dev libglib2.0-dev libgtk2.0-dev libswscale-dev libavcodec-dev libavformat-dev libgstreamer1.0-0 gstreamer1.0-plugins-base\n"
    sudo -E apt update
    sudo -E apt -y install build-essential cmake libcairo2-dev libpango1.0-dev libglib2.0-dev libgtk2.0-dev libswscale-dev libavcodec-dev libavformat-dev libgstreamer1.0-0 gstreamer1.0-plugins-base
    
    system_ver=`cat /etc/lsb-release | grep -i "DISTRIB_RELEASE" | cut -d "=" -f2`
    if [ $system_ver = "18.04" ]; then
        sudo -E apt-get install -y libpng-dev
    else
        sudo -E apt-get install -y libpng12-dev
    fi
fi

# Step 4. Build samples
printf "${dashes}"
printf "Build Inference Engine samples\n\n"

if [[ -z "${INTEL_CVSDK_DIR}" ]]; then
    printf "\n\nINTEL_CVSDK_DIR environment variable is not set. Trying to run ./setupvars.sh to set it. \n"
    
    if [ -e "$ROOT_DIR/../inference_engine/bin/setvars.sh" ]; then # for Intel Deep Learning Deployment Toolkit package
        setupvars_path="$ROOT_DIR/../inference_engine/bin/setvars.sh"
    elif [ -e "$ROOT_DIR/../../bin/setupvars.sh" ]; then # for Intel CV SDK package
        setupvars_path="$ROOT_DIR/../../bin/setupvars.sh"
    elif [ -e "$ROOT_DIR/../../setupvars.sh" ]; then # for GO SDK package
        setupvars_path="$ROOT_DIR/../../setupvars.sh"
    else
        printf "Error: setupvars.sh is not found\n"
    fi 
    if ! source $setupvars_path ; then
        printf "Unable to run ./setupvars.sh. Please check its presence. ${run_again}"
        exit 1
    fi
fi

samples_path="${INTEL_CVSDK_DIR}/deployment_tools/inference_engine/samples"

if ! command -v cmake &>/dev/null; then
    printf "\n\nCMAKE is not installed. It is required to build Inference Engine samples. Please install it. ${run_again}"
    exit 1
fi

build_dir="$HOME/inference_engine_samples"
if [ ! -e "$build_dir/intel64/Release/security_barrier_camera_demo" ]; then
    mkdir -p $build_dir
    cd $build_dir
    cmake -DCMAKE_BUILD_TYPE=Release $samples_path
    make -j8 security_barrier_camera_demo
else
    printf "\n\nTarget folder ${build_dir} already exists. Skipping samples building."
    printf "If you want to rebuild samples, remove the entire ${build_dir} folder. ${run_again}"
fi

# Step 5. Run samples
printf "${dashes}"
printf "Run Inference Engine security_barrier_camera demo\n\n"

binaries_dir="${build_dir}/intel64/Release"
cd $binaries_dir

printf "Run ./security_barrier_camera_demo -d $target -d_va $target -d_lpr $target -i $target_image_path -m $INTEL_CVSDK_DIR/deployment_tools/intel_models/vehicle-license-plate-detection-barrier-0106/$target_precision/vehicle-license-plate-detection-barrier-0106.xml -m_va $INTEL_CVSDK_DIR/deployment_tools/intel_models/vehicle-attributes-recognition-barrier-0039/$target_precision/vehicle-attributes-recognition-barrier-0039.xml -m_lpr $INTEL_CVSDK_DIR/deployment_tools/intel_models/license-plate-recognition-barrier-0001/$target_precision/license-plate-recognition-barrier-0001.xml ${sampleoptions}\n\n"

./security_barrier_camera_demo -d $target -d_va $target -d_lpr $target -i $target_image_path -m "$INTEL_CVSDK_DIR/deployment_tools/intel_models/vehicle-license-plate-detection-barrier-0106/$target_precision/vehicle-license-plate-detection-barrier-0106.xml" -m_va "$INTEL_CVSDK_DIR/deployment_tools/intel_models/vehicle-attributes-recognition-barrier-0039/$target_precision/vehicle-attributes-recognition-barrier-0039.xml" -m_lpr "$INTEL_CVSDK_DIR/deployment_tools/intel_models/license-plate-recognition-barrier-0001/$target_precision/license-plate-recognition-barrier-0001.xml" ${sampleoptions}

printf "${dashes}"
printf "Demo completed successfully.\n\n"

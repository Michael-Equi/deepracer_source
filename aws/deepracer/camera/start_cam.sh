#!/bin/bash

echo "Installing Camera FW and booting up camera..."
cd /opt/aws/deepracer/camera/installed/bin
sudo ./mxcam boot /opt/aws/deepracer/camera/fw/gc6500_ddrboot_no_audio_fw.img /opt/aws/deepracer/camera/fw/app_2ch.json /opt/aws/deepracer/camera/fw/sensor_ov4689_intelAI_le.bin

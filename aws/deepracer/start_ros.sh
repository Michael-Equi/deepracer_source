#!/usr/bin/env bash

source /opt/ros/kinetic/setup.bash
source /opt/aws/deepracer/setup.bash
source /opt/aws/intel/dldt/bin/setupvars.sh
export PYTHONPATH=/opt/aws/pyudev/pyudev-0.21.0/src:$PYTHONPATH
roslaunch deepracer_launcher deepracer.launch

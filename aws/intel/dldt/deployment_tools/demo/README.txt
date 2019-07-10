=====================================================
Demo Scripts for Model Optimizer and Inference Engine
=====================================================

The demo scripts illustrate Intel(R) Deep Learning Deployment Toolkit usage to convert and optimize pre-trained models and perform inference.

Setting Up Demos
================
If you are behind a proxy, set the following environment variables in the console session:

On Linux* OS:
export http_proxy=http://<proxyHost>:<proxyPort>
export https_proxy=https://<proxyHost>:<proxyPort>

On Windows* OS:
set http_proxy=http://<proxyHost>:<proxyPort>
set https_proxy=https://<proxyHost>:<proxyPort>

Running Demos
=============

The "demo" folder contains two scripts:

1. Classification demo using public SqueezeNet topology (demo_squeezenet_download_convert_run.sh|bat)

2. Security barrier camera demo that showcases three models coming with the product (demo_squeezenet_download_convert_run.sh|bat)

To run the demos, run demo_squeezenet_download_convert_run.sh or demo_security_barrier_camera.sh (*.bat on Windows) scripts from the console without parameters, for example:

./demo_squeezenet_download_convert_run.sh

The script allows to specify the target device to infer on using -d <CPU|GPU|MYRIAD|FPGA> option.

Classification Demo Using SqueezeNet
====================================

The demo illustrates the general workflow of using the Intel(R) Deep Learning Deployment Toolkit and performs the following:

  - Downloads a public SqueezeNet model using the model_downloader\downloader.py script
  - Installs all prerequisites required for running the Model Optimizer using the scripts from the "model_optimizer\install_prerequisites" folder
  - Converts SqueezeNet to an IR using the Model Optimizer (model_optimizer\mo.py)
  - Builds the Inference Engine classification_sample (inference_engine\samples\classification_sample)
  - Runs the sample with the car.png picture located in the demo folder

The sample application prints top-10 inference results for the picture.
 
For more information about the Inference Engine classification sample, refer to the documentation available in the sample folder.


Security Barrier Camera Demo
============================

The demo illustrates using the Inference Engine with pre-trained models to perform vehicle detection, vehicle attributes and license-plate recognition tasks. 
As the sample produces visual output, it should be run in GUI mode.  

The demo script does the following:

- Builds the Inference Engine security barrier camera sample (inference_engine\samples\security_barrier_camera_sample)
- Runs the sample with the car_1.bmp located in the demo folder

The sample application displays the resulting frame with detections rendered as bounding boxes and text.

For more information about the Inference Engine security barrier camera sample, refer to the documentation available in the sample folder.
Crossroad Detector Algorithm Sample: main
=========================================

This sample takes an image as an input, detects objects on it using Crossroad Detector,
and prints information about them. It can also optionally produce an image showing
the detected objects on the original image.

Running the Sample 
------------------

You must build the sample before running it. For the information on how to build the sample, 
go back to the "examples" directory and refer to the readme.txt file.  

If the building was successful, you can run the sample from the build folder as follows:

    ./cva_crd_example_main [options] <IMAGE>

<IMAGE> is a path to an image file in one of the common formats.

Available options:

* -h - Output a help message and exit.

* --impl=(CPU|GPUFP16|GPUFP32) - Use the specified implementation of the detector. By default,
  the CPU implementation is used.

* --show - Save an image showing the detected objects on the original image
  to result.jpeg in the working directory.

Barrier Detector Algorithm Sample: main
=======================================

This example takes an image as an input, detects objects on it using Barrier Detector,
and prints information about them. It can also optionally produce an image showing
the detected objects on the original image.

Running the Sample
------------------

You must build the sample before running it. For the information on how to build the sample, 
go back to the "examples" directory and refer to the readme.txt file.

If the building was successful, you can run the sample from the build folder as follows:

	./cva_barrier_example_main [options] <IMAGE>

<IMAGE> is a path to an image file in one of the common formats.

Available options:

* -h - Output a help message and exit.

* --impl=(cpu|gpu) - Use the specified implementation of the detector. By default,
  the CPU implementation is used.

* --prec=(FP32|FP16) - Use the specified precision of the model. Ignored if the CPU
  implementation is selected. The default is FP32.

* --show - Save an image showing the detected objects on the original image
  to result.jpeg in the working directory. Only objects detected with at least 50%
  confidence are shown.

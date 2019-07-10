Emotion Recognition Algorithm Sample: recognize
===============================================

This sample takes an image as input, recognizes an emotion expressed by a person on the image, and outputs
the most probable emotion.

Running the Sample
------------------ 

You must build the sample before running it. For the information on how to build the sample, 
go back to the "examples" directory and refer to the readme.txt file.  

If the building was successful, you can run the sample from the build folder as follows:

	./cva_er_example_recognize [options] <IMAGE>

<IMAGE> is a path to an image file in one of the common formats.

Available options:

* -h - Output a help message and exit.

* --impl=(CPU|GPUFP32|GPUFP16) - Use the specified implementation of the recognizer. By default,
  the CPU implementation is used.

As a result, you will see the most probable emotion expressed by a person on the input image.		

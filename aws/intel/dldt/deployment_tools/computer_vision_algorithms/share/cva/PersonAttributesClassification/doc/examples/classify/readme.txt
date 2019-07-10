Person Attributes Classification Algorithm Sample: classify
===========================================================

This sample takes an image of a person as an input, classifies it using Person Attributes
Classification, and prints whether the person was estimated to have each of the supported
attribute.

Running the Sample 
------------------

You must build the sample before running it. For the information on how to build the sample, 
go back to the "examples" directory and refer to the readme.txt file.

If the building was successful, you can run the sample from the build folder as follows:

    ./cva_pac_example_classify [options] <IMAGE>

<IMAGE> is a path to an image file in one of the common formats.

Available options:

* -h - Output a help message and exit.

* --impl=(CPU|GPUFP16|GPUFP32) - Use the specified implementation of the detector. By default,
  the CPU implementation is used.

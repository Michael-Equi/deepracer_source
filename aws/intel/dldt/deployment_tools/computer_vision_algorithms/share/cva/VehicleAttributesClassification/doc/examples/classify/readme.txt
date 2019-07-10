Vehicle Attributes Classification Algorithm Sample: classify
============================================================

This example takes an image of a vehicle as input, classifies it using Vehicle
Attributes Classification and outputs the estimated probabilities of the vehicle
being of each supported type and color.

Running the Sample
------------------

You must build the sample before running it. For the information on how to build the sample,
go back to the "examples" directory and refer to the readme.txt file.

If the building was successful, you can run the sample from the build folder as follows:

    ./cva_vc_example_classify [options] <IMAGE>

<IMAGE> is a path to an image file in one of the common formats.

Available options:

* -h - Output a help message and exit.

* --impl=(CPU|GPUFP16|GPUFP32)
    Use the specified implementation of the classifier. By default,
    the CPU implementation is used.

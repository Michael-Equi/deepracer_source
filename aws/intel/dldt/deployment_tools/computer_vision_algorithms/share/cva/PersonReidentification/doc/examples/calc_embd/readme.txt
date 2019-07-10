Person Reidentification Algorithm Sample: calc_embd
===================================================

This sample takes an image as input, calculates embedding for a person on the image, 
and outputs the embedding.

Running the Sample
------------------ 

You must build the sample before running it. For the information on how to build the sample, 
go up to the "examples" directory and refer to the readme.txt file there.  

If the building was successful, you can run the sample from the build folder as follows:

	./cva_reid_example_calc_embd [options] <IMAGE>


<IMAGE> is a path to an image file in one of the common formats.

Available options:

* -h - Outputs a help message and exits.

* --impl=(CPU|GPUFP32|GPUFP16) - Uses the specified implementation. By default,
        the CPU implementation is used.

As a result, you will see the embedding calculated for the input image.

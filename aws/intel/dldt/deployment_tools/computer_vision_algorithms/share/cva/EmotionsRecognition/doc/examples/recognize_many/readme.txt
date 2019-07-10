Emotion Recognition Algorithm Sample: recognize_many
====================================================

This sample takes a list of images, recognize emotion on each of these images,
and outputs the most probable emotion for each image. It uses batch processing
to process several images at once.

Running the Sample 
------------------

You must build the sample before running it. For the information on how to build the sample, 
go back to the "examples" directory and refer to the readme.txt file.  

If the building was successful, you can run the sample from the build folder as follows:

	./cva_er_example_recognize_many [options] <IMAGE_LIST>

<IMAGE_LIST> is a path to a text file containing a list of paths to image
files, one per line. The paths are interpreted relative to the current working
directory.

Available options:

* -h - Output a help message and exit.

* --batch_size=N - Process up to N images at once. By default, up to 4 images
        are processed.

* --impl=(CPU|GPUFP32|GPUFP16) - Use the specified implementation of the recognizer. By default,
  the CPU implementation is used.
		
As a result, you will see the most probable emotion expressed by a person on each input image.

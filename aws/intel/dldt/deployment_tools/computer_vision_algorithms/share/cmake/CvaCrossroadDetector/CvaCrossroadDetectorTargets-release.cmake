#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Cva::CrossroadDetector::crd" for configuration "Release"
set_property(TARGET Cva::CrossroadDetector::crd APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Cva::CrossroadDetector::crd PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "IE::inference_engine;opencv_dnn;opencv_highgui;opencv_core;opencv_videoio;opencv_flann;opencv_gapi;opencv_calib3d;opencv_stitching;opencv_imgcodecs;opencv_photo;opencv_features2d;opencv_ml;opencv_imgproc;opencv_video;opencv_objdetect;opencv_pvl"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libcva_crd.so.4.0.1"
  IMPORTED_SONAME_RELEASE "libcva_crd.so.4.0"
  )

list(APPEND _IMPORT_CHECK_TARGETS Cva::CrossroadDetector::crd )
list(APPEND _IMPORT_CHECK_FILES_FOR_Cva::CrossroadDetector::crd "${_IMPORT_PREFIX}/lib/libcva_crd.so.4.0.1" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)

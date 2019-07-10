#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Cva::AlgoCommon::ac" for configuration "Release"
set_property(TARGET Cva::AlgoCommon::ac APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Cva::AlgoCommon::ac PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libcva_ac.so.4.0.1"
  IMPORTED_SONAME_RELEASE "libcva_ac.so.4.0"
  )

list(APPEND _IMPORT_CHECK_TARGETS Cva::AlgoCommon::ac )
list(APPEND _IMPORT_CHECK_FILES_FOR_Cva::AlgoCommon::ac "${_IMPORT_PREFIX}/lib/libcva_ac.so.4.0.1" )

# Import target "Cva::AlgoCommon::ac_ocv" for configuration "Release"
set_property(TARGET Cva::AlgoCommon::ac_ocv APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Cva::AlgoCommon::ac_ocv PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libcva_ac_ocv.so.4.0.1"
  IMPORTED_SONAME_RELEASE "libcva_ac_ocv.so.4.0"
  )

list(APPEND _IMPORT_CHECK_TARGETS Cva::AlgoCommon::ac_ocv )
list(APPEND _IMPORT_CHECK_FILES_FOR_Cva::AlgoCommon::ac_ocv "${_IMPORT_PREFIX}/lib/libcva_ac_ocv.so.4.0.1" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)

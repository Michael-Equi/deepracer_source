#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Cva::PersonAttributesClassification::pac" for configuration "Release"
set_property(TARGET Cva::PersonAttributesClassification::pac APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Cva::PersonAttributesClassification::pac PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "IE::inference_engine"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libcva_pac.so.4.0.1"
  IMPORTED_SONAME_RELEASE "libcva_pac.so.4.0"
  )

list(APPEND _IMPORT_CHECK_TARGETS Cva::PersonAttributesClassification::pac )
list(APPEND _IMPORT_CHECK_FILES_FOR_Cva::PersonAttributesClassification::pac "${_IMPORT_PREFIX}/lib/libcva_pac.so.4.0.1" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)

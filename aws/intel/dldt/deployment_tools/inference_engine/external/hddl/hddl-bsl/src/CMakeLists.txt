# Copyright (C) 2018 Intel Corporation
#
# SPDX-License-Identifier: Apache-2.0

aux_source_directory(. SRC_LIST)

if(MSVC)
function(SET_TARGET_OUTPUT_DIRS target dir_archive dir_library dir_runtime)
  if(${CMAKE_VERSION} VERSION_GREATER "3.0.1")
    set_target_properties(
      ${target}
      PROPERTIES
      ARCHIVE_OUTPUT_DIRECTORY                "${CMAKE_BINARY_DIR}/output/${dir_archive}"
      ARCHIVE_OUTPUT_DIRECTORY_DEBUG          "${CMAKE_BINARY_DIR}/output/${dir_archive}"
      ARCHIVE_OUTPUT_DIRECTORY_RELEASE        "${CMAKE_BINARY_DIR}/output/${dir_archive}"
      ARCHIVE_OUTPUT_DIRECTORY_MINSIZEREL     "${CMAKE_BINARY_DIR}/output/${dir_archive}"
      ARCHIVE_OUTPUT_DIRECTORY_RELWITHDEBINFO "${CMAKE_BINARY_DIR}/output/${dir_archive}"
      LIBRARY_OUTPUT_DIRECTORY                "${CMAKE_BINARY_DIR}/output/${dir_library}"
      LIBRARY_OUTPUT_DIRECTORY_DEBUG          "${CMAKE_BINARY_DIR}/output/${dir_library}"
      LIBRARY_OUTPUT_DIRECTORY_RELEASE        "${CMAKE_BINARY_DIR}/output/${dir_library}"
      LIBRARY_OUTPUT_DIRECTORY_MINSIZEREL     "${CMAKE_BINARY_DIR}/output/${dir_library}"
      LIBRARY_OUTPUT_DIRECTORY_RELWITHDEBINFO "${CMAKE_BINARY_DIR}/output/${dir_library}"
      RUNTIME_OUTPUT_DIRECTORY                "${CMAKE_BINARY_DIR}/output/${dir_runtime}"
      RUNTIME_OUTPUT_DIRECTORY_DEBUG          "${CMAKE_BINARY_DIR}/output/${dir_runtime}"
      RUNTIME_OUTPUT_DIRECTORY_RELEASE        "${CMAKE_BINARY_DIR}/output/${dir_runtime}"
      RUNTIME_OUTPUT_DIRECTORY_MINSIZEREL     "${CMAKE_BINARY_DIR}/output/${dir_runtime}"
      RUNTIME_OUTPUT_DIRECTORY_RELWITHDEBINFO "${CMAKE_BINARY_DIR}/output/${dir_runtime}"
    )
  endif()
endfunction()
endif()

if(MSVC)
    if(IS_BSL_EXTERNAL)
      include_directories(${CMAKE_CURRENT_SOURCE_DIR}/..)
      include_directories(${CMAKE_CURRENT_BINARY_DIR}/../json-c/include)
      #include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../thirdpart/wingetopt/src)
    else()
      link_directories(${CMAKE_BINARY_DIR}/getopt9/lib)
      include_directories(${CMAKE_SOURCE_DIR})
      include_directories(${CMAKE_BINARY_DIR}/json-c/include)
      #include_directories(${CMAKE_SOURCE_DIR}/thirdpart/wingetopt/src)
    endif()
    list(REMOVE_ITEM SRC_LIST ./i2cbusses.c)
    list(REMOVE_ITEM SRC_LIST ./hidapi_linux.c)
    list(REMOVE_ITEM SRC_LIST ./smbus_linux.c)
    list(REMOVE_ITEM SRC_LIST ./thread_linux.c)
    list(REMOVE_ITEM SRC_LIST ./osl_linux.c)
    message(STATUS "${SRC_LIST}")
    list(REMOVE_ITEM SRC_LIST ./bsl_reset.c)
    list(REMOVE_ITEM SRC_LIST ./smb_address_tool.cpp)
if (EXISTS "${CMAKE_BINARY_DIR}/version.rc")
    add_library(bsl SHARED ${SRC_LIST} ${CMAKE_BINARY_DIR}/version.rc)
    add_executable(bsl_reset ./bsl_reset.c ${CMAKE_BINARY_DIR}/version.rc)
    add_executable(win_address_checktool ./smb_address_tool.cpp ${CMAKE_BINARY_DIR}/version.rc)
else()
    add_library(bsl SHARED ${SRC_LIST})
    add_executable(bsl_reset ./bsl_reset.c)
    add_executable(win_address_checktool ./smb_address_tool.cpp)
endif()
    add_dependencies(bsl json-c)
    add_dependencies(bsl_reset  bsl)
    target_link_libraries(bsl_reset bsl )
    target_link_libraries(bsl  json-c)
    set_target_output_dirs(bsl_reset   lib lib bin)
    set_target_output_dirs(bsl   lib lib bin)
    set_target_output_dirs(win_address_checktool  lib lib bin)
else()
    list(REMOVE_ITEM SRC_LIST ./hidapi_win.c)
    list(REMOVE_ITEM SRC_LIST ./smbus_win.c)
    list(REMOVE_ITEM SRC_LIST ./thread_win.c)
    list(REMOVE_ITEM SRC_LIST ./osl_win.c)
    list(REMOVE_ITEM SRC_LIST ./smb_address_tool.cpp)
if (EXISTS "${CMAKE_BINARY_DIR}/version.rc")
    add_library(bsl SHARED ${SRC_LIST} ${CMAKE_BINARY_DIR}/version.rc)
else()
    add_library(bsl SHARED ${SRC_LIST})
endif()
    add_executable(bsl_reset ${SRC_LIST} ${UTILS_LIST})
    target_link_libraries(bsl_reset json-c pthread udev)
    target_link_libraries(bsl udev)
endif()
target_link_libraries(bsl json-c)
set_target_properties(bsl PROPERTIES VERSION 0)

if(MSVC)
    install(TARGETS win_address_checktool DESTINATION bin  COMPONENT binaries)
endif()

install(TARGETS bsl_reset DESTINATION bin  COMPONENT binaries)
install(TARGETS bsl DESTINATION lib COMPONENT libraries)

file(GLOB FILES_TO_DEPLOY "../include/*")
install( FILES ${FILES_TO_DEPLOY} DESTINATION include COMPONENT headers)

option(INSTALL_USB_RULES "enable installing usb rules to system directory" OFF)
option(USBRULES_GENERATOR_COPY "enable copying the script generating rules to the install directory" OFF)

if(UNIX)
  if(INSTALL_USB_RULES)
      execute_process (
        COMMAND bash ${CMAKE_CURRENT_SOURCE_DIR}/generate_udev_rules.sh ${CMAKE_BINARY_DIR}/98-hddlbsl.rules
      )
      install(CODE "execute_process(COMMAND cp ${CMAKE_BINARY_DIR}/98-hddlbsl.rules /etc/udev/rules.d/98-hddlbsl.rules)")
      install(CODE "MESSAGE(\"-- ${CMAKE_BINARY_DIR}/98-hddlbsl.rules was copied to /etc/udev/rules.d/98-hddlbsl.rules\")")

      install(CODE "execute_process(COMMAND udevadm control --reload-rules)")
      install(CODE "execute_process(COMMAND udevadm trigger)")
      install(CODE "execute_process(COMMAND ldconfig)")
      install(CODE "MESSAGE(\"-- udev rules were reloaded\")")
  endif()

  if(USBRULES_GENERATOR_COPY)
    if (DEFINED DESTDIR)
      install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/generate_udev_rules.sh DESTINATION ${DESTDIR} COMPONENT usbrules_generator)
    else()
      install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/generate_udev_rules.sh DESTINATION . COMPONENT usbrules_generator)
    endif()
  endif()
endif()

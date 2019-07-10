// Copyright (C) 2018 Intel Corporation
//
// SPDX-License-Identifier: Apache-2.0

#pragma once

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define UNUSED(x) (void)(x)

#ifdef WIN32
#define MAX_PATH_LENGTH _MAX_PATH
#else
#define MAX_PATH_LENGTH PATH_MAX
#endif

#ifndef WIN32
#define errno_t int
#endif

errno_t bsl_strncpy(char* _Destination, size_t _SizeInBytes, char const* _Source, size_t _MaxCount);

errno_t bsl_fopen(FILE** _Stream, char const* _FileName, char const* _Mode);
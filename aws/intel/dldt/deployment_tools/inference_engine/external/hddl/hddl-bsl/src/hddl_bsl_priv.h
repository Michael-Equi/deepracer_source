// Copyright (C) 2018 Intel Corporation
//
// SPDX-License-Identifier: Apache-2.0

#ifndef __HDDL_BSL_PRIV_H__
#define __HDDL_BSL_PRIV_H__

#include <assert.h>
#include <json-c/json.h>
#include <stdio.h>
#include <sys/stat.h>
#include <stdbool.h>

#include "hddl-bsl.h"
#include "osl.h"

#if defined(WIN32)

#include <process.h>
#include <stdint.h>
#include <windows.h>
typedef CRITICAL_SECTION bsl_mutex_t;
#define MAX_DEVICE_PATH 256

#else

#include <linux/limits.h>
#include <pthread.h>
typedef pthread_mutex_t bsl_mutex_t;
#define MAX_DEVICE_PATH PATH_MAX

#endif

#ifdef DEBUG
#include <stdio.h>
#define LOG(...) printf(__VA_ARGS__)
#else
#define LOG(...) \
  do {           \
  } while (0)
#endif

typedef BSL_STATUS (*device_init_t)();
typedef BSL_STATUS (*device_reset_t)(int);
typedef BSL_STATUS (*device_reset_all_t)();
typedef BSL_STATUS (*device_config_t)(struct json_object* config);
typedef BSL_STATUS (*device_add_t)(int);
typedef BSL_STATUS (*device_scan_t)(int*);
typedef BSL_STATUS (*device_discard_t)(int);

typedef BSL_STATUS (*device_destroy_t)();

typedef struct {
  device_init_t device_init;
  device_reset_t device_reset;
  device_reset_all_t device_reset_all;
  device_config_t device_config;
  device_add_t device_add;
  device_scan_t device_scan;
  device_discard_t device_discard;
  device_destroy_t device_destroy;
} HddlController_t;

void mcu_init(HddlController_t* ctrl);
void ioexpander_init(HddlController_t* ctrl);
void hid_f75114_init(HddlController_t* ctrl);
// void c246_init(HddlController_t* ctrl);

typedef struct {
  BslDeviceType device_type;
  char* buf;
  struct json_object* json_object;
} CFG_HANDLER;

BSL_STATUS cfg_get_path(char* path);
BSL_STATUS cfg_open(const char* file_path, CFG_HANDLER* handler);
BSL_STATUS cfg_close(CFG_HANDLER* handler);
BSL_STATUS cfg_check(CFG_HANDLER* handler);

bool is_valid_device_type(BslDeviceType bsl_device);

#endif

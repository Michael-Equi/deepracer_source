// Copyright (C) 2018 Intel Corporation
//
// SPDX-License-Identifier: Apache-2.0

#include <hddl-bsl.h>
#include <stdio.h>
#include <stdlib.h>

#include "hddl-bsl.h"
#include "hddl_bsl_priv.h"

HddlController_t m_hddl_controller[BSL_DEVICE_TYPE_MAX];
static BslDeviceType m_bsl_device = DEVICE_INVALID_TYPE;

static void bsl_fill_all_callback_functions();
static BSL_STATUS hddl_bsl_try_init_with_config();
static BSL_STATUS bsl_set_and_config_device(BslDeviceType dev_type, struct json_object* config);
static BSL_STATUS bsl_init_by_scan();
static BSL_STATUS bsl_open_cfg(CFG_HANDLER* handler);

static BSL_STATUS hddl_bsl_init();
static BSL_STATUS hddl_bsl_destroy();

#ifndef WIN32
__attribute__((constructor))
#endif
void libbsl_init()
{
  BSL_STATUS status = hddl_bsl_init();
  if (status != BSL_SUCCESS) {
    printf("exit for:\t");
    hddl_get_error_string(status);
  }
}

#ifdef WIN32
typedef void(__cdecl* PF)();
#pragma section(".CRT$XCG", read)
__declspec(allocate(".CRT$XCG")) PF lib_construct[1] = {libbsl_init};
#endif

#ifndef WIN32
__attribute__((destructor))
#endif
void libbsl_destroy()
{
  hddl_bsl_destroy();
}

static BSL_STATUS hddl_bsl_init() {
  bsl_fill_all_callback_functions();

  BSL_STATUS status = hddl_bsl_try_init_with_config();
  if (status == BSL_SUCCESS) {
    printf("Load config SUCCESS\n");
    return status;
  }

  printf("HDDL BSL configure file is not found or load failed, scanning automatically\n");
  status = bsl_init_by_scan();
#if 1
  /* exit if reset device is not found.*/
  if (status == BSL_ERROR_NO_DEVICE_FOUND) {
    printf("Can not find any device(IOexpander or other reset devices) for VPU reset, it may cause by permission issue or you don't install driver correctly.\n");
    printf("If you want to run without reset device, please comment these lines and rebuilt libbsl to replace the one under ${HDDL_INSTALL_DIR}\n");
    printf("Linux: lib/libsl.so.0 and lib/libbsl.so Windows: bin\\bsl.dll\n");
    printf("hddl-bsl source code can be found under ${HDDL_INSTALL_DIR}\n");
    exit(BSL_ERROR_NO_DEVICE_FOUND);
  }
#endif
  return status;
}

void bsl_fill_all_callback_functions() {
  mcu_init(&m_hddl_controller[I2C_MCU]);
  ioexpander_init(&m_hddl_controller[I2C_IOEXPANDER]);
  hid_f75114_init(&m_hddl_controller[HID_F75114]);
  // c246_init(&m_hddl_controller[PCH_C246]);
}

BSL_STATUS hddl_bsl_try_init_with_config() {
  CFG_HANDLER handler;
  BSL_STATUS status = bsl_open_cfg(&handler);
  if (status) {
    goto exit_hddl_bsl_try_init_with_config;
  }

  status = cfg_check(&handler);
  if (status) {
    goto exit_hddl_bsl_try_init_with_config;
  }

  struct json_object* jconfig = json_object_object_get(handler.json_object, "config");
  if (jconfig == NULL) {
    status = BSL_ERROR_INVALID_CFG_FILE;
    goto exit_hddl_bsl_try_init_with_config;
  }

  status = bsl_set_and_config_device(handler.device_type, jconfig);

exit_hddl_bsl_try_init_with_config:
  cfg_close(&handler);
  return status;
}

BSL_STATUS bsl_open_cfg(CFG_HANDLER* handler) {
  char local_path[MAX_PATH_LENGTH];
  memset(local_path, 0, sizeof(local_path));
  memset(handler, 0, sizeof(CFG_HANDLER));

  BSL_STATUS status = cfg_get_path(local_path);
  if (status != BSL_SUCCESS)
    return status;

  return cfg_open((const char*)local_path, handler);
}

BSL_STATUS bsl_set_and_config_device(BslDeviceType dev_type, struct json_object* config) {
  BSL_STATUS status;
  status = hddl_set_device(dev_type);
  if (BSL_SUCCESS != status) {
    return status;
  }

  device_config_t device_config_callback = m_hddl_controller[dev_type].device_config;
  if (device_config_callback == NULL) {
    return BSL_ERROR_CALLBACK_NOT_FOUND;
  }
  status = device_config_callback(config);
  if (BSL_SUCCESS != status) {
    return status;
  }

  device_init_t device_init_callback = m_hddl_controller[dev_type].device_init;
  if (device_init_callback == NULL) {
    return BSL_ERROR_CALLBACK_NOT_FOUND;
  }
  return device_init_callback();
}

BSL_STATUS bsl_init_by_scan() {
  BSL_STATUS status;
  int device_count = 0;

  for (int i = BSL_DEVICE_TYPE_START; i < BSL_DEVICE_TYPE_MAX; i++) {
    status = m_hddl_controller[i].device_scan(&device_count);
    if (status != BSL_SUCCESS) {
      LOG("[%s %d] scan device type %d failed with %d\n", __func__, __LINE__, i, status);
      // hddl_get_error_string(status);
      continue;
    }

    if (device_count > 0) {
      LOG("Found %d devices\n", device_count);
      BslDeviceType dev_type = i;
      hddl_set_device(dev_type);
      status = m_hddl_controller[dev_type].device_init();
      return BSL_SUCCESS;
    }
  }
  LOG("No device found\n");

  return BSL_ERROR_NO_DEVICE_FOUND;
}

static BSL_STATUS hddl_bsl_destroy() {
  BslDeviceType dev_type = hddl_get_device();
  BSL_STATUS status=BSL_SUCCESS;
  if (is_valid_device_type(dev_type)) {
    status = m_hddl_controller[dev_type].device_destroy();
  }
  return status;
}

BSL_STATUS hddl_reset(int device_addr) {
  printf("Reset device: %d\n", device_addr);
  if (!is_valid_device_type(m_bsl_device)) {
    return BSL_ERROR_INVALID_DEVICE_TYPE;
  }

  device_reset_t reset_single_device_callback = m_hddl_controller[m_bsl_device].device_reset;
  if (reset_single_device_callback) {
    return reset_single_device_callback(device_addr);
  }
  return BSL_ERROR_CALLBACK_NOT_FOUND;
}

BSL_STATUS hddl_reset_all() {
  printf("Reset all devices\n");

  if (!is_valid_device_type(m_bsl_device)) {
    return BSL_ERROR_INVALID_DEVICE_TYPE;
  }

  device_reset_all_t reset_all_callback = m_hddl_controller[m_bsl_device].device_reset_all;
  if (reset_all_callback) {
    return reset_all_callback();
  }
  return BSL_ERROR_CALLBACK_NOT_FOUND;
}

BSL_STATUS hddl_discard(int device_addr) {
  if (!is_valid_device_type(m_bsl_device)) {
    return BSL_ERROR_INVALID_DEVICE_TYPE;
  }

  printf("Discard device: %d\n", device_addr);
  device_discard_t device_discard_callback = m_hddl_controller[m_bsl_device].device_discard;
  if (device_discard_callback) {
    return device_discard_callback(device_addr);
  }
  return BSL_ERROR_CALLBACK_NOT_FOUND;
}

BslDeviceType hddl_get_device() {
  return m_bsl_device;
}

BSL_STATUS hddl_set_device(BslDeviceType bsl_device) {
  LOG("hddl_set_device bsl_device=%d\n", bsl_device);
  if (!is_valid_device_type(bsl_device)) {
    return BSL_ERROR_INVALID_DEVICE_TYPE;
  }

  m_bsl_device = bsl_device;
  return BSL_SUCCESS;
}

bool is_valid_device_type(BslDeviceType bsl_device) {
  return (bsl_device >= BSL_DEVICE_TYPE_START) && (bsl_device < BSL_DEVICE_TYPE_MAX);
}

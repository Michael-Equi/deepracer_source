// Copyright (C) 2018 Intel Corporation
//
// SPDX-License-Identifier: Apache-2.0

#include "hddl-bsl.h"
#include "hddl_bsl_priv.h"

typedef struct {
  const char* device_name;
  BslDeviceType device_type;
} BSL_DEVICE_NAME_MATCH;

static BSL_DEVICE_NAME_MATCH s_cfg_device_type_str[BSL_DEVICE_TYPE_MAX] = {
    {"ioexpander", I2C_IOEXPANDER},
    {"mcu", I2C_MCU},
    {"hid-f75114", HID_F75114},
    //{"pch-c246", PCH_C246},
};

static BslDeviceType cfg_get_device_type_by_name(const char* dev_name) {
  int i;
  int len = sizeof(s_cfg_device_type_str) / sizeof(s_cfg_device_type_str[0]);
  assert(dev_name);
  for (i = 0; i < len; i++) {
    if (0 == strcmp(dev_name, s_cfg_device_type_str[i].device_name)) {
      return s_cfg_device_type_str[i].device_type;
    }
  }
  return BSL_DEVICE_TYPE_MAX;
}

BSL_STATUS cfg_get_path(char* path) {
  assert(path);

#ifdef WIN32
  char* envValue = NULL;
  size_t sz = 0;
  errno_t dup_status = _dupenv_s(&envValue, &sz, "HDDL_INSTALL_DIR");
  if (dup_status != 0) {
    return BSL_ERROR_HDDL_INSTALL_DIR_NOT_PROVIDED;
  }
#else
  char* envValue = getenv("HDDL_INSTALL_DIR");
#endif

  if (!envValue) {
    return BSL_ERROR_HDDL_INSTALL_DIR_NOT_PROVIDED;
  }

  snprintf(path, MAX_PATH_LENGTH, "%s/config/bsl.json", envValue);

#ifdef WIN32
  free(envValue);
#endif
  return BSL_SUCCESS;
}

BSL_STATUS cfg_open(const char* file_path, CFG_HANDLER* handler) {
  FILE* fp;
  char* buf;

  errno_t status = bsl_fopen(&fp, file_path, "rb");
  if (status != 0) {
    return BSL_ERROR_INVALID_CFG_FILE;
  }

  fseek(fp, 0, SEEK_END);
  unsigned int length = ftell(fp);
  rewind(fp);

  if (!(buf = malloc(length + 1))) {
    fclose(fp);
    return BSL_ERROR_MEMORY_ALLOC_FAILED;
  }
  if (fread(buf, 1, length, fp) != length) {
    fclose(fp);
    free(buf);
    return BSL_ERROR_INVALID_CFG_FILE;
  }

  fclose(fp);

  buf[length] = '\0';

  struct json_object* obj = json_tokener_parse(buf);
  if (obj == NULL) {
    LOG("json object is null\n");
    free(buf);
    return BSL_ERROR_INVALID_CFG_FILE;
  }

  struct json_object* jdev = json_object_object_get(obj, "active");
  assert(jdev);
  BslDeviceType dev_type = cfg_get_device_type_by_name(json_object_get_string(jdev));
  if (dev_type >= BSL_DEVICE_TYPE_MAX) {
    json_object_put(obj);
    return BSL_ERROR_INVALID_CFG_FILE;
  }

  handler->device_type = dev_type;
  handler->buf = buf;
  // struct json_object* json_object = json_object_object_get(obj, "config");
  handler->json_object = obj;  // json_object;
  return BSL_SUCCESS;
}

BSL_STATUS cfg_close(CFG_HANDLER* handler) {
  if (!handler) {
    return BSL_SUCCESS;
  }
  if (handler->json_object) {
    json_object_put(handler->json_object);
  }
  if (handler->buf) {
    free(handler->buf);
  }
  return BSL_SUCCESS;
}

BSL_STATUS cfg_check(CFG_HANDLER* handler) {
  BslDeviceType dev_type = handler->device_type;
  BSL_STATUS status = BSL_ERROR_INVALID_CFG_FILE;
  if (dev_type >= I2C_START && dev_type < BSL_DEVICE_TYPE_MAX) {
    status = BSL_SUCCESS;
  }

  return status;
}

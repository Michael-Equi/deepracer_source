// Copyright (C) 2018 Intel Corporation
//
// SPDX-License-Identifier: Apache-2.0

#pragma comment(lib, "Setupapi.lib")
#include <windows.h>

#ifndef _NTDEF_
typedef LONG NTSTATUS;
#endif

#ifdef __MINGW32__
#include <ntdef.h>
#include <winbase.h>
#endif

#ifdef __CYGWIN__
#include <ntdef.h>
#define _wcsdup wcsdup
#endif

#define MAX_STRING_WCHARS 0xFFF

#include <setupapi.h>
#include <winioctl.h>

#include <stdio.h>
#include <stdlib.h>

#include "hid-dev.h"

#define WSTR_LENGTH 512

typedef USHORT USAGE;
typedef void* BSL_PHIDP_PREPARSED_DATA;

typedef struct _BSL_HIDP_CAPS {
  USAGE Usage;
  USAGE UsagePage;
  USHORT InputReportByteLength;
  USHORT OutputReportByteLength;
  USHORT FeatureReportByteLength;
  USHORT Reserved[17];
  USHORT fields_not_used_by_hidapi[10];
} BSL_HIDP_CAPS, *BSL_PHIDP_CAPS;

#define BSL_HIDP_STATUS_SUCCESS 0x110000

typedef struct _BSL_HIDD_ATTRIBUTES {
  ULONG Size;
  USHORT VendorID;
  USHORT ProductID;
  USHORT VersionNumber;
} BSL_HIDD_ATTRIBUTES, *BSL_PHIDD_ATTRIBUTES;

#undef MIN
#define MIN(x, y) ((x) < (y) ? (x) : (y))

#ifdef _MSC_VER
/* Thanks Microsoft, but I know how to use strncpy(). */
#pragma warning(disable : 4996)
#endif

struct hidapi_device_internal {
  HANDLE device_handle;
  BOOL blocking;
  USHORT output_report_length;
  size_t input_report_length;
  void* last_error_str;
  DWORD last_error_num;
  BOOL read_pending;
  char* read_buf;
  OVERLAPPED ol;
};

typedef BOOLEAN(__stdcall* HidD_GetAttributes_Func)(HANDLE device, BSL_PHIDD_ATTRIBUTES attrib);
typedef BOOLEAN(__stdcall* HidD_GetSerialNumberString_Func)(HANDLE device, PVOID buffer, ULONG buffer_len);

typedef BOOLEAN(__stdcall* HidD_GetPreparsedData_Func)(HANDLE handle, BSL_PHIDP_PREPARSED_DATA* preparsed_data);
typedef BOOLEAN(__stdcall* HidD_FreePreparsedData_Func)(BSL_PHIDP_PREPARSED_DATA preparsed_data);
typedef NTSTATUS(__stdcall* HidP_GetCaps_Func)(BSL_PHIDP_PREPARSED_DATA preparsed_data, BSL_HIDP_CAPS* caps);
typedef BOOLEAN(__stdcall* HidD_SetNumInputBuffers_Func)(HANDLE handle, ULONG number_buffers);
typedef BOOLEAN(__stdcall* HidD_GetManufacturerString_Func)(HANDLE handle, PVOID buffer, ULONG buffer_len);
typedef BOOLEAN(__stdcall* HidD_GetProductString_Func)(HANDLE handle, PVOID buffer, ULONG buffer_len);

static HMODULE lib_handle = NULL;
static BOOLEAN initialized = FALSE;

static HidD_GetAttributes_Func HidD_GetAttributes;
static HidD_GetSerialNumberString_Func HidD_GetSerialNumberString;
static HidD_GetManufacturerString_Func HidD_GetManufacturerString;
static HidD_GetProductString_Func HidD_GetProductString;

static HidD_GetPreparsedData_Func HidD_GetPreparsedData;
static HidD_FreePreparsedData_Func HidD_FreePreparsedData;
static HidP_GetCaps_Func HidP_GetCaps;
static HidD_SetNumInputBuffers_Func HidD_SetNumInputBuffers;

static void free_hid_device(hidapi_device_s* dev) {
  CloseHandle(dev->ol.hEvent);
  CloseHandle(dev->device_handle);
  LocalFree(dev->last_error_str);
  free(dev->read_buf);
  free(dev);
}

static int lookup_functions() {
  lib_handle = LoadLibraryA("hid.dll");
  if (lib_handle) {
#define RESOLVE(x)                              \
  x = (x##_Func)GetProcAddress(lib_handle, #x); \
  if (!x)                                       \
    return -1;
    RESOLVE(HidD_GetAttributes);
    RESOLVE(HidD_GetPreparsedData);
    RESOLVE(HidD_FreePreparsedData);
    RESOLVE(HidP_GetCaps);
    RESOLVE(HidD_SetNumInputBuffers);
    RESOLVE(HidD_GetSerialNumberString);
    RESOLVE(HidD_GetManufacturerString);
    RESOLVE(HidD_GetProductString);
#undef RESOLVE
  } else
    return -1;

  return 0;
}
static void bsl__register_error(hidapi_device_s* device, const char* op) {
  WCHAR *ptr, *msg;

  FormatMessageW(FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS, NULL,
                 GetLastError(), MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT), (LPVOID)&msg, 0 /*sz*/, NULL);

  ptr = msg;
  while (*ptr) {
    if (*ptr == '\r') {
      *ptr = 0x0000;
      break;
    }
    ptr++;
  }

  LocalFree(device->last_error_str);
  device->last_error_str = msg;
}

static HANDLE open_device(const char* path, BOOL enumerate) {
  DWORD share_mode = FILE_SHARE_READ | FILE_SHARE_WRITE;
  HANDLE handle;
  DWORD desired_access = (enumerate) ? 0 : (GENERIC_WRITE | GENERIC_READ);
  handle = CreateFileA(path, desired_access, share_mode, NULL, OPEN_EXISTING, FILE_FLAG_OVERLAPPED,
                       /*FILE_ATTRIBUTE_NORMAL,*/ 0);

  return handle;
}

static hidapi_device_s* new_hid_device() {
  hidapi_device_s* dev = (hidapi_device_s*)calloc(1, sizeof(hidapi_device_s));
  if (!dev) {
    return NULL;
  }
  dev->device_handle = INVALID_HANDLE_VALUE;
  dev->blocking = TRUE;
  dev->output_report_length = 0;
  dev->input_report_length = 0;
  dev->last_error_str = NULL;
  dev->last_error_num = 0;
  dev->read_pending = FALSE;
  dev->read_buf = NULL;
  memset(&dev->ol, 0, sizeof(dev->ol));
  dev->ol.hEvent = CreateEvent(NULL, FALSE, FALSE /*initial state f=nonsignaled*/, NULL);

  return dev;
}

int hidapi_exit(void) {
  if (lib_handle)
    FreeLibrary(lib_handle);
  lib_handle = NULL;
  initialized = FALSE;

  return 0;
}

int hidapi_init(void) {
  if (!initialized) {
    if (lookup_functions() < 0) {
      hidapi_exit();
      return -1;
    }
    initialized = TRUE;
  }

  return 0;
}

struct hidapi_device_info_s* hidapi_enumerate(unsigned short vendor_id, unsigned short product_id) {
  BOOL res;

  GUID InterfaceClassGuid = {0x4d1e55b2, 0xf16f, 0x11cf, {0x88, 0xcb, 0x00, 0x11, 0x11, 0x00, 0x00, 0x30}};
  SP_DEVICE_INTERFACE_DETAIL_DATA_A* device_interface_detail_data = NULL;

  struct hidapi_device_info_s* current_dev = NULL;

  struct hidapi_device_info_s* root = NULL;

  int device_index = 0;
  int i;

  SP_DEVICE_INTERFACE_DATA device_interface_data;
  device_interface_data.cbSize = sizeof(SP_DEVICE_INTERFACE_DATA);

  SP_DEVINFO_DATA hiddev_info;
  memset(&hiddev_info, 0x0, sizeof(hiddev_info));
  hiddev_info.cbSize = sizeof(SP_DEVINFO_DATA);

  if (hidapi_init() < 0)
    return NULL;

  HDEVINFO hid_dev_info_set = INVALID_HANDLE_VALUE;
  hid_dev_info_set = SetupDiGetClassDevsA(&InterfaceClassGuid, NULL, NULL, DIGCF_PRESENT | DIGCF_DEVICEINTERFACE);

  while (1) {
    BSL_HIDD_ATTRIBUTES attrib;
    HANDLE dev_write_handle = INVALID_HANDLE_VALUE;

    DWORD required_size = 0;
    res =
        SetupDiEnumDeviceInterfaces(hid_dev_info_set, NULL, &InterfaceClassGuid, device_index, &device_interface_data);

    if (!res)
      break;

    res = SetupDiGetDeviceInterfaceDetailA(hid_dev_info_set, &device_interface_data, NULL, 0, &required_size, NULL);

    device_interface_detail_data = (SP_DEVICE_INTERFACE_DETAIL_DATA_A*)malloc(required_size);
    if (!device_interface_detail_data) {
      goto label_exit_0;
    }
    device_interface_detail_data->cbSize = sizeof(SP_DEVICE_INTERFACE_DETAIL_DATA_A);

    res = SetupDiGetDeviceInterfaceDetailA(hid_dev_info_set, &device_interface_data, device_interface_detail_data,
                                           required_size, NULL, NULL);

    if (!res)
      goto label_exit;
    char driver_name[256];
    for (i = 0;; i++) {
      res = SetupDiEnumDeviceInfo(hid_dev_info_set, i, &hiddev_info);
      if (!res)
        goto label_exit;

      res = SetupDiGetDeviceRegistryPropertyA(hid_dev_info_set, &hiddev_info, SPDRP_CLASS, NULL, (PBYTE)driver_name,
                                              sizeof(driver_name), NULL);
      if (!res)
        goto label_exit;

      if (strcmp(driver_name, "HIDClass") == 0) {
        res = SetupDiGetDeviceRegistryPropertyA(hid_dev_info_set, &hiddev_info, SPDRP_DRIVER, NULL, (PBYTE)driver_name,
                                                sizeof(driver_name), NULL);
        if (res)
          break;
      }
    }

    dev_write_handle = open_device(device_interface_detail_data->DevicePath, TRUE);

    if (dev_write_handle == INVALID_HANDLE_VALUE) {
      goto label_close;
    }

    attrib.Size = sizeof(BSL_HIDD_ATTRIBUTES);
    HidD_GetAttributes(dev_write_handle, &attrib);

    if ((vendor_id == 0x0 || attrib.VendorID == vendor_id) && (product_id == 0x0 || attrib.ProductID == product_id)) {
      const char* str;

      NTSTATUS status;
      wchar_t wstr[WSTR_LENGTH];
      BOOLEAN res;

      struct hidapi_device_info_s* tmp;
      tmp = (struct hidapi_device_info_s*)calloc(1, sizeof(struct hidapi_device_info_s));
      if (!tmp) {
        goto label_close;
      }

      if (current_dev) {
        current_dev->next = tmp;
      } else {
        root = tmp;
      }
      current_dev = tmp;

      BSL_PHIDP_PREPARSED_DATA pp_data = NULL;
      res = HidD_GetPreparsedData(dev_write_handle, &pp_data);
      if (res) {
        BSL_HIDP_CAPS caps;
        status = HidP_GetCaps(pp_data, &caps);
        if (status == BSL_HIDP_STATUS_SUCCESS) {
          current_dev->usage = caps.Usage;
          current_dev->usage_page = caps.UsagePage;
        }

        HidD_FreePreparsedData(pp_data);
      }

      str = device_interface_detail_data->DevicePath;
      current_dev->next = NULL;

      if (str) {
        size_t str_len;
        str_len = strlen(str);
        current_dev->path = (char*)calloc(str_len + 1, sizeof(char));
        if (current_dev->path) {
          strncpy(current_dev->path, str, str_len + 1);
          current_dev->path[str_len] = '\0';
        }
      } else
        current_dev->path = NULL;

      res = HidD_GetSerialNumberString(dev_write_handle, wstr, sizeof(wstr));
      wstr[WSTR_LENGTH - 1] = 0x0000;
      if (res) {
        current_dev->serial_number = _wcsdup(wstr);
      }

      res = HidD_GetProductString(dev_write_handle, wstr, sizeof(wstr));
      wstr[WSTR_LENGTH - 1] = 0x0000;
      if (res) {
        current_dev->product_string = _wcsdup(wstr);
      }

      res = HidD_GetManufacturerString(dev_write_handle, wstr, sizeof(wstr));
      wstr[WSTR_LENGTH - 1] = 0x0000;
      if (res) {
        current_dev->manufacturer_string = _wcsdup(wstr);
      }

      current_dev->vendor_id = attrib.VendorID;
      current_dev->release_number = attrib.VersionNumber;
      current_dev->product_id = attrib.ProductID;
      current_dev->interface_number = -1;

      if (current_dev->path) {
        char* interface_component = strstr(current_dev->path, "&mi_");
        if (interface_component) {
          char* hex_str = interface_component + 4;
          char* endptr = NULL;
          current_dev->interface_number = strtol(hex_str, &endptr, 16);
          if (endptr == hex_str) {
            current_dev->interface_number = -1;
          }
        }
      }
    }

  label_close:
    CloseHandle(dev_write_handle);
  label_exit:
    /* We no longer need the detail data. It can be freed */
    free(device_interface_detail_data);
  label_exit_0:
    device_index++;
  }

  /* Close the device information handle. */
  SetupDiDestroyDeviceInfoList(hid_dev_info_set);

  return root;
}

hidapi_device_s* hidapi_open_path(const char* path) {
  hidapi_device_s* dev;
  BSL_HIDP_CAPS caps;
  BSL_PHIDP_PREPARSED_DATA pp_data = NULL;
  BOOLEAN res;
  NTSTATUS nt_res;

  if (hidapi_init() < 0) {
    return NULL;
  }

  dev = new_hid_device();

  dev->device_handle = open_device(path, FALSE);

  if (dev->device_handle == INVALID_HANDLE_VALUE) {
    bsl__register_error(dev, "CreateFile");
    goto err;
  }

  res = HidD_SetNumInputBuffers(dev->device_handle, 64);
  if (!res) {
    bsl__register_error(dev, "HidD_SetNumInputBuffers");
    goto err;
  }

  res = HidD_GetPreparsedData(dev->device_handle, &pp_data);
  if (!res) {
    bsl__register_error(dev, "HidD_GetPreparsedData");
    goto err;
  }
  nt_res = HidP_GetCaps(pp_data, &caps);
  if (nt_res != BSL_HIDP_STATUS_SUCCESS) {
    bsl__register_error(dev, "HidP_GetCaps");
    goto err_pp_data;
  }

  dev->input_report_length = caps.InputReportByteLength;
  dev->output_report_length = caps.OutputReportByteLength;
  HidD_FreePreparsedData(pp_data);

  dev->read_buf = (char*)malloc(dev->input_report_length);

  return dev;

err_pp_data:
  HidD_FreePreparsedData(pp_data);
err:
  free_hid_device(dev);
  return NULL;
}

hidapi_device_s* hidapi_open(unsigned short vid, unsigned short pid, const wchar_t* serial_number) {
  struct hidapi_device_info_s *devs, *current_dev;
  const char* path_to_open = NULL;
  hidapi_device_s* handle = NULL;

  devs = hidapi_enumerate(vid, pid);
  current_dev = devs;
  while (current_dev) {
    if (current_dev->vendor_id == vid && current_dev->product_id == pid) {
      if (serial_number) {
        if (wcscmp(serial_number, current_dev->serial_number) == 0) {
          path_to_open = current_dev->path;
          break;
        }
      } else {
        path_to_open = current_dev->path;
        break;
      }
    }
    current_dev = current_dev->next;
  }

  if (path_to_open) {
    handle = hidapi_open_path(path_to_open);
  }

  hidapi_free_enumeration(devs);

  return handle;
}
void hidapi_free_enumeration(struct hidapi_device_info_s* devs) {
  struct hidapi_device_info_s* d = devs;
  while (d) {
    struct hidapi_device_info_s* next = d->next;
    free(d->serial_number);
    free(d->manufacturer_string);
    free(d->product_string);
    free(d->path);
    free(d);
    d = next;
  }
}
int hidapi_write(hidapi_device_s* dev, const unsigned char* data, size_t length) {
  unsigned char* buf;
  OVERLAPPED ol;
  memset(&ol, 0, sizeof(ol));

  DWORD bytes_written;
  BOOL res;
  if (length >= dev->output_report_length) {
    buf = (unsigned char*)data;
  } else {
    buf = (unsigned char*)malloc(dev->output_report_length);
    memcpy(buf + dev->output_report_length - length, data, length);
    memset(buf, 0, dev->output_report_length - length);
    length = dev->output_report_length;
  }

  res = WriteFile(dev->device_handle, buf, length, NULL, &ol);

  if (!res) {
    if (GetLastError() != ERROR_IO_PENDING) {
      bsl__register_error(dev, "WriteFile");
      bytes_written = -1;
      goto end_of_function;
    }
  }

  res = GetOverlappedResult(dev->device_handle, &ol, &bytes_written, TRUE /*wait*/);
  if (!res) {
    bsl__register_error(dev, "WriteFile");
    bytes_written = -1;
    goto end_of_function;
  }

end_of_function:
  if (buf != data)
    free(buf);

  return bytes_written;
}

int hidapi_read_timeout(hidapi_device_s* hid_dev, unsigned char* data, size_t length, int milliseconds) {
  size_t copy_len = 0;

  DWORD bytes_read = 0;
  HANDLE ev = hid_dev->ol.hEvent;
  BOOL res;

  if (!hid_dev->read_pending) {
    hid_dev->read_pending = TRUE;
    memset(hid_dev->read_buf, 0, hid_dev->input_report_length);
    ResetEvent(ev);
    res = ReadFile(hid_dev->device_handle, hid_dev->read_buf, hid_dev->input_report_length, &bytes_read, &hid_dev->ol);

    if (!res) {
      if (GetLastError() != ERROR_IO_PENDING) {
        CancelIo(hid_dev->device_handle);
        hid_dev->read_pending = FALSE;
        goto end_of_function;
      }
    }
  }

  if (milliseconds >= 0) {
    res = WaitForSingleObject(ev, milliseconds);
    if (res != WAIT_OBJECT_0) {
      return 0;
    }
  }

  res = GetOverlappedResult(hid_dev->device_handle, &hid_dev->ol, &bytes_read, TRUE /*wait*/);

  hid_dev->read_pending = FALSE;

  if (res && bytes_read > 0) {
    if (hid_dev->read_buf[0] == 0x0) {
      bytes_read--;
      copy_len = length > bytes_read ? bytes_read : length;
      memcpy(data, hid_dev->read_buf + 1, copy_len);
    } else {
      copy_len = length > bytes_read ? bytes_read : length;
      memcpy(data, hid_dev->read_buf, copy_len);
    }
  }

end_of_function:
  if (!res) {
    bsl__register_error(hid_dev, "GetOverlappedResult");
    return -1;
  }

  return copy_len;
}

int hidapi_read(hidapi_device_s* hid_dev, unsigned char* data, size_t length) {
  return hidapi_read_timeout(hid_dev, data, length, (hid_dev->blocking) ? -1 : 0);
}

int hidapi_set_nonblocking(hidapi_device_s* hid_dev, int nonblock) {
  hid_dev->blocking = !nonblock;
  return 0;
}

void hidapi_close(hidapi_device_s* hid_dev) {
  if (!hid_dev)
    return;
  CancelIo(hid_dev->device_handle);
  free_hid_device(hid_dev);
}

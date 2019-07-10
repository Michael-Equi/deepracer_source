// Copyright (C) 2018 Intel Corporation
//
// SPDX-License-Identifier: Apache-2.0

#include <errno.h>
#include <locale.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Linux */
#include <libudev.h>
#include <linux/hidraw.h>
#include <linux/input.h>
#include <linux/version.h>

/* Unix */
#include <fcntl.h>
#include <poll.h>
#include <sys/ioctl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/utsname.h>
#include <unistd.h>

#include "hid-dev.h"

struct hidapi_device_internal {
  int dev_handle;
  int is_blocking;
  int uses_numbered_reports;
} hidapi_device_internal;

/* USB HID device property names */
const char* device_string_names[] = {
    "manufacturer",
    "product",
    "serial",
};

/* Symbolic names for the properties above */
enum device_string_id {
  HID_STRING_MANUFACTURER,
  HID_STRING_PRODUCT,
  HID_STRING_SERIAL,

  HID_STRING_COUNT,
};

static __u32 s_kernel_version = 0;

static wchar_t* utf8_to_wchar(const char* utf8) {
  wchar_t* ret = NULL;

  if (utf8) {
    size_t wlen = mbstowcs(NULL, utf8, 0);
    if ((size_t)-1 == wlen) {
      return wcsdup(L"");
    }
    ret = calloc(wlen + 1, sizeof(wchar_t));
    if (ret) {
      mbstowcs(ret, utf8, wlen + 1);
      ret[wlen] = 0x0000;
    }
  }

  return ret;
}

static wchar_t* copy_udev_string(struct udev_device* dev, const char* udev_name) {
  return utf8_to_wchar(udev_device_get_sysattr_value(dev, udev_name));
}

static hidapi_device_s* create_hidapi_device(void) {
  hidapi_device_s* dev = calloc(1, sizeof(hidapi_device_s));
  if (dev) {
    dev->dev_handle = -1;
    dev->is_blocking = 1;
    dev->uses_numbered_reports = 0;
  }
  return dev;
}

void hidapi_free_enumeration(struct hidapi_device_info_s* devs_infos) {
  struct hidapi_device_info_s* inter = devs_infos;
  while (inter) {
    struct hidapi_device_info_s* next_item = inter->next;
    free(inter->path);
    free(inter->serial_number);
    free(inter->product_string);
    free(inter->manufacturer_string);

    free(inter);
    inter = next_item;
  }
}

static int uses_numbered_reports(__u8* report_descriptor, __u32 size) {
  unsigned int i = 0;
  int size_code;
  int data_len, key_value_len;

  while (i < size) {
    int key = report_descriptor[i];

    if (key == 0x85) {
      return 1;
    }

    if ((key & 0xf0) == 0xf0) {
      if (i + 1 < size)
        data_len = report_descriptor[i + 1];
      else
        data_len = 0; /* malformed report */
      key_value_len = 3;
    } else {
      size_code = key & 0x3;
      switch (size_code) {
        case 0:
        case 1:
        case 2:
          data_len = size_code;
          break;
        case 3:
          data_len = 4;
          break;
        default:
          data_len = 0;
          break;
      };
      key_value_len = 1;
    }
    i += data_len + key_value_len;
  }

  return 0;
}

static __u32 get_kernel_version(void) {
  struct utsname uname_str;

  int major_version, minor_version, release;

  // use uname to get version: uname -r?
  int ret = uname(&uname_str);
  if (ret != 0)
    return 0;

  ret = sscanf(uname_str.release, "%d.%d", &major_version, &minor_version);
  if (ret == 2) {
    return KERNEL_VERSION(major_version, minor_version, 0);
  }

  ret = sscanf(uname_str.release, "%d.%d.%d", &major_version, &minor_version, &release);
  if (ret == 3) {
    return KERNEL_VERSION(major_version, minor_version, release);
  }
  // which case run here?
  return 0;
}
static int parse_uevent_information(const char* uevent,
                                    int* bus_type,
                                    unsigned short* vendor_id,
                                    unsigned short* product_id,
                                    char** serial_number,
                                    char** product_name) {
  char* tmp_uevent = strdup(uevent);
  char* saveptr = NULL;

  char* key = NULL;
  char* value = NULL;

  int found_id = 0;
  int found_serial = 0;
  int found_name = 0;

  char* line_str = strtok_r(tmp_uevent, "\n", &saveptr);
  while (line_str != NULL) {
    key = line_str;
    value = strchr(line_str, '=');
    if (!value) {
      goto next_line;
    }
    *value = '\0';
    value++;

    if (strcmp(key, "HID_ID") == 0) {
      int ret = sscanf(value, "%x:%hx:%hx", (unsigned int*)bus_type, vendor_id, product_id);
      if (ret == 3) {
        found_id = 1;
      }
    } else if (strcmp(key, "HID_NAME") == 0) {
      /* The caller has to free the product name */
      *product_name = strdup(value);
      found_name = 1;
    } else if (strcmp(key, "HID_UNIQ") == 0) {
      /* The caller has to free the serial number */
      *serial_number = strdup(value);
      found_serial = 1;
    }

  next_line:
    line_str = strtok_r(NULL, "\n", &saveptr);
  }

  free(tmp_uevent);
  return (found_id && found_name && found_serial);
}

void hidapi_init(void) {
  s_kernel_version = get_kernel_version();

  // is it must?
  const char* locale = setlocale(LC_CTYPE, NULL);
  if (!locale)
    setlocale(LC_CTYPE, "");
}

struct hidapi_device_info_s* hidapi_enumerate(unsigned short vendor_id, unsigned short product_id) {
  struct hidapi_device_info_s* root = NULL;     /* return object */
  struct hidapi_device_info_s* prev_dev = NULL; /* previous device */
  struct hidapi_device_info_s* cur_dev = NULL;
  struct udev_enumerate* enumerate_list = NULL;
  struct udev_list_entry *devices, *dev_list_entry;

  struct udev* udev = NULL;

  hidapi_init();

  udev = udev_new();
  if (!udev) {
    printf("create udev failed\n");
    return NULL;
  }

  enumerate_list = udev_enumerate_new(udev);

  udev_enumerate_add_match_subsystem(enumerate_list, "hidraw");

  udev_enumerate_scan_devices(enumerate_list);

  devices = udev_enumerate_get_list_entry(enumerate_list);

  udev_list_entry_foreach(dev_list_entry, devices) {
    struct udev_device* usb_dev = NULL;
    struct udev_device* intf_dev = NULL;
    struct udev_device* hidapi_dev = NULL;
    unsigned short usb_vid;
    unsigned short usb_pid;
    char* serial_number = NULL;
    char* product_name = NULL;
    int bus_type;
    int result;

    const char* sysfs_path = udev_list_entry_get_name(dev_list_entry);
    struct udev_device* raw_dev = udev_device_new_from_syspath(udev, sysfs_path);
    const char* dev_path = udev_device_get_devnode(raw_dev);

    hidapi_dev = udev_device_get_parent_with_subsystem_devtype(raw_dev, "hid", NULL);

    if (!hidapi_dev) {
      // cannt find any hid
      goto next;
    }

    result = parse_uevent_information(udev_device_get_sysattr_value(hidapi_dev, "uevent"), &bus_type, &usb_vid,
                                      &usb_pid, &serial_number, &product_name);

    if (bus_type != BUS_USB) {
      goto next;
    }

    if (!result) {
      goto next;
    }

    /* Check the VID/PID against the arguments */
    if ((vendor_id == 0x0 || vendor_id == usb_vid) && (product_id == 0x0 || product_id == usb_pid)) {
      struct hidapi_device_info_s* tmp = NULL;

      /* VID/PID match. Create the record. */
      tmp = malloc(sizeof(struct hidapi_device_info_s));
      if (!tmp) {
        goto next;
      }
      if (cur_dev) {
        cur_dev->next = tmp;
      } else {
        root = tmp;
      }
      prev_dev = cur_dev;
      cur_dev = tmp;

      cur_dev->product_id = usb_pid;
      cur_dev->vendor_id = usb_vid;

      cur_dev->release_number = 0x0;

      cur_dev->interface_number = -1;

      cur_dev->next = NULL;
      cur_dev->path = dev_path ? strdup(dev_path) : NULL;
      cur_dev->serial_number = utf8_to_wchar(serial_number);

      switch (bus_type) {
        case BUS_USB:

          usb_dev = udev_device_get_parent_with_subsystem_devtype(raw_dev, "usb", "usb_device");

          if (!usb_dev) {
            free(cur_dev->path);
            free(cur_dev->serial_number);

            free(cur_dev);

            /* Take it off the device list. */
            if (prev_dev) {
              prev_dev->next = NULL;
              cur_dev = prev_dev;
            } else {
              cur_dev = root = NULL;
            }

            goto next;
          }

          cur_dev->product_string = copy_udev_string(usb_dev, device_string_names[HID_STRING_PRODUCT]);
          cur_dev->manufacturer_string = copy_udev_string(usb_dev, device_string_names[HID_STRING_MANUFACTURER]);

          const char* str = udev_device_get_sysattr_value(usb_dev, "bcdDevice");
          cur_dev->release_number = (str) ? strtol(str, NULL, 16) : 0x0;

          intf_dev = udev_device_get_parent_with_subsystem_devtype(raw_dev, "usb", "usb_interface");
          if (intf_dev) {
            str = udev_device_get_sysattr_value(intf_dev, "bInterfaceNumber");
            cur_dev->interface_number = (str) ? strtol(str, NULL, 16) : -1;
          }

          break;

        default:
          break;
      }
    }

  next:
    free(serial_number);
    free(product_name);
    udev_device_unref(raw_dev);
  }
  /* Free the enumerator and udev objects. */
  udev_enumerate_unref(enumerate_list);
  udev_unref(udev);

  return root;
}

hidapi_device_s* hidapi_open_path(const char* path) {
  hidapi_device_s* hid_dev = NULL;

  hidapi_init();

  hid_dev = create_hidapi_device();
  if (!hid_dev) {
    return NULL;
  }

  hid_dev->dev_handle = open(path, O_RDWR);

  if (hid_dev->dev_handle < 0) {
    free(hid_dev);
    return NULL;
  }

  int res, desc_size = 0;
  struct hidraw_report_descriptor rpt_desc;

  memset(&rpt_desc, 0x0, sizeof(rpt_desc));

  res = ioctl(hid_dev->dev_handle, HIDIOCGRDESCSIZE, &desc_size);
  if (res < 0) {
    printf("ioctl get report descriptor size error\n");
  }
  rpt_desc.size = desc_size;
  res = ioctl(hid_dev->dev_handle, HIDIOCGRDESC, &rpt_desc);
  if (res < 0) {
    printf("ioctl get report descriptor error\n");
  } else {
    hid_dev->uses_numbered_reports = uses_numbered_reports(rpt_desc.value, rpt_desc.size);
  }

  return hid_dev;
}

int hidapi_write(hidapi_device_s* hid_dev, const unsigned char* data, size_t length) {
  return write(hid_dev->dev_handle, data, length);
}
int hidapi_get_fd(hidapi_device_s* hid_dev) {
  return hid_dev->dev_handle;
}

int hidapi_read_timeout(hidapi_device_s* hid_dev, unsigned char* data, size_t length, int milliseconds) {
  // if timeout, use poll
  if (0 <= milliseconds) {
    struct pollfd fds_set;
    /// sdlfjasdlfasdlfasdf
    fds_set.fd = hid_dev->dev_handle;
    /// sdlfjasdlfasdlfasdf
    fds_set.revents = 0;
    /// sdlfjasdlfasdlfasdf
    fds_set.events = POLLIN;
    /// sdlfjasdlfasdlfasdf
    int result = poll(&fds_set, 1, milliseconds);

    /// sdlfjasdlfasdlfasdf
    if (result == -1 || result == 0) {
      return result;
    } else {
      if (fds_set.revents & (POLLERR | POLLHUP | POLLNVAL))
        return -1;
    }
  }
  /// sdlfjasdlfasdlfasdf
  int read_num = read(hid_dev->dev_handle, data, length);
  /////sdlfjasdlfasdlfasdf
  if (read_num < 0 && (errno == EAGAIN || errno == EINPROGRESS))
    read_num = 0;
  /// sdlfjasdlfasdlfasdf

  // workround
  if (s_kernel_version != 0 && s_kernel_version < KERNEL_VERSION(2, 6, 34)) {
    if (read_num >= 0 && hid_dev->uses_numbered_reports) {
      memmove(data, data + 1, read_num);
      read_num--;
    }
  }
  return read_num;
}

int hidapi_read(hidapi_device_s* hid_dev, unsigned char* data, size_t length) {
  return hidapi_read_timeout(hid_dev, data, length, (hid_dev->is_blocking) ? -1 : 0);
}

int hidapi_set_nonblocking(hidapi_device_s* hid_dev, int nonblock) {
  hid_dev->is_blocking = !nonblock;
  return 0;
}

void hidapi_close(hidapi_device_s* hid_dev) {
  if (!hid_dev)
    return;
  close(hid_dev->dev_handle);
  free(hid_dev);
}

hidapi_device_s* hidapi_open(unsigned short vid, unsigned short pid, const wchar_t* serial_number) {
  const char* dev_path = NULL;
  hidapi_device_s* handle = NULL;

  struct hidapi_device_info_s *devs_list, *cur_dev;

  devs_list = hidapi_enumerate(vid, pid);
  cur_dev = devs_list;
  while (cur_dev) {
    if (cur_dev->vendor_id == vid && cur_dev->product_id == pid) {
      if (serial_number) {
        if (wcscmp(serial_number, cur_dev->serial_number) == 0) {
          dev_path = cur_dev->path;
          break;
        }
      } else {
        dev_path = cur_dev->path;
        break;
      }
    }
    cur_dev = cur_dev->next;
  }

  if (dev_path) {
    /* Open the device */
    handle = hidapi_open_path(dev_path);
  }

  hidapi_free_enumeration(devs_list);

  return handle;
}

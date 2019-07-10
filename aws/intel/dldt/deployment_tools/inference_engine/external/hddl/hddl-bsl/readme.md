# libbsl

---
this project includes some tools and a library.

1. `libbsl`: A library to reset myraidx for HDDL.
2. `bsl_reset`: A tool to reset devices based on `libbsl`
3. `smb_address_tool`: A tool on Window to find SMBus address

## Compile `libbsl`

### Linux dependencies

```sh
sudo apt-get install libudev1
sudo apt-get install libudev-dev libjson-c-dev
```

### make&install

#### Installing on Linux

```sh
mkdir build
cd build
cmake .. -DINSTALL_USB_RULES=TRUE
make -j
sudo make install
```

#### Installing on Windows (using VS 2015)

* Firstly, please make sure that you ran command prompt as an administrator to be able installing hddl-bsl software

```sh
mkdir build
cd build
cmake -G"Visual Studio 14 2015 Win64" ..
cmake --build . --target INSTALL
```

### Uninstall

#### Use `make`

```sh
make uninstall
```

#### Use `CMake`

```sh
xargs rm < install_manifest.txt
```

## interfaces

all interfaces list here
> include/hddl-bsl.h

`bsl_reset` is based on libbsl

## how to know the i2c address and write config file

---
better we can fix the i2c addres in config file to avoid confusion

the config file path is
> ${HDDL_INSTALL_DIR}/config/bsl.json

---
this is a example how to config the i2c address, one address means one pcie card.

### for ioexpander

```json
{
  "active":"ioexpander",
  "config": {
    "i2c_addr":[37,39]
  }

}
```

### for mcu

```json
{
  "active":"ioexpander",
  "config": {
    "i2c_addr":[31]
  }

}
```

### MCU case

the following steps to get the MCU i2c address(one pcie card) and write the config file

#### install i2c-i801 driver

```sh
sudo modprobe i2c-i801
```

#### list all i2c devices

```sh
i2cdetect -l

$ hddl@hddl-US-E2332:~/eason/hddl-bsl/src$ i2cdetect -l
i2c-0   i2c             i915 gmbus dpc                          I2C adapter
i2c-1   i2c             i915 gmbus dpb                          I2C adapter
i2c-2   i2c             i915 gmbus dpd                          I2C adapter
i2c-3   i2c             DPDDC-C                                 I2C adapter
i2c-4   i2c             DPDDC-E                                 I2C adapter
i2c-5   smbus           SMBus I801 adapter at f040              SMBus adapter  ==>
```

we know i2c-5 is the right one, then check the i2c address

#### check i2c address

the following case is the MCU example, the address range is from 0x18 to 0x1f,  
the 0x18 is always there, so we know it is not the pcie card, 0x1f is the i2c address for pcie card.

```sh
i2cdetect -y 5

$ hddl@hddl-US-E2332:~/eason/hddl-bsl/src$ i2cdetect -y 5
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- 08 -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- 18 -- -- -- -- -- -- 1f                   ==>
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: 30 31 -- -- 34 35 36 -- -- -- -- -- -- -- -- --
40: -- -- -- -- 44 -- -- -- -- -- -- -- -- -- -- --
50: 50 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --
```

0x1f == 31, so  config the file like the following , then it is enough.

```json
{
  "active":"mcu",
  "i2c_addr":[31]
}
```

### IOExpander Case

the following steps to get the  IOExpander  i2c address(2 cards) and write the config file

#### install i2c-i801 driver

```sh
sudo modprobe i2c-i801
```

#### list all i2c devices

```sh
i2cdetect -l

$ hddl@hddl-US-E2332:~/eason/hddl-bsl/src$ i2cdetect -l
i2c-0   i2c             i915 gmbus dpc                          I2C adapter
i2c-1   i2c             i915 gmbus dpb                          I2C adapter
i2c-2   i2c             i915 gmbus dpd                          I2C adapter
i2c-3   i2c             DPDDC-C                                 I2C adapter
i2c-4   i2c             DPDDC-E                                 I2C adapter
i2c-5   smbus           SMBus I801 adapter at f040              SMBus adapter  ==>
```

we know i2c-5 is the right one, then check the i2c address

#### check i2c address

the following case is the IOExpander example, the address range is from 0x20 to 0x2f.  
there are two cards, so we know the i2c address is 0x23 and 0x26.

```sh
i2cdetect -y 5

$ hddl@hddl-US-E2332:~$ i2cdetect -y 5
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- 08 -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- 18 -- -- -- -- -- -- --
20: -- -- -- 23 -- -- 26 -- -- -- -- -- -- -- -- --
30: 30 31 -- -- 34 35 36 -- -- -- -- -- -- -- -- --
40: -- -- -- -- 44 -- -- -- -- -- -- -- -- -- -- --
50: 50 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 6f
```

0x23 == 35, 0x26==38, so  config the file like the following , then it is enough.

```json
{
  "active":"ioexpander",
  "i2c_addr":[37,39]
}
```

## how to reset IOExpander

use i2c-tools

0x23 is the i2c address

### reset all

```sh
sudo i2cset -y 5 0x23 0x06 0x00 b
sudo i2cset -y 5 0x23 0x02 0x00 b
sudo i2cset -y 5 0x23 0x02 0xff b
```

use bsl_reset

```sh
bsl_reset -d io
```

### reset one device

use bsl_reset
0x23-0x20 == 0x3, it is board id, 011
device id is from 0-7, use 1 as example
b 011 00001 == 0x61 == 97

```sh
bsl_reset -d io -i 97
```

## how to discard a specific device

```sh
bsl_reset -d io -a device_id
```

## how to reset MCU

use i2c-tools
0x1f is the i2c address

### reset all

```sh
sudo i2cset -y 5 0x1f 0x01 0xff b
```

use bsl_reset

```sh
bsl_reset -d mcu
```

### reset one device

0x2 is the device id

```sh
sudo i2cset -y 5 0x1f 0x01 0x2 b
```

use bsl_reset

```sh
bsl_reset -d mcu -i 2
```

## cmds

---

```sh
$ lab_seghwusr@SDIL16D016:~/eason/libbsl/src$ i2cdetect -y   6
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- 08 -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 1f
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: 30 31 -- -- 34 35 36 -- -- -- -- -- -- -- -- 3f
40: -- -- -- -- 44 -- -- -- -- -- -- -- -- -- -- --
50: 50 -- 52 -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- 6c -- -- --
70: -- -- -- -- -- -- -- --
```

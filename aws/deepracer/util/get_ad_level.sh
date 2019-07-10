#!/bin/bash

O_L10=0xec
L10=0xe0
L9=0xd9
L8=0xd3
L7=0xcf
L6=0xcb
L5=0xc8
L4=0xc5
L3=0xc3
L2=0xc0
L1=0xb4
L0=0x8c

function toLevel()
{
    local VALUE=$1

    if [[ $VALUE -ge $O_L10 ]]; then LEVEL=-2;
    elif [[ $VALUE -ge $L10 ]]; then LEVEL=10;
    elif [[ $VALUE -ge $L9 ]]; then LEVEL=9;
    elif [[ $VALUE -ge $L8 ]]; then LEVEL=8;
    elif [[ $VALUE -ge $L7 ]]; then LEVEL=7;
    elif [[ $VALUE -ge $L6 ]]; then LEVEL=6;
    elif [[ $VALUE -ge $L5 ]]; then LEVEL=5;
    elif [[ $VALUE -ge $L4 ]]; then LEVEL=4;
    elif [[ $VALUE -ge $L3 ]]; then LEVEL=3;
    elif [[ $VALUE -ge $L2 ]]; then LEVEL=2;
    elif [[ $VALUE -ge $L1 ]]; then LEVEL=1;
    elif [[ $VALUE -ge $L0 ]]; then LEVEL=0;
    else LEVEL=-1;
    fi

    echo $LEVEL
}

VALUE=$(i2cget -y 7 0x3f 0xb2)

CHECK_LEVEL=$(printf '0x%x\n' $VALUE)
echo $CHECK_LEVEL : Level is $(toLevel $CHECK_LEVEL)
sleep 0.1

#!/usr/bin/python3

import os
import subprocess

def run_cmd(cmd):
    proc = subprocess.run(cmd, shell=True, stdout=subprocess.PIPE)

def create_host_ssh_keys():
    if not os.path.exists('/etc/ssh/ssh_host_dsa_key'):
        run_cmd('dpkg-reconfigure openssh-server')

if __name__ == '__main__':
    create_host_ssh_keys()

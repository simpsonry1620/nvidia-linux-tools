#!/bin/bash
# file: driver-check.sh

# check if nouveau is blacklisted
# if nouveau is properly blacklisted the output should appear as follows:
# blacklist nouveau
# options nouveau modeset=0
cat /etc/modprobe.d/blacklist-nvidia-nouveau.conf

# check if nouveau drivers are loaded
lsmod | grep nouveau

# check if nvidia drivers are loaded
lsmod | grep -i nvidia

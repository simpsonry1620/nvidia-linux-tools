# Commands that can be useful for configuring, exploring, and troubleshooting NVIDIA devices on Ubuntu.

## General lookup / verification command
### View PCI devices
```
$ lspci | grep -i nvidia
```
### Update PCI Ids
```
$ sudo update-pciids
```
### View NVIDIA drivers
```
$ lsmod | grep -i nvidia
```

### Check for nouveau drivers
```
$ lsmod | grep -i nouveau
```

## General processes for configuring drivers
### Blacklisting nouveau drivers
In many cases nouveau drivers can cause issues with NVIDIA gpus specifically when trying to use CUDA. Below are the steps to verify and remidy nouveau drivers issues:
1. Check if nouveau drivers are loaded
```
$ lsmod | grep -i nouveau
```
2. If any nouveau items are returned we need to blacklist them with
```
$ sudo bash -c “echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf”
$ sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
```
3. Confirm that the nouveau drivers have been blacklisted
```
$ cat /etc/modprobe.d/blacklist-nvidia-nouveau.conf
blacklist nouveau
options nouveau modeset=0
```
4. Regenerate the kernel initramfs
```
$ sudo update-initramfs -u
```
5. Reboot
```
$ sudo reboot
```
6. Confirm the nouveau drivers are no longer loaded. Nothing should be returned.
```
$ lsmod | grep -i nouveau
```

## CUDA Troubleshooting
# Run cuda container with nvidia-smi
```
docker run --rm -it nvcr.io/nvidia/cuda nvidia-smi

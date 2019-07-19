# NVIDIA drivers and CUDA for Ubuntu

## NVIDIA driver installation
#### Remove Previous Installations

One might have installed the driver via `apt-get`. So before reinstall the driver from runfile, uninstalling previous installations is required. Executing the following scripts carefully one by one.

```
sudo apt-get purge nvidia* && sudo apt-get autoremove 
```

#### Download the Driver

The latest NVIDIA driver for Linux OS can be fetched from [NVIDIA's official website](http://www.nvidia.com/object/unix.html). 
The first one in the list, i.e. Latest Long Lived Branch version for Linux x86_64/AMD64/EM64T, is suitable for most cases. 

If you want to download the driver directly in a Linux shell, the script below would be useful.
```
cd ~/Downloads

wget http://us.download.nvidia.com/XFree86/Linux-x86_64/430.26/NVIDIA-Linux-x86_64-430.26.run
```

Detailed installation instruction can be found in the download page via a [README](http://us.download.nvidia.com/XFree86/Linux-x86_64/430.26/README/index.html) hyperlink in the ADDITIONAL INFORMATION tab. I have also summarized key steps below. 

#### Install Dependencies

Software required for the runfile are officially listed [here](http://us.download.nvidia.com/XFree86/Linux-x86_64/430.26/README/minimumrequirements.html).

For Ubuntu, installing the following dependencies is enough. 

1. `build-essential` -- For building the driver
2. (Optional) `gcc-multilib` -- For providing 32-bit support
3. `dkms` -- For providing dkms support
4. (Optional) `xorg` and `xorg-dev`. On a workstation with GUI, this is require but usually have already been installed, because you have already got the graphic display. On headless servers without GUI, this is not a must. 

As a summary, execute the following command to install all dependencies:
```
sudo apt-get install build-essential gcc-multilib dkms xorg xorg-dev
```

#### Create Blacklist for Nouveau Driver

Create a file with  `sudo gedit /etc/modprobe.d/blacklist-nouveau.conf` and paste the following content on it:
```
blacklist nouveau
options nouveau modeset=0
```
Save it.

Note: It is also possible for the NVIDIA installation runfile to create this blacklist file automatically. Execute the runfile and follow instructions when an error related Nouveau appears. 

Then, for Ubuntu 16.04 LTS, execute `sudo update-initramfs -u` and reboot the computer;

#### Stop X-server

After the computer is rebooted. We need to stop the desktop manager before executing the runfile to install the driver. `lightdm` is the default desktop manager in Ubuntu. If GNOME or KDE desktop environment is used, installed desktop manager will then be `gdm` or `kdm`.
Before logging-in, press `ctrl + alt + f1` and log-in from there. From that terminal you must stop the lightdm service and execute the runfile.

1. `sudo service lightdm stop` (or use `gdm` or `kdm` instead of `lightdm`), or  
2. `sudo systemctl stop lightdm` (or use `gdm` or `kdm` instead of `lightdm`)

#### Executing the Runfile

After above batch of preparition, we can eventually start executing the runfile. So this is why I, from the very begining, recommend new users to install the driver via `apt-get`. 

```
export IGNORE_PREEMPT_RT_PRESENCE=1 # if using rt kernel
cd ~/Downloads
chmod +x NVIDIA-Linux-x86_64-384.69.run

# If you are using a standard kernel:
sudo ./NVIDIA-Linux-x86_64-384.69.run --dkms

# If you are using a RT-patched kernel
sudo IGNORE_PREEMPT_RT_PRESENCE=1 ./NVIDIA-Linux-x86_64-384.69.run --dkms 
```

Note: 

1. option `--dkms` is used for register dkms module into the kernel so that update of the kernel will not require a reinstallation of the driver. This option should be turned on by default. 
2. option `-s` is used for silent installation which should used for batch installation. For installation on a single computer, this option should be turned off for more installtion information. 
3. option `--no-opengl-files` can also be added if non-NVIDIA (AMD or Intel) graphics are used for display while NVIDIA graphics are used for display. 
4. The installer may prompt warning on a system without X.Org installed. It is safe to ignore that based on my experience. 
```
WARNING: nvidia-installer was forced to guess the X library path '/usr/lib' and X module path '/usr/lib/xorg/modules'; these paths were not queryable from the system.  If X fails to find the NVIDIA X driver module, please install the `pkg-config` utility and the X.Org SDK/development package for your distribution and reinstall the driver.
```
**IMPORTANT:**
* When told that the `distribution-provided pre-install script failed` just press `Continue installation`.

* The installer will check for the presence of DKMS on your system. If DKMS is found, you will be given the option of registering the kernel module with DKMS, and using the DKMS infrastructure to build and install the kernel module. On most systems with DKMS, DKMS will take care of automatically rebuilding registered kernel modules when installing a different Linux kernel.

* When asked: `Would you like to run the nvidia-xconfig utility to automatically update your X configuration file..` press `NO`.

#### Check the Installation

After a successful installation, `sudo nvidia-smi` command will report all your CUDA-capable devices in the system. 

#### Common Errors and Solutions

1. `ERROR: Unable to load the 'nvidia-drm' kernel module.`
 * One probable reason is that the system is boot from UEFI but Secure Boot option is turned on in the BIOS setting. Turn it off and the problem will be solved. 

## CUDA installation
After installing the NVIDIA drivers, one can install CUDA like this:
* Go to [this](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1604&target_type=runfilelocal) webpage and download the cuda runfile.
or
```
cd ~/Downloads
wget https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda_10.1.168_418.67_linux.run
```
* Log-out, press `ctrl + alt + f1`, log-in, and stop the lightdm service again `sudo systemctl stop lightdm`.
```
# Verify the cuda runfile
md5sum cuda_10.1.168_418.67_linux.run

# Make the run-file executable
chmod +x cuda_10.1.168_418.67_linux.run

# Install, ff you are using a standard kernel:
sudo ./cuda_10.1.168_418.67_linux.run

# If you are using a RT-patched kernel
sudo IGNORE_PREEMPT_RT_PRESENCE=1 ./cuda_10.1.168_418.67_linux.run
```

* Accept and proceed with the installation.
* A summary of the installation will be shown.
* Check in the summary that the cuda installation dir is `/usr/local/cuda-10.1/` (this will be needed for some env variables).
* Reboot
* Log-in normally
* Add CUDA to the path @ .bashrc
```
export PATH=/usr/local/cuda-10.1/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
```
* Test CUDA with `nvcc -V`

### Verify CUDA installation with the samples
Go to `~/NVIDIA_CUDA-10.1_Samples` and build the samples with `make -j3`.

After the CUDA-samples building is finished successfully:
```
cd ~/NVIDIA_CUDA-10.1_Samples/bin/x86_64/linux/release
```
And execute any of the samples:
```
./deviceQuery
./bandwidthTest
./vectorAdd
./cuSolverSp_LowlevelQR
./cudaOpenMP
./cudaTensorCoreGemm
./c++11_cuda
./MonteCarloMultiGPU
./matrixMulCUBLAS
./immaTensorCoreGemm
./simpleMultiGPU
./fp16ScalarProduct
...
...
```

## Uninstall
To uninstall the CUDA toolkit, run `sudo cuda-uninstaller` in `/usr/local/cuda-10.1/bin`.  
To uninstall the NVIDIA driver, run `sudo nvidia-uninstall`.

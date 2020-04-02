# Linux kernel RT patch
## Install dependencies
You may need to install some dependencies first. For that, you can use the following command.
```
sudo apt update
sudo apt install openssl libssl-dev libncurses-dev gcc make git exuberant-ctags bc bison flex libelf-dev
```

## Select and download the kernel
The first thing to do is find out what kernel you want to download. Second, you have to download the patches for that specific kernel. Third build and install the kernel and end with adapting and updating the grub-loader so that you get the choice to boot the realtime or non-realtime kernel.

To find out what kernel you want, you can visit: https://www.kernel.org/. At the time of writing, the latest stable kernel was 4.19. However, there was not yet a RT patch for this kernel, so I went with 4.18.16 (the latest stable kernel apart from 4.19).

Once you figured out what kernel you need or want, visit: https://mirrors.edge.kernel.org/pub/linux/kernel/. Under “v5.x/” you will find the right kernel version (the name starts with “Linux”). I downloaded the xz file. Next, go one directory back up, go to “projects” then “rt”. There you can find the RT patch corresponding to your kernel `patch-5.0.21-rt16.patch.xz`.

- Download the packages
```
mkdir -p ~/kernel
cd ~/kernel
wget https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.0.21.tar.xz
wget https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.0.21.tar.sign
curl -SLO https://www.kernel.org/pub/linux/kernel/projects/rt/5.0/patch-5.0.21-rt16.patch.xz
curl -SLO https://www.kernel.org/pub/linux/kernel/projects/rt/5.0/patch-5.0.21-rt16.patch.sign
```

- Decompress the packages:
```
xz -d linux-5.0.21.tar.xz
xz -d patch-5.0.21-rt16.patch.xz
```

- Verify the integrity of the packages:
```
gpg2 --verify linux-5.0.21.tar.sign
```
This will give you an output like this:
```
gpg: assuming signed data in 'linux-5.0.21.tar'
gpg: Signature made Di 04 Jun 2019 08:02:08 CEST
gpg:                using RSA key 647F28654894E3BD457199BE38DBBDC86092693E
gpg: Can't check signature: No public key
```
Add the correct signature by using the RSA key provided by the last command, as:
```
gpg2  --keyserver hkp://keys.gnupg.net --recv-keys 647F28654894E3BD457199BE38DBBDC86092693E
```
When you re-verify the integrity with
```
gpg2 --verify linux-5.0.21.tar.sign
```
you will get
```
gpg: assuming signed data in 'linux-5.0.21.tar'
gpg: Signature made Di 04 Jun 2019 08:02:08 CEST
gpg:                using RSA key 647F28654894E3BD457199BE38DBBDC86092693E
gpg: Good signature from "Greg Kroah-Hartman <gregkh@linuxfoundation.org>" [unknown]
gpg:                 aka "Greg Kroah-Hartman <gregkh@kernel.org>" [unknown]
gpg:                 aka "Greg Kroah-Hartman (Linux kernel stable release signing key) <greg@kroah.com>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: 647F 2865 4894 E3BD 4571  99BE 38DB BDC8 6092 693E
```

Now we verify the patch:
```
gpg2 --verify patch-5.0.21-rt16.patch.sign
```
If we get the following response, take note of the RSA key:
```
gpg: assuming signed data in 'patch-5.0.21-rt16.patch'
gpg: Signature made Mi 10 Jul 2019 17:17:21 CEST
gpg:                using RSA key 57892E705233051337F6FDD105641F175712FA5B
gpg: Can't check signature: No public key
```
Add the correct signature by using the RSA key provided by the last command, as:
```
gpg2  --keyserver hkp://keys.gnupg.net --recv-keys 57892E705233051337F6FDD105641F175712FA5B

gpg: key 7B96E8162A8CF5D1: 114 signatures not checked due to missing keys
gpg: key 7B96E8162A8CF5D1: public key "Sebastian Andrzej Siewior" imported
gpg: no ultimately trusted keys found
gpg: Total number processed: 1
gpg:               imported: 1
```
When you re-verify the integrity with
```
gpg2 --verify patch-5.0.21-rt16.patch.sign
```
you will get
```
gpg: assuming signed data in 'patch-5.0.21-rt16.patch'
gpg: Signature made Mi 10 Jul 2019 17:17:21 CEST
gpg:                using RSA key 57892E705233051337F6FDD105641F175712FA5B
gpg: Good signature from "Sebastian Andrzej Siewior" [unknown]
gpg:                 aka "Sebastian Andrzej Siewior <bigeasy@linutronix.de>" [unknown]
gpg:                 aka "Sebastian Andrzej Siewior <sebastian@breakpoint.cc>" [unknown]
gpg: Note: This key has expired!
Primary key fingerprint: 6425 4695 FFF0 AA44 66CC  19E6 7B96 E816 2A8C F5D1
     Subkey fingerprint: 5789 2E70 5233 0513 37F6  FDD1 0564 1F17 5712 FA5B
```

- Patch the kernel
```
tar xf linux-5.0.21.tar
cd linux-5.0.21/
patch -p1 < ../patch-5.0.21-rt16.patch
```

## Configure the kernel
Now you can configure the kernel using:
```
make oldconfig
```
This opens a text-based configuration menu. When asked for the Preemption Model, choose the Fully Preemptible Kernel:
```
Preemption Model
    1. No Forced Preemption (Server) (PREEMPT_NONE)
    2. Voluntary Kernel Preemption (Desktop) (PREEMPT_VOLUNTARY)
    3. Preemptible Kernel (Low-Latency Desktop) (PREEMPT__LL) (NEW)
    4. Preemptible Kernel (Basic RT) (PREEMPT_RTB) (NEW)
    > 5. Fully Preemptible Kernel (RT) (PREEMPT_RT_FULL) (NEW)
```
We recommend keeping other options at their default values. 


## Install the kernel
You can install the patched kernel with any of the following options, but Option 1 is preferred because it installs the kernel headers as well (and you may need them).

**Option 1 (with Kernel headers):**  

Now, you can create packages which could be installed on other machines. Kernel's `make` has options for different kind of packages. Here, I use the option `deb-pkg` to generate Debian packages. The following command might take a really long time (**30 - 60 min** depending on your setup).  
```
sudo INSTALL_MOD_STRIP=1 make -j4 deb-pkg
```
Compiling with `INSTALL_MOD_STRIP=1` can generate modules without debugging information, reducing the size of the kernel. Without that, it may give you a "Couldn't find suitable memory target" error.

The above command creates 4 packages
* linux-headers-5.0.21-rt16-rt9_4.18.16-rt9-rt9-1_amd64.deb
* linux-image-5.0.21-rt16-rt9_4.18.16-rt9-rt9-1_amd64.deb
* linux-image-5.0.21-rt16-rt9-dbg_4.18.16-rt9-rt9-1_amd64.deb
* linux-libc-dev_5.0.21-rt16-rt9-1_amd64.deb

Check that the Debian packages have been created:
```
cd .. && ls *.deb
```

Install the kernel packages: 
```
sudo dpkg -i *.deb
```

**Option 2 (without Kernel headers):**  

Next, will build and install the kernel (I used the -j4 option because the MIO board has 4 cores, and this speeds up the make command): 
```
make -j4
sudo make INSTALL_MOD_STRIP=1 modules_install -j4    # sudo make modules_install -j4
sudo make install -j4
```
Especially the first command might between **30 - 60 min** depending on your setup.  

## Check the installation and update grub
Check if the install completed correctly by doing:
```
cd /boot
ls
```
The “ls” command should show these three files: “initrd.img-5.0.21-rt16”,   ”vmlinuz-5.0.21-rt16” and “config-5.0.21-rt16”.  
Now run: 
```
sudo update-grub
```

To make sure that you get the option to choose your kernel on each start up, we have to adapt the grub file:
```
cd /etc/default && sudo gedit grub
```
comment the following line (by placing a # in front of each line)
```
GRUB_HIDDEN_TIMEOUT=0
```

Save the file, exit and run once again:
```
sudo update-grub
```
Now reboot and you should be able to see the grub-menu. Under “Advanced ubuntu options” you can choose your kernel. The installed kernel (in this case 4.18.16-rt9) should be visible as well as the kernel that you were working with previously.

Once the computer has rebooted, you can check your kernel with the command:
```
uname -v
```
It should show you something like `#1 SMP PREEMPT RT`

## Allow real-time permissions for processes

After the `PREEMPT_RT` kernel is installed and running, add a group named realtime and add the user controlling your robot to this group:

```
sudo addgroup realtime
sudo usermod -a -G realtime $(whoami)
```

Afterwards, add the following limits to the realtime group in `/etc/security/limits.conf`:
```
@realtime soft rtprio 99
@realtime soft priority 99
@realtime soft memlock 102400
@realtime hard rtprio 99
@realtime hard priority 99
@realtime hard memlock 102400
```

The limits will be applied after you log out and in again.

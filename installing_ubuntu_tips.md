#Installation of ubuntu Tips

## Installing Ubuntu

###TODO

##Getting your nvidia card working (installation of drivers)

#### Option 1 (try first)
1. Open the additional drivers path

2. If there are no drivers available for your nvidia card run the following:
``sudo add-apt-repository ppa:graphics-drivers/ppa``
``sudo apt update``

3. Select the latest version and install it.

#### Option 2

If the drivers are not displayed, try installing it by hand:

``sudo apt install nvidia-driver-415``

But first check on internet what should be the appropiate driver for your card (it may not be 415 but other number).

### For switching between intel and nvidia drivers:

Install nvidia prime:
``sudo apt-get install nvidia-prime``

Then you can switch between drivers using the following commands in the terminal:
``sudo prime-select intel``
``sudo prime-select nvidia``

Or do it through the GUI-> Open *NVIDIA X Server Settings*, click Prime Profiles, and the switch manually

Some window errors in Ubuntu might appear from time to time (specially after booting the system), but until the moment I have just ignored them and nothing bad has happened.

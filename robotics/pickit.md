Pick it
=================================

Configure the network

1. Connect the cable to an ethenet port
2. Configure the network with automatic DHCP
3. In **Google Chrome** open the ip address `http://192.168.66.1/`
4. Voila! you see the interface

ROS interface
------------------

link ros integration: `https://support.pickit3d.com/article/52-the-pick-it-ros-interface`

Set your local system to use the  ROS master of the Pick-it system.
```shell
export ROS_MASTER_URI=http://192.168.66.1:11311/
```

Set the  ROS_IP environment variable to point to the IP of your local system.
```shell
export ROS_IP=<local-pc-ip>
```
**NOTE**: for *local-pc-ip* check `ifconfig` of the ethernet port used by pickit

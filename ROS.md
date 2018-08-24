ROS COMMNANDS
==========
Link to isntal: http://wiki.ros.org/kinetic/Installation/Ubuntu
Link for tutorials: http://wiki.ros.org/ROS/Tutorials


CATKIN
-------------

To ignore packages when compailing with ```catkinmake``` in the workspace:
* Add a file *CATKIN_IGNORE* (you can run ```touch CATKIN_IGNORE``` inside the package folder in the terminal) 

ROSBUILD
-------------

1) Check if your software is in the ```ROS_PACKAGE_PATH```

```
  export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:<your-bin>  (for exmple: ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:/home/cristian/rosbuild)
```

2) Go to the package and build the package
```
roscd <pkg>
rosmake
```

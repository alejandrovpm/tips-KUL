ROS COMMNANDS
==========
Link to isntal: http://wiki.ros.org/kinetic/Installation/Ubuntu
Link for tutorials: http://wiki.ros.org/ROS/Tutorials


CATKIN
-------------

To ignore packages when compiling with ```catkin_make``` in the workspace:
* Add a file *CATKIN_IGNORE* (you can run ```touch CATKIN_IGNORE``` inside the package folder in the terminal)

ROSBUILD
-------------
It is recommended to use Catkin instead of rosbuild since ROS groovy.

1) Check if your software is in the ```ROS_PACKAGE_PATH```

```
  export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:<your-bin>  (for exmple: ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:/home/cristian/rosbuild)
```

2) Go to the package and build the package
```
roscd <pkg>
rosmake
```

##ROSDEP

When you clone a ROS package and save it into the src directory of a workspace, and get dependency errors after running catkin_make to build the code, you can use rosdep.

Go to the directory of the workspace (e.g. ``cd catkin_ws``) and run the following line:
``rosdep install --from-paths src --ignore-src -r -y``

That will install all the dependencies that are missing and needed to build the project. 

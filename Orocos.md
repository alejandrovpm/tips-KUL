# OROCOS

Useful documentation

- Orocos Cheat Sheet: <http://www.orocos.org/stable/documentation/rtt/v2.x/doc-xml/orocos_cheat_sheet.pdf>
- RTT Cheat Sheet: <http://www.orocos.org/stable/documentation/rtt/v2.x/doc-xml/rtt_cheat_sheet.pdf>
- Component Builder's Manual: <http://www.orocos.org/stable/documentation/rtt/v2.x/doc-xml/orocos-components-manual.html>
- lua Cookbook: <http://www.orocos.org/wiki/orocos/toolchain/luacookbook>
- lua RTT bindings: <https://people.mech.kuleuven.be/~orocos/pub/stable/documentation/ocl/v2.3.x/doc-xml/rttlua.html>

## Components

Orocos components are organized in packages as ROS. To create a component

```
orocreate-catkin-pkg <name of the package>
```
it generates
- CMAkeLists.txt (define to generate the executables and target to specific libraries).
- package.xml (specify dependencies of other libraries).
- \src

A component contain at leas two files:

### Header file (@Pkgname@-component.hpp)
Variable and functions definition

```c++
#include <rtt/RTT.hpp>
#include //...

class @Pkgname@ : public RTT::TaskContext{
public:
    @Pkgname@(std::string const& name);
    bool configureHook();
    bool startHook();
    void updateHook();
    void stopHook();
    void cleanupHook();

private:
// Ports and variables deffinition
RTT::OutputPort < std::vector<double> >  outport;
std::vector<double>               vector;
};

```
### Cpp file (@Pkgname@-component.cpp)
Implementation and algorithms

```c++
#include "@pkgname@-component.hpp"
#include <rtt/Component.hpp>
#include <iostream>

@Pkgname@::@Pkgname@(std::string const& name) : TaskContext(name),
 // initialization of variables that will be used as in ports, properties services, among others.
vector(size,initial_value),
// ...
{
  addPort("outport",outport);
  outport_pose.setDataSample(vector);
}

bool @Pkgname@::configureHook(){
// Configuration of variables
  return true;
}

bool @Pkgname@::startHook(){
// Checks bebore start to run the component
  return true;
}

void @Pkgname@::updateHook(){
// Here is written all the algorithm inside the loop
}

void @Pkgname@::stopHook() {
}

void @Pkgname@::cleanupHook() {
}

/*
 * Using this macro, only one component may live
 * in one library *and* you may *not* link this library
 * with another component library. Use
 * ORO_CREATE_COMPONENT_TYPE()
 * ORO_LIST_COMPONENT_TYPE(@Pkgname@)
 * In case you want to link with another library that
 * already contains components.
 *
 * If you have put your component class
 * in a namespace, don't forget to add it here too:
 */
ORO_CREATE_COMPONENT(@Pkgname@)
```

## Deployer

### C++
`deployer -s file.ops`


### LUA
`rtt_lua -i file.ops`

To read from the traditional deployer run `deployer -s file.ops` with `file.ops`:

```c++
//load the lua service
loadService ("Deployer","Lua")

//execute your deployment file
Lua.exec_file("lua_file.lua")
```


## Extras
### rtt_tf
docs:<https://github.com/orocos/rtt_ros_integration/tree/toolchain-2.9/rtt_tf>

This package provides an Orocos RTT component for utilizing the **TF** rigid body transform library from within Orocos.

Do not forget to initialize a component `rtt_tf::RTT_TF`

```c++
import("rtt_ros");

// Import and load the TF component
ros.import("rtt_tf");
loadComponent("tf","rtt_tf::RTT_TF");

// Connect operations the tf component's provided "tf" service to another
// component's required "tf" service (easily created with the C++ API shown in the
// next section)
loadComponent("my_component","MyComponent");
connectServices("my_component","tf");
```

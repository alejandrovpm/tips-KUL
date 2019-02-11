#CMake

CMAKE for dummies:
https://www.youtube.com/watch?v=7W4Q-XLnMaA

The purpose of CMake and Make is to compile C and C++ code in an organized and systematic way, instead of compiling with g++/gcc and a bunch of flags which have to be written everytime.

The purpose of CMake is to automatically generate MakeFiles. In the past MakeFiles were written down manually, which can be very time consuming. The MakeFiles are used by Make in order to compile C and C++ code. I will write an example and explain each step:

1. Create the CMakeLists.txt file in the project folder, which will specify how the program should be compiled. There are a bunch of commands.

2. Create the build directory: ``mkdir build`` and then ``cd build``

3. Run ``cmake <directory of the CMakeLists.txt>``. Because you are probably in the build directory, the directory is the previous one (expressed with ..). Thus, ``cmake ..``

4.  Run ``make``, which will build (compile and link) your project with the specified configuration provided in the MakeFile (which you specified indirectly with the CMakeLists.txt)

Ubuntu Tips
===================
-------------
Terminal
----------------
* To look for the last commands used starting by some letters.

  * *ctrl r* + fraction of the command

### Finding words and files   

* To find words inside a file in the current path type: ```grep -r 'key_word'```
* You can also look for files with same extention e.g. ```*.pdf``` or that start with the same name ```hola*```
* more advances commands look for words in subset
```
sudo aptitude search rtt | grep geometry-msgs
rosmsg list | grep Wrench
```
* To find files in the : ```locate <name of the file>```

### Terminator
* To maximaize the current shell press: *ctrl+shift+r*

### Symbolic links
In `/usr/local/bin` there are the symbolic links to the executable file.
* To create one: `sudo ln -s <path of the executable link> /usr/local/bin/<name to execute>`

### Change gcc version

Sometimes the version of the C and C++ compiler (gcc) can have compatibility issues. For example, to compile etasl, gcc 5.4 or 5.5 is needed. 
In order to install several GCC, G++ or GFortran versions, you should add the `ubuntu-toolchain-r/test` repository:
```shell
sudo add-apt-repository ppa:ubuntu-toolchain-r/test & sudo apt-get update
```
After that, you can install the desired versions like this:
```shell
sudo apt-get install gcc-5 g++-5 gfortran-5
sudo apt-get install gcc-7 g++-7 gfortran-7
sudo apt-get install gcc-9 g++-9 gfortran-9
```
You can then set the alternatives for your GCC compiler.
First of all, remove any old set alternatives:
```shell
sudo update-alternatives --remove-all gcc
```
And then set every alternative, with a priority number going from 1 (min) to 100 (max)
```shell
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 90 --slave /usr/bin/g++ g++ /usr/bin/g++-5
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 80 --slave /usr/bin/g++ g++ /usr/bin/g++-9
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70 --slave /usr/bin/g++ g++ /usr/bin/g++-7
```
Now you can change your GCC version running in the terminal:
```shell
sudo update-alternatives --config gcc
```

and then type the corresponding number of the version (according to the logged table)

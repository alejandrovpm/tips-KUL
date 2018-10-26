# Lua Beginners

**Usefull tutorials:**
www.lua.org/pil/contents.html
This file contains the information presented in the first tutorial (getting started) in the Lua Beginners part.

## Importing libraries
### dofile() function

**Syntax:**
``` dofile("<filename.lua>")```

**Explanation:**
After executing the command, all the functions declared in the file will be available to use. In addition, if a function is called inside this file, this will be executed. In other words, is equivalent of pasting the code written in the file instead of calling the dofile() function. This is particularly usefull for testing functions in the lua prompt.

### require() function

Often this function is preferred to imort libraries. It has two differences with respect to the dofile funtion (as can be seen here: www.lua.org/pil/8.1/html )

### print() function

**Syntax:**

```print(data)```

**Explanation:**

Prints the value of the data variable into the promts. data variable can contain string or number values. It is particularly usefull to see values of variables after operations, or informing something to the user.

## Variables
**Create**
Variables can be created without declaring the type of the value:
```a = 1```

**Delete**
If you want to delete a variable, simply asign nil to it.
```a = nil```
This works because if you try to access a variable that doesn exist, it is going to have a nil value. In other words,
a global variable is existent if and only if it has a non-nil value

**Local Variables**
Variables are created global unless specified otherwise.
```local a=1```
If it is local it means it will have a short life and will be deleted outside the scope of the variable (e.g if declared in a for loop, the variable does not exists outside the loop)

**Multiple Declarations**

In lua multiple variables can be created in one line as follows:
```a,b = 2,1```
A value of 2 is assigned to a and a value of 1 to b. To swap the variables simply written
```a,b=b,a```

### Comments
To coment a single line:
```--here is a comment```

To coment multiple lines:
```
--[[
here
is
a comment
--]]
```
###Running Script in a bash shell
There are two options. You can just type:

```lua <filename.lua>```

Or, ff the first line of the script contains the following,
```#!/usr/bin/env lua```

then you can run the file just like this:
```./<filename>```

### Types of data
There are eight types of data in lua: nil, boolean, number, userdata, function, thread and table
All of them can be assigned to variables. This is usefull with functions, as they can be stored in variables and, in consequence, passed as arguments to other functions


# Lua Advanced

To print the information for tables
```
for i,v in pairs(mymod) do print(i,v) end print tables
```
It works with key `i` and values v`

Lua Path
------------------

* To see if the library folder is in the path type in the terminal outside lua environment
```
    export | grep LUA_PATH
    export | grep LUA_CPATH
```

* To add the folder to the Lua Path type in the terminal
```
    export LUA_PATH="$LUA_PATH;<path of the folder>/?.lua"					
```
"?" is for add all the files with lua extention


----------------
Modules
----------------
* Declare functions as locals

* When calling the libraries: ```mymod = require('library')```

* Call functions in the library: ``` mymode.funct....(args)```

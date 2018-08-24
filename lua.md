Lua
=================

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

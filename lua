To print the information for tables
for i,v in pairs(mymod) do print(i,v) end print tables 

------------------------- For modules --------------------------------

-> Declare functions as locals

-> When calling the libraries
  mymod = require('library')
  
-> Call functions in the library
    mymode.funct....(args)
    
-> To see if the library folder is in the path type
    export | grep LUA_PATH
    export | grep LUA_CPATH

-> To add the folder to the Lua Path type
    export LUA_PATH="$LUA_PATH;/home/cristian/etasl_ws/src/fiad_skills/scripts/"name of the folder"/?.lua"					-- "?" is for add all the files with lua extention in the folder
    
  
  
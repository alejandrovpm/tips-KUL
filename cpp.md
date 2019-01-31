# C++ tips

A series of very good tutorials can be found in the following link:
https://www.youtube.com/playlist?list=PLlrATfBNZ98dudnM48yfGUldqGD0S4FFb
in the "TheChernoProject" youtube channel.

Most of the tips written in this document are taken from there.

###Compile in ubuntu

To build an executable file (.exe) in ubuntu from the terminal, you can use the following command (example given for three files):
``g++ first_file.cpp second_file.cpp third_file.cpp -o selected_name_for_the_executable``

It compiles and also links (compiler and linker, respectively) the program. The compiler generates machine binary language from each file separately, that can be executed by the computer. The linker links and includes all the different files into just one executable. This is very important since, if there is an error, you can distiguish if it comes from the compiler or from the linker, and then it will have a better idea on how to solve it.

That is the basic command, which has many variants.

### Preprocessor Macros

These are instructions that are executed in the early steps of the compiling process. Macros are included with # at the beginning. They can be placed in any part of the code (not necessarily at the beginning)

**#define**

Is used to define repetitive parts of code that are going to be executed. The compiler copy-pastes the defined parameter in every part of the code. By convenction, they are written in capital letters. Examples:

``#define HELLO`` -> it creates an empty parameter called HELLO
``#define MY_SALARY 484513213231851`` -> it defines the "parameter" MY_SALARY, that whenever used in the code, is going to be replaced by the value.
``#define LOG(x) std::cout << "The message is: " << x << std::endl`` -> it creates an empty parameter called HELLO

To use the defined parameters just write them in your code. Examples:

``int remaining_money  = MY_SALARY - 1000;``
``LOG("hola");``

**#include**

It is used specially for header files (.h and .hpp), but the compiler literally copies and pastes the code in the file when it is used. Example:

``#include <iostream>`` The compiler copies and pastes all the code made in the iostream library in the exact spot it is called, and then it is compiled all together. The file between <> has to be in one of the include directories.

``#include "My_file.h"`` The compiler includes (copy-pastes) the code of the file My_file.h that is saved in the same directory as the current file (that's why te "" instead of the <>). You could also, for example, include a file that is in the parent directory like this: ``#include "../My_other_file.h"``

**#if    #endif**
Conditionals to compile code if the condition is true. The difference of the c++ conditionals is that code can be excluded from the compilation (for example, useful for debugging).

**#pragma once**
This header file is used to avoid repeating the compilation of the same file multiple times. In case your project has multiple files, and you included a header file twice in the same file (can happen indirectly), if you include this macro it will avoid the definition of everything more than one time and will avoid a compilation error.

**#ifndef    #endif**
it is the older way of doing the #pragma once. If a parameter is not defined, then it defines it and your code is included. (note: the following code is in a header file that you would #include in another file).

``#ifndef _IS_DEFINED``
``define _IS_DEFINED``
``\\your code``
``#endif``

# C++ tips

A series of very good tutorials can be found in the following link:
https://www.youtube.com/playlist?list=PLlrATfBNZ98dudnM48yfGUldqGD0S4FFb
in the "TheChernoProject" youtube channel.

Most of the tips written in this document are taken from there. The only things that are going to be included here are the ones that are different from other languages (e.g. if statements and loops are not going to be included here)

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


### Pointers and References

**Pointers of primitive data types:**
Pointers are just integers that contain a memory address that point to a specific data (or variable). They occupy 32 bits (4 bytes) of space when a 32 bits system is used. The addres says where in the memory the data BEGINS. Where it ends depends on the size of the type of data. Basic use:

``int var = 8;``
``void* pointer1 = &var;``
``int* pointer2 = &var;``

Two pointers are created, which cointain exactly the same information (same addres, same size) because they are both integers with an address. If you want to change the value of the variable var, you can dereference it as follows:
``*pointer2 = 3;``

If you do it with pointer2 is not going to work because the compiler doesn't know how much amount of memory to assign to the variable.

You can also have double pointers (or a pointer to another pointer), because pointers are memory stored variables that contain an addres:

``int** ptr = &pointer2;``

**Pointers to classes:**

Imagine that obj1 is an object of a class named My_Class. You can create a pointer of it like this:

``My_Class* pointer = &obj1;``

To call a method in that object use the -> member access operator

``pointer->method1();``
``this->method1();`` This is a pointer to the current class.


**References:**
References are just a cleaner way of using pointers (is a simpler sintax), but there is nothing you can do with with references that you cannot do with pointers.

A reference can be used as a simple alias:

``int var1 = 5;``
``int& ref = var1;``

They are both making reference to the same variable (there are not two separate variables created). saying ``ref=1;`` or ``var1=1;`` is the same.

They can be used to modify variables by passing them through parameters of functions:

```
void Increment(int& value)
{
  value++;
}
```

If we don't use a reference, a copy of value is created and used as a local variable. If we pass the reference, we are directly increasing by one the variable passed as a parameter.

###Static variables and functions

You can use the static reserved word for multiple purposes, and means different things depending on what you use them for.

**static Outside Classes:**

If you declare a static variable or a static function (``e.g. static int =1;``), you are actually making it local. This means that other translation units (other .cpp files) are not going to have access to this. So, you can for example have two static variables in 2 different .cpp files, and each one will be treated as different variables (otherwise you will have a linker error). It also applies to functions or if statements. If you declare a local variable inside a function with the static keyword, then that variable is not going to be deleted automatically each time the function is called. For example:

```
 void function(){
  static int counter = 0;
  counter++;
}
```
Each time function() is called the local counter is going to keep increasing (only before calling it for the first time it will have the value 0). This is because the static variables are all initialized at the beginning of the execution of the program.
**static Inside Classes:**

If you declare a static variable or a function inside a class, it means that there is going to be only one instance of that variable/function across all objects, thus, less memory usage. Use it for a variable when the corresponding value of the property is shared among all objects. Use it with a function when the result does not depend on the objects properties. If you change the value inside one of the objects, you are going to do it as well for all the other objects (unless you declare it also const, which will prevent you for changing the value). Actually, its value can be modified without refering to the object, just to the class (e.g. ``Class_Name::variable = 2``)


###Namespaces:

They allow to include different functions (using the same function name) in different contexts. It is like doing rtt=require("rttlib") in lua instead of just require("rttlib"). For those who don't know lua, just ignore that :). To create a namespace:

```
namespace apple {

    void function1(){
      //Here goes any code of the function
    }
}
```

To use the function1() (or any other inside a namespace):

``apple::function1();``

In case you want to ommit typing apple:: every time (e.g. when you #include a library) you can do the following:

```
using namespace apple;
function1();
```

However, that is not recommended since you can have repeated function names (with errors or without errors at compilation) because you usually don't know all the names of the functions declared in the namespace. You can also just use it locally for a function or a nested namespace:

```
using apple::function1;
function1();
```

Or you can create shorter version of the namespace:

```
namespace a = apple;
a::function1;
```
###Enums
Enums are used to limit a variable or the parameter of a function to set of possible integer values. For example, if you want to limit a logger to have Error, Warning and Info levels, you can use a Enum to limit those options (represented by a integer value).

Refer to this video to learn how to use them:
https://www.youtube.com/watch?v=x55jfOd5PEE&index=24&list=PLlrATfBNZ98dudnM48yfGUldqGD0S4FFb

###Casses and Structures

Classes and structures are basically the same thing, only that by default the declared properties in classes are private and in structures are public (can be accessed outside the class or an instance of the class). As a recommendation (convection) use classes when you have more complex things with a lot of functions, and structures when you just want a way to organize some primitive data types in an structured way. In that way you can access the structure's properties publicly (without the necessity of any get method), and keep encapsulation just for classes. Or you can just ignore that and do whatever you want :).

**Create a class:**
```
class Entity
{
private:
double X,Y;

public:

Entity(): x(1),y(2){} //This is an alternative way to initialize the parameters. Default constructor

Entity(double x, double y)
{
  X = x;
  Y = y;
} //You can have more than one constructor

~Entity()
{

} //Destructor

function1(){}

}; //don't forget the semicolon
```
The destructor of the class gets called whenever the object is deleted. In heap allocation (when using the word *new*) the destructor is called when the delete function is called. In stack allocation the destructor is called whenever the instance of the class is out of scope. For example, if you create an instance inside a function, the destructor will be called automatically as soon as the function ends.
**Create an instance (object) of the class:**

You can create the object using any constructor you'd like:
``Entity obj1(10.0,5.0);``

That will create the object in the stack memory (you should try always to do that because it's faster) instead than the heap. That means that the object will be erased automatically when the program gets out of the scope. Also, if class is to big, or there are many objects of the class, there will be not enough space in the stack to store them. Then you will need to creat the object in the heap using the *new* keyword.

``Entity* obj1 = new Entity(10.0, 5.0);``

Since it is a pointer, you should dereference it to call its functions:

`` (*obj1).function1();``

Or just use the -> operator to make it cleaner (does the same):
`` obj1->function1();``

If you create an object on the heap, you have to delete it manually to free the memory at some point (you don't have to otherwise):

``delete obj1;``

That delete function will also call the destructor of the class.

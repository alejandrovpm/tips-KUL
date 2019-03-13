#Editors and IDEs Tips

##ATOM

Atom is a GREAT editor in which you can install additional plugging and include more functionalities to write your code (in many languages), depending on your necessities.

It also works fine with high-resolution monitors in contrast to other editors/IDEs such as Eclipse, where the icons look tiny.

### Nice tricks 
- Holding *ctrl* and clicking in several parts of the file you can have multiple editting points.
- Select a word and press the correponding key to open brackets ([],{},(),"",...) the selected word will be inside the brackets
- Select a word and press *ctrl + d* the next instance of the world will be selected also
- To duplicate a line press *ctrl + shift + d*

###Packages to install:

**script:** Enables you to run code (in many languages) directly in the editor and view the results in a window embedded in atom.

https://atom.io/packages/script

**markdown-preview-enhanced:** Allows you to view Mark Down text as you would see it for example in github.

**dbg-gdb:** Lets you debug directly into the atom editor. Steps to use it after installing it:

1. Add the breakpoints in the lines you want to observe in the debugging (Shortcut: **F9**) and SAVE the file.

2. Compile with the gcc (for C) or g++ (for c++) using the -g or -ggdb flag in order to include the breakpoints information to the compiler and generate an executable special to debug. The -ggdb has slight differences and it is used because it provides "additional" features when using the gdb debugger. This executable is just used to debug and must not be used just to run it (released version) because the compiler will not optimize it. The -Wall is optional, and enables you some of the warnings (not all, despite the name) that the compiler can give you so that you can correct mistakes. An example for 3 cpp files is shown here:

``g++ -Wall -ggdb file1.cpp file2.cpp file3.cpp -o name_of_file``

3. In the left you can see the tree explorer of atom (where it shows you the files in your current project directory). Right click the executable (name_of_file) and press Debug this file (Shortcut: **Ctrl+F5**). You can click save to avoid repeating this step (just number 3.) in the future.

4. After saving it Press **F5**, select the configuration you just saved, and then you can use the buttons and observe the values of the variables easily.

**gpp-compiler:** For C and C++ code allows you to compile and run your codes directly from atom, and display the results in an external terminal. Can be used when you need inputs, as the script package doesn't allow to provide inputs in the logger. It also allows you to debug by using gbd manually (you have to learn some basic commands instead of having the buttons that the dbg-gbd provides).

This package can be used in order to replace step 3 of the dbg-gdb. To do so follow the following steps:

1. Go to: Edit -> Preferences -> Packages -> gpp-compiler -> settings

2. Add the following compiler command options: -Wall -ggdb -o name_of_file

3. Disable the keybidings (because they are in conflict with the dbg-gbd package) and also disable the run after compile option (because its easier to run the file using the script package instead: we are doing this just when debugging).

4. In the left you can see the tree explorer of atom (where it shows you the files in your current project directory). Select the .cpp files you want to compile (holding shift), then right click, and select "compile and run" (though, it will not run because you disabled the option).


**language-lua:** Add color formating to lua code (by default atom doesn't provide it, in contrast to other languages)

**Atom-beautify:** Must have! with ctrl+alt+b it automatically indent the selected file and makes your code look pretty (for a lot of supported languages). If the identation doesn't look good for you, or you see it is slow, there are different modes for each language in the settings.

**Highlight-selected:** When you double click a word it highlights all the existing same words in the document.

**Todo:** You can a lot of todos as:  ``TODO: description`` (it has to be commented in your specific language) and then you can toggle a section in the editor that displays all the TODOS in all the files of the project.

**Teletype:** Allows multiple people to work in the same code at the same time (real time). It is super easy to use, you just copy an address that you give to your colleagues.

**Hydrogen:** Enables live scripts functionalities (like mathematica or jupyter notebooks) directly into Atom for many languages (yes, including c++, Julia, Lua, etc). Also gives you the possibility to include latex functions. Separate each section of code with a commented %%

**Autocomplete-paths:** When you are going to import a library (e.g. require in LUA), you can type more or less the file you want and it autocompletes the proper path.

**linter:** There are linter packages that you can install for each language. This basically tell you on the fly whenever you made a syntax mistake without the necessity of running your code. However, I don't use it because when you run it (using script or from the terminal), the environment also tells you about this mistakes.

**Column-select** Nice package to select blocks of code. In ubuntu just press *alt + shift + up/down/PgUp ...*


## Texstudio

Is a great editor for working with LaTex. In contrast to TexMaker (which is commonly more used), it allows you to increase the icon size when working with high resolution displays. That is the principal advantage with respect to TexMaker. Other than that, it is very similar.

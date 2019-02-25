# Tips for  GIT

Useful tutorial video:
https://www.youtube.com/watch?v=HVsySz-h9r4

### For help

Type in the terminal for documentation about branch, checkout, remote, add, push or others:
```
git branch/checkout/remote/add/push/... --help
```

## Local and Remote repository
Git work with two types repositories the ones in a PC/laptop (Local) and the ones in online (Remote).

- One remote repository can be connected to multiple local repositories (e.g. a person working from multiple devices in a project or multiple persons adding to the same remote project)

- In the same way, one local repository can be connected to multiple remote (e.g. A person want to upload special ones to A remote repository but no B)

### Getting started

To configure your information to allow other users to see who made the changes:

``git config --global user.name "<your name>"`` -> setup your name
``git config --global user.email "<your email>"`` -> setup your email

``git config --list`` -> run to check your configuration parameters

### To create/initialize a new local repository

This steps will instruct you on how to start controlling the version of your codes in an existing directory. All the files in the directory will now form part of the repository.

1. Go to your existing directory where your codes are stored (use cd command)
2. Run ``git init`` or ``git init .``to create the repository. You should notice that a .git file is created.
3. Run ``git add .`` and then ``git commit -m "Initial commit"``

### To create/initialize a new remote repository
After creating the local repository, one can create a remote repository to push the information to the cloud.

The following configures a default remote repository that will be called whenever you push (test_erwin is the name of the repository). The namespace is usually your U or R number (staff or student number)
``git remote add origin git@gitlab.mech.kuleuven.be:namespace/test_erwin.git``

Then when you want to push the repository, run:
``git push origin master``

If the repository exists then all the commits of your branch will be pushed. If it does not exists, then it will be created automatically (and also the commits will be pushed).

To use other remote repository then run the following and repeat the previous steps
``git remote remove origin``



### Stop tracking changes of a local repository

1. Go to your existing directory where your codes are stored (use cd command)
2. Run ``rm -rf .git`` to delete the repository. You should notice that the .git file is deleted.

### Useful commands
- check available remote repositories: ```git remote -v```
- Check the different commits that have been made by different authors: ```git log```
- Check changes made in the repo with the differentiation tool in the terminal: ``git diff``

## Download/Upload files

### for cloning files from a local/remote  repository
1. Change your destination file with ```cd <directory>```.
2. Download the files from the desired repository by using the following command
 `` git clone <URL> ``

For example to download from this repository: ```git clone https://github.com/alejandrovpm/tips-KUL```.

### to upload/update files to the master repository
1. Select the files you want to upload: ```git add <file>```. If you want to add all the files of the current folder instead of just one file: ```git add .```
2. Record the added files into the local repository: ```git commit -m '<message>'```. The message should be use to describe briefly the changes/updates
3. Update the files you commited to the remote repository: ```git push origin master```. There is also this variant: ``git push --set-upstream origin master`` but for the moment I'm not sure about the difference (you should check it yourself)

In case you want to cancel the commited files, but keep the newer version of the files in the computer, run: ```git reset --soft HEAD^```

## Branches
Git work as a tree with multiple branches.

- There is a main branch that usually is named **master** in this usually only tested code is merged, it is managed usually by the owner of the repository.

- Multiple branches are created to develop and test code without damaging the **master** branch.


### commands for the terminal
- To create and change to a new branch: ``` git checkout -b <new-branch> ```.
- To check available local branches: ```git branch -v```.
- To check available local and remote branches: ```git branch -a```.
- To change to an existing branch: ``` git checkout <existing-branch> ```.

### Differentiation tool
A recommended tool for the terminal is _gitk_.

To launch it, go to a repository in the terminal and type ```gitk``` you will see different commits.

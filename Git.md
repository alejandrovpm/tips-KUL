# Tips for  GIT

### commands for documentation in the terminal

Type in the terminal for documentation about branch, checkout, remote, add, push or others:
```
git branch/checkout/remote/add/push/... --help
```

## Local and Remote repository
Git work with two types repositories the ones in a PC/laptop (Local) and the ones in online (Remote).

- One remote repository can be connected to multiple local repositories (e.g. a person working from multiple devices in a project or multiple persons adding to the same remote project)

- In the same way, one local repository can be connected to multiple remote (e.g. A person want to upload special ones to A remote repository but no B)

### commands for the terminal
- check available remote repositories: ```git remote -v```

## Branches
Git work as a tree with multiple branches.

- There is a main branch that usually is named **master** in this usually only tested code is merged, it is managed usually by the owner of the repository.

- Multiple branches are created to develop and test code without damaging the **master** branch.

### For downloading files from a repository
1. Change your destination file with ```cd <directory>```.
2. Download the files from the desired repository by using the following command
 ```git clone <URL>```
For example to download from this repository: ```git clone https://github.com/alejandrovpm/tips-KUL```.

### To upload/update files to the master repository
1. Select the files you want to upload: ```git add <file>```. If you want to add all the files of the current folder instead of just one file: ```git add .```
2. Record the added files into the local repository: ```git commit -m '<message>'```. The message should be use to describe briefly the changes/updates
3. Update the files you commited to the remote repository: ```git push origin master```.

In case you want to cancel the commited files, but keep the newer version of the files in the computer, run: ```git reset --soft HEAD^```

### Branches
- To create and change to a new branch: ``` git checkout -b <new-branch> ```.
- To check available branches: ```git branch -v```.
- To change to an existing branch: ``` git checkout <existing-branch> ```.

### Differentiation tool
A recommended tool for the terminal is _gitk_.

To launch it, go to a repository in the terminal and type ```gitk``` you will see different commits.

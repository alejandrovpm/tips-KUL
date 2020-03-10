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

### Setting an SSH key to a remote repository

To avoid entering your password each time you push, pull or clone, you can set an SSH key pair.

Click [here](https://gitlab.mech.kuleuven.be/help/ssh/README#generating-a-new-ssh-key-pair) for the instructions (need access to gitlab.mech.kuleuven.be). The one that has worked for me is the RSA type.

If it fails and gives the following error "sign_and_send_pubkey: signing failed: agent refused operation" when cloning and asks the git@gitlab.mech.kuleuven.be's password, try the following in the terminal (that solved it for me after trying a lot of different things)

```sh
eval `ssh-agent -s`
ssh-add
```

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

### To push to multiple remote repositories at once.

Based on [this forum](http://caseyscarborough.com/blog/2013/08/25/pushing-to-multiple-remotes-using-git/):

If you currently have a remote repository defined as origin, rename it so that you can later on push things just to that one:
`git remote rename origin github` -> For example, to name it "github"

To add another remote repository:
`git remote add otherRepo git@gitlab.mech.kuleuven.be:group/local_repo.git` -> Named "otherRepo" for the example

Afterwards, you'll want to set up your origin remote to push to both of these. Issue the following command:
`git config -e`
This will open the configuration file (found in .git/config) in your default terminal editor.

Add the following lines to the end of the file:

```
[remote "origin"]
  url = git@gitlab.mech.kuleuven.be:group/local_repo.git
  fetch = +refs/heads/*:refs/remotes/otherRepo/*
  url = <Your remote github repo URL>
```

If you do this, each time you perform a `git push origin master`, all the remote repositories included will be updated. If you do a `git pull origin master`, you will be pulling from the first url you provided (in this case the "otherRepo" repository)

You can also push/pull to single repos:
`git push github master`
`git push otherRepo master`

### Stop tracking changes of a local repository

1. Go to your existing directory where your codes are stored (use cd command)
2. Run ``rm -rf .git`` to delete the repository. You should notice that the .git file is deleted.

### Useful commands
- check available remote repositories: ```git remote -v```
- Check the different commits that have been made by different authors: ```git log```
- Check changes made in the repo with the differentiation tool in the terminal: ``git diff``

## Download/Upload files

### To clone files from a local/remote  repository
1. Change your destination file with ```cd <directory>```.
2. Download the files from the desired repository by using the following command
 `` git clone <URL> ``

For example to download from this repository: ```git clone https://github.com/alejandrovpm/tips-KUL```.

### To update the local repository:

To update your local repository from the changes made in a remote one:
`git pull origin master`

This will update the changes from the repository that is defined as "origin". Pull is equivalent of performing a git fetch + a git merge. The first one brings the changes to your local repo and the second one is for merging both if changes has been performed in both.

### To upload/update files to the master repository
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

## Differentiation tool
A recommended tool for the terminal is _gitk_.

To launch it, go to a repository in the terminal and type ```gitk``` you will see different commits.

## Ignoring files by its extention

Git allows you to define files that you don't want to synchronize i.e. you do not want these files in your remote repository

To do so, first create a file in the root of the repository called **.gitignore**

This file contains in it the files that you do not want to synchronize. You also can define extensions of files that you do not want. For instance a typical file for a repository for latex articles can be:

```
# Compiled source #
###################
*.aux
*.bbl
*.blg
*.dvi
*.log
*.out
*.ps
*.bak
*.fdb_latexmk
*.fls
*.synctex.gz
```

This file avoid to synchronize all the auto-generated files with the extensions above.

## Latex Maths

In order to be able to visualize Latex Equations in GitLab, use this syntax:

This math is inline $`a^2+b^2=c^2`$. The quotes are only visible in Atom, but when you git push to the gitlab repo they are not visible (although required).

This is on a separate line

```math
a^2+b^2=c^2
```
# Git Stash

Very good explanation for millenials here:
https://www.youtube.com/watch?v=KLEDKgMmbBI

**Stash your work:**
```sh
git stash save "<Your description>"
```
This will "remove" your uncommited changes in the branch and store them as a stash.

**List of stashes:**
```sh
git stash list
```

**Apply the stashed changes**
You can perform it in any branch (does not matter if you made the changes in a different branch). This will apply the stash to your current branch but keep it in the stash list
```sh
git stash apply <optional name of stash>
```
**Pop the stashed changes**
The same as Apply but in addition it removes the stash from the list
```sh
git stash pop <optional name of stash>
```
**Delete a stash (drop)**
You can get rid of an stash by:
```sh
git stash drop <name of stash>
```

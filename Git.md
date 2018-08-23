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

### commands for the terminal
- To create and change to a new branch: ``` git checkout -b <new-branch> ```.
- To check available branches: ```git branch -v```.
- To change to an existing branch: ``` git checkout <existing-branch> ```,

### Differentiation tool
A recommended tool for the terminal is _gitk_.

To launch it, go to a repository in the terminal and type ```gitk``` you will see differnt commits.

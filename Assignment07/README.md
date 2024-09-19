# Git Assignment
##  PART A

- Create a folder ninja at the root level of your cloned code
``` 
git clone https://github.com/radhagondchor/assignment07.git
cd assignment07/
mkdir ninja
```
- Add a file README.md with content "Trying fast forward merge" in  ninja folder.
```
cd ninja/
echo "Trying fast forward merge" > README.md
```
- Create a branch ninja and move to it
```
git checkout -b ninja
```


- Run git status command
```
git status
```

- Commit your changes to ninja branch
```
git add ninja/README.md
git commit -m "Modified README.md with content 'Changes in ninja branch'"
```
- Merge ninja branch to master branch make sure that a new commit get's created
```
git checkout ninja
git add .
git commit -m "Added README.md to ninja folder"
Let's play around with process:
clear a log file of running process
delete a log file of running process and see what happens to process
elevate the priority of a process
git checkout master

git merge --no-ff ninja
```
- Assuming you are in the master branch, modify README.md with content "Changes in master branch", commit the changes in master branch.

```
git checkout master

echo "Changes in master branch" > ninja/README.md

git add ninja/README.md
git commit -m "Modified README.md with content 'Changes in master branch'"
```
- Switch to ninja branch, modify README.md with content "Changes in ninja branch", commit the changes in ninja branch.
```
git checkout ninja

echo "Changes in ninja branch" > ninja/README.md

git add ninja/README.md
git commit -m "Modified README.md with content 'Changes in ninja branch'"
```
- Merge the ninja branch to the master branch in such a fashion that a merge conflict is generated and resolve it using the ours and theirs concept so that the changes of the ninja branch overrides changes in master branch.
```
git checkout ninja
git add ninja/README.md
git commit -m "Modified README.md with content 'Changes in ninja branch'"

git checkout master

echo "Changes in master branch" > ninja/README.md
git add ninja/README.md
git commit -m "Modified README.md with content 'Changes in master branch'"

git merge ninja

git checkout --theirs ninja/README.md
git add ninja/README.md

git commit -m "Merged ninja branch into master, keeping changes from ninja branch"
```

#### Good To Do
- Simulate the above scenarios using rebase
```
git checkout ninja
git add ninja/README.md
git commit -m "Modified README.md with content 'Changes in ninja branch'"

git checkout master
echo "Changes in master branch" > ninja/README.md
git add ninja/README.md
git commit -m "Modified README.md with content 'Changes in master branch'"

git checkout ninja
git rebase master

echo "Changes in ninja branch" > ninja/README.md
git add ninja/README.md
git rebase --continue
```


## Release 2: Basic Git Commands
Define the following commands and describe how they work/what they do.  


#### add

The `git add` command is used to add files to a git repository or to
stage changes to an existing file(s) in a respository. 
`git add [file]` will add or change that specific file.
`git add .` will add any new files and stage any new changes in your git repostiory. 

#### branch
`git branch` enables you to see all the branches of code in your git repository.
Branches are separate copies of the code that allow programmers to develop in an
isolated environment. 

#### checkout
`git checkout [branch]` will switch to the [branch]

#### clone
`git clone` is used to copy an existing git repository; it is used to make 
a local copy of a remote repository, such as on github. With this clone,
you can make changes on a local machine and then push the changes back 
up to the server. 
`git clone [url]` will clone the repository at [url]

#### commit
`git commit` is used to push changes on your local repository up to a remote
repository on a server.
use `git commit -am "messaage about updates"` to push all staged changes

#### fetch
`git fetch` is used to pull changes from a remote repository down onto 
a local machine. 
You can fetch changes made to the master repository on the server, or 
you can set a new remote to specify an upstream repository using 
`git remote add upstream [URL]`
'git fetch upstream`

#### log
`git log` will show a log of recent changes made to files in your repository.
`git log -pretty=oneline` is a nice way to display these changes.

#### merge
`git merge` combines changes made to two separate branches in the git repository.
First, switch to the branch you wish to merge into. Then use `git merge [branch]`
to merge the changes from [branch] into the current branch. 


#### pull
`git pull` works similiar to `git fetch`. It pulls changes from a remote repository 
and automatically merges them with the local repository.

#### push
`git push` pushes changes from a local repository up to a remote repository. 
`git push origin master` pushes changes up to the remote repository and merges
them with the master branch. 

#### reset
`git reset [file]` will remove a file from the staging area.
Use `get reset .` to remote all files from the staging area.

#### rm
`git rm [file]` will remove [file from the repository]

#### status
`git status` shows a log of all files that have been changed, added, or removed from staging. 
It will also provide information on the current branch and its status compared to
the master branch.

## Release 4: Git Workflow

- Push files to a remote repository
- Fetch changes
- Commit locally

<img src="http://jeffkynaston.github.io/images/Week-6-git-workflow.png">
<img src="http://jeffkynaston.github.io/images/git-commands.pdf">

## Release 5: Reflection

I have been using git and the command line for all of phase 0 so I am pretty comfortable with it. I also had a fair amount of experience from doing the one month rails and jumpstart sintatra tutorials before phase 0. Fixing merge conflicts is one thing I don't have a lot of experience with, but I am sure that after I have to do it a couple times I will feel comfortable. 
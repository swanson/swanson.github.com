# The staging area
* This is like Pending Changes tab in TFS
* You can add/remove files (or individual lines!) in a 'loading dock'
* Working directory is not coupled to what git saves

# Common staging commands
* Similar to the operations you performing in the Pending
	Changes tab - check/uncheck, undo changes, view changes, etc
* git status - show the state of your loading dock
* git add FILE - add any changes in FILE
* git add . - add all changes in all files in your directory
* git rm FILE - remove whole FILE
* git diff FILE - show what you've changed

# Making a commit
* This is like the Check-In section in TFS
* You specify a message and the changes in your staging area get
	bundled together into a single commit
* But: in TFS, check-in pushes to the server, in git it does not
* Commits are local until you explicit 'push' them

# Why are local commits good?
* You can snapshot your code early and often
* Explore a big change, rollback if it doesn't work
* Split big changes into discrete units
* When you're ready to push, you can combine all your commits into one

# Getting changes from the server
* Get latest version -> git pull origin master
* TFS Check-In -> git push origin master
* origin -> alias for the remote repository (ie git.sep.com/project/your_project.git)
* master -> name of the branch you want

# Okay, so why git over TFS (or others)?
* School of thought: git is a tool to build your own SCM process
* If you use a single branch, with one remote repo, make one commit per task,
	don't track issues - then TFS isn't much different than git (though you
	don't have to deal with locks or no server connection)
* But the power of git comes from picking a better workflow

# How SEP.Amazon uses git
* We copied this workflow from [Hashrocket][hr] - accidentally, kinda...
* Highlights:
* * Efficient for developers
* * Handles features and bugs
* * Sane history

[hr]: http://reinh.com/blog/2009/03/02/a-git-workflow-for-agile-teams.html

# Branching
* Branching in TFS is a huge pain
* You copy certain folders
* You do some weird thing called 'cloaking'
* It's slow
* Everything is on the server

* Branching in git is awesome
* Whole project directory is branched
* It's fast to switch back and forth
* They can exist locally or on the server

# Feature branching
* Starting a task or bug fix? Make a local branch
* git checkout -b AMAZ-123-add-settings
* Do your normal stuff (git add/git commit)
* Make all the changes you need to finish the task
* [optionally] Squash all commits into a single commit
* Merge* your local branch back into the master branch

# Neat Tricks
* You notice a bug, how do you know you introduced it with your pending changes?
* git checkout master
* reload app, check for bug
* git checkout AMAZ-123-add-settings
* resume working on your branch

* Critical prod bug appears, you need a hotfix NOW
* git checkout master
* git checkout -b HOT-FIX
* make the fix, merge back and push
* git checkout AMAZ-123-add-settings
* resume working on your branch

* You need to tie your commits to issues in your tracker
* Git has scriptable hooks you can customize
* Want an equivalent to TFS "Enforce check-in policy?"
* Add a 'commit-msg' hook that requires your message to contain 'AMAZ-'
* This links the commit to the work item in Jira

* Add hooks that automatically run your unit tests when you push and reject 
 if the tests fails
* Add script to send chat message whenever someone pushes new changes
* Add hook to run your code through a lint-checker/formatter before making a commit

# Clean history
* git sometimes creates a 'merge commit'
* This pollutes your history with a bunch of commits that no one explicitly created
 and aren't really linked to anything
* if you speak git:
"We frequently rebase our local branches from upstream and squash before we merge back to master"
* Translation:
"Get Latest often and merge in your changes"

# Rebase
* Intermediate difficulty git-fu
* It seems scary at first, but it's not so bad
* Rebase: other people pushed some new changes, 'rewind' my changes, and then reapply them to the
  new code
* Get Latest when you have Pending Changes
* No conflicts - no manual merging - no problems

* Conflicts can be scary
* Setupd git mergetool to use something like p4merge or beyond compare
* Git merges each of your commits one-by-one
* If something really bad happens, you can abort the rebase and start over

# Interactive Rebase - aka Squashing
* Here are my local commits

* Implement new settings
* Fix bad merge
* Add unit tests
* Fix edge case throwing NullPointer
* Cleaned up unused variables

* Handy for me - kind of annoying for the team when trying to debug or find a specific build
* Use git rebase -i to combine into one commit

* [AMAZ-123] Implement new settings
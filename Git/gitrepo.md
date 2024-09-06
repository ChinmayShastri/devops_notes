# GIT & GITHub
### What is GIT?
- GIT is free, open source version control system, which helps a software team manage changes to source code over time.
- Helps team to rollback to previous version

### What is GIT Repository?
- GIT Repository contains Files, History, Config Managed by GIT.

### What are the Stage of GIT- 
- Working Directory
    - Area of Live Files, also known as Untracked area of GIT.  
- Staging Area
    - Staging Area is when GIT starts tracking and saving changes that occur in files.  
- GIT Directory
    - Also called ‘local Repo’, is your .GIT repo. It’s Area where GIT save everything.

### What is Remote Repository - GITHub
- Remote repository is stored on a code hosting service like GITHub or on an internal server.  
- Branch in GIT - It is a way to keep developing and coding a new feature to the software and still not aﬀecting the main part of the project.

### What is GIT Merge?
- GIT merge combines changes from one branch into another, typically used to integrate new features or bug fixes from a feature branch into the main branch.

### What is Reset and Revert?
➤ In GIT rollback of any changes can be done in 2 ways:
- Reset: Reset points local environment back to a previous commit.
- Revert: It adds a new commit at the end of the chain to "cancel" changes. If user have already pushed commits to the remote repo, a revert is a nicer way to cancel out changes.

### What is GIT Stash :
- Git stash temporarily saves changes you've made to your Working Diectory. We can only add tracking files in Staging area. 
- Ex commands:
    - Git stash  
    ```git stash save “message text”```
    - Git stash list  
    ```git stash list```
    - Git stash apply  
    ```git stash apply stash@{index}```
    - Git stash drop  
    ```git stash drop stash@{index}```

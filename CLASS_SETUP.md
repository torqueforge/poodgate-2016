The steps to use this to create the repository for a specific class are:

1. Create a new repository in the torqueforge organization at https://github.com/organizations/torqueforge/repositories/new
1. Grab the git url for the new repository (something like git@github.com:torqueforge/my_new_class.git)
1. cd to the root of _this_ project
```bash
cd /path/to/exercises
```
1. Run the build script:
```bash
bin/build_class_repo git@github.com:torqueforge/my_new_class.git
```


To copy a branch into master:
```bash
git checkout master
git branch
git branch -r
git merge origin/house master
git push
```

To copy a file or folder from another branch into master:
```bash
git checkout master
git checkout house -- house/
git commit -m 'add house exercise'
git push
```

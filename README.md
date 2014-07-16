# Object-Oriented Design Class

## Dependencies

You will need:

* git ([windows](http://msysgit.github.com/), [mac os x: using brew](http://brew.sh/), linux: probably apt-get or yum git-core)
* a modern version of Ruby (1.9.3 or greater)

## Setup

Clone this repository:

```bash
$ git glone https://github.com/torqueforge/$NAME_OF_CLASS.git
```

Change directories so that you are in the project:

```bash
$ cd $NAME_OF_CLASS
```

Install the dependencies:

```bash
$ gem install bundler # if you don't have it
$ bundle install
```

## Sanity Check Setup

To verify that everything is set up correctly, run the following command:

```bash
$ ruby sanity_test.rb
```

You should see the following output.
```bash
$ ruby sanity_test.rb
Run options: --seed 62459

# Running:

.

Finished in 0.001317s, 759.3014 runs/s, 759.3014 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```

## Exercises

Class consists of a number of exercises. Each exercise has its own
subdirectory and README.

## Working on the exercises

We'll tell you the next exercise to work on (for example, 'house').  Every
exercise is in a separate folder. Each exercise folder contains a README which
tells you what to do for that specific exercise.

As we work on each exercise, we'll periodically add intermediate solutions
to master on github and ask you to pull the code. This means that your life will
be easier if you NEVER UPDATE your local MASTER. Instead, it's best to do your
work in local branches.

Therefore, to work on the 'house' problem you would
```bash
$ git checkout master
```

Create a new branch to hold your work on this exercise:
```bash
$ git checkout -b my-house-branch
```

Change to the house directory and work on the exercise:
```bash
$ cd house
```

When you want to save your work, stage and commit your changes:
```bash
$ git add . # notice the dot
$ git commit -m "Explain your change here"
```

When we start working on the next section of house (or move to a new exercise
altogether) save your outstanding work (as above) and then switch back to master:
```bash
$ git checkout master
```

Pull the latest version from GitHub:
```bash
$ git pull origin
```

Then create another new branch to work on the next thing.
```bash
$ git checkout -b my-house-branch-2 # for the next section of 'house'
$ # or
$ git checkout -b my-bottles-branch # for a new exercise entirely
```

## Git: Troubleshooting / Recovery

### Throw it all away?

You can throw all your code away like this:

First, make sure that git knows all about the files you have:

```bash
$ git add .
```

Then throw the changes away:

```bash
$ git reset --hard
```

### Did your master diverge?

Go ahead and create a new branch with all your changes:

```bash
$ git checkout -b my-backup-branch
```

Then go back to master:

```bash
$ git checkout master
```

Make sure you have the most recent changes from GitHub:

```bash
$ git fetch origin
```

Then tell git to create a new copy of master, throwing away the old one:

```bash
$ git reset --hard origin/master
```

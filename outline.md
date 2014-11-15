# DAY 1

## Opening

Pass out small post-it notes and pens for use to collect goals later  
Get name tags on everyone  
Show the repo on the projector or write it on the board  

* I'm Sandi Metz
* This is xxxxx
* git clone this xxxx repo (for example)

    https://github.com/torqueforge/backstopsolutions_2014_nov

* We'll introduce the course in a bit
* For the next three days you’ll mostly either be working (writing code) or talking to each other
* We don’t like to be talked at, we’re going to put you to work immediately.


Deal with pairing issues. Put them into pairs across Ruby and OOD experience.

Get the sanity test running on everyone's machine.

* There’s a readme in your repo
* Following the directions to Run the sanity test
* You probably need to 'bundle install'


## Start the Bottles pre-test

* cd bottles
* ruby test/bottles_test.rb

* we have pre-written tests in minitest (it works just like you’d expect)
* after 30 minutes we will interrupt you
* don't worry about finishing, just write some code to get a sense of the problem

9:10 - 9:40

Retrospective:

* we interrupted you, that’s frustrating.
* we’re annoying you on purpose
* We will have BREAKS!!!
* Take a break :-)

-----
BREAK
-----


## Overview of course

* Course structure is dictated by learning theory
* interrupt and reflect is better than flow for learning
* we'll do a lot of: 30 minute exercise, interupt, reflect
* Best schoolkid math outcomes from teachers who only ask questions
* Having said that, I'll tell you a few more things


### Preempt the skeptics
* We'll be asking you to learn some new techniques
* Some of you will find these techniques tedious and boring
* Don't resist. Suspend disbelief. Commit to learning them. 
* You can ignore them come Monday if you haven't been convinced.
* You can't choose to ignore them if you don't know them.
* Think of this as a 3-day coding vacation.


### Console the planners

* We'll learn, and practice, all of the principles of OO Design
* We'll learn how to remove conditionals
* Do you have any messy conditionals?
* Overall schedule is flexible, we have a plan but it will not survive.
* Syllabus is online for those who need to know where we're going.
* I need you to have faith for 1.5 days
* Survey each morning to give us feedback and tweak the course.


### Collect Goals

Put 4 big poster post-its on wall
Small post-it notes and pens should have already been passed out)

* (Public courses) Interview pair, collect their goals on 3 different post-its
* (Private course) Write 3 goals on 3 different post-its
* Collect goals and arrange them on posters
* Talk about OOD, refactoring, testing, misc


## Bottles Show and Tell

* 5 minute lightening talk
* Tell us your approach and how it led to your solution
* your job is to applaud wildly when they're done


### During Bottles Show and Tell

* Did you find this exercise easy or hard?

* often embarrassed about code (if lowest hanging green)
* often didn’t finish (too complicated)
* inebriation test (if too complicated)
* compare solutions: is this more complicated or simpler than the previous one?
* how did you get there? (I saw a pattern and I went there. What if you don’t see a pattern?)
* What force drove you to make these decisions?

* For production, would it look like this?
* Is there complexity here that the test did not force you to implement?


### Post Bottles Show and Tell

* Bottles was hard and you didn't finish
* Save your code in a branch
* We're going to learn some new techniques
* We'll return to bottles in a bit and apply the new techniques
* We'll learn on a simpler example.
* On to 'The House That Jack Built'

## House

### House, Shameless Green

* cd house
* ruby test/house_test.rb
* same deal as before, unskip the tests one by one
* strive for the shameless green (whatever that is!)
* you only get 10 minutes
* cut and paste is your friend

### House, Shameless Green show & tell

Define shameless green

* Intersection of maximum comprehensibility with minimum complexity
* Many kinds of duplication are ok
* Prioritizes getting the tests running green
* Uses the Red-Green-Refactor cycle
* Uses simple transformations (see Bob), simple abstractions
* Waits on ALL the data (all tests green) before creating complicated abstractions
* Be brave (if you wrote it) and admiring (if you're looking at someone elses code)


Repeat the Bottles Retrospective Questions

* Did you find this exercise easy or hard?
* often embarrassed about code (if lowest hanging green)
* often didn’t finish (too complicated)
* inebriation test (if too complicated)
* compare solutions: is this more complicated or simpler than the previous one?
* how did you get there? (I saw a pattern and I went there. What if you don’t see a pattern?)
* What force drove you to make these decisions?

* For production, would it look like this?
* Is there complexity here that the test did not force you to implement?


### House, Demo Shameless to DRY

Refactor to simplest possible solution
Open/Closed Refactoring
Techniques
When to refactor
How to refactor
What to refactor
Metrics
Inebriation test
Instructions


Once you have a shameless green, you can refactor.
Definition of refactoring: Changing the structure/arrangement of code without altering the behavior.
Open/Closed. Imagine a world.
Combine refactoring with open/closed. Make the change easy, then make the easy change.
Send them back to write shameless green if most didn’t achieve it.
Once they have a shamless green, demo the refactoring technique.

Show refactoring from low hanging green to dry.
Rule is, DRY out strings, no repeating phrases.

FROM my github bottles commit:
Choose the 'else' and '2' cases as being most alike and make the smallest change that
make the first difference the same.

This is the start of DRYing out the strings using a very specific refactoring technique.
In the micro, the plan is
1) Parse some code.
2) Execute the code without using the result. (step is sometimes skipped)
3) Execute the code and use the result
4) Delete unused code.

Simple rules.  Like flocking or schooling rules, seemingly complex behavior emerges.

In the macro, the plan is
1) find the strings that are most alike
2) find the smallest difference
3) make the smallest change that will remove the difference
4) make changes only on a single line of code
5) run the tests after each change
6) if the tests fail, undo and make a better change

A few things to especially note:
We never chase after red; if the tests fail, undo and make a change that leaves the tests green.
This can be a real challenge but it's a great learning experience and is a technique well worth knowing.

The rule is to make small differences the same, NOT to make the big commonalities
DRY. Don't get distracted by strings that are the _same_, instead identify and remove
strings that are different.

Do complete 'horizontal' refactorings before switching to a 'vertical' path. This means that once you pick two strings and start making them the same, you should finish this entirely before getting distracted by a third string, no matter how much that other string calls out to you.

To convince the non-believers:
Who hates this? Who loves this? (breaks down across experience lines?) What do you hate about it?
You can only choose whether to use the technique if you know it.
You think this is slow because it is easy (tedious), but it’s easy. but if you don’t do this it is hard.
Have you ever written code for 15 or 20 minutes and then had to throw it all away, or dug so deep a hole that you did git reset --hard?
What was wrong?  You thought you knew where you were going, but couldn’t get there. 

How much complexity ends up in the code that you don’t need, with this technique?

Begin to develop the belief that it’s not inevitable that your production code be the way it is.

tendency to want to move fast, tendency to want to be clever/smart/complicated


----
LUNCH
----


### House, Demo Shameless to DRY

Now you go do Shameless to DRY 

## 99 Bottles, Rodux

### 99 Bottles, Shameless Green

* commit outstanding work to a branch
* cd bottles
* start over and write shameless green
* 15 minutes
* when you get done, come ring the bell

### 99 Bottles, Shameless Green Show & Tell

* We're having a bake off
* Make your best pitch that you win the Shameless Green

* Did you write more code than the tests require? (the test suite is deliberately bad)?
* Did you get **all** the tests passing before you started making methods?

Things they might have done

* put heredoc in song (not simple, but shameless)
* put 100 cases (not simple, not really shameless, more typing)
* 4 cases

For every attempt, ask these questions:

* how many verse variants are there?
* which verses are most alike?
* which are different?
* in what way?
* what's the algorithm for looping?

* Is the code production ready? (if it’s never going to change, then of course!)

Have them choose a Shamless Green Winner.
Check the winning Shameless Green and test with skips removed into master.
Often I just checkout the branch, copy the code, checkout master, paste the code, and commit.


  When you start the statement with “if you want to change…” you know you’re guessing.

  We’re making assumptions about the kinds of changes that are going to come,
  but we never know. 
  Is this about where you would stop in order to put this into production?

  What kinds of changes might happen that would create problems? 
  Do we know it’s going to change or are we guessing?

  There is a place to guess. We want exemplary code. If I have experience that tells me that this customer will want x, y, z, then I might be justified to make the guess IFF a novice programmer is coming behind me. If it’s me who’s coming behind, then I can just do it when I ask.


  Single Responsibility Principle
  Open/Closed Principle
  Techniques
  Extract Method
  Extract Class
  Refactorings as recipes
  Step-wise refactoring to reach for Open/Closed

### 99 Bottles, Shameless Green to DRY 

* Should we stop here?
* What would justify a change to this code?
* Introduce 6-packs
* Talk about open/closed
  * is this code open/closed to 6-packs
  * do you know how to make it open/closed
  * fix the most aggregious sin
* biggest sin is duplication of strings 
* Demo shameless to DRY

* which cases are the most similar? What is the smallest difference?
* A ‘string’ is the entire return in the case branch.
* Tension between what the squint test would leads you to do, and keeping long strings for left-right refactoring.
* Don’t put another ball in the air.  Finish the refactoring you’re on.  Finish the thought. (http://www.threeriversinstitute.org/blog/?p=594)
* if you feel resistance, just write it down. Make a TODO list. Then you can go back to it.
* How to choose which difference to pick? (The smallest one, the easiest one, the left-most one)

Write the stuff about
  is it open
  do you know how to make it open
  fix the egregious sin

This may loop for a while  




# DAY 2

## Reflect upon day 1

Make sure survey is ok
Make bit.ly link for survey

* Tell them to pick a different seat

Tell them bit.ly link
Give them a few minutes to fill out survey
Go over survey publicaly

Do 'Reflect on What I Learned' posters:

* get in groups of 4 or 5
* get a wall-sized post-it
* discuss what you learned yesteday
* draw something that represents it.  
* you can make a boring list, but we have lots of colors, why not draw?

Do reflection presentations

Update Post-it goals, maybe draw a line for 'want to learn' vs 'learned'

----
BREAK
----


## Bottles, Redux, continued

### 99 Bottles, Shameless Green to DRY, continued

Make sure they 'git pull', which should get them the 'Shameless' from which we demoed

* 30 minutes to DRY out the strings
* we'll see where you are, might need more time
* if you get done, go through it again with the other person typing
* don't go off the rails, get one of us before you go off the rails

This might take two iteractions.
If they go off the rails, help them.  If they still go off the rails, hook them
up to the projector and have the class give them advice.

Check a DRY Bottles into master for us to demo Extract Class

Ask them about their experience:
  names
  problems
  insights
  did they stop in time?
  did they stay the course?

Transition to
  is it open closed?
  Do you know how to make it open/closed?
  What's the most egregious sin?

Talk about the characteristics of the DRY Solution

- methods depend on the argument that got passed
- the if statements are duplicated in all the private methods
- the solution is apparently more complicated
- each private method has the same shape
- only one public method uses the private methods *******
- that public method also takes the same parameter and when we name it verse this method gets extracted along
- return values in the branches of the conditionals are the smallest atomic piece, and it’s the piece described by the method name
- each private method has ONLY a conditional


* is this code more complicated or simplier? What would flog say?
* we've turned one conditional into many!!!
* is this better or worse than Shameless Green?


### 99 Bottles, DRY to Extract class

We're still trying to add 6-packs.

* Is DRY Bottles open closed to 6-packs?
  * Would you have to edit this class?
* Do you know how to make it open/closed?
* Fix the most aggregious sin

* What is the sin?

Talk about Code Smells

* Kent Beck coined 'code smell'
* Martin Fowlers book.
* Jay Fields book.
* Every code smell has a corrective refactoring recipe
* If you could only recognize code smells, you could apply the correct recipe
* What are the code smells in 99 Bottles DRY?

  * clusters of similar shapes
  * private methods
  * many methods take the same argument
    * what does the argument represent?  Trace it all the way back to enumeration.
  * many methods depend more on the argument they got passed then the class as a whole
  * If you were going to divide this class into two parts, where would you split it?

Primative Obsession code smell
'number' ought to be a first class object which hold onto a single value of number
  and implements all those methods.  Then you wouldn't have to pass the argument around.

### DEMO 99 Bottles, DRY to Extract class

Create an empty class
Copy the methods to it
Add and attr_reader and initializer for number
In Bottles, go into every method we've moved and replace contents with
  BottleNumber.new(number).action(number)

Then remove remove the method arguments one at a time, using a default of
  self.number.

In Bottles, add 

    bottle_number_for(number) to return BottleNumber.new(number)    

In Bottles#verse

    bottle_number = bottle_number_for(number)

  and replace calls one at at time until forced to

    next_bottle_number = bottle_number_for(bottle_number.successor)

  then finish replacing.
  
* Why can't I just say bottle_number.successor, ie, just ask a BottleNumber for its successor?

Because successor returns a Fixnum, not a BottleNumber

* this is a Liskov violation
* don't try to fix it now, just note it
* I would prefer to just ask the object I know for something and have to answer be right
* Don't want to get the result and have to do something to it
* this is just like the problem of #amount needed to return a 'capitalizable'

In Bottles, delete obsolete code, ie, delete the forwarding methods.

Once Extract Class is done, notice:

* all methods contain a conditional
* all methods contain ONLY the conditional
* the methods are all switching on the same value 
* that value represents the same concept everywhere 
* each branch of each conditional returns the smallest atomic idea

Is it open/closed to 6-packs?

-----
LUNCH
-----

### They Do -> 99 Bottles, DRY to Extract class


### Create SOLID posters


### DEMO 99 Bottles, Conditional to Polymorphism

Create BottleNumber0 as subclass of BottleNumber
Copy one method, maybe #amount into it
Delete everything but what's needed for 0
Go into Bottles and get an instance of BottleNumber0 for the 0 case.

    def bottle_number_for(number)
      if number == 0
        BottleNumber0.new(number)
      else
        BottleNumber.new(number)
      end
    end

Remove unneeded code from Bottles#amount

Change:

    def amount
      if number == 0
        "no more"
      else
        number.to_s
      end
    end

To:

    def amount
      number.to_s
    end

Repeat until you have BottleNumber0, BottleNumber1 and BottleNumber, and
a little #bottle_number_for or #make_bottle_number factory method in Bottles.

### 99 Bottles, Data Clump

Talk about data clumps.  x,y is Point, starting\_date ending\_date is DateRange, etc.
Fix the #quantity/#container data clump with #to_s in BottleNumber



# DAY 3

Prep
* Surveys
  * Make sure day 2 AND day 3 surveys are ok
  * Make bit.ly links for surveys
* Exercises
  * update House in master
    * checkout house DRY
    * copy code in house/lib/house.rb
    * checkout master
    * paste DRY house over house/lib/house.rb
    * add puts House.new.line(12) at bottom
    * commit and push
  * update Farm in master
    * git checkout origin/farm
    * commit and push 

## Reflect upon day 2

* Tell them to pick a different seat

Tell them bit.ly day 2 survey link
Give them a few minutes to fill out survey
Go over survey

Do 'Reflect on What I Learned' posters:

* get in groups of 4 or 5
* get a wall-sized post-it
* discuss what you learned yesteday
* draw something that represents it.  
* you can make a boring list, but we have lots of colors, why not draw?

Do reflection presentations

Update Post-it goals, especially 'learned'

----
BREAK
----

### They Do -> 99 Bottles, Conditional to Polymorphism, plus Test and code for 6-packs

They do BottlesConditional to Polymorphism.
Group discussion of Inheritance vs Composition

  is-a, has-a 
  historically the way to make code open/closed is inheritance
  inheritance can go badly wrong (and how)
  when you have an instance of verse variant 0, if it receives a message that it doesn’t understand, ruby looks up the hierarchy and finds the implementation in VerseVariant. You get automatic message forwarding. VerseVariant0 doesn’t know about VerseVariant. The price you pay for that is that Variant0 is dependent on the tree.
  There’s no place where it knows any of the methods in the superclass.
  You have to accept the dependency that you’re a kind-of the superclass.
  It gets message forwarding for free.
  * I don’t have to know the names of the methods that I respond to
  * I can’t collaborate with any other object than my superclass. I’m dependent on that one thing.

  Opposite relationship. Verse knows about a VerseVariant. There are many methods here (listed in the private). Verse receives them and turns right around and sends it to someone else. Verse has no external dependency on the class VerseVariant.
  It has to explicitly forward the messages to the composed part. The win is that  you could plug anything in there that plays the role. Variant is a duck type. We can inject new objects as long as they implement that role. If I’m willing to pay the price to know, to do the forwarding myelf, then I get the freedom to collaborate with whoever does the right thing.

  Which is more flexible? Composition or inheritance? Prefer composition to inheritance (not always. Prefer.)

  How does inheritance goes wrong?
  “we end up sticking stuff in there”
  it’s like a knife that turns in your hand.
  Part of your superclass will change for reasons that are unrelated to you, and things begin to go off the rails.

  why it’s ok to use inheritance safely here.
  * at the edge of the object graph (leaf node)
  * at least one subclass overrides every single method in the base class. All the behavior is used in the inheritance tree. Everything in the superclass varies (at some point in time).
  I want the subclasses to be a complete specialization of all the behavior in the superclass. We have constrained the superclass to the behavior that we want to override.

  Before we started extracting the variant hierarchy, we isolated all the conditionals by themselves.

  objects at the core of the domain should probably not use inheritance.

  Talk about when to use inheritance

----
BREAK
----

Options for remainder of morning: Factories vs Production Code vs re-do all of Bottles

### 99 Bottles, Open/Closed Factories



----
LUNCH
----

### Farm, Null Object Pattern

Recognizing fundamental code shapes that guide OOD
Techniques
Null Object Pattern

----
BREAK
----

----
SWAG???
----


### House, Dependency Inversion

Dependency Inversion Principle
Depending on abstractions

Dependency Injection
    Injecting abstractions to depend on roles


  First, look at the code together. Is this cohesive? In what way is it not. characterize it. In which ways might this song change? I can’t know. Maybe they’ll want to change the algorithm. Or, maybe they’ll change the data. Randomization. Backwards. I should not make anything more flexible than necessary to meet todays requirement.

  As soon as someone asks me to make random house, it tells me where I need more flexibility. I need to have more than one kind of collaborator in this way.

  Now that I know the parts that will vary, I will rearrange this code so that I can vary this part.
  We’re writing the simplest possible code at every moment, but we’re not going to make it variable until we know that we need variability right there.

  it has to keep doing what it’s doing
  it has to be open/closed to the randomization
  randomization:
  - just swap the lines around
  - swap who is what to whom
  - end with “house built.”


### Do final survey

Tell them bit.ly day 3 survey link
Give them a few minutes to fill out survey

Hug and go


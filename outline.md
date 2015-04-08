# Pre Class

## Prepare the Repo

Create a new repo under TorqueForge following the directions in CLASS_SETUP.md.

Copy the 99Bottles and House exercises to master.

    git checkout master

    git checkout origin/house -- house/
    git commit -m 'add house exercise'

    git checkout origin/bottles -- bottles/
    git commit -m 'add bottles exercise'

    git push

This checks a single folder (house/ or bottles/) out of a branch (origin/house or origin/bottles) and places that folder into master, ready to be commited.

## Prepare the Surveys
Angela makes them, they're on my google drive under 'Surveys'.
Each day's survey needs to be checked, and a bitly link must be created for the actual form.


# DAY 1

## Supplies
* small post-it notes (10x-ish times num of students)
* Poster (wall) sized post-it notes (2 packs)
* Many colors of sharpie markers
* Many ballpoint pens
* Cheap kitchen timer


## Opening

Pass out small post-it notes, pens and sharpies
Have them write their name on a small post-it attach to back of laptop
Warn them that they should pick a different seat tomorrow morning
Show the repo on the projector or write it on the board

**Say:**

* I'm _xxxx_
* This is _yyyy_
* git clone this repo
* Warning: YOU'LL NEVER CHECK CODE INTO MASTER OF THIS REPO

    for example...
    https://github.com/torqueforge/backstopsolutions_2014_nov

* We'll introduce the course in a bit
* For the next three days you’ll either be working (writing code) or talking to each other
* We don’t like to be talked at so you'll be writing code right away

Ask if they have experience pairing.  If they don't, discuss how pairing works.
Have them put themselves into pairs across Ruby and OOD experience.

If they know one another, they can just do this.
If they don't know one another, ask them to stand up and arrange themselves in a line based on how much Ruby experience they have.  This is amazingly chaotic, but it works.

Once they're paired, get the sanity test running on everyone's machine.

**Say:** 

* There’s a readme in your repo
* Following the directions to run the sanity test
* Pro-tip: You probably need to 'bundle install'


## Start the Bottles pre-test

**Say:** Here's how you run the tests:

    cd bottles
    ruby test/bottles_test.rb

* we have pre-written tests in minitest
* who has used minittest (no one) (That's okay, it works just like you’d expect)
* after 30 minutes we will interrupt you
* don't worry about finishing, just write some code to get a sense of the problem
* THIS IS NOT A TEST
* YOU WILL NOT FINISH, don't worry, THIS IS NOT A TEST

Set the timer for 30 minutes.
9:15 - 9:45

* we interrupted you, that’s frustrating.
* we are annoying you on purpose
* we're all about learning theory
* learning theory says we should take breaks
* take a break :-)

**BREAK**

10:00am

## Introduce the course

### Explain how it works

Set the timer for 5 minutes to show them we're serious about not talking on and on and then tell them the following things:

* Course structure is dictated by learning theory
* interrupt and reflect is better than flow for learning
* we'll do a lot of: 30 minute exercise, interupt, reflect
* Best schoolkid math outcomes from teachers who only ask questions
* Having said that, I'll tell you a few more things


### Preempt the skeptics

* We'll be asking you to learn some new techniques
* Some of you will find these techniques tedious and boring
* Don't resist. Suspend disbelief. Commit to learning them.
* You can ignore them after we're gone if you haven't been convinced.
* You can't choose to ignore them if you don't know them.
* Think of this as a 3-day coding vacation.
* Commit to doing what we ask.


### Console the planners

* We'll learn, and practice, all of the principles of OO Design
* We'll learn how to remove conditionals
* Do you have any messy conditionals?
* Overall schedule is flexible, we have a plan but it will not survive
* Syllabus is online (http://www.sandimetz.com/courses/ follow syllabus link) for those who need to know where we're going
* I need you to have faith for a while (probably until tomorrow afternoon)
* Survey each morning to give us feedback and tweak the course


### Collect Goals

About to collect goals, make sure you have a place to put them, perhaps put 4 big poster post-its on wall.  Do not yet put labels on these posters.

***Give them instructions:***

* (Public courses) Interview your pair, collect their goals on 3 different post-its
* (Private course) Write your own 3 goals on 3 different post-its

For private courses we collect goals, read each aloud and stick on the wall.
For public courses the interviewer introduces the interviewee and reads their goals aloud, after we which collect and stick on wall.

As you collect the goal goal post-its, group them into OOD, refactoring, testing, misc.
Once all the goal post-its are up, have them guess the names of the 4 groups, and then write the label on each group.


## Bottles Show and Tell

***Describe how show and tells work:***

* like 5 minute lightening talk
* tell us your approach and how it led to your solution
* if someone has already shown a solution like yours, you don't have to show
* if you're showing, your job is to finish within 5 minutes
* if you're watching, your job is to applaud wildly when timer goes off


### During Bottles Show and Tell

* Did you find this exercise easy or hard?
* Are you proud or embarrassed about your code?
* Did you finish? (your solution is too complicated)
* Is your code understandable (would it pass the inebriation test?)
* Is this solution more complicated or simpler than the previous one?
* How did you decide what code to write? (I saw a pattern and I went there. What if you don’t see a pattern?)
* What force drove you to make these decisions?
* For production, would it look like this?
* Is there complexity here that the test did not force you to implement?


### Post Bottles Show and Tell

* Bottles was hard and you didn't finish
* Save your code in a branch
* DON'T CHECK CODE INTO MASTER
* We're going to learn some new techniques
* We'll return to bottles in a bit and apply the new techniques
* We'll learn on a simpler example.
* On to 'The House That Jack Built'

**BREAK**

## House

### House, Shameless Green

The ```House``` exercise is already in master.

***Say:***

    cd house
    ruby test/house_test.rb

* same deal as before, unskip the tests one by one
* strive for the shameless green (whatever that is!)
* you only get 10 minutes
* cut and paste is your friend

### House, Shameless Green show & tell

Define shameless green

* Intersection of maximum comprehensibility with minimum complexity
* Maximize comprehension, don't worry about changeability
* Many kinds of duplication are ok
* Prioritizes getting the tests running green
* Uses the Red-Green-Refactor cycle
* Uses simple transformations (see Bob), simple abstractions
* Collects maximum information (all tests green) before creating complicated abstractions
* Be brave (if you wrote it) and admiring (if you're looking at someone else's code)


Repeat the Bottles Retrospective Questions

* Did you find this exercise easy or hard?
* Are you proud or embarrassed about your code?
* Did you finish? (your solution is too complicated)
* Is your code understandable (would it pass the inebriation test?)
* Is this solution more complicated or simpler than the previous one?
* How did you decide what code to write? (I saw a pattern and I went there. What if you don’t see a pattern?)
* What force drove you to make these decisions?
* For production, would it look like this?
* Is there complexity here that the test did not force you to implement?

By the end of Show & Tell, they should have picked a winner for Shameless Green.


### House, Shameless to DRY

***Prep***
Push a version of House Shameless Green to master.  This can be one of the ones they just wrote, or mine.  To get mine:

    git checkout master
    git checkout origin/house_1_shameless_green -- house/
    git commit -m 'shameless house'
    git push origin master

Ask for a volunteer to type. Have them do a ```git pull``` and tell them you'll need them to hook up to the projector in just a minute.


#### When to Refactor
Make them define the word 'refactor': 
"Change the structure/arrangement of code without altering its behavior."

Ask them if they use the word 'refactor' to mean implementing _new_ behavior. (They'll say yes.)  This is not refactoring.

**Ask:** 

  * What does shameless green reveal about the domain of House? 
    (There are 12 cases/lines) 

  * What is the algorithm for building a line? 
    (It's cumulative, but you can't tell from the code.)

  * What annoys you most about this code? 
    (The duplication of strings.)

  * Should you 'refactor' your current implementation house?  I.e., should you do more?

  * Do you have justification to do more?  Perhaps not (discuss, maybe need a new requirement), but let's pretend that we do.


#### How to Refactor
This is the start of DRYing out the strings using a very specific refactoring technique.

##### The big picture

1) Parse some code.
2) Execute the code without using the result. (step is sometimes skipped)
3) Execute the code and use the result
4) Delete unused code.

Simple rules.  Like flocking or schooling rules, seemingly complex behavior emerges.

##### The specific plan
1) find the strings that are most alike
2) find the smallest difference between them
3) make the smallest change that will remove the difference
4) try to make changes only on a single line of code (can't always, but try)
5) run the tests after each change
6) if the tests fail, undo and make a better change

##### Other things to say
Never chase after red; if the tests fail, undo and make a change that leaves the tests green.

The rule is to make small differences the same, NOT to DRY out big commonalities.

Don't get distracted by strings that are the same, instead identify and remove strings that are different.

Do complete 'horizontal' refactorings before switching to a 'vertical' path. This means that once you pick two strings and start making them the same, you should finish this entirely before getting distracted by a third string, no matter how much that other string calls out to you.

#### Mob DRYing out strings in House

Get the volunteer typist hooked up to the monitor.

Ask them to do a ```git pull```.

Tell the class NOT to work along on their own computers.  Right now they should just pay attention and participate; they'll do this exact exercise individually after lunch.

To get everyone to talk, consider asking one small group (3-4 folks) at a time to be responsible for making the next suggestion.  Given them some sort of token to hold when it's their turn, and let them decide who gets the token next.

Help them with get started.  Ask:

  * Which cases are most alike?
    They should choose line 1 and line 2.
  * What is the smallest difference between them?
    '' or 'the malt that lay in '
  * What is the smallest change that will remove the difference?
    If these two things represent the same concept, I should name the concept, and then send a message in this place.
  * What is the concept?
    phrase
  * Okay, create a #phrase method.
  * What should it return?

Here they always pick

    'the malt that lay in '

because they can't wrap their heads around ''.  Just run with it.  See the refactorings in the branches of the repo for the steps.

Make them mob all the way through DRYing out the House strings.  Afterwards:

  * Who hates this technique? Who loves it? (love/hate breaks down across experience lines) 
  * If you hate it, why?
  * You can only choose whether to use the technique if you know it.
  * You think this is slow because it is easy (tedious), but if you don’t do this it is hard and slow.
  * Have you ever written code for 15 or 20 minutes and then had to throw it all away, or dug so deep a hole that you did git reset --hard?
  * What was wrong?  You thought you knew where you were going, but couldn’t get there.

  * How much complexity ends up in the code that you don’t need, with this technique?

It is not inevitable that your production code be the way it is.

Your tendency to want to move fast, tendency to want to be clever/smart/complicated

**LUNCH**

### House, They do Shameless to DRY

1:00PM

Have them ```git pull``` and go do House Shameless to DRY

Should not need a Show & Tell, but if you do, do it.

Tell them to put this problem away, and we'll return to it on day 3.  Now we'll return to Bottles and find Shameless Green and then apply these refactoring rules to see what happens.


## 99 Bottles, Rodux

1:45PM ish

### 99 Bottles, Shameless Green

***Say:***
* commit outstanding work to a branch
* cd bottles
* start over and write bottles shameless green
* you get 15 minutes

### 99 Bottles, Shameless Green Show & Tell

***Tell them:***

* We're having a bake off.
* Make your best pitch that you win the Shameless Green.

***For each Show & Tell, ask:***

* Did you write more code than the tests require? (the test suite is deliberately bad)?
* Did you get **all** the tests passing before you started making methods?

They might put evil pair code in #verse, #verses and #song to pass the tests.  If so, ask:

* What responsibility does #verse have? (produce any verse)
* What about #verses?  (call #verse for any range of verse numbers, or produce all the verses?)
* What about #song? 

Only #verse is responsible for producing a verse, the other methods are responsible for algorithms.

For every Show & Tell, ask these questions:

* how many verse variants are there?
* which verses are most alike?
* which are different?
* in what way?
* what's the algorithm for looping?

After all Show & Tells:
Have them choose a Shameless Green Winner.

***Ask:***

* Is the winning code production ready? (if it’s never going to change, then of course!)

***Things you might discuss:***

When you start the statement with “if you want to change…” you know you’re guessing.

This makes assumptions about the kinds of changes that are going to come, but we never know.

What kinds of changes might occur that this code can't easily handle?

If I wait until I have the next requirement to refactor, will it cost more, or less?

There is a place to guess. We want exemplary code. If I have experience that tells me that this customer will want x, y, z, then I might be justified to make the guess IF a novice programmer is coming behind me. If it’s me who’s coming behind, then I can just do it when I ask.

Get a Bottles Shameless Green into master.  Either take theirs, or

    git checkout master
    git checkout origin/bottles_1_shameless -- bottles/
    git commit -m 'shameless bottles'
    git push origin master

Whichever you choose, you should now have a Bottles Shameless green, and tests with no skips, in master.

**BREAK**

### 99 Bottles, Mob Shameless Green to DRY
3:00pm ish

As break is ending, get another volunteer typist.

***ASK:***

* Should we stop here at Bottles Shameless Green?
* What would justify a change to this code?
* Introduce 6-packs requirement.
* Talk about open/closed.

Ask them what the O in SOLID stands for. (Open/Closed)
Ask them what Open/Closed is short for. (Open for extension/Closed for Modification)
Ask them what that means.

Talk briefly about open/closed:

* Imagine a world in which you never have to change existing code to implement new behavior.
* Don't worry that this seems impossible, just pretend for a minute that it's true.
* If it's true, what are the consequences?

Make sure they say:
  Adding new behavior can't break distant and unrelated things.
  Your existing tests are always green.

You should deal with new requirements in two steps.

  1. Make the existing code open to the new requirement
  1. Implement the new requirement

When thinking about a new requirement:

  * Flowchart questions: 
    * is this code open/closed to 6-packs
    * do you know how to make it open/closed
    * fix the most approachable sin

For Bottles Shameless:

  * What is the most approachable sin?  What do you hate most, that you understand and know how to fix? (duplication of strings)
  * You know how to fix duplication of strings... the flocking rules.

### Bottles, Mob shameless to DRY

Repeat the refactoring rules from before.
Get the volunteer typist hooked up.
Don't allow the typist to think.
Rotate around the room, making small groups responsible for telling the typist the next thing to do.


***Say:***

* don't type along; you'll each do this tomorrow morn.
* if you feel the urge to jump vertically, don't stray from the path, just write your issue down. Make a TODO list. You can go back to it.

As they mob this: 

  * point out that the flocking rules cause you to write methods that are mini examples of open/closed.  We put 'if' statements in the methods to make the methods 'open' to use in new places.
  * remember that they'll encounter a Liskov violation when they try to send capitalize to #amount so that, in the 0 case, 'no more' will turn into 'No more'.  They should send #to_s to the number inside of the #amount method.  The method should return a trustworthy object; it should return something that understands #capitalize.
  * when extracting a method, they'll occasionally choose the non-else case as the first thing they return.  This requires that they use a real value (not :fixme) as the default for the parameter.  Give them time to understand this.
  * Many times they can make things the same by using a no-op.  This is an important idea.  The _concept_ exists, even if it can sometimes be implemented as a no-op.


***OFFICE HOURS***


# DAY 2

## Reflect upon day 1
9:00am

Make sure survey is ok
Make bit.ly link for survey

* Remind them to pick a different seat

Tell them bit.ly link
Give them a few minutes to fill out survey
Go over survey publicly

Do 'Reflect on What I Learned' posters:

* get in groups of 4 or 5
* discuss what you learned yesterday
* take a wall post-it and draw something that represents it, or
* Classes have done poetry, Ms Manners questions, art, plays, etc.  The bar is high.
* You get 30 minutes.  You'll run out of ideas at 15 minutes.  Stick with it, the best ideas happen if you persevere. Don't quit and read email at the 16 min mark.

Do reflection presentations

Tell them to take a break, but during the break to update their post-it goals.  This is always a bit confusing.  Lately I've been telling them to update the wall to reflect their current goals.  They can find a move their previous goals, or put up new goals.  They can dot-vote by putting blank new post-its somewhere.  They can rip a post-it in half.  Whatever.  We just want them to think.

***BREAK***

Update Post-it goals during break.

## Bottles, Redux, continued

### 99 Bottles, They do Shameless Green to DRY
10:00am

Make sure they 'git pull', which should get them the 'Shameless' from which we demoed

* 30 minutes to DRY out the strings
* we'll see where you are, might need more time
* if you get done, go through it again with the other person typing
* don't go off the rails, get one of us before you go off the rails

This might take two iterations.
If they go off the rails, help them.  If they still go off the rails, hook them
up to the projector and have the class give them advice.





___
Everything from here down is pending updates



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




***Notes***


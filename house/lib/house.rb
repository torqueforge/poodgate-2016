# Multiple inheritance with Modules as an alternative to injected composition
# from Sandi Metz's talk [Nothing is Something](http://confreaks.tv/videos/bathruby2015-nothing-is-something)

# Like Sandi's 'direct' DI method this has behavior outside of the base class
# that gets composed together. However in this gist I compose modules in class
# definitions instead of injecting collaborators.

# Tradeoffs between this and Sandi's version are that in this case the API consumer doesn't
# have to know how to make a RandomEchoHouse (no `house = House.new(formatter: Whatever.new)`),
# but also the API consumer can't make anything not already accounted for either.

module DefaultOrdering
  def order(data)
    data
  end
end

module RandomOrdering
  def order(data)
    data.shuffle
  end
end

module DefaultFormatting
  def format(parts)
    parts
  end
end

module EchoedFormatting
  def format(parts)
    parts.zip(parts).flatten
  end
end

class House
  include DefaultFormatting
  include DefaultOrdering

  DATA = [ 'the horse and the hound and the horn that belonged to',
           'the farmer sowing his corn that kept',
           'the rooster that crowed in the morn that woke',
           'the priest all shaven and shorn that married',
           'the man all tattered and torn that kissed',
           'the maiden all forlorn that milked',
           'the cow with the crumpled horn that tossed',
           'the dog that worried',
           'the cat that killed',
           'the rat that ate',
           'the malt that lay in',
           'the house that Jack built' ]

  def initialize
    @data = order(DATA)
  end

  def recite
    (1..data.length).map {|i| line(i)}.join("\n")
  end

  def line(number)
    "This is #{phrase(number)}.\n"
  end

  def phrase(number)
    parts(number).join(" ")
  end

  def parts(number)
    format(data.last(number))
  end

  attr_reader :data # personal preference I think
end

# Inheritance is valid here IMO because we are specializing behavior
class RandomHouse < House
  include RandomOrdering
end

class EchoHouse < House
  include EchoedFormatting
end

class RandomEchoHouse < House
  include RandomOrdering
  include EchoedFormatting
end

#
# First, you rock for taking the time to write this up. Thanks very much. I am totally agreed that this is the most reasonable module based solution; while it's no great recommendation to say this, my module variant is almost identical. :-)
#
# I also agree with your assessment of the tradeoffs, but I'd like to expand upon them:
#
# module based solution:
#
# Pro: The wiring together is hard-coded in advance, so there's only one run-time dependency (EchoHouse.new).
#
# Con: If a new player of the Orderer or Formatter role arises, you have to create not only the new role but also as many new subclasses of House as are required to account for all of the combinations. For example, if a RandomExceptForLastRow orderer appears, we now need classes:
#
# EchoHouse
# RandomHouse
# RandomExceptForLastRowHouse
# RandomEchoHouse
# RandomExceptForLastRowEchoHouse
# Metrics: Flog says this version is more complicated then the 'composition' solution:
#
#     34.2: flog total
#      3.1: flog/method average
#
#      7.5: House#recite                     lib/house_using_modules.rb:46
#      5.5: House#none
#      4.4: RandomEchoHouse#none
#      3.9: House#parts                      lib/house_using_modules.rb:59
# composition based solution
#
# Con: The collaborating objects must be brought together in time and space. This may entail forcing a single object to know many class names (House.new(formatter: Whatever.new)) and therefore saddling this object with many dependencies.
#
# Pro: There's no requirement that the formatter be created by the same object that creates a House. It's common for some object to get passed a formatter, which it in turn injects into a House (House.new(formatter: a_formatter)). This style is common when using composition (and is not shown in my talk!!!). When used in this way, all it takes to get a brand new collaboration is the create and use the new Orderer or Formatter class; we don't have to change any existing code or create new subclasses of House.
#
# Metrics: Flog says this version is less complicated:
#
#     25.9: flog total
#      3.2: flog/method average
#
#      7.5: House#recite                     lib/house4_raw.rb:24
#      5.2: House#parts                      lib/house4_raw.rb:38
#      4.0: House#initialize                 lib/house4_raw.rb:19
# So, now that I've thought more carefully about these alternatives (thank you again), I'd say that both of the solutions allow us to avoid duplicating code, but I'm even more comfortable saying that the composition variant is both simpler and more extensible.
#
# Thoughts?
#
# Owner
# Thanks very much for taking the time to go through this, it's awesome to be able to have discussions like this with you, I feel like I learn a lot every time we talk :)
#
# I think your analysis is spot-on. Including the flog score is very interesting. You're naturally going to leave out the materialized concepts of RandomEchoHouse and friends, which will give you a lower score of course, but I don't imagine including those would add much (random_echo_house = House.new(orderer: RandomOrder.new, formatter: EchoFormatter.new), etc I suppose).
#
# I think interestingly you can retain the value of presenting materialized concepts to the API consumer by adding a Factory class to your implementation (random_echo_house = HouseFactory.random_echo_house maybe?). This adds the pro of the module-based solution while retaining all of the pros of the (more open/closed!) composition based solution.
#
# I also love your point about DI from even further outside the local context. I did that a ton when I used to write j2ee. I think people often conflate it with big nasty systems but it's a really great way to create clean code.
#
# Thanks again for taking the time to review this, you rock! :)
#
# I've been thinking about the inheritance (which includes mixins) vs. composition question a lot lately because I've had to modify a lot of heavily mixed-in code.
#
# I visualize it like looking for an artifact on the ocean floor. Inheritance is like looking over a square mile. You know all the code that's doing whatever it's doing is in this class, you just don't know where the code is physically located; so it may take a long time to navigate through all the modules and figure out what overrides what.
#
# With object composition, it's like looking in a mile-deep trench: you may need to navigate through a deep object graph, but to me, the way is clearer than trying to figure out which contributed bit of functionality is causing a certain effect.
#
# When using a deep graph of small objects, you can often get a single class in its entirety on one editor screen, or a few folds deep. Comparing that with n open files worth of modules, I find it easier to understand one "single-class" class at a time, rather than a class composed of many modules.
#
# Class responsibility, and therefore tests, is also more focused, in my experience.
#
# It still depends on the design of the modules/classes in question, but these techniques seem to lean in these directions.

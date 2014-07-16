# To do this exercise you must first install several gems.
# From the command line, run
# > gem install pry
# > gem install pry-byebug
# > gem install pry-stack_explorer

# Once you've install pry, start this exercise by
# running
# > ruby exploring_with_pry.rb
# from the command line.
#
# References:
#   http://pryrepl.org/pry/
#   https://github.com/pry/pry
#   https://github.com/deivid-rodriguez/pry-byebug
#   https://github.com/pry/pry-stack_explorer
gem 'pry', '~> 0.9.12'
require 'pry'

def outer(message, number)
  inner(message)
end

def inner(message)
  local = true
  binding.pry
  "done with inner"
end

outer("hello", 1000)

# Here's a transcript of my subsequent pry session.
# My pry prompt is set to [n]> (where n is set to line number), so
# you can duplicate this session by scanning down this transcript
# looking for prompts and then entering the same commands.

# ---------------Transcript starts here ---------------
# Frame number: 0/7
#
# From: /Users/skm/Projects/classes/ex2/adhoc/exploring_with_pry.rb @ line 27 Object#inner:
#
#     25: def inner(message)
#     26:   local = true
#  => 27:   binding.pry
#     28:   "done with inner"
#     29: end

# [1]> local      # <------ This is the first prompt.  I typed 'local'.
# => true
# [2]> message    # <------ Second prompt. I typed 'message'. You get the idea.
# => "hello"
#
# [3]> number
# NameError: undefined local variable or method `number' for main:Object
# from (pry):3:in `inner'
#
# [4]> show-stack
#
# Showing all accessible frames in stack (8 in total):
# --
# => #0  inner <Object#inner(message)>
#    #1 [block]   block in run <PryByebug::Processor#run(initial=?, &block)>
#    #2 [method]  run <PryByebug::Processor#run(initial=?, &block)>
#    #3 [method]  start_with_pry_byebug <Pry.start_with_pry_byebug(target=?, options=?)>
#    #4 [method]  pry <Object#pry(object=?, hash=?)>
#    #5 [method]  inner <Object#inner(message)>
#    #6 [method]  outer <Object#outer(message, number)>
#    #7 [main]    <main>
#
# [5]> up
# Frame number: 1/7
# Frame type: block
# ...
# [6]> up
# Frame number: 2/7
# ...
# [7]> up
# Frame number: 3/7
# ...
# [8]> up
# Frame number: 4/7
...
# [9]> up
#
# Frame number: 5/7
# Frame type: method
#
# From: /Users/skm/Projects/classes/ex2/adhoc/exploring_with_pry.rb @ line 27 Object#inner:
#
#     25: def inner(message)
#     26:   local = true
#  => 27:   binding.pry
#     28:   "done with inner"
#     29: end
#
# [10]> up
#
# Frame number: 6/7
# Frame type: method
#
# From: /Users/skm/Projects/classes/ex2/adhoc/exploring_with_pry.rb @ line 22 Object#outer:
#
#     21: def outer(message, number)
#  => 22:   inner(message)
#     23: end
#
# [11]> number
# => 1000
#
# [12]> show-stack
#
# Showing all accessible frames in stack (8 in total):
# --
#    #0  inner <Object#inner(message)>
#    #1 [block]   block in run <PryByebug::Processor#run(initial=?, &block)>
#    #2 [method]  run <PryByebug::Processor#run(initial=?, &block)>
#    #3 [method]  start_with_pry_byebug <Pry.start_with_pry_byebug(target=?, options=?)>
#    #4 [method]  pry <Object#pry(object=?, hash=?)>
#    #5 [method]  inner <Object#inner(message)>
# => #6 [method]  outer <Object#outer(message, number)>
#    #7 [main]    <main>

# [13]> down
#
# Frame number: 5/7
# Frame type: method
#
# From: /Users/skm/Projects/classes/ex2/adhoc/exploring_with_pry.rb @ line 27 Object#inner:
#
#     25: def inner(message)
#     26:   local = true
#  => 27:   binding.pry
#     28:   "done with inner"
#     29: end

# [13]> down
# [14]> down
# [15]> down
# [16]> down
# [17]> down
# [18]> down
# [19]> down
# Error: At bottom of stack, cannot go further!#

# [20]> next
#
# From: /Users/skm/Projects/classes/ex2/adhoc/exploring_with_pry.rb @ line 28 Object#inner:
#
#     25: def inner(message)
#     26:   local = true
#     27:   binding.pry
#  => 28:   "done with inner"
#     29: end

# [21]> next
# >

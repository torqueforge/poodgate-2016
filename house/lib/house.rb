class House
  attr_reader :phrases
  def initialize(phrases=Lines.new.lines)
    @phrases = phrases
  end

  def recite
    1.upto(12).collect {|i| line(i)}.join("\n")
  end

  def line(num)
    "This is #{phrase(num)}.\n"
  end

  def phrase(num)
    phrases.last(num).join(" ")
  end
end

class Lines
  def lines
    [["the horse and the hound and the horn", "that belonged to"],
     ["the farmer sowing his corn", "that kept"],
     ["the rooster that crowed in the morn", "that woke"],
     ["the priest all shaven and shorn", "that married"],
     ["the man all tattered and torn", "that kissed"],
     ["the maiden all forlorn", "that milked"],
     ["the cow with the crumpled horn", "that tossed"],
     ["the dog", "that worried"],
     ["the cat", "that killed"],
     ["the rat", "that ate"],
     ["the malt", "that lay in"],
     ["the house", "that Jack built"]]
  end
end

# full lines, randomized
class RandomLines
  def lines
    Lines.new.lines.shuffle
  end
end

# actors and actions, randomized
class MixedRandomLines
  def lines
    transposed = Lines.new.lines.transpose
    [transposed[0].shuffle, transposed[1].shuffle].transpose
  end
end

# actors and actions, randomized, with last line held constant
class MostlyMixedRandomLines
  def lines
    orig = Lines.new.lines
    transposed = orig[0...-1].transpose
    actors  = transposed[0].shuffle
    actions = transposed[1].shuffle
    [actors, actions].transpose << orig.last
  end
end

puts
puts House.new(MostlyMixedRandomLines.new.lines).line(12)
puts

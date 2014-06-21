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
  DATA =
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

  attr_reader :orderer

  def initialize(orderer=Order::Default.new)
    @orderer = orderer
  end

  def lines
    orderer.order(DATA)
  end
end

module Order
  class Default
    def order(data)
      data
    end
  end

  class Random
    def order(data)
      data.shuffle
    end
  end

  class MixedRandom
    def order(data)
      transposed = data.transpose
      [transposed[0].shuffle, transposed[1].shuffle].transpose
    end
  end
end


# actors and actions, randomized, with 'Jack Built' held constant
class MostlyMixedRandomLines
  def lines
    orig = Lines.new.lines
    transposed = orig.transpose
    actors  = transposed[0].shuffle
    actions = transposed[1][0...-1].shuffle << transposed[1].last
    [actors, actions].transpose
  end
end


puts
puts House.new(Lines.new(Order::MixedRandom.new).lines).line(12)
puts

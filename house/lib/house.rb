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
    [["the horse and the hound and the horn", nil, "that belonged to"],
     ["the farmer", "sowing his corn", "that kept"],
     ["the rooster", "that crowed in the morn", "that woke"],
     ["the priest", "all shaven and shorn", "that married"],
     ["the man", "all tattered and torn", "that kissed"],
     ["the maiden", "all forlorn", "that milked"],
     ["the cow", "with the crumpled horn", "that tossed"],
     ["the dog", nil, "that worried"],
     ["the cat", nil, "that killed"],
     ["the rat", nil, "that ate"],
     ["the malt", nil, "that lay in"],
     ["the house", nil, "that Jack built"]]

  attr_reader :orderer

  def initialize(orderer=Order::Default.new)
    @orderer = orderer
  end

  def lines
    orderer.order(DATA).map {|line| line.compact.join(" ")}
  end
end

module Order

  # Leave the order unchanged
  class Default
    def order(data)
      data
    end
  end

  # Randomize the rows
  class Random
    def order(data)
      data.shuffle
    end
  end

  # Randomize any number of columns
  class MixedRandom
    def order(data)
      transposing(data) {|columns| columns.collect {|column| column.shuffle}}
    end

    def transposing(data)
      yield(data.transpose).transpose
    end
  end

  # Randomize any number of columns,
  # but hold the bottom right value constant.
  class MostlyMixedRandom < MixedRandom
    def order(data)
      bottom_right_value = data.last.last

      mixed = super(data)

      last_col = (cols = mixed.transpose).last
      last_col[last_col.index(bottom_right_value)] = last_col.last
      last_col[-1] = bottom_right_value
      cols.transpose
    end
  end
end


puts
puts House.new(Lines.new(Order::MostlyMixedRandom.new).lines).line(12)
puts

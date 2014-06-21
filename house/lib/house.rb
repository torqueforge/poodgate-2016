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
    [ "the horse and the hound and the horn that belonged to",
      "the farmer sowing his corn that kept",
      "the rooster that crowed in the morn that woke",
      "the priest all shaven and shorn that married",
      "the man all tattered and torn that kissed",
      "the maiden all forlorn that milked",
      "the cow with the crumpled horn that tossed",
      "the dog that worried",
      "the cat that killed",
      "the rat that ate",
      "the malt that lay in",
      "the house that Jack built"]
  end
end

# Know about Lines class
# class RandomLines
#   def lines
#     Lines.new.lines.shuffle
#   end
# end

# Inherit from Lines class, depend on #super
class RandomLines < Lines
  def lines
    super.shuffle
  end
end

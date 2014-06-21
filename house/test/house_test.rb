require_relative '../../test_helper'
require_relative '../lib/house'

class HouseTest < Minitest::Test
  attr_reader :tale
  def setup
    @tale = House.new
  end

  def test_line_1
    expected = "This is the house that Jack built.\n"
    assert_equal expected, tale.line(1)
  end

  def test_line_2
    expected = "This is the malt that lay in the house that Jack built.\n"
    assert_equal expected, tale.line(2)
  end

  def test_line_3
    expected = "This is the rat that ate the malt that lay in the house that Jack built.\n"
    assert_equal expected, tale.line(3)
  end

  def test_line_4
    expected = "This is the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    assert_equal expected, tale.line(4)
  end

  def test_line_5
    expected = "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    assert_equal expected, tale.line(5)
  end

  def test_line_6
    expected = "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    assert_equal expected, tale.line(6)
  end

  def test_line_7
    expected = "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    assert_equal expected, tale.line(7)
  end

  def test_line_8
    expected = "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    assert_equal expected, tale.line(8)
  end

  def test_line_9
    expected = "This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    assert_equal expected, tale.line(9)
  end

  def test_line_10
    expected = "This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    assert_equal expected, tale.line(10)
  end

  def test_line_11
    expected = "This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    assert_equal expected, tale.line(11)
  end

  def test_line_12
    expected = "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    assert_equal expected, tale.line(12)
  end

  def test_all_the_lines
    expected = <<-TEXT
This is the house that Jack built.

This is the malt that lay in the house that Jack built.

This is the rat that ate the malt that lay in the house that Jack built.

This is the cat that killed the rat that ate the malt that lay in the house that Jack built.

This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.

This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.

This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.

This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.

This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.

This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.

This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.

This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
    TEXT
    assert_equal expected, tale.recite
  end

end

class RandomHouseTest < Minitest::Test
  def test_lines
    Random.srand(1)
    lines = RandomLines.new.lines
    expected =
      [["the rooster that crowed in the morn", "that woke"],
       ["the priest all shaven and shorn", "that married"],
       ["the man all tattered and torn", "that kissed"],
       ["the malt", "that lay in"],
       ["the farmer sowing his corn", "that kept"],
       ["the cow with the crumpled horn", "that tossed"],
       ["the horse and the hound and the horn", "that belonged to"],
       ["the dog", "that worried"],
       ["the house", "that Jack built"],
       ["the rat", "that ate"],
       ["the cat", "that killed"],
       ["the maiden all forlorn", "that milked"]]
    assert_equal expected, lines
  end
end


class MixedRandomHouseTest < Minitest::Test
  def test_lines
    Random.srand(1)
    lines = MixedRandomLines.new.lines
    expected =
      [["the rooster that crowed in the morn", "that kept"],
       ["the priest all shaven and shorn", "that worried"],
       ["the man all tattered and torn", "that belonged to"],
       ["the malt", "that married"],
       ["the farmer sowing his corn", "that killed"],
       ["the cow with the crumpled horn", "that lay in"],
       ["the horse and the hound and the horn", "that milked"],
       ["the dog", "that Jack built"],
       ["the house", "that kissed"],
       ["the rat", "that woke"],
       ["the cat", "that ate"],
       ["the maiden all forlorn", "that tossed"]]
    assert_equal expected, lines
  end
end


class MostlyMixedRandomHouseTest < Minitest::Test
  def test_lines
    Random.srand(1)
    lines = MostlyMixedRandomLines.new.lines
    expected =
      [["the rooster that crowed in the morn", "that kept"],
       ["the priest all shaven and shorn", "that worried"],
       ["the man all tattered and torn", "that married"],
       ["the rat", "that belonged to"],
       ["the farmer sowing his corn", "that killed"],
       ["the cow with the crumpled horn", "that milked"],
       ["the horse and the hound and the horn", "that lay in"],
       ["the dog", "that kissed"],
       ["the malt", "that woke"],
       ["the cat", "that ate"],
       ["the maiden all forlorn", "that tossed"],
       ["the house", "that Jack built"]]
    assert_equal expected, lines
  end

end

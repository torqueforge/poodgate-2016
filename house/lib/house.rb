class House

  def recite
    1.upto(12).collect {|i| line(i)}.join("\n")
  end

  # Now
  #  when num == 1, phase(num) should return ''
  #  when num == 2, phase(num) should return 'the malt that lay in '
  #  when num == 3, phase(num) should return 'the rat that ate the malt that lay in '.

  # If your code may not duplicate 'the malt that ley in ', you must write it down once
  # and use it in every phrase that needs it.

  # Seeing the solution requires understanding that the '' above is _something_, and that
  # what's actually needed is:
  #  when num == 1, phase(num) should return ''
  #  when num == 2, phase(num) should return 'the malt that lay in ' and ''
  #  when num == 3, phase(num) should return 'the rat that ate ' and 'the malt that lay in ' and ''.

  # Therefore, handling cases 1, 2 and 3 requires knowing about 3 different strings, and
  # using one string for case 1, two strings for case 2, and all three strings for case 3.

  def phrase(num)
    if num == 1
      ''
    else
      'the malt that lay in '
    end
  end

  def line(num)
    case num
    when 1..2
      "This is #{phrase(num)}the house that Jack built.\n"
    when 3
      "This is the rat that ate the malt that lay in the house that Jack built.\n"
    when 4
      "This is the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    when 5
      "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    when 6
      "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    when 7
      "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    when 8
      "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    when 9
      "This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    when 10
      "This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    when 11
      "This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    when 12
      "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    end
  end
end
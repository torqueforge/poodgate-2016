class Bottles

  def song
    verses(99, 0)
  end

  def verses(upper, lower)
    upper.downto(lower).map { |i| verse(i) }.join("\n")
  end

  def verse(number)
    bottle_number      = bottle_number_for(number)
    next_bottle_number = bottle_number_for(bottle_number.successor)
    "#{bottle_number.amount.capitalize} #{bottle_number.container} of beer on the wall, " +
    "#{bottle_number.amount} #{bottle_number.container} of beer.\n" +
    "#{bottle_number.action}, " +
    "#{next_bottle_number.amount} #{next_bottle_number.container} of beer on the wall.\n"
  end

  def bottle_number_for(number)
    if number == 1
      BottleNumber1.new(number)
    else
      BottleNumber.new(number)
    end
  end
end

class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def container
    "bottles"
  end

  def pronoun
    if number == 1
      "it"
    else
      "one"
    end
  end

  def amount
    if number == 0
      "no more"
    else
      number.to_s
    end
  end

  def action
    if number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun} down and pass it around"
    end
  end

  def successor
    if number == 0
      99
    else
      number - 1
    end
  end
end

class BottleNumber1 < BottleNumber
  def container
    "bottle"
  end
end

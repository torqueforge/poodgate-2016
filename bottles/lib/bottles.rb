class Bottles

  def song
    verses(99, 0)
  end

  def verses(upper, lower)
    upper.downto(lower).map { |i| verse(i) }.join("\n")
  end

  def verse(number)
    bottle_number = BottleNumber.new(number)
    "#{bottle_number.amount.capitalize} #{bottle_number.container(number)} of beer on the wall, " +
    "#{bottle_number.amount} #{container(number)} of beer.\n" +
    "#{action(number)}, " +
    "#{amount(successor(number))} #{container(successor(number))} of beer on the wall.\n"
  end

  private
  def container(bottle_number)
    if bottle_number == 1
      "bottle"
    else
      "bottles"
    end
  end

  def pronoun(bottle_number)
    if bottle_number == 1
      "it"
    else
      "one"
    end
  end

  def amount(bottle_number)
    if bottle_number == 0
      "no more"
    else
      bottle_number.to_s
    end
  end

  def action(bottle_number)
    if bottle_number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun(bottle_number)} down and pass it around"
    end
  end

  def successor(bottle_number)
    if bottle_number == 0
      99
    else
      bottle_number - 1
    end
  end
end

class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def container(number)
    if number == 1
      "bottle"
    else
      "bottles"
    end
  end

  def pronoun(number)
    if number == 1
      "it"
    else
      "one"
    end
  end

  def amount(number=self.number)
    if number == 0
      "no more"
    else
      number.to_s
    end
  end

  def action(number)
    if number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun(number)} down and pass it around"
    end
  end

  def successor(number)
    if number == 0
      99
    else
      number - 1
    end
  end
end

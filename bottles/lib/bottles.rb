class Bottles

  def song
    verses(99, 0)
  end

  def verses(upper, lower)
    upper.downto(lower).map { |i| verse(i) }.join("\n")
  end

  def verse(number)
    container_number = ContainerNumber.new(number)
    successor        = ContainerNumber.new(container_number.successor)

    "#{container_number.label.capitalize} #{container_number.container} of beer on the wall, " +
    "#{container_number.label} #{container_number.container} of beer.\n" +
    "#{container_number.action}, " +
    "#{successor.label} #{successor.container} of beer on the wall.\n"
  end
end

class ContainerNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def container
    if number == 1
      "bottle"
    else
      "bottles"
    end
  end

  def pronoun
    if number == 1
      "it"
    else
      "one"
    end
  end

  def label
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

class House
  attr_reader :phrases, :formatter

  def initialize(phrases: HousePhrases.new, formatter: DefaultFormatter.new)
    @phrases   = phrases
    @formatter = formatter
  end

  def recite
    1.upto(12).collect {|i| line(i)}.join("\n")
  end

  def line(num)
    "This is #{phrase(num)}.\n"
  end

  def phrase(num)
    parts(num).join(' ')
  end

  def parts(num)
    formatter.format(phrases.last(num)).flatten.compact
  end
end

class MixedActorActionFixedLastOrder
  def order(data)
    data[0..-2].transpose.collect {|row| row.shuffle}.transpose << data.last
  end
end

class FixedLastRandomOrder
  def order(data)
    data[0..-2].shuffle << data.last
  end
end

class RandomOrder
  def order(data)
    data.shuffle
  end
end

class DefaultOrder
  def order(data)
    data
  end
end

class EchoFormatter
  def format(parts)
    parts.zip(parts)
  end
end

class DefaultFormatter
  def format(parts)
    parts
  end
end

class HousePhrases
  include Enumerable

  DATA = [
    ['the horse and the hound and the horn', nil, 'that belonged to'],
    ['the farmer', 'sowing his corn', 'that kept'],
    ['the rooster', 'that crowed in the morn', 'that woke'],
    ['the priest', 'all shaven and shorn', 'that married'],
    ['the man', 'all tattered and torn', 'that kissed'],
    ['the maiden', 'all forlorn', 'that milked'],
    ['the cow', 'with the crumpled horn', 'that tossed'],
    ['the dog', nil, 'that worried'],
    ['the cat', nil, 'that killed'],
    ['the rat', nil, 'that ate'],
    ['the malt', nil, 'that lay in'],
    ['the house', nil, 'that Jack built']]


  attr_reader :data
  def initialize(orderer: DefaultOrder.new)
    @data = orderer.order(DATA)
  end

  def each(&block)
    data.each{|phrase| block.call(phrase)}
  end

  def last(n)
    data.last(n)
  end
end

puts "\nMixedActorActionFixedLastOrder"
puts House.new(phrases: HousePhrases.new(orderer: MixedActorActionFixedLastOrder.new)).line(12)

puts "\nFixedLastRandomOrder"
puts House.new(phrases: HousePhrases.new(orderer: FixedLastRandomOrder.new)).line(12)

# puts "\nEchoHouse"
# puts House.new(formatter: EchoFormatter.new).line(12)

# puts "\nRandomEchoHouse"
# puts House.new(orderer: RandomOrder.new, formatter: EchoFormatter.new).line(12)
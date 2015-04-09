using Article

class Farm
  attr_reader :animals

  def initialize(animals)
    @animals = animals.collect {|animal| animal || NullAnimal.new }
  end

  def lyrics
    animals.collect {|animal| verse(animal) }.join("\n\n")
  end

  def verse(animal)
    sound   = animal.sound
    species = animal.species
    "Old MacDonald had a farm, E-I-E-I-O,\n" +
    "And on that farm he had #{species.articlize}, E-I-E-I-O,\n" +
    "With #{sound.articlize} #{sound} here " +
      "and #{sound.articlize} #{sound} there,\n" +
    "Here #{sound.articlize}, there #{sound.articlize}, " +
      "everywhere #{sound.articlize} #{sound},\n" +
    "Old MacDonald had a farm, E-I-E-I-O."
  end
end

class NullAnimal
  def species
    '<silence>'
  end

  def sound
    '<silence>'
  end
end

class ReliableAnimal
  def self.all(ids)
    Animal.all(ids).collect {|animal| animal.nil? ? NullAnimal.new : animal}
  end
end
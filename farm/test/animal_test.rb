require_relative '../../test_helper'
require_relative '../lib/animal'
using Article


# Animals already exists; it's part of an external framework which you're
# not allowed to change.  These tests are here simply to show you its API.
class AnimalsTest < Minitest::Test
  def test_pig
    animal = Animal.all(['pig']).first
    assert_equal 'pig',     animal.species
    assert_equal 'oink',    animal.sound
    assert_equal 'a pig',   animal.species.articlize
    assert_equal 'an oink', animal.sound.articlize
  end

  def test_owl
    animal = Animal.all(['owl']).first
    assert_equal 'owl',    animal.species
    assert_equal 'hoot',   animal.sound
    assert_equal 'an owl', animal.species.articlize
    assert_equal 'a hoot', animal.sound.articlize
  end

  def test_pig_and_owl
    animals = Animal.all(['pig', 'owl'])
    assert_equal 2, animals.size
  end

  def test_missing_animal
    animal = Animal.all(['']).first
    assert_nil animal
  end

  def test_pig_and_missing_animal_and_owl
    animals = Animal.all(['pig', '', 'owl'])
    assert_equal 3, animals.size
  end
end

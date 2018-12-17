require('minitest/autorun')
require('minitest/rg')
require_relative('animal.rb')
require_relative('owner.rb')


class TestAnimal < Minitest::Test

  def set up
    @animal = Animal.new("Rover", "name")
  end

  def test_animal_has_name
    assert_equal("Rover", @animal.name)
  end

  def test_animal_has_type
    assert_equal("Dog", @animal.type)
  end


end

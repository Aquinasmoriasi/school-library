require_relative './nameable'
require_relative './trimmerdecorator'
require_relative './capitalizedecorator'

class Person
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @rentals = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    true
  end

  def add_rental(rental)
    @rentals << rental unless @rentals.include?(rental)
    rental.person = self
  end
end

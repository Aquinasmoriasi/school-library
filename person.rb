require_relative './nameable'
require_relative './trimmerdecorator'
require_relative './capitalizedecorator'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name, parent_permission: true)
    super()
    @id = Random.rand(1..100_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
  @rentals << rental unless @rentals.include?(rental)
  rental.person = self
  end

  private

  def of_age?
    @age >= 18
  end
end

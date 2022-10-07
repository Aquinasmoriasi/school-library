require_relative './person'

class Student < Person
  attr_accessor :age, :name, :parent_permission, :classroom

  def initialize(age, name, parent_permission)
    super(age, name)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @classroom = ''
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
  private

  def of_age?
    @age >= 18
  end
end

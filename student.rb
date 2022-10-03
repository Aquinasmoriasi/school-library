require_relative './person.rb'

class Student < Person
    def initialize(classroom)
        super("unkown")
        @classroom = classroom
    end
    def play_hooky
        "¯\(ツ)/¯"
    end
end

x=Student.new("History")
puts(x.play_hooky)
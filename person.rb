class Person
    attr_reader :id
    attr_accessor :name, :age
    def initialize(age, name = "Unkown", parent_permission = true)
        @id = Random.rand(1..100000)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    private def  is_of_age?
        @age > 18
    end

    def can_use_services?
        is_of_age? || @parent_permission
    end
end




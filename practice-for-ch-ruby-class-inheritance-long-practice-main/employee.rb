class Employee

    def initialize(name,title,salary,boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end 

    def bonus(multiplier) 

        bonus = salary * multiplier

    end 

    attr_reader :salary


end 
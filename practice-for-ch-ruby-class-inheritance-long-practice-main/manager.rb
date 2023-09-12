require_relative "employee.rb"

class Manager < Employee

    def initialize(name,title,salary,boss)
        super
        @employees = []
    end 
    
    def bonus(multiplier)


        #recursive case 
        employee_salary = employees.inject(0) { |sum, employee| sum + employee.salary }
        employee_bonus = employees.inject(0)  do |sum, employee| 
            if employee.is_a?(Manager)
                 sum + employee.bonus(1)
            else 
                0
            end  

        end 


        return employee_salary * multiplier + employee_bonus * multiplier

    #     total = 0
    #     employees.each do |emp|
    #         if emp.is_a?(Manager)
    #             total += emp.bonus(1)
    #             total += emp.salary
    #         else
    #             total += emp.salary
    #         end
    #     end
    #     total * multiplier

    end 

    attr_accessor :employees


end 

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

darren.employees = [shawna, david]
ned.employees = [darren]

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000

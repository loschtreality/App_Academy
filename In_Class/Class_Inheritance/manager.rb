require_relative 'employee'
require "byebug"

class Manager < Employee

  def initialize(name,title,salary, boss, employees = [])
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    self.sum_employees * multiplier
  end

  def sum_employees
    total = 0
    @employees.each do |employee|
      if employee.is_a? Manager
        total += employee.sum_employees
      end
        total += employee.salary
    end
    total
  end

  def add_employee(*worker)
    @employees.concat(worker)
  end

end



a = Manager.new('a','cool',1000000, nil)
b = Manager.new('b','cool',78000, a)
c = Employee.new('c','cool',12000,b)
d = Employee.new('d','cool',10000,b)
a.add_employee(b)
b.add_employee(c, d)
p a.bonus(5)
p b.bonus(4)
p d.bonus(3)

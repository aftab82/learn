class Person
  include Comparable
  attr_accessor :name, :age

  def initialize(name, age)
    @name, @age = name, age
  end

  def <=>(other_person)
    age <=> other_person.age
  end

  def to_s
    "Name: #{name} and age: #{age}"
  end
end

class Household
  include Enumerable
  attr_accessor :people

  def initialize
    @people = []
  end

  def add(person)
    people.push(person)
  end

  def each(&block)
    people.each(&block)
  end
end

john = Person.new("John", 20)
mark = Person.new("Mark", 35)
tim = Person.new("Tim", 10)
jimmy = Person.new("Jimmy", 45)

household1 = Household.new
household1.add(john)
household1.add(mark)

household2 = Household.new
household2.add(tim)
household2.add(jimmy)

puts "Household 1 members:\n"
puts household1.people
puts "\n"

puts "Household 2 members:\n"
puts household2.people
puts "\n"

puts "Are there any Household 2 members with age > 40\n"
puts household2.any?{|person| person.age > 40}
puts "\n"

puts "Are there any Household 1 members with age > 50\n"
puts household1.any?{|person| person.age > 50}
puts "\n"

age_below_20 = household2.find_all{|person| person.age < 20}
puts "Household 2 members with age below 20: ", age_below_20

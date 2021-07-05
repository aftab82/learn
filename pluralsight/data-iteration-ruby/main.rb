def part1
  3.times { puts "Testing ..." }

  3.times do
    puts "Inside the block."
    puts "Still inside the block"
  end

  array = [2, 3, 4]
  array.each { |num| puts "#{num}" }

  array.each do |num|
    puts "#{num}"
  end

  def my_method
    puts "Inside my method"
    yield
  end

  my_method do
    puts "Block as argument"
  end

  def greet
    puts "What's your name?"
    name = gets.chomp
    yield name
  end

  greet do |name|
    puts "Hello #{name}"
  end

  def greet(question, &my_block)
    puts question
    name = gets.chomp
    my_block.call(name)
  end

  greet("What's your name?") do |name|
    puts "Hello #{name}"
  end
end

def part2
  string = "Ruby"
  string.each_char{|letter| print "#{letter} "}

  i = 0
  lang = "Ruby
  Java
  Python
  C"

  lang.each_line{|line| print "#{i +=1} #{line}"}

  2.upto(6){ |num| print num, " "}

  arr = [1,2,3,4,5,6,7,8,9,10]
  print arr.delete_if {|num| num > 7}

  arr = [1,2,3,4,5,6,7,8,9,10]
  print arr.reject {|num| num > 7}
  print "\n", arr

  print arr.count {|c| c == 9}

  hash = {'name' => 'John', 'age' => 18}
  hash.each do |key, value|
    puts "key: #{key}, value: #{value}"
  end

  hash.each_key {|key| puts "key: #{key}"}
  hash.each_value {|value| puts "value: #{value}"}
end

def part3
  evens = [2, 4, 6, 8]
  odds = [1, 3, 5, 7]

  # With blocks
  square_of_evens = evens.map{|num| num**2}
  square_of_odds = odds.map{|num| num**2}
  p square_of_evens
  p square_of_odds

  #with procs
  squares = Proc.new {|x| x**2}
  even_squares = evens.map(&squares)
  odd_squares = odds.map(&squares)
  p even_squares
  p odd_squares

  nums = [1, 2, 3, 4, 5]

  is_even = Proc.new {|num| num % 2 == 0}
  is_odd = Proc.new{|num| num % 2 == 1}

  p nums.select(&is_even)
  p nums.select(&is_odd)

  def my_method
    puts "Inside my method"
    yield
  end

  my_proc = Proc.new { puts "Inside the Proc" }
  my_method(&my_proc)

  greet = Proc.new {puts "Hello world!"}
  greet.call

end

def part4
  proc = Proc.new {puts "This is a Proc"}
  lambda = lambda {puts "This is a Lambda"}

  p proc.class
  p lambda.class

  proc = Proc.new {|name| puts "Name is: #{name}"}
  proc.call("John", "Doe")
  proc.call
  proc.call("John")

  lambda = lambda {|name| puts "Name is: #{name}"}
  # lambda.call("John", "Doe")
  # lambda.call
  lambda.("John")

  def a_lambda
    lambda = lambda { return }
    lambda.call
    puts "End of method"
  end
  a_lambda

  def a_proc
    proc = Proc.new { return "Exiting a_proc"}
    proc.call
    puts "End of method"
  end
  p a_proc
end

def part5
  p Class.superclass
  p Enumerable.class
end

part5

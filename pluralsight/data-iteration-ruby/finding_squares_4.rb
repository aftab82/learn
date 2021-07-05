evens = [2, 4, 6, 8]
odds = [1, 3, 7, 9]

squares = Proc.new {|num| num ** 2}
cubes = Proc.new {|num| num ** 3}
squares_of_evens, squares_of_odds = [evens, odds].map {|array| array.map(&squares)}
cubes_of_evens, cubes_of_odds = [evens, odds].map {|array| array.map(&cubes)}

p squares_of_evens
p squares_of_odds
p cubes_of_evens
p cubes_of_odds

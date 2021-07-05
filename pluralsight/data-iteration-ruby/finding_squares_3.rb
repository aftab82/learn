evens = [2, 4, 6, 8]
odds = [1, 3, 7, 9]

squares = Proc.new {|num| num ** 2}

squares_of_evens, squares_of_odds = [evens, odds].map {|array| array.map(&squares)} 

p squares_of_evens
p squares_of_odds

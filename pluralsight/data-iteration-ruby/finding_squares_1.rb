evens = [2, 4, 6, 8]
odds = [1, 3, 7, 9]

squares_of_evens = evens.map {|num| num**2}
squares_of_odds = odds.map {|num| num**2}

p squares_of_evens
p squares_of_odds

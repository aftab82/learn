GENRE = 2
YEAR = 3

require "csv"
CSV.read("albums.csv")[1..]
  .select {|album|
    album[GENRE] == "Jazz" and album[YEAR].to_i.between?(1950, 1959)
  }
  .sort_by {|album| album[YEAR].to_i}
  .each {|album| puts album.join(',')}

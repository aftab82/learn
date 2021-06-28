require 'csv'
file_location = "prices_2.csv"

content = File.read(file_location)

data = CSV.parse(content, headers: true)

data.each do |d|
  puts "DATE: #{d['date']} PRICE: #{d['price']}"
end

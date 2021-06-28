require 'json'
require 'date'

def extract_data(content)
  data = JSON.parse(content)

  current_date = Date.parse(data["time"]["updated"]).strftime("%Y-%m-%d")
  current_price = data["bpi"]["USD"]["rate_float"]

  return { current_date: current_date, current_price: current_price }
end

file_location = "demos.json"
content = File.read(file_location)

result = extract_data(content)

puts "Current Date: #{result[:current_date]}"
puts "Current Price: #{result[:current_price]}"

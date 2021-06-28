require 'net/http'
require 'json'

endpoint = "https://breaking-bad-quotes.herokuapp.com/v1/quotes"
uri = URI(endpoint)

# content = Net::HTTP.get(uri)

# quotes = JSON.parse(content)
# puts quotes[0]["quote"]
# puts "By: #{quotes[0]["author"]}"

res = Net::HTTP.get_response(uri)
puts res.code
puts res.content_type
puts res.body

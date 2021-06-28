require 'csv'

# content = File.read("sample.csv")
data = CSV.read("sample.csv", headers: true)

data.each do |d|
  puts "ID: #{d['id']} First Name: #{d['first_name']} Last Name: #{d['last_name']}"
end

require 'csv'

content = CSV.generate do |c|
  c << ["id", "first_name", "last_name"]
  c << [1, "John", "Doe"]
  c << [2, "Michael", "Smith"]
  c << [3, "Sally", "Dean"]
  c << [4, "Peter", "Rabbit"]
  c << [5, "Jessie", "Fanning"]
end

File.write("sample.csv", content)

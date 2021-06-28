data = [
  ["id", "first_name", "last_name"],
  [1, "John", "Doe"],
  [2, "Michael", "Smith"],
  [3, "Sally", "Dean"],
  [4, "Peter", "Rabbit"],
  [5, "Jessie", "Fanning"]
]

content = data.map{ |d| d.join(",")
}.join("\n")

File.write("sample.csv", content)

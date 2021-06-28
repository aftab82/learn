file_location = "sample.txt"
# content = File.read(file_location)
new_content = "New Content!"

File.open(file_location, "a") do |file|
  file.write(new_content)
end

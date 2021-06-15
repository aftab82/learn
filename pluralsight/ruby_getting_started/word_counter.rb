TEXT_FILE = "romeo-juliet.txt"
REFERENCE_TEXT_FILE = "hamlet.txt"

# Load the words from a file
def words_from_file(text_file)
  File.read(text_file).downcase.gsub(/[^a-z]/," ").split
rescue
  puts "Give me #{text_file} and let's get the party started"
  exit
end

# Load the list of words in the text
words = words_from_file(TEXT_FILE)
words_to_remove = words_from_file(REFERENCE_TEXT_FILE).uniq

# Remove from the text all he words that also appear in ref
words_to_remove.each do |word|
  words.delete word
end

# Create a dictionary of word counts
WORD_COUNT = {}

words.each do |word|
  WORD_COUNT[word] = 0 unless WORD_COUNT[word]
  WORD_COUNT[word] += 1
end

WORD_COUNT.sort_by {|word, count| count }
          .reverse[0...40]
          .each {|word, count| puts "#{word}: #{count}" }

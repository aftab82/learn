reversed_words = set()
reversible_words = []

with open('dictionary.txt') as dictionary_file:
    for line in dictionary_file:
        word = line.rstrip()
        if len(word) > 5:
            if word in reversed_words:
                reversible_words.append(word)
            reversed_words.add(word[::-1])

for word in reversible_words:
    print(word)

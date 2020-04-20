words_over_five_letters = []
with open('dictionary.txt') as dictionary_file:
    for line in dictionary_file:
        word = line.rstrip()
        if len(word) > 5:
            words_over_five_letters.append(word)

reversed_words = set()
for word in words_over_five_letters:
    reversed_words.add(word[::-1])

reversible_words = []
for word in words_over_five_letters:
    if word in reversed_words:
        reversible_words.append(word)

for word in reversible_words:
    print(word)

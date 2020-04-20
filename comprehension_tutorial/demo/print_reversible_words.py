words_over_five_letters = []
with open('dictionary.txt') as dictionary_file:
    words = [
        line.rstrip()
        for line in dictionary_file
    ]

    words_over_five_letters = [
        word
        for word in words
        if len(word) > 5
    ]

reversed_words = set()
for word in words_over_five_letters:
    reversed_words.add(word[::-1])

reversible_words = [
    word
    for word in words_over_five_letters
    if word in reversed_words
]

for word in reversible_words:
    print(word)

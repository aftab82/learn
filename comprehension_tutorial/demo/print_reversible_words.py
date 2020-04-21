with open('dictionary.txt') as dictionary_file:
    words = (
        line.rstrip()
        for line in dictionary_file
    )
    words_over_five_letters = [
        word
        for word in words
        if len(word) > 5
    ]

reversed_words = {
    word[::-1]
    for word in words_over_five_letters
}

reversible_words = [
    word
    for word in words_over_five_letters
    if word in reversed_words
]

for word in reversible_words:
    print(word)

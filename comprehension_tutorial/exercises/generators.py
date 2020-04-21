"""Generator Exercises."""


def is_prime(num):
    """Return True if candidate number is prime."""
    return all(
        num % n != 0
        for n in range(2, num)
    )


def all_together(*iterables):
    """String together all items from the given iterables."""
    return (
        elem
        for iterable in iterables
        for elem in iterable
    )


def interleave(iterable1, iterable2):
    """Return iterable of one item at a time from each list."""
    return (
        elem
        for pair in zip(iterable1, iterable2)
        for elem in pair
    )


def translate(sentence):
    """Return a transliterated version of the given sentence."""
    words = {'esta': 'is',
             'la': 'the',
             'en': 'in',
             'gato': 'cat',
             'casa': 'house',
             'el': 'the'
             }

    return ' '.join(
        words[word]
        for word in sentence.split()
    )


def parse_ranges(range_string):
    """Return a list of numbers corresponding to number ranges in a string"""
    ranges = range_string.split(',')
    all_nums = []
    for range_ in ranges:
        lower, upper = map(int, range_.split('-'))
        for i in range(lower, upper+1):
            all_nums.append(i)
    return (num for num in all_nums)


def first_prime_over():
    """Return the first prime number over a given number."""


def is_anagram():
    """Return True if the given words are anagrams."""

"""Generator Exercises."""


def is_prime(num):
    """Return True if candidate number is prime."""
    return all(num % n != 0 for n in range(2, int(num / 2) + 1))


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
    trans = {'esta': 'is',
             'la': 'the',
             'en': 'in',
             'gato': 'cat',
             'casa': 'house',
             'el': 'the'
             }

    words = (sentence.split())

    return ' '.join([
        trans[word]
        for word in words
    ])


def parse_ranges():
    """Return a list of numbers corresponding to number ranges in a string"""


def first_prime_over():
    """Return the first prime number over a given number."""


def is_anagram():
    """Return True if the given words are anagrams."""

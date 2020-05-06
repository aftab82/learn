"""Generator Exercises."""
from math import sqrt


def is_prime(num):
    """Return True if candidate number is prime."""
    return num >= 2 and all(
        num % n != 0
        for n in range(2, int(sqrt(num)) + 1)
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
    limits = (
        map(int, group.split('-'))
        for group in range_string.split(',')
    )
    return (
        i
        for lower, upper in limits
        for i in range(lower, upper + 1)
    )


def first_prime_over(num):
    """Return the first prime number over a given number."""
    return next(
        n
        for n in range(num + 1, num ** 2)
        if is_prime(n)
    )


def is_anagram(word1, word2):
    """Return True if the given words are anagrams."""
    return sorted(c for c in word1.lower() if c.isalpha()) == sorted(c for c in word2.lower() if c.isalpha())

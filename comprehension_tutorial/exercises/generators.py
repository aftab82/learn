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


def interleave():
    """Return iterable of one item at a time from each list."""


def translate():
    """Return a transliterated version of the given sentence."""


def parse_ranges():
    """Return a list of numbers corresponding to number ranges in a string"""


def first_prime_over():
    """Return the first prime number over a given number."""


def is_anagram():
    """Return True if the given words are anagrams."""

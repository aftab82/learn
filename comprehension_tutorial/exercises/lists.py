"""List comprehension exercises"""


def get_vowel_names(names):
    """Return a list containing all names given that start with a vowel."""
    return [
        name
        for name in names
        if name[0].lower() in 'aeiou'
    ]


def power_list(nums):
    """Return a list that contains each number raised to the i-th power."""
    return [
        num ** i
        for i, num in enumerate(nums)
    ]


def flatten(matrix):
    """Return a flattened version of the given 2-D matrix (list-of-lists)."""
    return [
        elem
        for row in matrix
        for elem in row
    ]


def reverse_difference(nums):
    """Return list subtracted from the reverse of itself."""
    return [
        m - n
        for m, n in zip(nums, nums[::-1])
    ]


def matrix_add(m1, m2):
    """Add corresponding numbers in given 2-D matrices."""
    return [
        [m + n for m, n in zip(row1, row2)]
        for row1, row2 in zip(m1, m2)
    ]


def transpose():
    """Return a transposed version of given list of lists."""


def get_factors():
    """Return a list of all factors of the given number."""


def triples():
    """Return list of Pythagorean triples less than input num."""

"""More comprehension exercises"""


def flip_dict(input_dict):
    """Return a new dictionary that maps the original values to the keys."""
    return {value: key for key, value in input_dict.items()}


def get_ascii_codes(words):
    """Return a dictionary mapping the strings to ASCII codes."""
    return {
        word: [
            ord(letter)
            for letter in word
            ]
        for word in words
    }


def dict_from_truple(tuple_list):
    """Turn three-item tuples into a dictionary of two-valued tuples."""
    return {
        key: (value1, value2)
        for key, value1, value2 in tuple_list
    }


def dict_from_tuple(tuple_list):
    """Turn multi-item tuples into a dictionary of two-valued tuples."""
    return {
        items[0]: items[1:]
        for items in tuple_list
    }


def get_all_factors(nums):
    """Return a dictionary mapping numbers to their factors."""
    from exercises.lists import get_factors
    return {
        num: get_factors(num)
        for num in nums
    }

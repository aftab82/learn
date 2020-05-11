# MIT Licensed
# https://github.com/exercism/python/blob/master/LICENSE
from string import ascii_lowercase as letters


atbash = dict(zip(letters, reversed(letters)))


def decode(string):
    """Return string of each character decoded."""
    return ''.join(
        atbash.get(c, c)
        for c in string.lower()
        if c.isalnum()
    )


def chunkify(string, n):
    return (
        string[i: (i+n)]
        for i in range(0, len(string), n)
    )


def encode(string):
    """Decode each letter and group into 5-letter words."""
    return ' '.join(chunkify(decode(string), 5))

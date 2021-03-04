import requests
from requests.exceptions import HTTPError


def example_of_exception():
    for url in ['https://api.github.com', 'https://api.github.com/invalid']:
        try:
            response = requests.get(url)

            # If the response was successful, no Exception will be raised
            response.raise_for_status()
        except HTTPError as http_err:
            print(f"HTTP error occurred: {http_err}")
        except Exception as err:
            print(f"Other error occurred: {err}")
        else:
            print('Success!')


def example_query_string_parameters():
    # Search GitHub's repositories for requests
    response = requests.get(
        'https://api.github.com/search/repositories',
        params={'q': 'requests+language:python'}
    )

    # Inspect some attributes of the `requests` repository
    json_response = response.json()
    repository = json_response['items'][0]
    print(f"Repository name: {repository['name']}")
    print(f"Repository description: {repository['description']}")


def example_headers():
    response = requests.get(
        'https://api.github.com/search/repositories',
        params={'q': 'requests+language:python'},
        headers={'Accept': 'application/vnd.github.v3.text-match+json'}
    )

    # View the new `text-matches` array which provides information
    # about your search term within the results
    json_response = response.json()
    repository = json_response['items'][0]
    print(f"Text matches: {repository['text_matches']}")


example_headers()

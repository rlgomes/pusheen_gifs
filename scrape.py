#!/usr/bin/env python

import json
import os

import click
import requests
import requests_cache

USELESS_PREFIXES = [
    'art-cat-',
    'cat-adorable-',
    'cat-cute-',
    'cat-kitty-',
    'cat-pokemon-',
    'cat-pusheen-',
    'cat-',
    'love-cat-'
]

@click.command()
@click.option('--api-key',
              default=os.environ.get('GIPHY_API_KEY'))
@click.option('--limit',
              default=1000,
              type=int)
@click.option('--output-dir',
              default='gifs')
@click.option('--name-cleanup',
              default=True)
@click.option('--use-cache',
              default=False)
def main(api_key,
         limit,
         output_dir,
         name_cleanup,
         use_cache):

    if use_cache:
        requests_cache.install_cache('requests_cache')

    params = {
        'q': '#pusheen',
        'api_key': api_key,
        'limit': limit
    }

    response = requests.get('http://api.giphy.com/v1/gifs/search', params=params)

    if response.status_code != 200:
        raise Exception('%s: %s' % (response.status_code, response.text))

    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    datas = response.json()['data']
    with click.progressbar(datas) as bar:
        for data in bar:
            if data['type'] == 'gif':
                url = data['images']['original']['url']

                name = data['slug'].replace(data['id'], 'pusheen')

                if name_cleanup:
                    for prefix in USELESS_PREFIXES:
                        if name.startswith(prefix):
                            name = name[len(prefix):]

                    # remove repeated naming instances
                    name = name.replace('pusheen-pusheen', 'pusheen')

                    # remove two occurences of pusheen
                    if name.startswith('pusheen-') and name.rfind('pusheen') != 0:
                        name = name[len('pusheen-'):]

                response = requests.get(url)

                if response.status_code != 200:
                    raise Exception('%s: %s' % (response.status_code, response.text))

                with open('%s/%s.gif' % (output_dir, name), 'wb') as handle:
                    for block in response.iter_content(1024):
                        handle.write(block)


if __name__ == '__main__':
    main()

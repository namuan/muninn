# Muninn

> Like Alfred but on Telegram

[![PyPI Version][pypi-image]][pypi-url]
[![Build Status][build-image]][build-url]

## Installation

```sh
pip install telemuninn
```

## Usage

## Development setup

```sh
$ make setup
$ make deps
$ make tox
```

## Release

-[ ] Increment version in `telemuninn/__init__.py`
-[ ] Create a new Tag and Release on Github
-[ ] New Release will trigger the `publish` workflow to upload new binaries on PyPi

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Make sure to add or update tests as appropriate.

## [Changelog](CHANGELOG.md)

## License

[MIT](https://choosealicense.com/licenses/mit/)

<!-- Badges -->

[pypi-image]: https://img.shields.io/pypi/v/telemuninn
[pypi-url]: https://pypi.org/project/telemuninn/
[build-image]: https://github.com/namuan/muninn/actions/workflows/build.yml/badge.svg
[build-url]: https://github.com/namuan/muninn/actions/workflows/build.yml

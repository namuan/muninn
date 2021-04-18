"""Command-line interface."""

import click
from telemuninn.bot_wrapper import start_bot


@click.command()
@click.version_option()
def main() -> None:
    """Main method"""
    print("Starting with bot wrapper")
    start_bot()


if __name__ == "__main__":
    main()  # pragma: no cover

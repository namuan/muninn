"""Command-line interface."""
import click


@click.command()
@click.version_option()
def main() -> None:
    """Muninn."""


if __name__ == "__main__":
    main(prog_name="muninn")  # pragma: no cover

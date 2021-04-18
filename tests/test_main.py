"""Test cases for the __main__ module."""
from unittest.mock import patch

import click
import pytest
from click.testing import CliRunner

from telemuninn.__main__ import main


@pytest.fixture
def runner() -> CliRunner:
    return CliRunner()


def test_main_succeeds(runner: CliRunner) -> None:
    with patch("telemuninn.bot_wrapper.start_bot") as mock:
        mock.return_value = True

    result = runner.invoke(main)
    click.echo("Result = {}".format(result))
    assert result.exit_code == 0

"""Test cases for the __main__ module."""
from unittest.mock import patch

import click
import pytest
from click.testing import CliRunner

from telemuninn.__main__ import main


@pytest.fixture
def runner() -> CliRunner:
    return CliRunner()


@patch('telemuninn.__main__.start_bot')
def test_main_succeeds(mocked_val, runner: CliRunner) -> None:
    mocked_val.return_value = False

    result = runner.invoke(main)
    click.echo("Result = {}".format(result))
    assert result.exit_code == 0

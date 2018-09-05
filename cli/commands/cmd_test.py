import os
import subprocess
import click

@click.command()
@click.argument('path', default=os.path.join('ceelo', 'tests'))
def cli(path):
    """
    Run a tests with Pytest

    :param path: Test path
    :return: Subprocess call result
    """
    cmd = 'py.test {0}'.format(path)
    return subprocess.call(cmd, shell=True)
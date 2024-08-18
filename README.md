# Python Template

A python template that we can use to create a new project for the development and publication of a python package named `cybersamx_test` to Test PyPi.

## Setup

### Set up the Project

1. Set up tools, packages, and virtual environment. It installs the tools/packages for the dev environment and the packages for running the package.

   ```shell
   make install
   ```

1. The Makefile doesn't activate the virtual environment (virtualenv), just set up the virtualenv. So activate the virtualenv after running `make`.

   ```shell
   source .venv/bin/activate 
   ```

### Set up IDE

#### PyCharm

If you open this project in PyCharm, perform the following setup on the IDE to optimize the user experience.

1. Go to **Settings** and tweak the following
   * **Project Structure**. Mark the directories `src` and `tests` as `Sources` and `Tests` respectively. This drastically improves code completion by parsing the project code for the code completion.
   * **Python Interpreter**. Make sure we set the interpreter to the one on the project virtual environment. Remove the current interpreter if needed. Select **local interpreter... > Virtualenv > Existing**.

### Running Tests
   
1. Run the command to test

   ```shell
   $ make test
   $ # Alternatively, run pytest directly.
   $ python -m pytest tests
   ```

### Publish to Test PyPi

1. Change the project name in `pyproject.toml`, otherwise we will get a name collision as the name has already been taken.
1. Make sure that the version in `pyproject.toml` is correct.
1. Run the command to build and publish the package.

   ```shell
   make publish
   ```
   
> **Notes**
> 
> The project is set up for Test PyPi. Make the appropriate changes to publish the package to PyPi.


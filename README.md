# Python Main Program Template

A python template that we can use to create a new project for the development of python main program.

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

### Run Program

1. Run the command to run the project.

   ```shell
   make run
   # Alternatively via file arg
   python src/cybersamx_main/__main__.py
   # Alternatively via module arg
   cd src
   python -m cybersamx_main
   cd -
   ```

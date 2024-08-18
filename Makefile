ROOT_DIR := $(shell git rev-parse --show-toplevel)
VENV := $(ROOT_DIR)/.venv
PYTHON := $(VENV)/bin/python3
TWINE := $(VENV)/bin/twine
PIP := $(VENV)/bin/pip
VIRTUAL_ENV := python3 -m venv
REQUIREMENTS := requirements.txt
REQUIREMENTS_TOOLS := requirements-tools.txt
TESTS_DIR := tests

.PHONY: all install venv run lint test clean

# Default target

all: run

##@ run: Install packages

install: venv
	@echo "Install packages"
	$(PIP) install -r $(REQUIREMENTS)
	$(PIP) install -r $(REQUIREMENTS_TOOLS)
	@echo "Installed a virtual environment called $(VENV)"
	@echo "You don't need to activate venv if you are using make for this project."
	@echo "If you want to activate the root venv, please run source $(VENV)/bin/activate."

# If virtual environment has been set up, we won't see the activate file.
$(VENV)/bin/activate: requirements.txt requirements-tools.txt
	@echo "Setting up virtual environment $(VENV)."
	$(VIRTUAL_ENV) $(VENV)

# Phony target for running the virtual environment setup
venv: $(VENV)/bin/activate

##@ publish: Publish the program to test PyPI

publish: clean test
	@echo "Publish the python project to test pypi."
	$(PYTHON) -m build
	$(TWINE) check dist/*
	$(TWINE) upload -r testpypi dist/*

##@ run: Run the program

run: venv lint
	@echo "Build the python project."
	$(PYTHON) main.py

##@ lint: Run a linter against the project

lint:
	@echo "Run linter against the python project."
	$(PYTHON) -m flake8

##@ test: Test unit tests

test: venv
	@echo "Run all unit tests."
	$(PYTHON) -m pytest -s $(TESTS_DIR)

##@ clean: Clean output files and build cache

clean:
	@echo "Removing build cache and files."
	@-rm -rf __pycache__
	@-rm -rf dist
	@-rm -rf *.egg-info
	@-find . -type f -name '*.pyc' -delete

##@ help: Help

help: Makefile
	@-echo " Usage:\n  make <target>"
	@-echo
	@-sed -n 's/^##@//p' $< | column -t -s ':' | sed -e 's/[^ ]*/ &/2'

export PROJECTNAME=$(shell basename "$(PWD)")
PY=python3

.SILENT: ;               # no need for @

setup: ## Sets up virtual environment
	python3 -m venv venv

clean: ## Clean package
	find . -type d -name '__pycache__' | xargs rm -rf
	rm -rf build dist

coverage:  ## Run tests with coverage
	$(PY) -m coverage erase
	$(PY) -m coverage run --include=telemuninn/* -m pytest -ra
	$(PY) -m coverage report -m

release:  ## Install release dependencies
	$(PY) -m pip install -r requirements/base.txt

deps:  ## Install all dependencies
	$(PY) -m pip install --upgrade pip
	$(PY) -m pip install -r requirements/dev.txt

lint:  ## Lint and static-check
	$(PY) -m flake8 telemuninn
	$(PY) -m pylint telemuninn
	$(PY) -m mypy telemuninn

publish:  ## Publish to PyPi
	$(PY) -m pip install flit
	$(PY) -m flit publish

push:  ## Push code with tags
	git push && git push --tags

test:  ## Run tests
	$(PY) -m pytest -ra

tox:   ## Run tox
	$(PY) -m tox

.PHONY: help
.DEFAULT_GOAL := help

help: Makefile
	echo
	echo " Choose a command run in "$(PROJECTNAME)":"
	echo
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	echo
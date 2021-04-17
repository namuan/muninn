export PROJECTNAME=$(shell basename "$(PWD)")
PY=./venv/bin/python3

.SILENT: ;               # no need for @

prep: ## Setup Virtual Env
	python3 -m pip install nox
	poetry install
	poetry run nox

deps: ## Update dependencies
	poetry update

tests: ## Run black for code formatting
	poetry run nox -rs tests

lint: ## Run black for code formatting
	poetry run nox -rs black
	poetry run nox -rs lint

clean: ## Clean package
	find . -type d -name '__pycache__' | xargs rm -rf
	rm -rf build dist

nox: clean ## Runs nox with existing Virtual environments
	poetry run nox -r

bpython: ## Run bpython
	poetry run bpython

ssh: ## SSH into the target VM
	ssh ${PROJECTNAME}

cheat: ## Display useful commands
	echo "poetry env list # Display all available venvs"
	echo "poetry shell # Creates a new shell with the current venv. which python to find the python bin location"
	echo "poetry env remove # Removes the venv. Check the full path using poetry shell; which python"

.PHONY: help
.DEFAULT_GOAL := help

help: Makefile
	echo
	echo " Choose a command run in "$(PROJECTNAME)":"
	echo
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	echo

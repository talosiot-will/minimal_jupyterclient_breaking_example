SRC = $(wildcard ./*.ipynb)

test:
	. .venv/bin/activate && nbdev_test_nbs

env:
	virtualenv .venv -p python3.8 --prompt "[$(shell basename "`pwd`")] "
	. .venv/bin/activate && pip install jupyter jupyterlab nbdev
	. .venv/bin/activate && pip install -e .
